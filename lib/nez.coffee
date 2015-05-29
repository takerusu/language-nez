child_process = require 'child-process-promise'
module.exports = NEZ =
  config:
    nezPath:
      type: 'string'
      default: '/usr/local/lib/nez.jar'

  nezView: null
  startPoint: ""

  # nez:runで呼び出された時にrunメソッドを実行するようにする
  activate:(state) ->
    console.log "activate nez"
    @nezPath = atom.config.get('language-nez.nezPath')
    atom.commands.add 'atom-workspace',
      #"nez:run": => @run()
      "nez:run with start point": =>
        @setStartingPoint()
        @createNezView(state).toggle(@)
      "nez:toggle": =>
        @createNezView(state).toggle(@)
    atom.config.observe 'language-nez.nezPath', (newValue) =>
      console.log "Change nez path to #{newValue}"
      @nezPath = newValue

  run:(input) ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getUriで現在開いているファイルのパスを取得する
    uri = editor.getUri()
    einput = input.replace(/\\/g, "\\\\").replace(/\"/g, "\\\"")
    #java -jar nez.jar -p input.nez
    command = "java -jar #{@nezPath} parse -p #{uri}"
    command = "#{command} -s #{@startPoint}" unless @startPoint is ""
    command = "#{command} -t \"#{einput}\""
    console.log command
    return child_process.exec(command)
    #child = child_process.spawn("java", ['-jar', nez_path, '-p', uri])

  setStartingPoint: ->
    editor = atom.workspace.getActiveTextEditor()
    @startPoint = editor.getSelectedText()

  createNezView:(state) ->
    unless @nezView?
      NezView = require './nez-view'
      @nezView = new NezView()
    @nezView
