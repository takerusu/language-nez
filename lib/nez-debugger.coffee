child_process = require 'child_process'
_atom = require 'atom'
fs = require 'fs'
module.exports = class NezDebugger
  @process = null
  @command = null
  @outs = null
  @isOutput = null

  constructor: (@inputPath, @output) ->
    @outs = ""
    @isOutput = false
    @dbConsole = "(nezdb)"

  suspend: () ->
    @process?.kill()

  init: () ->
    @outs = ""
    @isOutput = false
    nezPath = atom.config.get 'language-nez.nezPath'
    editor = atom.workspace.getActiveTextEditor()
    tmpobj = @createFileSync()
    path = tmpobj.name
    fs.writeFileSync(path, editor.getText())
    command = ["-jar", "#{nezPath}", "debug", "-p", "#{path}", "-i", "#{@inputPath}"]
    @process = child_process.exec("java -jar #{nezPath} debug -p #{path} -i #{@inputPath}")
    @process.stdout.on 'data', (data)=>
      s = data.toString()
      start = 0
      last = 0
      if @isOutput
        last = s.length
      console.log s.search(@command) != -1
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
      @output.text(data.toString())
    @process.on 'exit', (code, signal)=>
      if @outs?
        @Out()
      console.log 'terminated: ', signal
      @process = null
      console.log @process
    @process

  Out: () ->
    if @outs? && @outs is not ""
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
      @output.text(@outs)
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
    cp = (if @process? then @process else @init())
    cp.stdin.write input, ()->
      console.log "exec: ", input

  createFileSync: ->
    tmp = require 'tmp'
    tmpobj = tmp.fileSync()
    #console.log("Dir: ", tmpobj.name)
    return tmpobj
