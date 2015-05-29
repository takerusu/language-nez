{View} = require 'atom-space-pen-views'

module.exports =
  class NezView extends View
    nez: null


    @content: ->
      @div class:'nez-view', =>
        @input outlet:'editor', class:'native-key-bindings', placeholder: 'input test code...'
        @pre =>
          @code outlet:'result', class:'result-view', "results"

    initialize: ->
      @editor.on 'core:confirm', @confirm
      @editor.on 'keydown', @confirm
      @editor.on 'core:cancel', @hide
      @editor.on 'blur', @blur

    cancelled: =>
      @panel.hide()

    confirm: (e) =>
      if e.keyCode is 13
        #console.log @nez.run(@editor.val())
        @nez.run(@editor.val()).then((res) =>
          console.log res.stdout
          @result.text(res.stdout)
        )

    blur: =>
      @panel.hide()

    hide: =>
      @editor.val("")
      @result.text("")
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'focus')
      @panel.hide()

    show: =>
      @panel ?= atom.workspace.addModalPanel(item: this)
      @panel.show()
      @editor.focus()
      @editor.select()

    toggle: (nez) ->
      @nez = nez
      console.log @nez
      if @panel?.isVisible()
        @hide()
      else
        @show()
