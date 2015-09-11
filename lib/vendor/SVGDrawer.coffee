class Point
  constructor: (x, y) ->
    if x instanceof Point
      return x
    if x instanceof Array and x.length is 2
      @x = x[0]
      @y = x[1]
    else
      @x = x
      @y = y
  toString: ->
    @x + " " + @y
  ltor :(a) ->
    this.x < a.x
  utod :(a) ->
    this.y < a.y

class SVGDrawer
  constructor: (target) ->
    @width = 600
    @height = 400
    @rlength = 3
    @boxx = 60
    @boxy = 30
    @padding = 3
    rect = target[0].getBoundingClientRect()
    @top = rect.top + window.pageYOffset
    @left = rect.left + window.pageXOffset
    @scale = 1.0
    @posx = 0
    @posy = 0

    if target[0].clientWidth? and target[0].clientHeight?
      @width = target[0].clientWidth unless target[0].clientWidth is 0
      @height = target[0].clientHeight unless target[0].clientHeight is 0

    @svg = document.createElementNS("http://www.w3.org/2000/svg", "svg")
    @svg.setAttributeNS(null, 'version', '1.1')
    @svg.setAttribute("xmlns", "http://www.w3.org/2000/svg")
    @svg.setAttribute("xmlns:xlink", "http://www.w3.org/1999/xlink")
    @svg.setAttribute("width", @width + "px")
    @svg.setAttribute("height", @height + "px")
    @svg.setAttribute("viewBox", "0 0 " + @width + " " + @height)
    @svg.setAttribute("preserveAspectRatio", "xMinYMin")
    @svgg = document.createElementNS("http://www.w3.org/2000/svg", "g")
    @svg.appendChild @svgg
    target[0].appendChild(@svg)
    onWheel = (e) =>
      @scale -= e.originalEvent.deltaY * 0.01
      # @scale = 1.5 if @scale > 1.5
      @scale = 0.5 if @scale < 0.5
      curposx = e.originalEvent.screenX - @left
      curposy = e.originalEvent.screenY - @top
      bbox = @svgg.getBBox()
      pointx = bbox.width / 2
      pointy = bbox.height / 2

      tx = @posx * bbox.width / @width + (bbox.x + pointx)*(1 - @scale)
      ty = @posy * bbox.height / @height + (bbox.y + pointy)*(1 - @scale)

      @svgg.setAttribute("transform", "translate(#{tx}, #{ty}) scale(#{@scale})")
    onDragStart = (e) =>
      console.log "start"
      e.preventDefault()
      e.stopPropagation()
      @isdrag = true
      @startX = e.originalEvent.screenX
      @startY = e.originalEvent.screenY
    onDragEnd = (e) =>
      console.log "end"
      @isdrag = false
      @startX = 0
      @startY = 0
    onDrag = (e) =>
      return unless @isdrag

      bbox = @svgg.getBBox()
      pointx = bbox.width / 2
      pointy = bbox.height / 2
      curx = e.originalEvent.screenX
      cury = e.originalEvent.screenY
      if curx isnt 0 and cury isnt 0
        @posx += curx - @startX
        @posy += cury - @startY
      @startX = curx
      @startY = cury
      tx = @posx * bbox.width / @width + (bbox.x + pointx)*(1 - @scale)
      ty = @posy * bbox.height / @height + (bbox.y + pointy)*(1 - @scale)
      # console.log e.originalEvent.screenX, e.originalEvent.screenY
      console.log @posx,@posy
      # console.log tx,ty
      @svgg.setAttribute("transform", "translate(#{tx}, #{ty}) scale(#{@scale})")


    target.on('wheel', onWheel)
    target.on('mousedown', onDragStart)
    target.on('mousemove', onDrag)
    target.on('mouseup', onDragEnd)
    target.on('')

  clear: () ->
    while @svg.firstChild?
      @svg.removeChild @svg.firstChild

  setViewport: (option) ->
    x = option.x
    y = option.y - option.height / 2
    y = y - @padding
    xx = option.width
    yy = option.height + @padding * 2
    @svg.setAttribute("viewBox", "#{x} #{y} #{xx} #{yy}")

  makePathObj: (a, b, bezie) ->
    path = document.createElementNS("http://www.w3.org/2000/svg", "path")
    path.style.stroke = "black"
    path.style.fill = "none"
    if bezie?
      path.setAttribute("d", "M" + a.toString() + " Q " + bezie.toString() + " " + b.toString())
    else if b?
      path.setAttribute("d", "M" + a.toString() + " " + b.toString())
    else
      path.setAttribute("d", "M" + a)
    @svgg.appendChild(path)

  drawRect: ({point, width, height, r, fill, opacity, stroke, stroke_dasharray}) ->
    rect = document.createElementNS("http://www.w3.org/2000/svg", "rect")
    rect.style.stroke = if stroke? then stroke else "black"
    rect.style.fill = if fill? then fill else "none"
    rect.setAttribute("fill-opacity", opacity) if opacity?
    rect.setAttribute("stroke-dasharray", stroke_dasharray) if stroke_dasharray?
    rect.setAttribute("x", point.x)
    rect.setAttribute("y", point.y)
    rect.setAttribute("width", width)
    rect.setAttribute("height", height)
    if r?
      rect.setAttribute("rx", r)
      rect.setAttribute("ry", r)
    @svgg.appendChild(rect)

  drawPath: (a, b, xd) ->
    unless b?
      option = a
      a = [option.x, option.y]
      b = [option.xx, option.yy]
      xd = option.xd
      if option.through or option.loop
        paddingY = if option.height > 0 then @padding else -@padding
        start = new Point(a)
        end = new Point(b)
        width = end.x - start.x
        p1 = new Point(start.x + @padding, start.y - paddingY)
        b1 = new Point(start.x + @padding, start.y)
        p2 = new Point(p1.x, start.y - option.height + paddingY)
        p3 = new Point(p2.x + @padding, p2.y - paddingY)
        b2 = new Point(p2.x, p3.y)
        p4 = new Point(start.x + width - @padding * 2, p3.y)
        p5 = new Point(p4.x + @padding, p4.y + paddingY)
        b3 = new Point(p5.x, p4.y)
        p6 = new Point(p5.x, p4.y + option.height - paddingY)
        b4 = new Point(p5.x, p6.y + paddingY)
        if option.loop
          start.x += @padding * 2
          end.x -= @padding * 2
        route =
          [start, "Q", b1, p1, "L", p2, "Q", b2, p3,
          "L", p4, "Q", b3, p5, "L", p6, "Q", b4 ,end].join(" ")
        return @makePathObj(route)
    start = new Point(a)
    end = new Point(b)
    if start.x is end.x || start.y is end.y
      if start.x is end.x && start.y is end.y
        return
      @makePathObj(start, end)
    else
      xl = end.x - start.x
      xd =  if xd? then xd - start.x else xl / 2
      yl = end.y - start.y
      rlx = @rlength
      rlx = Math.abs(xd) if Math.abs(xl / 2) < @rlength
      rlx = Math.abs(yl / 2) if Math.abs(yl / 2) < @rlength
      rly = rlx
      rlx = -rlx unless start.ltor end
      rly = -rly unless start.utod end
      p1 = new Point(start.x + xd - rlx, start.y)
      p2 = new Point(start.x + xd, start.y + rly)
      b1 = new Point(start.x + xd, start.y)
      p3 = new Point(start.x + xd, end.y - rly)
      p4 = new Point(start.x + xd + rlx, end.y)
      b2 = new Point(start.x + xd, end.y)
      route = [start, "L", p1, "Q", b1, p2, "L", p3, "Q", b2, p4, "L", end].join(" ")
      @makePathObj(route)

