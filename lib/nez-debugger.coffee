child_process = require 'child_process'
_atom = require 'atom'
fs = require 'fs'
module.exports = class NezDebugger
  @process = null
  @command = null
  @outs = null
  @isOutput = null

  constructor: (@inputPath, view) ->
    @outs = ""
    @resultv = view.find('.result-view code')
    @printv = view.find('.print-view code')
    @isOutput = false
    @dbConsole = "(nezdb)"

  suspend: () ->
    @process?.kill()

  setFile: (path) ->
    @inputPath = path
    @

  init: () ->
    if @process?
      return @process
    @outs = ""
    @isOutput = false
    nezPath = atom.config.get 'language-nez.nezPath'
    editor = atom.workspace.getActiveTextEditor()
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    command = ["-jar", "#{nezPath}", "debug", "-p", "#{path}", "-i", "#{@inputPath}"]
    @process = child_process.exec("java -jar #{nezPath} ndb -p #{path} -i #{@inputPath}")
    @process.stdout.on 'data', (data)=>
      s = data.toString()
      start = 0
      last = 0
      if @isOutput
        last = s.length
      if s.search(@command) != -1
        start = s.search(@command)
        last = s.length
        @isOutput = true
      if @isOutput and s.search(@dbConsole) != -1
        last = s.search(@dbConsole) - 1
        @isOutput = false
      @outs += s.slice(start, last)
      console.log s
      if !@isOutput and @outs?
        @Out()
    @process.stderr.on 'data', (data)=>
      console.log data.toString()
      @resultv.text(data.toString())
    @process.on 'exit', (code, signal)=>
      @command = ""
      if @outs?
        @Out()
      @printv.text("")
      console.log 'terminated: ', signal
      @process = null
      console.log @process
    return @process

  Out: () ->
    if @outs? and !(@outs is "")
      console.log "outs: ", @outs
      if @outs.match(/\n/g)?.length > 1
        start = @outs.search(/\n([\s\S])*/g)
        last = @outs.search(/\n.*$/)
        @outs = @outs.slice(start, last)
      line = @outs.match(/tmp:([0-9]+)\) \[debug\]/)?[1]
      if line?
        editor = atom.workspace.getActiveTextEditor()
        editor.setCursorBufferPosition [parseInt(line)-1, 0]
        editor.selectLinesContainingCursors()
      if @command is "p -ctx pos\n"
        @printv.text(@outs)
      else
        @resultv.text(@outs)
        if @process? and !(@command is "")
          @Print()
    @isOutput = false
    @outs = ""

  Breakpoint: (bp) ->
    @exec("b #{bp}\n")

  Stepin: (bp) ->
    @exec("s\n")

  Stepover: (bp) ->
    @exec("n\n")

  Stepreturn: (bp) ->
    @exec("f\n")

  Run: (bp) ->
    @exec("r\n")

  Print: (bp) ->
    @exec("p -ctx pos\n")

  Quit: (bp) ->
    @exec("q\n")

  exec: (input) ->
    @command = input
    cp = @init()
    cp.stdin.write input, ()->
      console.log "exec: ", input

  createFileSync: ->
    tmp = require 'tmp'
    tmpobj = tmp.fileSync()
    #console.log("Dir: ", tmpobj.name)
    return tmpobj
