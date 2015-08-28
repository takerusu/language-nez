child_process = require 'child-process-promise'
_atom = require 'atom'
{Range} = require 'atom'
fs = require 'fs'
url = require 'url'
path = require 'path'
parser = require './nez-parser'

class NezManager
  config:
    nezPath:
      type: 'string'
      default: '/usr/local/lib/nez.jar'

  nezView: null
  startPoint: ""
  ruleSet: null
  ruleArray: null
  lastPoss: null

  activate:(state) ->
    console.log "activate nez"
    @lastPoss = []
    @nezPath = atom.config.get('language-nez.nezPath')
    atom.commands.add 'atom-text-editor',
      'symbols-view:go-to-declaration': =>
        @goToDeclaration()

    atom.commands.add 'atom-workspace',
      #"nez:run": => @run()
      "nez:set starting point": =>
        @setStartingPoint()
        # @createNezView(state).toggle(@)
      "nez:toggle": =>
        @getRule()
        @setStartingPoint()
        @createNezView(state).toggle(@)
      "nez:go-to-declaration": =>
        @goToDeclaration()
      "nez:last-edit-position": =>
        @setCursorLastPos()
      "nez:beta": =>
        @beta()
    atom.config.observe 'language-nez.nezPath', (newValue) ->
      console.log "Change nez path to #{newValue}"
      @nezPath = newValue
    atom.workspace.addOpener (uriToOpen) ->
      try
        {protocol, host, pathname} = url.parse(uriToOpen)
      catch error
        return

      return unless protocol is 'nez-preview:'

      try
        pathname = decodeURI(pathname) if pathname
      catch error
        return
      NezPreviewView = require './nez-preview-view'
      if host is 'editor'
        new NezPreviewView(editorId: pathname.substring(1))
      else
        new NezPreviewView(filePath: pathname)
    atom.workspace.onDidChangeActivePaneItem (editor) =>
      @nezView?.hide()
      if editor?
        if editor.getGrammar?().name is "NEZ"
          @getRule()

  run:(input) ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    #einput = input.replace(/\\/g, "\\\\").replace(/\"/g, "\\\"")
    #java -jar nez.jar -p input.nez
    command = "java -jar #{@nezPath} ast -p #{path}"
    command = "#{command} -s #{@startPoint}" unless @startPoint is ""
    inputobj = @createFileSync()
    inputPath = inputobj.name
    fs.writeFileSync(inputPath, input)
    console.log input
    command = "#{command} -i #{inputPath}"
    #console.log command
    return child_process.exec(command)
    #child = child_process.spawn("java", ['-jar', nez_path, '-p', uri])

  setStartingPoint: ->
    editor = atom.workspace.getActiveTextEditor()
    rule = editor.getSelectedText()
    @startPoint = rule if /^[A-Z_a-z][0-9A-Z_a-z]*$/.test(rule)

  createNezView:(state) ->
    unless @nezView?
      NezView = require './nez-view'
      @nezView = new NezView()
    @nezView

  getRule: ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getURIで現在開いているファイルのパスを取得する
    uri = editor.getURI()
    rs = {}
    @ruleArray = []
    results = parser.parse editor.getText()
    if !results.value?
      return
    nl = [0]
    editor.scan(/\n/g, (obj) ->
      nl.push obj.match.index
    )
    rules = []
    for result in results.value
      if result.tag is "Production"
        rule = {}
        for val in result.value
          if val.tag is "Name"
            rule.name = val.value
            break
        rule.pos = result.value[0].pos
        rules.push rule
    #console.log rules
    if nl.length > 1
      i = 0
      n = 0
      while n isnt rules.length and i+1 isnt nl.length
        if nl[i] <= rules[n].pos.start < nl[i+1]
          s = rules[n].pos.start
          e = rules[n].pos.end
          rules[n].range = new Range([i, s-nl[i]-1], [i+1, s-nl[i]-1])
          rs[rules[n].name] = rules[n].range
          n++
        i++
    @ruleArray = rules
    @ruleSet = rs

  createFile:(callback) ->
    tmp = require 'tmp'
    tmp.file callback

  createFileSync: ->
    tmp = require 'tmp'
    tmpobj = tmp.fileSync()
    #console.log("Dir: ", tmpobj.name)
    return tmpobj

  goToDeclaration: ->
    editor = atom.workspace.getActiveTextEditor()
    console.log editor.getURI()?
    if editor.getURI()?
      unless editor.getURI().split(".").pop() is "nez"
        return
    @getRule()
    console.log rule = editor.getWordUnderCursor()
    if @ruleSet[rule]?
      console.log sp = @ruleSet[rule].start
      @lastPoss.push editor.getCursorBufferPosition()
      editor.setCursorBufferPosition [sp.row, sp.column]

  setCursorLastPos: ->
    console.log lastPos = @lastPoss.pop()
    atom.workspace.getActiveTextEditor().setCursorBufferPosition lastPos if lastPos

  uriForEditor: (editor) ->
    "nez-preview://editor/#{editor.id}"

  isNezPreviewView: (obj) ->
    NezPreviewView = require './nez-preview-view'
    obj instanceof NezPreviewView

  beta: ->
    editor = atom.workspace.getActiveTextEditor()
    previousActivePane = atom.workspace.getActivePane()
    return unless editor.getGrammar().scopeName in ["source.nez"]
    vmjs = require './vendor/vismodel.js'
    uri = @uriForEditor(editor)
    options =
      searchAllPanes: true
      split: 'right'
    atom.workspace.open(uri, options).done (preview) =>
      if @isNezPreviewView(preview)
        previousActivePane.activate()

module.exports = new NezManager()
