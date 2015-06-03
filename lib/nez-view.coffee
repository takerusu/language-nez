{View} = require 'atom'

module.exports =
  class NezView extends View
    nez: null


    @content: ->
      @div class:'nez-view', =>
        @div =>
          @textarea outlet:'editor', style:'line-height:20px;height:30px', class:'native-key-bindings', placeholder: ''
          @select outlet: 'ruleView', class:'rule-view'
        @div =>
          @pre =>
            @code outlet:'result', class:'result-view', "results"

    initialize: ->
      @editor.on 'core:confirm', @confirm
      @editor.on 'input', @autosize
      @editor.on 'core:cancel', @hide
      #@editor.on 'blur', @blur
      #console.log @panel

    cancelled: =>
      @hide()

    confirm: (e) =>
      #console.log e
      #if e.keyCode is 13
      @nez.startPoint = @ruleView.val()
      @nez.run(@editor.val()).then((res) =>
        console.log res.stdout
        @result.text(res.stdout)
      )

    autosize: (e) =>
      #console.log "scroll:", e.target.scrollHeight
      #console.log "offset:", e.target.offsetHeight
      if e.target.scrollHeight > e.target.offsetHeight
        e.target.style.height = e.target.scrollHeight + "px" if e.target.scrollHeight < 300
      else
        lineHeight = Number(e.target.style.lineHeight.split("px")[0])
        height = Number(e.target.style.height.split("px")[0])
        e.target.style.height = (height - lineHeight) + "px"
        @autosize(e)

    blur: (e) =>
      @hide() unless e.relatedTarget?.className is "rule-view"

    hide: =>
      @editor.css("height", "30px")
      @editor.val("")
      @result.text("results")
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'focus')
      @panel.hide()

    show: =>
      @panel ?= atom.workspace.addModalPanel(item: this)
      @createRuleView
      @panel.show()
      @editor.focus()
      @editor.select()

    createRuleView: =>
      if @nez.ruleSet?
        @ruleView.empty()
        for rule in @nez.ruleSet
          @ruleView.append "<option value=#{rule}>#{rule}</option>"
        #console.log @nez.startPoint
        @setStartingPoint()

    setStartingPoint: =>
      if @nez.startPoint is "" or !@ruleView.find("option[value=#{@nez.startPoint}]")?
        @nez.startPoint = "File"
      @find("option[value=#{@nez.startPoint}]")?.attr("selected", "")

    toggle: (nez) ->
      @nez = nez
      Object.observe @nez, (changes)=>
        changes.forEach (change, i)=>
          #console.log change.name
          @createRuleView() if change.name is "ruleSet"
          @setStartingPoint() if change.name is "startPoint"

      if @panel?.isVisible()
        @hide()
      else
        @show()