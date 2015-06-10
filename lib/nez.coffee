child_process = require 'child-process-promise'
_atom = require 'atom'
fs = require 'fs'

module.exports = NEZ =
  config:
    nezPath:
      type: 'string'
      default: '/usr/local/lib/nez.jar'

  nezView: null
  startPoint: ""
  ruleSet: null

  # nez:runで呼び出された時にrunメソッドを実行するようにする
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
      # "nez:beta": =>
      #   @beta()
    atom.config.observe 'language-nez.nezPath', (newValue) ->
      console.log "Change nez path to #{newValue}"
      @nezPath = newValue

  run:(input) ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getURIで現在開いているファイルのパスを取得する
    # uri = editor.getURI()
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    einput = input.replace(/\\/g, "\\\\").replace(/\"/g, "\\\"")
    #java -jar nez.jar -p input.nez
    command = "java -jar #{@nezPath} parse -p #{path}"
    command = "#{command} -s #{@startPoint}" unless @startPoint is ""
    command = "#{command} -t \"#{einput}\""
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
    editor.scan(/^(public|inline)?[ \t]*(\w+)/g, (obj)->
      rs["#{obj.match[2]}"] = obj.range
    )
    console.log @ruleSet = rs

  createFile:(callback) =>
    tmp = require 'tmp'
    tmp.file callback

  createFileSync: =>
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
