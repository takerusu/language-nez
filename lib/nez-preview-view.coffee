{ScrollView} = require 'atom-space-pen-views'
{Emitter, Range, CompositeDisposable} = require 'atom'
_atom = require 'atom'

module.exports =
  class NezPreviewView extends ScrollView
    @content: ->
      @div class: 'nez-preview native-key-bindings', tabindex: -1

    constructor: ({@editorId, @filePath}) ->
      super
      @emitter = new Emitter
      @disposables = new CompositeDisposable

    onDidChangeTitle: (callback) ->
      @emitter.on 'did-change-title', callback

    attached: ->
      return if @isAttached
      @isAttached = true
      if @editorId?
        @editor = @editorForId(@editorId)
        @emitter.emit 'did-change-title' if @editor?
      # else
      #   if atom.workspace?
      #     @subscribeToFilePath(@filePath)
      #   else
      #     @disposables.add atom.packages.onDidActivateInitialPackages =>
      #       @subscribeToFilePath(@filePath)
      parser = require './nez-parser'
      json = parser.parse @editor.getText()
      @rules = @posToRange(json, @editor)
      curpos = @editor.getCursorBufferPosition()
      p = @selectRuleByPos(curpos, @rules.value)
      json = p if p?
      @show(json)
      @disposables.add @editor.getBuffer().onDidStopChanging ->
        console.log "change!!"
      @disposables.add @editor.observeCursors (cursor) =>
        console.log cursor
        cursor.onDidChangePosition (e) =>
          curpos = e.newBufferPosition
          p = @selectRuleByPos(curpos, @rules.value)
          @show(p) if p?


    posToRange:(json, editor) ->
      rules = []
      nl = [0]
      i = 0
      n = 0
      editor.scan(/\n/g, (obj) ->
        nl.push obj.match.index
      )
      return unless nl.length > 1
      for result in json.value
        if result.tag is "Production"
          pos = result.pos
          while !result.range? and i+1 isnt nl.length
            if nl[i] <= pos.start < nl[i+1]
              start = [i, pos.start-nl[i]-1]
              while !result.range? and i+1 isnt nl.length
                if nl[i] < pos.end <= nl[i+1] + 1
                  end = [i, pos.end-nl[i]-1]
                  result.range = new Range(start, end)
                i++
              i--
            i++
          i--
      json

    selectRuleByPos: (pos, rules) ->
      for rule in rules
        continue unless rule.range?
        if rule.range.containsPoint(pos)
          return rule


    getTitle: ->
      if @editor?
        "#{@editor.getTitle()} Preview"
      else
        "NEZ Preview"

    genVismodel: ->
      vmjs = require './vendor/vismodel.js'

    editorForId: (editorId) ->
      for editor in atom.workspace.getTextEditors()
        return editor if editor.id?.toString() is editorId.toString()
      null

    show: (json) ->
      while @[0].childElementCount > 0
        @[0].removeChild(@[0].children[0])
      # vmjs = require './vendor/vismodel.js'
      # panel = new vmjs.VisualModelPanel(@[0])
      # TopNode = vmjs.createNodeViewFromP4DJson(json)
      # panel.initializeView(TopNode)
      # panel.draw()
      # panel.viewport.camera.setPositionAndScale(TopNode.centerGx, TopNode.centerGy + panel.viewport.areaHeight / 3, 1)
      NEZDrawer = require './vendor/SVGDrawer.coffee'
      drawer = new NEZDrawer(@)
      drawer.show(json)
