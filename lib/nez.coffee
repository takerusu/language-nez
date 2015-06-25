child_process = require 'child-process-promise'
_atom = require 'atom'
fs = require 'fs'

class NezManager
  config:
    nezPath:
      type: 'string'
      default: '/usr/local/lib/nez.jar'

  nezView: null
  startPoint: ""
  ruleSet: null
  ruleArray: null

  activate:(state) ->
    console.log "activate nez"
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
      "nez:debug toggle": =>
        @getRule()
        @setStartingPoint()
        @createNezDebugView().toggle(@)
      # "nez:beta": =>
      #   @beta()
    atom.config.observe 'language-nez.nezPath', (newValue) ->
      console.log "Change nez path to #{newValue}"
      @nezPath = newValue


  run:(input) ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    #einput = input.replace(/\\/g, "\\\\").replace(/\"/g, "\\\"")
    #java -jar nez.jar -p input.nez
    command = "java -jar #{@nezPath} parse -p #{path}"
    command = "#{command} -s #{@startPoint}" unless @startPoint is ""
    inputobj = @createFileSync()
    inputPath = inputobj.name
    fs.writeFileSync(inputPath, input)
    console.log input
    command = "#{command} -i #{inputPath}"
    #console.log command
    return child_process.exec(command)
    #child = child_process.spawn("java", ['-jar', nez_path, '-p', uri])

  debug:(inputPath) ->
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    command = "java -jar #{@nezPath} debug -p #{path} -i #{inputPath}"

  setStartingPoint: ->
    editor = atom.workspace.getActiveTextEditor()
    rule = editor.getSelectedText()
    @startPoint = rule if /^[A-Z_a-z][0-9A-Z_a-z]*$/.test(rule)

  createNezView:(state) ->
    unless @nezView?
      NezView = require './nez-view'
      @nezView = new NezView()
    @nezView

  createNezDebugView:(state) ->
    unless @nezDebugView?
      NezDebugView = require './nez-debug-view'
      @nezDebugView = new NezDebugView()
    @nezDebugView

  getRule: ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getURIで現在開いているファイルのパスを取得する
    uri = editor.getURI()
    rs = {}
    @ruleArray = []
    editor.scan(/^(public|inline)?[ \t]*(\w+)/g, (obj)=>
      rs["#{obj.match[2]}"] = obj.range
      @ruleArray.push({name:obj.match[2], range:obj.range})
    )
    sortFunc = (a,b)-> if a.range.start.row>b.range.start.row then 1 else -1
    console.log @ruleArray = @ruleArray.sort sortFunc
    console.log @ruleSet = rs

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
      editor.setCursorBufferPosition [sp.row, sp.column]

  beta: ->
    editor = atom.workspace.getActiveTextEditor()
    cp = editor.getCursorBufferPosition()
    console.log @ruleArray.find (ele)-> ele > cp.row

module.exports = new NezManager()
