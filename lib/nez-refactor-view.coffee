{View, TextEditorView} = require 'atom-space-pen-views'
_atom = require 'atom'

module.exports =
  class NezRefactorView extends View
    nez: null

    @content: ->
      @div class:'nez-refactor-view', =>
        @div =>
          @span style:'font-weight: bold;', "Rename Rule"
          @span class: 'subtle-info-message', =>
            @span 'Close this panel with '
            @span class:'highlight', 'esc'
            @span ' key. And commit with the '
            @span class:'highlight', 'enter'
            @span 'key.'
        @div =>
          @subview 'editor',
            new TextEditorView(mini: true, placeholderText: 'new name')


    initialize: ->
      # @editorView = atom.views.getView(@editor)
      @editor.on 'core:confirm', @confirm
      @editor.on 'core:confirm', @confirm
      @editor.on 'core:cancel', @hide
      @editor.on 'blur', @hide

    setRule: (@rule) ->

    confirm: =>
      after = @editor.getText()
      @nez?.refactorRuleName(after, @rule)
      @toggle()

    toggle: (nez) ->
      @nez = nez if nez?
      if @panel?.isVisible()
        @hide()
      else
        @show()

    hide: =>
      # @editor.css("height", "30px")
      # @editor.val("")
      # @result.text("results")
      # atom.commands.dispatch(atom.views.getView(atom.workspace), 'focus')
      @panel.hide()

    show: =>
      @panel ?= atom.workspace.addModalPanel(item: this)
      @panel.show()
      @editor.setText(@rule)
      @editor.focus()
