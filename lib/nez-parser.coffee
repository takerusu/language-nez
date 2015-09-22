
class Parser
  constructor: ->
    @currPos = 0

  parse: (input) ->
    @currPos = 0
    @input = input
    @NonTerminalList = []
    @nez$File()

  nez$File: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    while(result isnt false)
      posl978 = poss.length
      pos978 = @currPos
      result = @nez$S()
    @currPos = pos978
    while(poss.length > posl978)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      while(result isnt false)
        posl981 = poss.length
        pos981 = @currPos
        result = @nez$Statement()
        outs.push result if typeof result isnt "boolean"
      @currPos = pos981
      while(poss.length > posl981)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "List" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$S: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1051 = @currPos
    posl1051 = poss.length
    result = true
    if(/[\t]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos1051
      while(poss.length > posl1051)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[\n]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result is false)
        @currPos = pos1051
        while(poss.length > posl1051)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[\r]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result is false)
          @currPos = pos1051
          while(poss.length > posl1051)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[ ]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Statement: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1122 = @currPos
    posl1122 = poss.length
    result = true
    result = @nez$Document()
    if(result is false)
      @currPos = pos1122
      while(poss.length > posl1122)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      result = @nez$ExampleStatement()
      if(result is false)
        @currPos = pos1122
        while(poss.length > posl1122)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        result = @nez$ImportStatement()
        if(result is false)
          @currPos = pos1122
          while(poss.length > posl1122)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          result = @nez$FormatStatement()
          if(result is false)
            @currPos = pos1122
            while(poss.length > posl1122)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$TemplateStatement()
            if(result is false)
              @currPos = pos1122
              while(poss.length > posl1122)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              result = @nez$Production()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Document: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$COMMENT()
    if(result isnt false)
      while(result isnt false)
        posl838 = poss.length
        pos838 = @currPos
        while(result isnt false)
          posl836 = poss.length
          pos836 = @currPos
          if(/[\t-\n\r ]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
          else
            result = false
        @currPos = pos836
        while(poss.length > posl836)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(result isnt false)
          result = @nez$COMMENT()
      @currPos = pos838
      while(poss.length > posl838)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "Comment" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$COMMENT: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos925 = @currPos
    posl925 = poss.length
    result = true
    if(/[\/]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[\*]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        while(result isnt false)
          posl557 = poss.length
          pos557 = @currPos
          pos555 = @currPos
          if(/[\*]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\/]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
          @currPos = pos555
          if(result is false)
            result = true
          else
            result = false
          if(result isnt false)
            if(@input.length > @currPos)
              @currPos++
              result = true
            else
              result = false
        @currPos = pos557
        while(poss.length > posl557)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(result isnt false)
          if(/[\*]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\/]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
    if(result is false)
      @currPos = pos925
      while(poss.length > posl925)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[\/]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[\/]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          while(result isnt false)
            posl921 = poss.length
            pos921 = @currPos
            pos919 = @currPos
            result = @nez$EOL()
            @currPos = pos919
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              if(@input.length > @currPos)
                @currPos++
                result = true
              else
                result = false
          @currPos = pos921
          while(poss.length > posl921)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(result isnt false)
            result = @nez$EOL()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$EOL: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos899 = @currPos
    posl899 = poss.length
    result = true
    if(/[\n]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos899
      while(poss.length > posl899)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[\r]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        pos654 = @currPos
        posl654 = poss.length
        if(/[\n]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result is false)
          @currPos = pos654
          while(poss.length > posl654)
            posobj = poss.pop(posobj) if poss.length > 0
        result = true
      if(result is false)
        @currPos = pos899
        while(poss.length > posl899)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        result = @nez$EOT()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$EOT: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos715 = @currPos
    if(@input.length > @currPos)
      @currPos++
      result = true
    else
      result = false
    @currPos = pos715
    if(result is false)
      result = true
    else
      result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$_: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    while(result isnt false)
      posl1115 = poss.length
      pos1115 = @currPos
      pos1114 = @currPos
      posl1114 = poss.length
      result = true
      if(/[\t]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result is false)
        @currPos = pos1114
        while(poss.length > posl1114)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[\n]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result is false)
          @currPos = pos1114
          while(poss.length > posl1114)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\r]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result is false)
            @currPos = pos1114
            while(poss.length > posl1114)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[ ]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result is false)
              @currPos = pos1114
              while(poss.length > posl1114)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(/[\/]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[\*]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  while(result isnt false)
                    posl557 = poss.length
                    pos557 = @currPos
                    pos555 = @currPos
                    if(/[\*]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[\/]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                    @currPos = pos555
                    if(result is false)
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(@input.length > @currPos)
                        @currPos++
                        result = true
                      else
                        result = false
                  @currPos = pos557
                  while(poss.length > posl557)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(result isnt false)
                    if(/[\*]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[\/]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
              if(result is false)
                @currPos = pos1114
                while(poss.length > posl1114)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                if(/[\/]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[\/]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    while(result isnt false)
                      posl921 = poss.length
                      pos921 = @currPos
                      pos919 = @currPos
                      result = @nez$EOL()
                      @currPos = pos919
                      if(result is false)
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(@input.length > @currPos)
                          @currPos++
                          result = true
                        else
                          result = false
                    @currPos = pos921
                    while(poss.length > posl921)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    if(result isnt false)
                      result = @nez$EOL()
    @currPos = pos1115
    while(poss.length > posl1115)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$ExampleStatement: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[e]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[x]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[a]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[m]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[p]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[l]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[e]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  pos142 = @currPos
                  if(/[0-9A-Z_a-z]/).test(@input.charAt(@currPos))
                    result = true
                    @currPos++
                  else
                    result = false
                  @currPos = pos142
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
                    if(result isnt false)
                      pos166 = @currPos
                      posl166 = poss.length
                      result = true
                      if(/[\!]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      tag = "Rebut" if result isnt false
                      if(result is false)
                        @currPos = pos166
                        while(poss.length > posl166)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        tag = "Example" if result isnt false
                      if(result isnt false)
                        result = @nez$NonTerminal()
                        outs.push result if typeof result isnt "boolean"
                        if(result isnt false)
                          while(result isnt false)
                            posl850 = poss.length
                            pos850 = @currPos
                            if(/[\&]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$NonTerminal()
                              outs.push result if typeof result isnt "boolean"
                          @currPos = pos850
                          while(poss.length > posl850)
                            posobj = poss.pop(posobj) if poss.length > 0
                          result = true
                          if(result isnt false)
                            result = @nez$addInputText()
                            if(result isnt false)
                              posobj.end = @currPos if posobj?
                              obj = {}
                              result = true
                              if(tag is "")
                                if(outs.length > 0)
                                  obj = outs.pop()
                                else if(@obj?)
                                  obj = @obj
                              else
                                obj.tag = tag
                                obj.pos = posobj if posobj?
                                if(outs.length isnt 0 and poss.length is 0)
                                  obj.value = outs
                                  @obj = obj
                                else if(posobj?)
                                  posobj.end = @currPos if !posobj.end?
                                  obj.value = @input.slice(posobj.start, posobj.end)
                                  @obj = obj
                                else
                                  obj = @obj if @obj?
                              posobj = null
                              if(!obj.value? or obj.value is "")
                                obj = true
                              result = obj
                              posobj = poss.pop(posobj) if poss.length > 0
                              if(result isnt false)
                                result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$NonTerminal: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$NAME()
    if(result isnt false)
      pos901 = @currPos
      posl901 = poss.length
      if(/[\.]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        result = @nez$NAME()
      if(result is false)
        @currPos = pos901
        while(poss.length > posl901)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "NonTerminal" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          result = @nez$_()
        @NonTerminalList[@obj.value] = [] if !@NonTerminalList[@obj.value]?
        @NonTerminalList[@obj.value].push pos: @obj.pos
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$NAME: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1076 = @currPos
    result = @nez$KEYWORD()
    @currPos = pos1076
    if(result is false)
      result = true
    else
      result = false
    if(result isnt false)
      result = @nez$LETTER()
      if(result isnt false)
        while(result isnt false)
          posl933 = poss.length
          pos933 = @currPos
          result = @nez$W()
        @currPos = pos933
        while(poss.length > posl933)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$KEYWORD: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1048 = @currPos
    posl1048 = poss.length
    result = true
    if(/[p]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[u]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[b]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[i]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[c]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
    if(result is false)
      @currPos = pos1048
      while(poss.length > posl1048)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[i]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[n]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[i]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[n]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[e]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  pos869 = @currPos
                  result = @nez$W()
                  @currPos = pos869
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
      if(result is false)
        @currPos = pos1048
        while(poss.length > posl1048)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[i]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[m]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[p]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[o]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[r]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[t]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    pos869 = @currPos
                    result = @nez$W()
                    @currPos = pos869
                    if(result is false)
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      result = @nez$_()
        if(result is false)
          @currPos = pos1048
          while(poss.length > posl1048)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[f]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[r]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[o]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[m]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  pos869 = @currPos
                  result = @nez$W()
                  @currPos = pos869
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
          if(result is false)
            @currPos = pos1048
            while(poss.length > posl1048)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[g]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[r]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[a]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[m]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[m]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[a]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[r]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          pos869 = @currPos
                          result = @nez$W()
                          @currPos = pos869
                          if(result is false)
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            result = @nez$_()
            if(result is false)
              @currPos = pos1048
              while(poss.length > posl1048)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(/[e]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[x]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[a]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[m]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[p]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[l]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[e]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            pos142 = @currPos
                            if(/[0-9A-Z_a-z]/).test(@input.charAt(@currPos))
                              result = true
                              @currPos++
                            else
                              result = false
                            @currPos = pos142
                            if(result is false)
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$_()
              if(result is false)
                @currPos = pos1048
                while(poss.length > posl1048)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                if(/[t]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[e]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[m]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[p]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[l]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[a]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[t]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              if(/[e]/.test(@input.charAt(@currPos)))
                                @currPos++
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                pos869 = @currPos
                                result = @nez$W()
                                @currPos = pos869
                                if(result is false)
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  result = @nez$_()
                if(result is false)
                  @currPos = pos1048
                  while(poss.length > posl1048)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[f]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[o]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[r]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[m]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[a]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[t]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              pos869 = @currPos
                              result = @nez$W()
                              @currPos = pos869
                              if(result is false)
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                result = @nez$_()
                  if(result is false)
                    @currPos = pos1048
                    while(poss.length > posl1048)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    if(/[t]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[r]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[u]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[e]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            pos869 = @currPos
                            result = @nez$W()
                            @currPos = pos869
                            if(result is false)
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$_()
                    if(result is false)
                      @currPos = pos1048
                      while(poss.length > posl1048)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      if(/[f]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[a]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[l]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[s]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              if(/[e]/.test(@input.charAt(@currPos)))
                                @currPos++
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                pos869 = @currPos
                                result = @nez$W()
                                @currPos = pos869
                                if(result is false)
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  result = @nez$_()
                      if(result is false)
                        @currPos = pos1048
                        while(poss.length > posl1048)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        if(/[d]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[e]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[f]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              if(/[i]/.test(@input.charAt(@currPos)))
                                @currPos++
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                if(/[n]/.test(@input.charAt(@currPos)))
                                  @currPos++
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  if(/[e]/.test(@input.charAt(@currPos)))
                                    @currPos++
                                    result = true
                                  else
                                    result = false
                                  if(result isnt false)
                                    pos869 = @currPos
                                    result = @nez$W()
                                    @currPos = pos869
                                    if(result is false)
                                      result = true
                                    else
                                      result = false
                                    if(result isnt false)
                                      result = @nez$_()
                        if(result is false)
                          @currPos = pos1048
                          while(poss.length > posl1048)
                            posobj = poss.pop(posobj) if poss.length > 0
                          result = true
                          if(/[t]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[y]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              if(/[p]/.test(@input.charAt(@currPos)))
                                @currPos++
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                if(/[e]/.test(@input.charAt(@currPos)))
                                  @currPos++
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  pos869 = @currPos
                                  result = @nez$W()
                                  @currPos = pos869
                                  if(result is false)
                                    result = true
                                  else
                                    result = false
                                  if(result isnt false)
                                    result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$W: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1067 = @currPos
    posl1067 = poss.length
    result = true
    if(/[0-9]/).test(@input.charAt(@currPos))
      result = true
      @currPos++
    else
      result = false
    if(result is false)
      @currPos = pos1067
      while(poss.length > posl1067)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[A-Z]/).test(@input.charAt(@currPos))
        result = true
        @currPos++
      else
        result = false
      if(result is false)
        @currPos = pos1067
        while(poss.length > posl1067)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[_]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result is false)
          @currPos = pos1067
          while(poss.length > posl1067)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[a-z]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
          else
            result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$LETTER: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1206 = @currPos
    posl1206 = poss.length
    result = true
    if(/[A-Z]/).test(@input.charAt(@currPos))
      result = true
      @currPos++
    else
      result = false
    if(result is false)
      @currPos = pos1206
      while(poss.length > posl1206)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[_]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result is false)
        @currPos = pos1206
        while(poss.length > posl1206)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[a-z]/).test(@input.charAt(@currPos))
          result = true
          @currPos++
        else
          result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$addInputText: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1478 = @currPos
    posl1478 = poss.length
    result = true
    if(/[\']/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[\']/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[\']/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          result = @nez$EOL()
          if(result isnt false)
            poss.push(posobj) if posobj?
            posobj = {}
            posobj.start = @currPos
            while(result isnt false)
              posl180 = poss.length
              pos180 = @currPos
              pos178 = @currPos
              if(/[\n]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[\']/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[\']/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[\']/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
              @currPos = pos178
              if(result is false)
                result = true
              else
                result = false
              if(result isnt false)
                if(@input.length > @currPos)
                  @currPos++
                  result = true
                else
                  result = false
            @currPos = pos180
            while(poss.length > posl180)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(result isnt false)
              posobj.end = @currPos if posobj?
              obj = {}
              result = true
              if(tag is "")
                if(outs.length > 0)
                  obj = outs.pop()
                else if(@obj?)
                  obj = @obj
              else
                obj.tag = tag
                obj.pos = posobj if posobj?
                if(outs.length isnt 0 and poss.length is 0)
                  obj.value = outs
                  @obj = obj
                else if(posobj?)
                  posobj.end = @currPos if !posobj.end?
                  obj.value = @input.slice(posobj.start, posobj.end)
                  @obj = obj
                else
                  obj = @obj if @obj?
              posobj = null
              if(!obj.value? or obj.value is "")
                obj = true
              result = obj
              posobj = poss.pop(posobj) if poss.length > 0
            outs.push result if typeof result isnt "boolean"
            if(result isnt false)
              if(/[\n]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[\']/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[\']/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[\']/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
    if(result is false)
      @currPos = pos1478
      while(poss.length > posl1478)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[`]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[`]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[`]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$EOL()
            if(result isnt false)
              poss.push(posobj) if posobj?
              posobj = {}
              posobj.start = @currPos
              while(result isnt false)
                posl196 = poss.length
                pos196 = @currPos
                pos194 = @currPos
                if(/[\n]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[`]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[`]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[`]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                @currPos = pos194
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(@input.length > @currPos)
                    @currPos++
                    result = true
                  else
                    result = false
              @currPos = pos196
              while(poss.length > posl196)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(result isnt false)
                posobj.end = @currPos if posobj?
                obj = {}
                result = true
                if(tag is "")
                  if(outs.length > 0)
                    obj = outs.pop()
                  else if(@obj?)
                    obj = @obj
                else
                  obj.tag = tag
                  obj.pos = posobj if posobj?
                  if(outs.length isnt 0 and poss.length is 0)
                    obj.value = outs
                    @obj = obj
                  else if(posobj?)
                    posobj.end = @currPos if !posobj.end?
                    obj.value = @input.slice(posobj.start, posobj.end)
                    @obj = obj
                  else
                    obj = @obj if @obj?
                posobj = null
                if(!obj.value? or obj.value is "")
                  obj = true
                result = obj
                posobj = poss.pop(posobj) if poss.length > 0
              outs.push result if typeof result isnt "boolean"
              if(result isnt false)
                if(/[\n]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[`]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[`]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[`]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
      if(result is false)
        @currPos = pos1478
        while(poss.length > posl1478)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/["]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/["]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/["]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              result = @nez$EOL()
              if(result isnt false)
                poss.push(posobj) if posobj?
                posobj = {}
                posobj.start = @currPos
                while(result isnt false)
                  posl211 = poss.length
                  pos211 = @currPos
                  pos209 = @currPos
                  if(/[\n]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/["]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/["]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/["]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                  @currPos = pos209
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(@input.length > @currPos)
                      @currPos++
                      result = true
                    else
                      result = false
                @currPos = pos211
                while(poss.length > posl211)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                if(result isnt false)
                  posobj.end = @currPos if posobj?
                  obj = {}
                  result = true
                  if(tag is "")
                    if(outs.length > 0)
                      obj = outs.pop()
                    else if(@obj?)
                      obj = @obj
                  else
                    obj.tag = tag
                    obj.pos = posobj if posobj?
                    if(outs.length isnt 0 and poss.length is 0)
                      obj.value = outs
                      @obj = obj
                    else if(posobj?)
                      posobj.end = @currPos if !posobj.end?
                      obj.value = @input.slice(posobj.start, posobj.end)
                      @obj = obj
                    else
                      obj = @obj if @obj?
                  posobj = null
                  if(!obj.value? or obj.value is "")
                    obj = true
                  result = obj
                  posobj = poss.pop(posobj) if poss.length > 0
                outs.push result if typeof result isnt "boolean"
                if(result isnt false)
                  if(/[\n]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/["]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/["]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/["]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
        if(result is false)
          @currPos = pos1478
          while(poss.length > posl1478)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          poss.push(posobj) if posobj?
          posobj = {}
          posobj.start = @currPos
          while(result isnt false)
            posl921 = poss.length
            pos921 = @currPos
            pos919 = @currPos
            result = @nez$EOL()
            @currPos = pos919
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              if(@input.length > @currPos)
                @currPos++
                result = true
              else
                result = false
          @currPos = pos921
          while(poss.length > posl921)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(result isnt false)
            posobj.end = @currPos if posobj?
            obj = {}
            result = true
            if(tag is "")
              if(outs.length > 0)
                obj = outs.pop()
              else if(@obj?)
                obj = @obj
            else
              obj.tag = tag
              obj.pos = posobj if posobj?
              if(outs.length isnt 0 and poss.length is 0)
                obj.value = outs
                @obj = obj
              else if(posobj?)
                posobj.end = @currPos if !posobj.end?
                obj.value = @input.slice(posobj.start, posobj.end)
                @obj = obj
              else
                obj = @obj if @obj?
            posobj = null
            if(!obj.value? or obj.value is "")
              obj = true
            result = obj
            posobj = poss.pop(posobj) if poss.length > 0
          outs.push result if typeof result isnt "boolean"
          if(result isnt false)
            result = @nez$EOL()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$ImportStatement: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[i]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[m]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[p]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[o]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[r]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[t]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    result = @nez$ImportName()
                    outs.push result if typeof result isnt "boolean"
                    if(result isnt false)
                      if(/[f]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[r]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[o]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[m]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              pos869 = @currPos
                              result = @nez$W()
                              @currPos = pos869
                              if(result is false)
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                result = @nez$_()
                                if(result isnt false)
                                  pos1084 = @currPos
                                  posl1084 = poss.length
                                  result = true
                                  result = @nez$Character()
                                  outs.push result if typeof result isnt "boolean"
                                  if(result is false)
                                    @currPos = pos1084
                                    while(poss.length > posl1084)
                                      posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    result = @nez$String()
                                    outs.push result if typeof result isnt "boolean"
                                  if(result isnt false)
                                    tag = "Import" if result isnt false
                                    posobj.end = @currPos if posobj?
                                    obj = {}
                                    result = true
                                    if(tag is "")
                                      if(outs.length > 0)
                                        obj = outs.pop()
                                      else if(@obj?)
                                        obj = @obj
                                    else
                                      obj.tag = tag
                                      obj.pos = posobj if posobj?
                                      if(outs.length isnt 0 and poss.length is 0)
                                        obj.value = outs
                                        @obj = obj
                                      else if(posobj?)
                                        posobj.end = @currPos if !posobj.end?
                                        obj.value = @input.slice(posobj.start, posobj.end)
                                        @obj = obj
                                      else
                                        obj = @obj if @obj?
                                    posobj = null
                                    if(!obj.value? or obj.value is "")
                                      obj = true
                                    result = obj
                                    posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$ImportName: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos1211 = @currPos
    posl1211 = poss.length
    result = true
    if(/[\*]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos1211
      while(poss.length > posl1211)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      result = @nez$NAME()
      if(result isnt false)
        pos1209 = @currPos
        posl1209 = poss.length
        if(/[\.]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          pos1207 = @currPos
          posl1207 = poss.length
          result = true
          if(/[\*]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result is false)
            @currPos = pos1207
            while(poss.length > posl1207)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$NAME()
        if(result is false)
          @currPos = pos1209
          while(poss.length > posl1209)
            posobj = poss.pop(posobj) if poss.length > 0
        result = true
    if(result isnt false)
      tag = "Name" if result isnt false
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
      if(result isnt false)
        result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Character: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[\']/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      while(result isnt false)
        posl1338 = poss.length
        pos1338 = @currPos
        pos1337 = @currPos
        posl1337 = poss.length
        result = true
        if(/[\\]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[\']/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
        if(result is false)
          @currPos = pos1337
          while(poss.length > posl1337)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\\]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\\]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
          if(result is false)
            @currPos = pos1337
            while(poss.length > posl1337)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            pos1335 = @currPos
            if(/[\n\r\']/).test(@input.charAt(@currPos))
              result = true
              @currPos++
            else
              result = false
            @currPos = pos1335
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              if(@input.length > @currPos)
                @currPos++
                result = true
              else
                result = false
      @currPos = pos1338
      while(poss.length > posl1338)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "Character" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(/[\']/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$String: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/["]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      while(result isnt false)
        posl827 = poss.length
        pos827 = @currPos
        pos826 = @currPos
        posl826 = poss.length
        result = true
        if(/[\\]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/["]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
        if(result is false)
          @currPos = pos826
          while(poss.length > posl826)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\\]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\\]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
          if(result is false)
            @currPos = pos826
            while(poss.length > posl826)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            pos824 = @currPos
            if(/[\n\r"]/).test(@input.charAt(@currPos))
              result = true
              @currPos++
            else
              result = false
            @currPos = pos824
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              if(@input.length > @currPos)
                @currPos++
                result = true
              else
                result = false
      @currPos = pos827
      while(poss.length > posl827)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "String" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(/["]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$FormatStatement: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[f]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[o]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[r]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[m]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[a]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[t]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    if(/[#]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      result = @nez$Identifier()
                      outs.push result if typeof result isnt "boolean"
                      if(result isnt false)
                        if(/[\[]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          result = @nez$_()
                          if(result isnt false)
                            result = @nez$FormatSize()
                            outs.push result if typeof result isnt "boolean"
                            if(result isnt false)
                              if(/[\]]/.test(@input.charAt(@currPos)))
                                @currPos++
                                result = true
                              else
                                result = false
                              if(result isnt false)
                                result = @nez$_()
                                if(result isnt false)
                                  if(/[`]/.test(@input.charAt(@currPos)))
                                    @currPos++
                                    result = true
                                  else
                                    result = false
                                  if(result isnt false)
                                    result = @nez$Formatter()
                                    outs.push result if typeof result isnt "boolean"
                                    if(result isnt false)
                                      if(/[`]/.test(@input.charAt(@currPos)))
                                        @currPos++
                                        result = true
                                      else
                                        result = false
                                      if(result isnt false)
                                        tag = "Format" if result isnt false
                                        posobj.end = @currPos if posobj?
                                        obj = {}
                                        result = true
                                        if(tag is "")
                                          if(outs.length > 0)
                                            obj = outs.pop()
                                          else if(@obj?)
                                            obj = @obj
                                        else
                                          obj.tag = tag
                                          obj.pos = posobj if posobj?
                                          if(outs.length isnt 0 and poss.length is 0)
                                            obj.value = outs
                                            @obj = obj
                                          else if(posobj?)
                                            posobj.end = @currPos if !posobj.end?
                                            obj.value = @input.slice(posobj.start, posobj.end)
                                            @obj = obj
                                          else
                                            obj = @obj if @obj?
                                        posobj = null
                                        if(!obj.value? or obj.value is "")
                                          obj = true
                                        result = obj
                                        posobj = poss.pop(posobj) if poss.length > 0
                                        if(result isnt false)
                                          result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Identifier: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$NAME()
    if(result isnt false)
      tag = "Name" if result isnt false
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
      if(result isnt false)
        result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$FormatSize: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos1135 = @currPos
    posl1135 = poss.length
    result = true
    if(/[\*]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos1135
      while(poss.length > posl1135)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      result = @nez$INT()
    if(result isnt false)
      tag = "Integer" if result isnt false
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$INT: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[0-9]/).test(@input.charAt(@currPos))
      result = true
      @currPos++
    else
      result = false
    if(result isnt false)
      while(result isnt false)
        posl613 = poss.length
        pos613 = @currPos
        if(/[0-9]/).test(@input.charAt(@currPos))
          result = true
          @currPos++
        else
          result = false
      @currPos = pos613
      while(poss.length > posl613)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Formatter: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    tag = "List" if result isnt false
    while(result isnt false)
      posl1330 = poss.length
      pos1330 = @currPos
      pos600 = @currPos
      if(/[`]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      @currPos = pos600
      if(result is false)
        result = true
      else
        result = false
      if(result isnt false)
        pos1328 = @currPos
        posl1328 = poss.length
        result = true
        if(/[$]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[{]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$Identifier()
            if(result isnt false)
              if(/[}]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
        outs.push result if typeof result isnt "boolean"
        if(result is false)
          @currPos = pos1328
          while(poss.length > posl1328)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[$]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\[]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              result = @nez$_()
              if(result isnt false)
                result = @nez$Index()
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    pos1309 = @currPos
                    posl1309 = poss.length
                    ltmp = []
                    if(ltmp[ltmp.length-1] isnt result)
                      ltmp.push result if typeof result isnt "boolean"
                    poss.push(posobj) if posobj?
                    posobj = {}
                    posobj.start = @currPos
                    if(/[`]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      result = @nez$Formatter()
                      ltmp.push result if typeof result isnt "boolean"
                      if(result isnt false)
                        if(/[`]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          result = @nez$_()
                          if(result isnt false)
                            result = @nez$Index()
                            ltmp.push result if typeof result isnt "boolean"
                            if(result isnt false)
                              result = @nez$_()
                              if(result isnt false)
                                tag = "Format" if result isnt false
                                posobj.end = @currPos if posobj?
                                obj = {}
                                result = true
                                if(tag is "")
                                  if(outs.length > 0)
                                    obj = outs.pop()
                                  else if(@obj?)
                                    obj = @obj
                                else
                                  obj.tag = tag
                                  obj.pos = posobj if posobj?
                                  if(outs.length isnt 0 and poss.length is 0)
                                    obj.value = outs
                                    @obj = obj
                                  else if(posobj?)
                                    posobj.end = @currPos if !posobj.end?
                                    obj.value = @input.slice(posobj.start, posobj.end)
                                    @obj = obj
                                  else
                                    obj = @obj if @obj?
                                posobj = null
                                if(!obj.value? or obj.value is "")
                                  obj = true
                                result = obj
                                posobj = poss.pop(posobj) if poss.length > 0
                                if(result isnt false)
                                  if(obj?)
                                    if(typeof obj isnt "boolean")
                                      obj.value = ltmp
                                      ltmp = []
                                      outs.push result if typeof result isnt "boolean"
                    if(ltmp.length > 0)
                      outs.push ltmp.pop()
                    if(result is false)
                      @currPos = pos1309
                      while(poss.length > posl1309)
                        posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    if(result isnt false)
                      if(/[\]]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
          outs.push result if typeof result isnt "boolean"
          if(result is false)
            @currPos = pos1328
            while(poss.length > posl1328)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            poss.push(posobj) if posobj?
            posobj = {}
            posobj.start = @currPos
            pos1324 = @currPos
            posl1324 = poss.length
            result = true
            if(/[$]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[$]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                result = "$"
            if(result is false)
              @currPos = pos1324
              while(poss.length > posl1324)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(/[\\]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[`]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = "\\`"
              if(result is false)
                @currPos = pos1324
                while(poss.length > posl1324)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                pos1321 = @currPos
                pos1320 = @currPos
                posl1320 = poss.length
                result = true
                if(/[$]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[$]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                if(result is false)
                  @currPos = pos1320
                  while(poss.length > posl1320)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[$]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[{]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                  if(result is false)
                    @currPos = pos1320
                    while(poss.length > posl1320)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    if(/[$]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[\[]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                    if(result is false)
                      @currPos = pos1320
                      while(poss.length > posl1320)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      if(/[\\]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[`]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                      if(result is false)
                        @currPos = pos1320
                        while(poss.length > posl1320)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        if(/[`]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                @currPos = pos1321
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(@input.length > @currPos)
                    @currPos++
                    result = true
                  else
                    result = false
                if(result isnt false)
                  while(result isnt false)
                    pos1323 = @currPos
                    posl1323 = poss.length
                    pos1321 = @currPos
                    pos1320 = @currPos
                    posl1320 = poss.length
                    result = true
                    if(/[$]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[$]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                    if(result is false)
                      @currPos = pos1320
                      while(poss.length > posl1320)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      if(/[$]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[{]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                      if(result is false)
                        @currPos = pos1320
                        while(poss.length > posl1320)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        if(/[$]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[\[]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                        if(result is false)
                          @currPos = pos1320
                          while(poss.length > posl1320)
                            posobj = poss.pop(posobj) if poss.length > 0
                          result = true
                          if(/[\\]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            if(/[`]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                          if(result is false)
                            @currPos = pos1320
                            while(poss.length > posl1320)
                              posobj = poss.pop(posobj) if poss.length > 0
                            result = true
                            if(/[`]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                    @currPos = pos1321
                    if(result is false)
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(@input.length > @currPos)
                        @currPos++
                        result = true
                      else
                        result = false
                  @currPos = pos1323
                  while(poss.length > posl1323)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
            if(result isnt false)
              posobj.end = @currPos if posobj?
              obj = {}
              result = true
              if(tag is "")
                if(outs.length > 0)
                  obj = outs.pop()
                else if(@obj?)
                  obj = @obj
              else
                obj.tag = tag
                obj.pos = posobj if posobj?
                if(outs.length isnt 0 and poss.length is 0)
                  obj.value = outs
                  @obj = obj
                else if(posobj?)
                  posobj.end = @currPos if !posobj.end?
                  obj.value = @input.slice(posobj.start, posobj.end)
                  @obj = obj
                else
                  obj = @obj if @obj?
              posobj = null
              if(!obj.value? or obj.value is "")
                obj = true
              result = obj
              posobj = poss.pop(posobj) if poss.length > 0
            outs.push result if typeof result isnt "boolean"
    @currPos = pos1330
    while(poss.length > posl1330)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Index: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos467 = @currPos
    posl467 = poss.length
    if(/[-]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos467
      while(poss.length > posl467)
        posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      result = @nez$INT()
      if(result isnt false)
        tag = "Integer" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$TemplateStatement: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[t]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[e]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[m]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[p]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[l]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[a]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[t]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[e]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    pos869 = @currPos
                    result = @nez$W()
                    @currPos = pos869
                    if(result is false)
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      result = @nez$_()
                      if(result isnt false)
                        result = @nez$Identifier()
                        outs.push result if typeof result isnt "boolean"
                        if(result isnt false)
                          if(/[<]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            result = @nez$_()
                            if(result isnt false)
                              result = @nez$TemplateParameter()
                              outs.push result if typeof result isnt "boolean"
                              if(result isnt false)
                                if(/[>]/.test(@input.charAt(@currPos)))
                                  @currPos++
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  result = @nez$_()
                                  if(result isnt false)
                                    if(/[=]/.test(@input.charAt(@currPos)))
                                      @currPos++
                                      result = true
                                    else
                                      result = false
                                    if(result isnt false)
                                      result = @nez$_()
                                      if(result isnt false)
                                        result = @nez$Expression()
                                        outs.push result if typeof result isnt "boolean"
                                        if(result isnt false)
                                          tag = "Template" if result isnt false
                                          posobj.end = @currPos if posobj?
                                          obj = {}
                                          result = true
                                          if(tag is "")
                                            if(outs.length > 0)
                                              obj = outs.pop()
                                            else if(@obj?)
                                              obj = @obj
                                          else
                                            obj.tag = tag
                                            obj.pos = posobj if posobj?
                                            if(outs.length isnt 0 and poss.length is 0)
                                              obj.value = outs
                                              @obj = obj
                                            else if(posobj?)
                                              posobj.end = @currPos if !posobj.end?
                                              obj.value = @input.slice(posobj.start, posobj.end)
                                              @obj = obj
                                            else
                                              obj = @obj if @obj?
                                          posobj = null
                                          if(!obj.value? or obj.value is "")
                                            obj = true
                                          result = obj
                                          posobj = poss.pop(posobj) if poss.length > 0
                                          if(result isnt false)
                                            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$TemplateParameter: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$Identifier()
    outs.push result if typeof result isnt "boolean"
    if(result isnt false)
      while(result isnt false)
        posl928 = poss.length
        pos928 = @currPos
        if(/[,]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          result = @nez$_()
          if(result isnt false)
            result = @nez$Identifier()
            outs.push result if typeof result isnt "boolean"
      @currPos = pos928
      while(poss.length > posl928)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Expression: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    result = @nez$Sequence()
    if(result isnt false)
      pos1190 = @currPos
      posl1190 = poss.length
      ltmp = []
      if(ltmp[ltmp.length-1] isnt result)
        ltmp.push result if typeof result isnt "boolean"
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      if(/[\/]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        result = @nez$_()
        if(result isnt false)
          result = @nez$Sequence()
          ltmp.push result if typeof result isnt "boolean"
      if(result isnt false)
        while(result isnt false)
          pos1187 = @currPos
          posl1187 = poss.length
          if(/[\/]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
            if(result isnt false)
              result = @nez$Sequence()
              ltmp.push result if typeof result isnt "boolean"
        @currPos = pos1187
        while(poss.length > posl1187)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
      if(result isnt false)
        tag = "Choice" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(obj?)
            if(typeof obj isnt "boolean")
              obj.value = ltmp
              ltmp = []
              outs.push result if typeof result isnt "boolean"
      if(ltmp.length > 0)
        outs.push ltmp.pop()
      if(result is false)
        @currPos = pos1190
        while(poss.length > posl1190)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Sequence: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    result = @nez$Prefix()
    if(result isnt false)
      pos1073 = @currPos
      posl1073 = poss.length
      ltmp = []
      if(ltmp[ltmp.length-1] isnt result)
        ltmp.push result if typeof result isnt "boolean"
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      result = @nez$Prefix()
      ltmp.push result if typeof result isnt "boolean"
      if(result isnt false)
        while(result isnt false)
          pos1070 = @currPos
          posl1070 = poss.length
          result = @nez$Prefix()
          ltmp.push result if typeof result isnt "boolean"
        @currPos = pos1070
        while(poss.length > posl1070)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
      if(result isnt false)
        tag = "Sequence" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(obj?)
            if(typeof obj isnt "boolean")
              obj.value = ltmp
              ltmp = []
              outs.push result if typeof result isnt "boolean"
      if(ltmp.length > 0)
        outs.push ltmp.pop()
      if(result is false)
        @currPos = pos1073
        while(poss.length > posl1073)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Prefix: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos976 = @currPos
    posl976 = poss.length
    result = true
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos970 = @currPos
    posl970 = poss.length
    result = true
    if(/[\&]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    tag = "And" if result isnt false
    if(result is false)
      @currPos = pos970
      while(poss.length > posl970)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[\!]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      tag = "Not" if result isnt false
      if(result is false)
        @currPos = pos970
        while(poss.length > posl970)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[@]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[\[]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
            if(result isnt false)
              result = @nez$Integer()
              outs.push result if typeof result isnt "boolean"
              if(result isnt false)
                result = @nez$_()
                if(result isnt false)
                  if(/[\]]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  tag = "Link" if result isnt false
        if(result is false)
          @currPos = pos970
          while(poss.length > posl970)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[@]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          tag = "Link" if result isnt false
          if(result is false)
            @currPos = pos970
            while(poss.length > posl970)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[~]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            tag = "Match" if result isnt false
    if(result isnt false)
      result = @nez$Suffix()
      outs.push result if typeof result isnt "boolean"
      if(result isnt false)
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
    if(result is false)
      @currPos = pos976
      while(poss.length > posl976)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      result = @nez$Suffix()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Integer: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$INT()
    if(result isnt false)
      tag = "Integer" if result isnt false
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Suffix: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    result = @nez$Primary()
    if(result isnt false)
      pos915 = @currPos
      posl915 = poss.length
      ltmp = []
      if(ltmp[ltmp.length-1] isnt result)
        ltmp.push result if typeof result isnt "boolean"
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      pos912 = @currPos
      posl912 = poss.length
      result = true
      if(/[\*]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        pos909 = @currPos
        posl909 = poss.length
        result = @nez$Integer()
        ltmp.push result if typeof result isnt "boolean"
        if(result is false)
          @currPos = pos909
          while(poss.length > posl909)
            posobj = poss.pop(posobj) if poss.length > 0
        result = true
        tag = "Repetition" if result isnt false
      if(result is false)
        @currPos = pos912
        while(poss.length > posl912)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[\+]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        tag = "Repetition1" if result isnt false
        if(result is false)
          @currPos = pos912
          while(poss.length > posl912)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\?]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          tag = "Option" if result isnt false
      if(result isnt false)
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
      if(result isnt false)
        if(obj?)
          if(typeof obj isnt "boolean")
            obj.value = ltmp
            ltmp = []
            outs.push result if typeof result isnt "boolean"
      if(ltmp.length > 0)
        outs.push ltmp.pop()
      if(result is false)
        @currPos = pos915
        while(poss.length > posl915)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Primary: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1295 = @currPos
    posl1295 = poss.length
    result = true
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[t]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[r]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[u]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[e]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            pos869 = @currPos
            result = @nez$W()
            @currPos = pos869
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              result = @nez$_()
              if(result isnt false)
                tag = "Empty" if result isnt false
                posobj.end = @currPos if posobj?
                obj = {}
                result = true
                if(tag is "")
                  if(outs.length > 0)
                    obj = outs.pop()
                  else if(@obj?)
                    obj = @obj
                else
                  obj.tag = tag
                  obj.pos = posobj if posobj?
                  if(outs.length isnt 0 and poss.length is 0)
                    obj.value = outs
                    @obj = obj
                  else if(posobj?)
                    posobj.end = @currPos if !posobj.end?
                    obj.value = @input.slice(posobj.start, posobj.end)
                    @obj = obj
                  else
                    obj = @obj if @obj?
                posobj = null
                if(!obj.value? or obj.value is "")
                  obj = true
                result = obj
                posobj = poss.pop(posobj) if poss.length > 0
    if(result is false)
      @currPos = pos1295
      while(poss.length > posl1295)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      if(/[f]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[a]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[s]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[e]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    tag = "Failure" if result isnt false
                    posobj.end = @currPos if posobj?
                    obj = {}
                    result = true
                    if(tag is "")
                      if(outs.length > 0)
                        obj = outs.pop()
                      else if(@obj?)
                        obj = @obj
                    else
                      obj.tag = tag
                      obj.pos = posobj if posobj?
                      if(outs.length isnt 0 and poss.length is 0)
                        obj.value = outs
                        @obj = obj
                      else if(posobj?)
                        posobj.end = @currPos if !posobj.end?
                        obj.value = @input.slice(posobj.start, posobj.end)
                        @obj = obj
                      else
                        obj = @obj if @obj?
                    posobj = null
                    if(!obj.value? or obj.value is "")
                      obj = true
                    result = obj
                    posobj = poss.pop(posobj) if poss.length > 0
      if(result is false)
        @currPos = pos1295
        while(poss.length > posl1295)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        result = @nez$Character()
        if(result is false)
          @currPos = pos1295
          while(poss.length > posl1295)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          result = @nez$Charset()
          if(result is false)
            @currPos = pos1295
            while(poss.length > posl1295)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            poss.push(posobj) if posobj?
            posobj = {}
            posobj.start = @currPos
            if(/[\.]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              tag = "Any" if result isnt false
              posobj.end = @currPos if posobj?
              obj = {}
              result = true
              if(tag is "")
                if(outs.length > 0)
                  obj = outs.pop()
                else if(@obj?)
                  obj = @obj
              else
                obj.tag = tag
                obj.pos = posobj if posobj?
                if(outs.length isnt 0 and poss.length is 0)
                  obj.value = outs
                  @obj = obj
                else if(posobj?)
                  posobj.end = @currPos if !posobj.end?
                  obj.value = @input.slice(posobj.start, posobj.end)
                  @obj = obj
                else
                  obj = @obj if @obj?
              posobj = null
              if(!obj.value? or obj.value is "")
                obj = true
              result = obj
              posobj = poss.pop(posobj) if poss.length > 0
              if(result isnt false)
                result = @nez$_()
            if(result is false)
              @currPos = pos1295
              while(poss.length > posl1295)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              poss.push(posobj) if posobj?
              posobj = {}
              posobj.start = @currPos
              if(/[0]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[x]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$HEX()
                  if(result isnt false)
                    result = @nez$HEX()
                    if(result isnt false)
                      tag = "Byte" if result isnt false
                      posobj.end = @currPos if posobj?
                      obj = {}
                      result = true
                      if(tag is "")
                        if(outs.length > 0)
                          obj = outs.pop()
                        else if(@obj?)
                          obj = @obj
                      else
                        obj.tag = tag
                        obj.pos = posobj if posobj?
                        if(outs.length isnt 0 and poss.length is 0)
                          obj.value = outs
                          @obj = obj
                        else if(posobj?)
                          posobj.end = @currPos if !posobj.end?
                          obj.value = @input.slice(posobj.start, posobj.end)
                          @obj = obj
                        else
                          obj = @obj if @obj?
                      posobj = null
                      if(!obj.value? or obj.value is "")
                        obj = true
                      result = obj
                      posobj = poss.pop(posobj) if poss.length > 0
                      if(result isnt false)
                        result = @nez$_()
              if(result is false)
                @currPos = pos1295
                while(poss.length > posl1295)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                poss.push(posobj) if posobj?
                posobj = {}
                posobj.start = @currPos
                if(/[U]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[\+]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$HEX()
                    if(result isnt false)
                      result = @nez$HEX()
                      if(result isnt false)
                        result = @nez$HEX()
                        if(result isnt false)
                          result = @nez$HEX()
                          if(result isnt false)
                            tag = "Byte" if result isnt false
                            posobj.end = @currPos if posobj?
                            obj = {}
                            result = true
                            if(tag is "")
                              if(outs.length > 0)
                                obj = outs.pop()
                              else if(@obj?)
                                obj = @obj
                            else
                              obj.tag = tag
                              obj.pos = posobj if posobj?
                              if(outs.length isnt 0 and poss.length is 0)
                                obj.value = outs
                                @obj = obj
                              else if(posobj?)
                                posobj.end = @currPos if !posobj.end?
                                obj.value = @input.slice(posobj.start, posobj.end)
                                @obj = obj
                              else
                                obj = @obj if @obj?
                            posobj = null
                            if(!obj.value? or obj.value is "")
                              obj = true
                            result = obj
                            posobj = poss.pop(posobj) if poss.length > 0
                            if(result isnt false)
                              result = @nez$_()
                if(result is false)
                  @currPos = pos1295
                  while(poss.length > posl1295)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[\(]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
                    if(result isnt false)
                      result = @nez$Expression()
                      if(result isnt false)
                        if(/[\)]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          result = @nez$_()
                  if(result is false)
                    @currPos = pos1295
                    while(poss.length > posl1295)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    result = @nez$Constructor()
                    if(result is false)
                      @currPos = pos1295
                      while(poss.length > posl1295)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      result = @nez$Replace()
                      if(result is false)
                        @currPos = pos1295
                        while(poss.length > posl1295)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        result = @nez$Tagging()
                        if(result is false)
                          @currPos = pos1295
                          while(poss.length > posl1295)
                            posobj = poss.pop(posobj) if poss.length > 0
                          result = true
                          result = @nez$String()
                          if(result isnt false)
                            pos1275 = @currPos
                            if(/[=]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$_()
                            @currPos = pos1275
                            if(result is false)
                              result = true
                            else
                              result = false
                          if(result is false)
                            @currPos = pos1295
                            while(poss.length > posl1295)
                              posobj = poss.pop(posobj) if poss.length > 0
                            result = true
                            result = @nez$Extension()
                            if(result is false)
                              @currPos = pos1295
                              while(poss.length > posl1295)
                                posobj = poss.pop(posobj) if poss.length > 0
                              result = true
                              result = @nez$NonTerminal()
                              if(result isnt false)
                                pos1293 = @currPos
                                pos1292 = @currPos
                                posl1292 = poss.length
                                result = true
                                if(/[=]/.test(@input.charAt(@currPos)))
                                  @currPos++
                                  result = true
                                else
                                  result = false
                                if(result isnt false)
                                  result = @nez$_()
                                if(result is false)
                                  @currPos = pos1292
                                  while(poss.length > posl1292)
                                    posobj = poss.pop(posobj) if poss.length > 0
                                  result = true
                                  if(/[\[]/.test(@input.charAt(@currPos)))
                                    @currPos++
                                    result = true
                                  else
                                    result = false
                                  if(result isnt false)
                                    if(/[e]/.test(@input.charAt(@currPos)))
                                      @currPos++
                                      result = true
                                    else
                                      result = false
                                    if(result isnt false)
                                      if(/[x]/.test(@input.charAt(@currPos)))
                                        @currPos++
                                        result = true
                                      else
                                        result = false
                                      if(result isnt false)
                                        if(/[a]/.test(@input.charAt(@currPos)))
                                          @currPos++
                                          result = true
                                        else
                                          result = false
                                        if(result isnt false)
                                          if(/[m]/.test(@input.charAt(@currPos)))
                                            @currPos++
                                            result = true
                                          else
                                            result = false
                                          if(result isnt false)
                                            if(/[p]/.test(@input.charAt(@currPos)))
                                              @currPos++
                                              result = true
                                            else
                                              result = false
                                            if(result isnt false)
                                              if(/[l]/.test(@input.charAt(@currPos)))
                                                @currPos++
                                                result = true
                                              else
                                                result = false
                                              if(result isnt false)
                                                if(/[e]/.test(@input.charAt(@currPos)))
                                                  @currPos++
                                                  result = true
                                                else
                                                  result = false
                                                if(result isnt false)
                                                  if(/[:]/.test(@input.charAt(@currPos)))
                                                    @currPos++
                                                    result = true
                                                  else
                                                    result = false
                                  if(result is false)
                                    @currPos = pos1292
                                    while(poss.length > posl1292)
                                      posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    if(/[\[]/.test(@input.charAt(@currPos)))
                                      @currPos++
                                      result = true
                                    else
                                      result = false
                                    if(result isnt false)
                                      if(/[b]/.test(@input.charAt(@currPos)))
                                        @currPos++
                                        result = true
                                      else
                                        result = false
                                      if(result isnt false)
                                        if(/[a]/.test(@input.charAt(@currPos)))
                                          @currPos++
                                          result = true
                                        else
                                          result = false
                                        if(result isnt false)
                                          if(/[d]/.test(@input.charAt(@currPos)))
                                            @currPos++
                                            result = true
                                          else
                                            result = false
                                          if(result isnt false)
                                            if(/[-]/.test(@input.charAt(@currPos)))
                                              @currPos++
                                              result = true
                                            else
                                              result = false
                                            if(result isnt false)
                                              if(/[e]/.test(@input.charAt(@currPos)))
                                                @currPos++
                                                result = true
                                              else
                                                result = false
                                              if(result isnt false)
                                                if(/[x]/.test(@input.charAt(@currPos)))
                                                  @currPos++
                                                  result = true
                                                else
                                                  result = false
                                                if(result isnt false)
                                                  if(/[a]/.test(@input.charAt(@currPos)))
                                                    @currPos++
                                                    result = true
                                                  else
                                                    result = false
                                                  if(result isnt false)
                                                    if(/[m]/.test(@input.charAt(@currPos)))
                                                      @currPos++
                                                      result = true
                                                    else
                                                      result = false
                                                    if(result isnt false)
                                                      if(/[p]/.test(@input.charAt(@currPos)))
                                                        @currPos++
                                                        result = true
                                                      else
                                                        result = false
                                                      if(result isnt false)
                                                        if(/[l]/.test(@input.charAt(@currPos)))
                                                          @currPos++
                                                          result = true
                                                        else
                                                          result = false
                                                        if(result isnt false)
                                                          if(/[e]/.test(@input.charAt(@currPos)))
                                                            @currPos++
                                                            result = true
                                                          else
                                                            result = false
                                                          if(result isnt false)
                                                            if(/[:]/.test(@input.charAt(@currPos)))
                                                              @currPos++
                                                              result = true
                                                            else
                                                              result = false
                                @currPos = pos1293
                                if(result is false)
                                  result = true
                                else
                                  result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Charset: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[\[]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      while(result isnt false)
        posl1151 = poss.length
        pos1151 = @currPos
        poss.push(posobj) if posobj?
        posobj = {}
        posobj.start = @currPos
        result = @nez$CHAR()
        if(result isnt false)
          tag = "Class" if result isnt false
          posobj.end = @currPos if posobj?
          obj = {}
          result = true
          if(tag is "")
            if(outs.length > 0)
              obj = outs.pop()
            else if(@obj?)
              obj = @obj
          else
            obj.tag = tag
            obj.pos = posobj if posobj?
            if(outs.length isnt 0 and poss.length is 0)
              obj.value = outs
              @obj = obj
            else if(posobj?)
              posobj.end = @currPos if !posobj.end?
              obj.value = @input.slice(posobj.start, posobj.end)
              @obj = obj
            else
              obj = @obj if @obj?
          posobj = null
          if(!obj.value? or obj.value is "")
            obj = true
          result = obj
          posobj = poss.pop(posobj) if poss.length > 0
          if(result isnt false)
            pos1145 = @currPos
            posl1145 = poss.length
            ltmp = []
            if(ltmp[ltmp.length-1] isnt result)
              ltmp.push result if typeof result isnt "boolean"
            poss.push(posobj) if posobj?
            posobj = {}
            posobj.start = @currPos
            if(/[-]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              poss.push(posobj) if posobj?
              posobj = {}
              posobj.start = @currPos
              result = @nez$CHAR()
              if(result isnt false)
                tag = "Class" if result isnt false
                posobj.end = @currPos if posobj?
                obj = {}
                result = true
                if(tag is "")
                  if(outs.length > 0)
                    obj = outs.pop()
                  else if(@obj?)
                    obj = @obj
                else
                  obj.tag = tag
                  obj.pos = posobj if posobj?
                  if(outs.length isnt 0 and poss.length is 0)
                    obj.value = outs
                    @obj = obj
                  else if(posobj?)
                    posobj.end = @currPos if !posobj.end?
                    obj.value = @input.slice(posobj.start, posobj.end)
                    @obj = obj
                  else
                    obj = @obj if @obj?
                posobj = null
                if(!obj.value? or obj.value is "")
                  obj = true
                result = obj
                posobj = poss.pop(posobj) if poss.length > 0
              ltmp.push result if typeof result isnt "boolean"
              if(result isnt false)
                tag = "List" if result isnt false
                posobj.end = @currPos if posobj?
                obj = {}
                result = true
                if(tag is "")
                  if(outs.length > 0)
                    obj = outs.pop()
                  else if(@obj?)
                    obj = @obj
                else
                  obj.tag = tag
                  obj.pos = posobj if posobj?
                  if(outs.length isnt 0 and poss.length is 0)
                    obj.value = outs
                    @obj = obj
                  else if(posobj?)
                    posobj.end = @currPos if !posobj.end?
                    obj.value = @input.slice(posobj.start, posobj.end)
                    @obj = obj
                  else
                    obj = @obj if @obj?
                posobj = null
                if(!obj.value? or obj.value is "")
                  obj = true
                result = obj
                posobj = poss.pop(posobj) if poss.length > 0
                if(result isnt false)
                  if(obj?)
                    if(typeof obj isnt "boolean")
                      obj.value = ltmp
                      ltmp = []
                      outs.push result if typeof result isnt "boolean"
            if(ltmp.length > 0)
              outs.push ltmp.pop()
            if(result is false)
              @currPos = pos1145
              while(poss.length > posl1145)
                posobj = poss.pop(posobj) if poss.length > 0
            result = true
        outs.push result if typeof result isnt "boolean"
      @currPos = pos1151
      while(poss.length > posl1151)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "Class" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(/[\]]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$CHAR: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos950 = @currPos
    posl950 = poss.length
    result = true
    if(/[\\]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[u]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        result = @nez$HEX()
        if(result isnt false)
          result = @nez$HEX()
          if(result isnt false)
            result = @nez$HEX()
            if(result isnt false)
              result = @nez$HEX()
    if(result is false)
      @currPos = pos950
      while(poss.length > posl950)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[\\]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[x]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          result = @nez$HEX()
          if(result isnt false)
            result = @nez$HEX()
      if(result is false)
        @currPos = pos950
        while(poss.length > posl950)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[\\]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[n]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
        if(result is false)
          @currPos = pos950
          while(poss.length > posl950)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\\]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[t]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
          if(result is false)
            @currPos = pos950
            while(poss.length > posl950)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\\]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[\\]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
            if(result is false)
              @currPos = pos950
              while(poss.length > posl950)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(/[\\]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[r]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
              if(result is false)
                @currPos = pos950
                while(poss.length > posl950)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                if(/[\\]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[v]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                if(result is false)
                  @currPos = pos950
                  while(poss.length > posl950)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[\\]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[f]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                  if(result is false)
                    @currPos = pos950
                    while(poss.length > posl950)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    if(/[\\]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[-]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                    if(result is false)
                      @currPos = pos950
                      while(poss.length > posl950)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      if(/[\\]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[\]]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                      if(result is false)
                        @currPos = pos950
                        while(poss.length > posl950)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        pos551 = @currPos
                        if(/[\]]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        @currPos = pos551
                        if(result is false)
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(@input.length > @currPos)
                            @currPos++
                            result = true
                          else
                            result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$HEX: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[0-9A-Fa-f]/).test(@input.charAt(@currPos))
      result = true
      @currPos++
    else
      result = false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Constructor: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[{]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      pos1125 = @currPos
      posl1125 = poss.length
      result = true
      if(/[@]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        result = @nez$S()
        tag = "LeftNew" if result isnt false
      if(result is false)
        @currPos = pos1125
        while(poss.length > posl1125)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        tag = "New" if result isnt false
      if(result isnt false)
        result = @nez$_()
        if(result isnt false)
          pos1128 = @currPos
          posl1128 = poss.length
          result = @nez$Expression()
          outs.push result if typeof result isnt "boolean"
          if(result is false)
            @currPos = pos1128
            while(poss.length > posl1128)
              posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(result isnt false)
            if(/[}]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              posobj.end = @currPos if posobj?
              obj = {}
              result = true
              if(tag is "")
                if(outs.length > 0)
                  obj = outs.pop()
                else if(@obj?)
                  obj = @obj
              else
                obj.tag = tag
                obj.pos = posobj if posobj?
                if(outs.length isnt 0 and poss.length is 0)
                  obj.value = outs
                  @obj = obj
                else if(posobj?)
                  posobj.end = @currPos if !posobj.end?
                  obj.value = @input.slice(posobj.start, posobj.end)
                  @obj = obj
                else
                  obj = @obj if @obj?
              posobj = null
              if(!obj.value? or obj.value is "")
                obj = true
              result = obj
              posobj = poss.pop(posobj) if poss.length > 0
              if(result isnt false)
                result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Replace: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[`]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      while(result isnt false)
        posl1107 = poss.length
        pos1107 = @currPos
        pos1106 = @currPos
        posl1106 = poss.length
        result = true
        if(/[\\]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[`]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
        if(result is false)
          @currPos = pos1106
          while(poss.length > posl1106)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[\\]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[\\]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
          if(result is false)
            @currPos = pos1106
            while(poss.length > posl1106)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            pos1104 = @currPos
            if(/[\n\r`]/).test(@input.charAt(@currPos))
              result = true
              @currPos++
            else
              result = false
            @currPos = pos1104
            if(result is false)
              result = true
            else
              result = false
            if(result isnt false)
              if(@input.length > @currPos)
                @currPos++
                result = true
              else
                result = false
      @currPos = pos1107
      while(poss.length > posl1107)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "Replace" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          if(/[`]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Tagging: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[#]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      result = @nez$LETTER()
      if(result isnt false)
        while(result isnt false)
          posl933 = poss.length
          pos933 = @currPos
          result = @nez$W()
        @currPos = pos933
        while(poss.length > posl933)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(result isnt false)
          tag = "Tagging" if result isnt false
          posobj.end = @currPos if posobj?
          obj = {}
          result = true
          if(tag is "")
            if(outs.length > 0)
              obj = outs.pop()
            else if(@obj?)
              obj = @obj
          else
            obj.tag = tag
            obj.pos = posobj if posobj?
            if(outs.length isnt 0 and poss.length is 0)
              obj.value = outs
              @obj = obj
            else if(posobj?)
              posobj.end = @currPos if !posobj.end?
              obj.value = @input.slice(posobj.start, posobj.end)
              @obj = obj
            else
              obj = @obj if @obj?
          posobj = null
          if(!obj.value? or obj.value is "")
            obj = true
          result = obj
          posobj = poss.pop(posobj) if poss.length > 0
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Extension: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[<]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      result = @nez$_()
      if(result isnt false)
        poss.push(posobj) if posobj?
        posobj = {}
        posobj.start = @currPos
        result = @nez$addExtension()
        if(result isnt false)
          posobj.end = @currPos if posobj?
          obj = {}
          result = true
          if(tag is "")
            if(outs.length > 0)
              obj = outs.pop()
            else if(@obj?)
              obj = @obj
          else
            obj.tag = tag
            obj.pos = posobj if posobj?
            if(outs.length isnt 0 and poss.length is 0)
              obj.value = outs
              @obj = obj
            else if(posobj?)
              posobj.end = @currPos if !posobj.end?
              obj.value = @input.slice(posobj.start, posobj.end)
              @obj = obj
            else
              obj = @obj if @obj?
          posobj = null
          if(!obj.value? or obj.value is "")
            obj = true
          result = obj
          posobj = poss.pop(posobj) if poss.length > 0
          if(result isnt false)
            while(result isnt false)
              posl978 = poss.length
              pos978 = @currPos
              result = @nez$S()
            @currPos = pos978
            while(poss.length > posl978)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(result isnt false)
              if(/[>]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$addExtension: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1458 = @currPos
    posl1458 = poss.length
    result = true
    if(/[i]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[f]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        pos869 = @currPos
        result = @nez$W()
        @currPos = pos869
        if(result is false)
          result = true
        else
          result = false
        if(result isnt false)
          result = @nez$_()
          if(result isnt false)
            result = @nez$FlagName()
            outs.push result if typeof result isnt "boolean"
            tag = "If" if result isnt false
    if(result is false)
      @currPos = pos1458
      while(poss.length > posl1458)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[o]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[n]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          pos869 = @currPos
          result = @nez$W()
          @currPos = pos869
          if(result is false)
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
            if(result isnt false)
              result = @nez$FlagName()
              outs.push result if typeof result isnt "boolean"
              if(result isnt false)
                result = @nez$Expression()
                outs.push result if typeof result isnt "boolean"
                tag = "On" if result isnt false
      if(result is false)
        @currPos = pos1458
        while(poss.length > posl1458)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(/[b]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[o]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[c]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[k]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  pos869 = @currPos
                  result = @nez$W()
                  @currPos = pos869
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
                    if(result isnt false)
                      result = @nez$Expression()
                      outs.push result if typeof result isnt "boolean"
                      tag = "Block" if result isnt false
        if(result is false)
          @currPos = pos1458
          while(poss.length > posl1458)
            posobj = poss.pop(posobj) if poss.length > 0
          result = true
          if(/[d]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[e]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[f]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    result = @nez$TableName()
                    outs.push result if typeof result isnt "boolean"
                    if(result isnt false)
                      result = @nez$Expression()
                      outs.push result if typeof result isnt "boolean"
                      tag = "Def" if result isnt false
          if(result is false)
            @currPos = pos1458
            while(poss.length > posl1458)
              posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[i]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[s]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
                  if(result isnt false)
                    result = @nez$TableName()
                    outs.push result if typeof result isnt "boolean"
                    tag = "Is" if result isnt false
            if(result is false)
              @currPos = pos1458
              while(poss.length > posl1458)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(/[i]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[s]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[a]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    pos869 = @currPos
                    result = @nez$W()
                    @currPos = pos869
                    if(result is false)
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      result = @nez$_()
                      if(result isnt false)
                        result = @nez$TableName()
                        outs.push result if typeof result isnt "boolean"
                        tag = "Isa" if result isnt false
              if(result is false)
                @currPos = pos1458
                while(poss.length > posl1458)
                  posobj = poss.pop(posobj) if poss.length > 0
                result = true
                if(/[e]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[x]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[i]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[s]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[t]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[s]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            pos869 = @currPos
                            result = @nez$W()
                            @currPos = pos869
                            if(result is false)
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$_()
                              if(result isnt false)
                                result = @nez$TableName()
                                outs.push result if typeof result isnt "boolean"
                                tag = "Exists" if result isnt false
                if(result is false)
                  @currPos = pos1458
                  while(poss.length > posl1458)
                    posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[l]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[o]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[c]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        if(/[a]/.test(@input.charAt(@currPos)))
                          @currPos++
                          result = true
                        else
                          result = false
                        if(result isnt false)
                          if(/[l]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            pos869 = @currPos
                            result = @nez$W()
                            @currPos = pos869
                            if(result is false)
                              result = true
                            else
                              result = false
                            if(result isnt false)
                              result = @nez$_()
                              if(result isnt false)
                                result = @nez$TableName()
                                outs.push result if typeof result isnt "boolean"
                                if(result isnt false)
                                  result = @nez$Expression()
                                  outs.push result if typeof result isnt "boolean"
                                  tag = "Local" if result isnt false
                  if(result is false)
                    @currPos = pos1458
                    while(poss.length > posl1458)
                      posobj = poss.pop(posobj) if poss.length > 0
                    result = true
                    result = @nez$Identifier()
                    outs.push result if typeof result isnt "boolean"
                    if(result isnt false)
                      result = @nez$Expression()
                      outs.push result if typeof result isnt "boolean"
                      if(result isnt false)
                        while(result isnt false)
                          posl1453 = poss.length
                          pos1453 = @currPos
                          if(/[,]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            result = @nez$_()
                            if(result isnt false)
                              result = @nez$Expression()
                              outs.push result if typeof result isnt "boolean"
                        @currPos = pos1453
                        while(poss.length > posl1453)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        tag = "Expand" if result isnt false
                    if(result is false)
                      @currPos = pos1458
                      while(poss.length > posl1458)
                        posobj = poss.pop(posobj) if poss.length > 0
                      result = true
                      if(/[\x00-=?-\xff]/).test(@input.charAt(@currPos))
                        result = true
                        @currPos++
                      else
                        result = false
                      if(result isnt false)
                        while(result isnt false)
                          pos410 = @currPos
                          posl410 = poss.length
                          if(/[\x00-=?-\xff]/).test(@input.charAt(@currPos))
                            result = true
                            @currPos++
                          else
                            result = false
                        @currPos = pos410
                        while(poss.length > posl410)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                      tag = "Undefined" if result isnt false
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$FlagName: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos510 = @currPos
    posl510 = poss.length
    if(/[\!]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result is false)
      @currPos = pos510
      while(poss.length > posl510)
        posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      result = @nez$LETTER()
      if(result isnt false)
        while(result isnt false)
          posl933 = poss.length
          pos933 = @currPos
          result = @nez$W()
        @currPos = pos933
        while(poss.length > posl933)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        if(result isnt false)
          tag = "Name" if result isnt false
          posobj.end = @currPos if posobj?
          obj = {}
          result = true
          if(tag is "")
            if(outs.length > 0)
              obj = outs.pop()
            else if(@obj?)
              obj = @obj
          else
            obj.tag = tag
            obj.pos = posobj if posobj?
            if(outs.length isnt 0 and poss.length is 0)
              obj.value = outs
              @obj = obj
            else if(posobj?)
              posobj.end = @currPos if !posobj.end?
              obj.value = @input.slice(posobj.start, posobj.end)
              @obj = obj
            else
              obj = @obj if @obj?
          posobj = null
          if(!obj.value? or obj.value is "")
            obj = true
          result = obj
          posobj = poss.pop(posobj) if poss.length > 0
          if(result isnt false)
            result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$TableName: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    result = @nez$LETTER()
    if(result isnt false)
      while(result isnt false)
        posl933 = poss.length
        pos933 = @currPos
        result = @nez$W()
      @currPos = pos933
      while(poss.length > posl933)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        tag = "Name" if result isnt false
        posobj.end = @currPos if posobj?
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
        posobj = poss.pop(posobj) if poss.length > 0
        if(result isnt false)
          result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Production: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    pos1218 = @currPos
    posl1218 = poss.length
    result = @nez$Modifiers()
    outs.push result if typeof result isnt "boolean"
    if(result is false)
      @currPos = pos1218
      while(poss.length > posl1218)
        posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      pos956 = @currPos
      posl956 = poss.length
      result = true
      result = @nez$Identifier()
      outs.push result if typeof result isnt "boolean"
      if(result is false)
        @currPos = pos956
        while(poss.length > posl956)
          posobj = poss.pop(posobj) if poss.length > 0
        result = true
        result = @nez$String()
        outs.push result if typeof result isnt "boolean"
      if(result isnt false)
        result = @nez$_SKIP_()
        if(result isnt false)
          if(/[=]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_()
            if(result isnt false)
              while(result isnt false)
                posl1221 = poss.length
                pos1221 = @currPos
                result = @nez$OldExample()
                outs.push result if typeof result isnt "boolean"
              @currPos = pos1221
              while(poss.length > posl1221)
                posobj = poss.pop(posobj) if poss.length > 0
              result = true
              if(result isnt false)
                result = @nez$Expression()
                outs.push result if typeof result isnt "boolean"
                if(result isnt false)
                  tag = "Production" if result isnt false
                  posobj.end = @currPos if posobj?
                  obj = {}
                  result = true
                  if(tag is "")
                    if(outs.length > 0)
                      obj = outs.pop()
                    else if(@obj?)
                      obj = @obj
                  else
                    obj.tag = tag
                    obj.pos = posobj if posobj?
                    if(outs.length isnt 0 and poss.length is 0)
                      obj.value = outs
                      @obj = obj
                    else if(posobj?)
                      posobj.end = @currPos if !posobj.end?
                      obj.value = @input.slice(posobj.start, posobj.end)
                      @obj = obj
                    else
                      obj = @obj if @obj?
                  posobj = null
                  if(!obj.value? or obj.value is "")
                    obj = true
                  result = obj
                  posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Modifiers: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    while(result isnt false)
      posl867 = poss.length
      pos867 = @currPos
      result = @nez$Modifier()
    @currPos = pos867
    while(poss.length > posl867)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      tag = "Sequence" if result isnt false
      posobj.end = @currPos if posobj?
      obj = {}
      result = true
      if(tag is "")
        if(outs.length > 0)
          obj = outs.pop()
        else if(@obj?)
          obj = @obj
      else
        obj.tag = tag
        obj.pos = posobj if posobj?
        if(outs.length isnt 0 and poss.length is 0)
          obj.value = outs
          @obj = obj
        else if(posobj?)
          posobj.end = @currPos if !posobj.end?
          obj.value = @input.slice(posobj.start, posobj.end)
          @obj = obj
        else
          obj = @obj if @obj?
      posobj = null
      if(!obj.value? or obj.value is "")
        obj = true
      result = obj
      posobj = poss.pop(posobj) if poss.length > 0
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$Modifier: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    pos1052 = @currPos
    posl1052 = poss.length
    result = true
    if(/[p]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      if(/[u]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[b]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[i]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[c]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                pos869 = @currPos
                result = @nez$W()
                @currPos = pos869
                if(result is false)
                  result = true
                else
                  result = false
                if(result isnt false)
                  result = @nez$_()
    if(result is false)
      @currPos = pos1052
      while(poss.length > posl1052)
        posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(/[i]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[n]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[l]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[i]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[n]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[e]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  pos869 = @currPos
                  result = @nez$W()
                  @currPos = pos869
                  if(result is false)
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$_SKIP_: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    while(result isnt false)
      posl846 = poss.length
      pos846 = @currPos
      result = @nez$_ANNOTATION_()
    @currPos = pos846
    while(poss.length > posl846)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$_ANNOTATION_: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    if(/[\[]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      result = @nez$_DOC_()
      if(result isnt false)
        if(/[\]]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$_DOC_: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    while(result isnt false)
      posl245 = poss.length
      pos245 = @currPos
      if(/[\x00-Z\\^-\xff]/).test(@input.charAt(@currPos))
        result = true
        @currPos++
      else
        result = false
    @currPos = pos245
    while(poss.length > posl245)
      posobj = poss.pop(posobj) if poss.length > 0
    result = true
    if(result isnt false)
      pos1204 = @currPos
      posl1204 = poss.length
      if(/[\[]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        result = @nez$_DOC_()
        if(result isnt false)
          if(/[\]]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            result = @nez$_DOC_()
      if(result is false)
        @currPos = pos1204
        while(poss.length > posl1204)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

  nez$OldExample: () ->
    obj = null
    outs = []
    poss = []
    tags = []
    tag = ""
    poss.push(posobj) if posobj?
    posobj = {}
    posobj.start = @currPos
    if(/[\[]/.test(@input.charAt(@currPos)))
      @currPos++
      result = true
    else
      result = false
    if(result isnt false)
      pos1351 = @currPos
      posl1351 = poss.length
      if(/[b]/.test(@input.charAt(@currPos)))
        @currPos++
        result = true
      else
        result = false
      if(result isnt false)
        if(/[a]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[d]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[-]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
      if(result is false)
        @currPos = pos1351
        while(poss.length > posl1351)
          posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
        if(/[e]/.test(@input.charAt(@currPos)))
          @currPos++
          result = true
        else
          result = false
        if(result isnt false)
          if(/[x]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
          else
            result = false
          if(result isnt false)
            if(/[a]/.test(@input.charAt(@currPos)))
              @currPos++
              result = true
            else
              result = false
            if(result isnt false)
              if(/[m]/.test(@input.charAt(@currPos)))
                @currPos++
                result = true
              else
                result = false
              if(result isnt false)
                if(/[p]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
                else
                  result = false
                if(result isnt false)
                  if(/[l]/.test(@input.charAt(@currPos)))
                    @currPos++
                    result = true
                  else
                    result = false
                  if(result isnt false)
                    if(/[e]/.test(@input.charAt(@currPos)))
                      @currPos++
                      result = true
                    else
                      result = false
                    if(result isnt false)
                      if(/[:]/.test(@input.charAt(@currPos)))
                        @currPos++
                        result = true
                      else
                        result = false
                      if(result isnt false)
                        while(result isnt false)
                          posl1353 = poss.length
                          pos1353 = @currPos
                          if(/[\x00-\\^-\xff]/).test(@input.charAt(@currPos))
                            result = true
                            @currPos++
                          else
                            result = false
                        @currPos = pos1353
                        while(poss.length > posl1353)
                          posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        if(result isnt false)
                          if(/[\]]/.test(@input.charAt(@currPos)))
                            @currPos++
                            result = true
                          else
                            result = false
                          if(result isnt false)
                            tag = "OldExample" if result isnt false
                            posobj.end = @currPos if posobj?
                            obj = {}
                            result = true
                            if(tag is "")
                              if(outs.length > 0)
                                obj = outs.pop()
                              else if(@obj?)
                                obj = @obj
                            else
                              obj.tag = tag
                              obj.pos = posobj if posobj?
                              if(outs.length isnt 0 and poss.length is 0)
                                obj.value = outs
                                @obj = obj
                              else if(posobj?)
                                posobj.end = @currPos if !posobj.end?
                                obj.value = @input.slice(posobj.start, posobj.end)
                                @obj = obj
                              else
                                obj = @obj if @obj?
                            posobj = null
                            if(!obj.value? or obj.value is "")
                              obj = true
                            result = obj
                            posobj = poss.pop(posobj) if poss.length > 0
                            if(result isnt false)
                              result = @nez$_()
    if(result isnt false)
      if(obj is null)
        obj = {}
        result = true
        if(tag is "")
          if(outs.length > 0)
            obj = outs.pop()
          else if(@obj?)
            obj = @obj
        else
          obj.tag = tag
          obj.pos = posobj if posobj?
          if(outs.length isnt 0 and poss.length is 0)
            obj.value = outs
            @obj = obj
          else if(posobj?)
            posobj.end = @currPos if !posobj.end?
            obj.value = @input.slice(posobj.start, posobj.end)
            @obj = obj
          else
            obj = @obj if @obj?
        posobj = null
        if(!obj.value? or obj.value is "")
          obj = true
        result = obj
      result = obj
    result

module.exports = new Parser()
