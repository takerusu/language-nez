{ScrollView} = require 'atom-space-pen-views'
{Emitter} = require 'atom'
_atom = require 'atom'

module.exports =
  class NezPreviewView extends ScrollView
    @content: ->
      @div class: 'nez-preview native-key-bindings', tabindex: -1

    constructor: ({@editorId, @filePath}) ->
      super
      @emitter = new Emitter

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
      @show(json)

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
      vmjs = require './vendor/vismodel.js'
      panel = new vmjs.VisualModelPanel(@[0])
      TopNode = vmjs.createNodeViewFromP4DJson(json)
      panel.initializeView(TopNode)
      panel.draw()
      panel.viewport.camera.setPositionAndScale(TopNode.centerGx, TopNode.centerGy + panel.viewport.areaHeight / 3, 1)
