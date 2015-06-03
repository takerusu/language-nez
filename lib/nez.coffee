child_process = require 'child-process-promise'
fs = require 'fs'

module.exports = NEZ =
  config:
    nezPath:
      type: 'string'
      default: '/usr/local/lib/nez.jar'

  nezView: null
  startPoint: ""
  rawRuleData: ""
  ruleSet: null

  # nez:runで呼び出された時にrunメソッドを実行するようにする
  activate:(state) ->
    console.log "activate nez"
    @nezPath = atom.config.get('language-nez.nezPath')
    atom.commands.add 'atom-workspace',
      #"nez:run": => @run()
      "nez:set starting point": =>
        @setStartingPoint()
        # @createNezView(state).toggle(@)
      "nez:toggle": =>
        @getRule()
        @setStartingPoint()
        @createNezView(state).toggle(@)
      # "nez:beta": =>
      #   @beta()
    atom.config.observe 'language-nez.nezPath', (newValue) ->
      console.log "Change nez path to #{newValue}"
      @nezPath = newValue
    Object.observe(@, (changes)=>
      changes.forEach((change, i)=>
        if change.name is "rawRuleData"
          @rawRuleData = @rawRuleData.replace(/Display all.*$/, "")
          rule = (/>>>([\s\S]*)>>>/.exec(@rawRuleData)or[])[1]
          if rule?
            rule = rule.split(/[ \r\n]+/)
            @ruleSet = rule[1..-2]
      )
    )

  run:(input) ->
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getUriで現在開いているファイルのパスを取得する
    # uri = editor.getUri()
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
    @rawRuleData = ""
    # 現在開いているeditorの本体
    editor = atom.workspace.getActiveTextEditor()
    # getUriで現在開いているファイルのパスを取得する
    uri = editor.getUri()

    @createFile (err, path, fd)=>
      command = "java -jar #{nezPath} -p #{path}"
      fs.writeFileSync(path, editor.getText())
      child_process.exec(command).progress((child)=>
        #console.log child
        child.stdout.on('data', (data)=>
          #console.log "data:",data
          @rawRuleData = @rawRuleData + data
        )
        child.stdin.write("\ty", ()=>
          child.stdin.end()
        )
      )

  createFile:(callback) =>
    tmp = require 'tmp'
    tmp.file callback

  createFileSync: =>
    tmp = require 'tmp'
    tmpobj = tmp.fileSync()
    #console.log("Dir: ", tmpobj.name)
    return tmpobj

  beta: =>
    console.log "alt-c"
