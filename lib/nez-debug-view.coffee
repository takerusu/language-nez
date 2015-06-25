{View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'
_atom = require 'atom'

module.exports =
  class NezView extends View
    nez: null
    subscriptions: null
    nezDebugger: null
    inputPath: null

    @content: ->
      @div class:'nez-debug-view', =>
        @div class:'ui-item', =>
          @div class:'btn-group mleft', =>
            @button outlet:'run', id:'run', class:'btn btn-icon', =>
              @i class:'fa fa-play'
            @button outlet:'quit', id:'quit', class:'btn btn-icon', =>
              @i class:'fa fa-stop'
          @button outlet:'print', id:'print', class:'btn btn-icon mleft', =>
            @i class:'fa fa-print'
          @div class:'btn-group mleft', =>
            @button outlet:'stepin', id:'stepin', class:'btn btn-icon', =>
              @i class:'fa fa-level-down'
            @button outlet:'stepover', id:'stepover', class:'btn btn-icon', =>
              @i class:'fa fa-long-arrow-right'
            @button outlet:'stepreturn', id:'stepreturn', class:'btn btn-icon', =>
              @i class:'fa fa-share'
          @select outlet:'ruleView', class:'rule-view', class:'mleft'
          @button outlet:'breakpoint', id:'breakpoint', class:'btn btn-icon mleft', =>
            @i class:'fa fa-tag'
          @input outlet:'inputfile', type:'file', style:'display:inline;', class:'mleft'
        @div =>
          @pre outlet:'msgView', style:'display:none',  =>
            @code outlet:'message'
          @pre class:'result-view', =>
            @code outlet:'result', "results"

    initialize: ->
      @run.on 'click', @confirm
      @quit.on 'click', @confirm
      @stepin.on 'click', @confirm
      @stepover.on 'click', @confirm
      @stepreturn.on 'click', @confirm
      @breakpoint.on 'click', @confirm
      @print.on 'click', @confirm

    confirm:(e) =>
      if @inputfile[0].files.length < 1
        return
      @inputPath = @inputfile[0].files[0].path
      switch e.currentTarget.id
        when "run"
          @getNezdebugger().Run()
        when "quit"
          @getNezdebugger().Quit()
        when "stepin"
          @getNezdebugger().Stepin()
        when "stepover"
          @getNezdebugger().Stepover()
        when "stepreturn"
          @getNezdebugger().Stepreturn()
        when "breakpoint"
          @getNezdebugger().Breakpoint(@ruleView.val())
        when "print"
          @getNezdebugger().Print()

    getNezdebugger:() ->
      if !@nezDebugger?
        NezDebugger = require './nez-debugger'
        return @nezDebugger = new NezDebugger(@inputPath, @result)
      return @nezDebugger


    hide: =>
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'focus')
      @nezDebugger.suspend()
      @subscriptions.dispose()
      @panel.hide()

    show: =>
      @panel ?= atom.workspace.addBottomPanel({ item: this, priority: 1000, visible: true })
      @createRuleView()
      @subscriptions = new CompositeDisposable
      @subscriptions.add atom.tooltips.add @stepin,
        title: 'Step Into'
      @subscriptions.add atom.tooltips.add @stepover,
        title: 'Step Over'
      @subscriptions.add atom.tooltips.add @stepreturn,
        title: 'Step Return'
      @subscriptions.add atom.tooltips.add @breakpoint,
        title: 'Set Breakpoint'
      @subscriptions.add atom.tooltips.add @run,
        title: 'Run'
      @subscriptions.add atom.tooltips.add @print,
        title: 'Print'
      @panel.show()

    createRuleView: =>
      if @nez.ruleSet?
        @ruleView.empty()
        for key of @nez.ruleSet
          @ruleView.append "<option value=#{key}>#{key}</option>"
        #console.log @nez.startPoint
        @setStartingPoint()

    setStartingPoint: =>
      if @nez.startPoint is "" or !@ruleView.find("option[value=#{@nez.startPoint}]")?
        @nez.startPoint = "File"
      @find("option[value=#{@nez.startPoint}]")?.attr("selected", "")

    toggle: (nez) ->
      @nez = nez

      if @panel?.isVisible()
        @hide()
      else
        @show()