class NEZDrawer extends SVGDrawer
  show : (json) ->
    if json.tag is "Production"
      production = json
    else
      console.log json.value[0].value[1]
      production = json.value[0]
    return if production.value.len
    return if production.value.length < 2
    target = production.value[production.value.length - 1]
    name = production.value[production.value.length - 2]
    @name = name.value
    start_line =
      shape: "path"
      width: 6
      height: 1
      x: 0
      y: 0
      xx: 6
      yy: 0
    option =
      x: start_line.x + start_line.width
      y: start_line.y
    opt = @plot(target, option)
    return if !opt? or !opt.width?
    end_line =
      shape: "path"
      width: 6
      height: 1
      x: start_line.width + opt.width
      y: start_line.y
      xx: start_line.width + opt.width + 6
      yy: start_line.y
    plot = {}
    plot.shape = "List"
    plot.value = [start_line, opt, end_line]
    plot.x = start_line.x
    plot.y = start_line.y
    plot.width = start_line.width + opt.width + end_line.width
    plot.height = Math.max(start_line.height, opt.height, end_line.height)
    console.log JSON.parse JSON.stringify(plot)
    @draw(plot)
    @elementWidth = plot.width
    @elementHeight = plot.height
    console.log plot

    @setViewport(plot)

  plot : (json, option) ->
    switch json.tag
      when "Any", "Character", "String", "NonTerminal"
        @Textrect(json.tag, json.value, option)
      when "Name"
        @Textrect("NonTerminal", json.value, option)
      when "And", "Not"
        padding = 5
        p = @plot(json.value[0], option)
        p.moveX = padding
        p.moveY = 0
        ret =
          shape: "List"
          x: option.x
          y: option.y
          width: p.width + padding * 2
          height: p.height + padding * 4
          value : [p]
        rect =
          shape: "rect"
          text: ""
          round: @rlength
          x: option.x
          y: option.y
          width: ret.width
          height: ret.height
          stroke: if json.tag is "And" then "#8AF" else "#F88"
          stroke_dasharray: "3,3"
          opacity: "0.2"
        text =
          shape: "text"
          x: option.x + padding
          y: option.y - ret.height / 2 + padding
          size: 4
          text: json.tag
        ret.value.push rect, text
        ret.value.push @plotPath(
          option.x, option.y,
          option.x + padding, option.y
        )
        ret.value.push @plotPath(
          option.x + ret.width - padding, option.y,
          option.x + ret.width, option.y
        )
        ret
      when "Class"
        str = ""
        for v in json.value
          if v.tag is "Class"
            str += v.value
          else if v.tag is "List"
            str += v.value[0].value + "-" + v.value[1].value
        @Textrect("Class", str, option)
      when "Sequence"
        sequence_width = 6
        ret = {shape: "List", width: -sequence_width, height: 0}
        ret.x = option.x
        ret.y = option.y
        ret.value = []
        opt = JSON.parse(JSON.stringify(option))
        for v in json.value
          continue if v.tag is "Tagging"
          continue if v.tag is "Replace"
          # console.log(v)
          p = @plot(v, opt)
          opt.x += p.width + sequence_width
          ret.width += p.width + sequence_width
          ret.height = p.height if ret.height < p.height
          ret.value.push p
        x = 0
        path = []
        for v in ret.value
          # v.x += x
          # x += v.width + sequence_width
          path.push
            shape: "path"
            x: v.x + v.width
            y: ret.y
            xx: v.x + v.width + sequence_width
            yy: ret.y
        path.pop()
        ret.value.push.apply(ret.value, path)
        ret
      when "Choice"
        choice_width = 20
        choice_height = 10
        ret = {shape: "List", width: 0, height: -choice_height}
        ret.x = option.x
        ret.y = option.y
        ret.value = []
        for v in json.value
          p = @plot(v, option)
          ret.width = p.width if ret.width < p.width
          ret.height += p.height + choice_height
          ret.value.push p
        max_width = ret.width
        ret.width += 2 * choice_width
        y = ret.y - ret.height / 2
        path = []
        xd = (ret.width / 2 - max_width / 2) / 2
        for v in ret.value
          v.moveX = ret.width / 2 - v.width / 2
          v.moveY = y + v.height / 2
          y = y + v.height + choice_height
          left =
            shape: "path"
            x: ret.x
            y: ret.y
            xd: ret.x + xd
            xx: ret.x + v.moveX
            yy: ret.y + v.moveY
          right =
            shape: "path"
            x: ret.x + v.moveX + v.width
            y: ret.y + v.moveY
            xd: ret.x + ret.width - xd
            xx: ret.x + ret.width
            yy: ret.y
          path.push left
          path.push right
        ret.value.push.apply(ret.value, path)
        ret
      when "Option"
        option_width = 10
        option_height = 10
        ret = {shape: "List", width: 0, height: -option_height}
        ret.x = option.x
        ret.y = option.y
        ret.value = []
        p = @plot(json.value[0], option)
        ret.width = p.width + option_width * 2
        ret.height = p.height + option_height * 2
        p.moveX = option_width
        p.moveY = 0
        ret.value.push p
        path =
          shape: "path"
          through: true
          x: ret.x
          y: ret.y
          xx: ret.x + ret.width
          yy: ret.y
          height: -ret.height / 2
        left =
          shape: "path"
          x: ret.x
          y : ret.y
          xx: ret.x + option_width
          yy : ret.y
        right =
          shape: "path"
          x: left.xx + p.width
          y : ret.y
          xx: left.xx + p.width + option_width
          yy : ret.y
        ret.value.push path, left, right
        ret
      when "Repetition", "Repetition1"
        repetition_width = 10
        repetition_height = 10
        ret =
          shape: "List"
          x: option.x
          y: option.y
          width: 0
          height: 0
        ret.value = []
        p = @plot(json.value[0], option)
        p.moveX = repetition_width
        ret.width = p.width + repetition_width * 2
        ret.height = p.height + repetition_height * 2
        loops =
          shape: "path"
          loop: true
          x: ret.x
          y: ret.y
          xx: ret.x + ret.width
          yy: ret.y
          height: ret.height / 2
        path =
          shape: "path"
          through: true
          x: ret.x
          y: ret.y
          xx: ret.x + ret.width
          yy: ret.y
          height: -ret.height / 2
        left =
          shape: "path"
          x: ret.x
          y : ret.y
          xx: ret.x + repetition_width
          yy : ret.y
        right =
          shape: "path"
          x: left.xx + p.width
          y : ret.y
          xx: left.xx + p.width + repetition_width
          yy : ret.y
        ret.value.push p, loops, left, right
        ret.value.push path if json.tag is "Repetition"
        ret
      when "New", "LeftNew", "Link", "Is", "If", "On", "Block", "Def"
        @plot(json.value[json.value.length - 1], option)

  plotRect: () ->
    return {
      shape: "rect"
      text: text
      round: round
      x: option.x
      y: option.y
      width: w
      height: h
    }

  plotPath: (x, y, xx, yy) ->
    shape: "path"
    x: x
    y: y
    xx: xx
    yy: yy

  Textrect : (type, text, option) ->
    charSize = @getCharSize()
    text = "'#{text}'" if type is "Character"
    text = "\"#{text}\"" if type is "String"
    text = "[#{text}]" if type is "Class"
    # text = "&#{text}" if type is "And"
    # text = "!#{text}" if type is "Not"
    l = text.length
    w = charSize.width * l + @padding * 2
    h = charSize.height + @padding * 2
    round = if type is "NonTerminal" then true else false
    return {
      shape: "rect"
      text: text
      round: round
      x: option.x
      y: option.y
      width: w
      height: h
    }

  draw : (plot) ->
    plot.x += plot.moveX if plot.moveX?
    plot.y += plot.moveY if plot.moveY?
    switch plot.shape
      when "List"
        option = {}
        option.value = []
        option.shape = "List"
        for p in plot.value
          if plot.moveX?
            p.x += plot.moveX
            p.moveX = 0 unless p.moveX?
            p.moveX += plot.moveX if p.shape is "List"
            p.xd += plot.moveX if p.xd?
            p.xx += plot.moveX if p.xx?
          if plot.moveY?
            p.y += plot.moveY
            p.moveY = 0 unless p.moveY?
            p.moveY += plot.moveY if p.shape is "List"
            p.yy += plot.moveY if p.yy?
          opt = @draw(p)
          # option.width += opt.width
          # option.height = opt.height if option.height < opt.height
          # option.value.push opt
        option
      when "path"
        @drawPath(plot)
      when "rect"
        @drawRectWithText(plot)
      when "text"
        @drawText(plot.text, plot)

  drawText : (text, option, target) ->
    t = document.createElementNS("http://www.w3.org/2000/svg", "text")
    t.setAttribute("x", option.x)
    t.setAttribute("y", option.y)
    t.setAttribute("fill", "#222")
    fontsize = if option.size? then option.size else 12
    t.setAttribute("font-size", fontsize)
    t.setAttribute("font-family", "monospace")
    t.innerHTML = text
    target = @svgg unless target?
    target.appendChild(t)
    t

  drawTextPadding : (text, option) ->
    t = document.createElementNS("http://www.w3.org/2000/svg", "text")
    t.setAttribute("x", option.x + @padding)
    t.setAttribute("y", option.y + @padding)
    t.setAttribute("fill", "#222")
    t.setAttribute("font-size", 12)
    t.setAttribute("font-family", "monospace")
    t.innerHTML = text
    @svgg.appendChild(t)
    t

  getCharSize : () ->
    if @charSize?
      @charSize
    else
      text = @drawText("XgfTlM|.q", {x: -1000, y: -1000}, @svg)
      box = text.getBBox()
      @charSize = {}
      @charSize.height = box.height
      @charSize.width = box.width / (text.innerHTML.length - 1)
      @charSize

  drawRectWithText : (option) ->
    point = new Point(option.x, option.y - option.height / 2)
    @drawTextPadding(option.text, option)
    r = 0
    r = @rlength if option.round
    option.point = point
    option.r = r
    @drawRect(option)

  drawChoice : () ->


if module?
  module.exports = NEZDrawer
