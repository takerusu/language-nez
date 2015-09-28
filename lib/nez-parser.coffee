
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
         posl1065 = poss.length
         pos1065 = @currPos
         result = @nez$S()
      @currPos = pos1065
      while(poss.length > posl1065)
         posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
         while(result isnt false)
            posl1068 = poss.length
            pos1068 = @currPos
            result = @nez$Statement()
            outs.push result if typeof result isnt "boolean"
         @currPos = pos1068
         while(poss.length > posl1068)
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
      pos1162 = @currPos
      posl1162 = poss.length
      result = true
      if(/[\t]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1162
         while(poss.length > posl1162)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[\n]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1162
            while(poss.length > posl1162)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\r]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1162
               while(poss.length > posl1162)
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
      pos1173 = @currPos
      posl1173 = poss.length
      result = true
      result = @nez$Document()
      if(result is false)
         @currPos = pos1173
         while(poss.length > posl1173)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         result = @nez$ExampleStatement()
         if(result is false)
            @currPos = pos1173
            while(poss.length > posl1173)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$ImportStatement()
            if(result is false)
               @currPos = pos1173
               while(poss.length > posl1173)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               result = @nez$FormatStatement()
               if(result is false)
                  @currPos = pos1173
                  while(poss.length > posl1173)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  result = @nez$TemplateStatement()
                  if(result is false)
                     @currPos = pos1173
                     while(poss.length > posl1173)
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
            posl868 = poss.length
            pos868 = @currPos
            while(result isnt false)
               posl866 = poss.length
               pos866 = @currPos
               if(/[\t-\n\r ]/).test(@input.charAt(@currPos))
                  result = true
                  @currPos++
               else
                  result = false
            @currPos = pos866
            while(poss.length > posl866)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(result isnt false)
               result = @nez$COMMENT()
         @currPos = pos868
         while(poss.length > posl868)
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
      pos1155 = @currPos
      posl1155 = poss.length
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
         @currPos = pos1155
         while(poss.length > posl1155)
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
                  posl847 = poss.length
                  pos847 = @currPos
                  pos845 = @currPos
                  result = @nez$EOL()
                  @currPos = pos845
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
               @currPos = pos847
               while(poss.length > posl847)
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
      pos1157 = @currPos
      posl1157 = poss.length
      result = true
      if(/[\n]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1157
         while(poss.length > posl1157)
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
            @currPos = pos1157
            while(poss.length > posl1157)
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
         posl1185 = poss.length
         pos1185 = @currPos
         pos1184 = @currPos
         posl1184 = poss.length
         result = true
         if(/[\t]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1184
            while(poss.length > posl1184)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\n]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1184
               while(poss.length > posl1184)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               if(/[\r]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               if(result is false)
                  @currPos = pos1184
                  while(poss.length > posl1184)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[ ]/.test(@input.charAt(@currPos)))
                     @currPos++
                     result = true
                  else
                     result = false
                  if(result is false)
                     @currPos = pos1184
                     while(poss.length > posl1184)
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
                        @currPos = pos1184
                        while(poss.length > posl1184)
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
                                 posl847 = poss.length
                                 pos847 = @currPos
                                 pos845 = @currPos
                                 result = @nez$EOL()
                                 @currPos = pos845
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
                              @currPos = pos847
                              while(poss.length > posl847)
                                 posobj = poss.pop(posobj) if poss.length > 0
                              result = true
                              if(result isnt false)
                                 result = @nez$EOL()
      @currPos = pos1185
      while(poss.length > posl1185)
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
                                          posl880 = poss.length
                                          pos880 = @currPos
                                          if(/[\&]/.test(@input.charAt(@currPos)))
                                             @currPos++
                                             result = true
                                          else
                                             result = false
                                          if(result isnt false)
                                             result = @nez$NonTerminal()
                                             outs.push result if typeof result isnt "boolean"
                                       @currPos = pos880
                                       while(poss.length > posl880)
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
         pos910 = @currPos
         posl910 = poss.length
         if(/[\.]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            result = @nez$NAME()
         if(result is false)
            @currPos = pos910
            while(poss.length > posl910)
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
         @NonTerminalList[@obj.value] = [] if !@NonTerminalList[@obj.value]?
         @NonTerminalList[@obj.value].push pos: @obj.pos
      result

   nez$NAME: () ->
      obj = null
      outs = []
      poss = []
      tags = []
      tag = ""
      pos1377 = @currPos
      result = @nez$KEYWORD()
      @currPos = pos1377
      if(result is false)
         result = true
      else
         result = false
      if(result isnt false)
         result = @nez$LETTER()
         if(result isnt false)
            while(result isnt false)
               posl904 = poss.length
               pos904 = @currPos
               result = @nez$W()
            @currPos = pos904
            while(poss.length > posl904)
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
      pos1275 = @currPos
      posl1275 = poss.length
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
                        if(result is false)
                           result = true
                        else
                           result = false
                        if(result isnt false)
                           result = @nez$_()
      if(result is false)
         @currPos = pos1275
         while(poss.length > posl1275)
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
                           pos973 = @currPos
                           result = @nez$W()
                           @currPos = pos973
                           if(result is false)
                              result = true
                           else
                              result = false
                           if(result isnt false)
                              result = @nez$_()
         if(result is false)
            @currPos = pos1275
            while(poss.length > posl1275)
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
                              pos973 = @currPos
                              result = @nez$W()
                              @currPos = pos973
                              if(result is false)
                                 result = true
                              else
                                 result = false
                              if(result isnt false)
                                 result = @nez$_()
            if(result is false)
               @currPos = pos1275
               while(poss.length > posl1275)
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
                           pos973 = @currPos
                           result = @nez$W()
                           @currPos = pos973
                           if(result is false)
                              result = true
                           else
                              result = false
                           if(result isnt false)
                              result = @nez$_()
               if(result is false)
                  @currPos = pos1275
                  while(poss.length > posl1275)
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
                                       pos973 = @currPos
                                       result = @nez$W()
                                       @currPos = pos973
                                       if(result is false)
                                          result = true
                                       else
                                          result = false
                                       if(result isnt false)
                                          result = @nez$_()
                  if(result is false)
                     @currPos = pos1275
                     while(poss.length > posl1275)
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
                        @currPos = pos1275
                        while(poss.length > posl1275)
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
                                                pos973 = @currPos
                                                result = @nez$W()
                                                @currPos = pos973
                                                if(result is false)
                                                   result = true
                                                else
                                                   result = false
                                                if(result isnt false)
                                                   result = @nez$_()
                        if(result is false)
                           @currPos = pos1275
                           while(poss.length > posl1275)
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
                                             pos973 = @currPos
                                             result = @nez$W()
                                             @currPos = pos973
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                           if(result is false)
                              @currPos = pos1275
                              while(poss.length > posl1275)
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
                                          pos973 = @currPos
                                          result = @nez$W()
                                          @currPos = pos973
                                          if(result is false)
                                             result = true
                                          else
                                             result = false
                                          if(result isnt false)
                                             result = @nez$_()
                              if(result is false)
                                 @currPos = pos1275
                                 while(poss.length > posl1275)
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
                                                pos973 = @currPos
                                                result = @nez$W()
                                                @currPos = pos973
                                                if(result is false)
                                                   result = true
                                                else
                                                   result = false
                                                if(result isnt false)
                                                   result = @nez$_()
                                 if(result is false)
                                    @currPos = pos1275
                                    while(poss.length > posl1275)
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
                                                      pos973 = @currPos
                                                      result = @nez$W()
                                                      @currPos = pos973
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
      pos1166 = @currPos
      posl1166 = poss.length
      result = true
      if(/[0-9]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1166
         while(poss.length > posl1166)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[A-Z]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
         else
            result = false
         if(result is false)
            @currPos = pos1166
            while(poss.length > posl1166)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[_]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1166
               while(poss.length > posl1166)
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
      pos1227 = @currPos
      posl1227 = poss.length
      result = true
      if(/[A-Z]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1227
         while(poss.length > posl1227)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[_]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1227
            while(poss.length > posl1227)
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
      pos852 = @currPos
      posl852 = poss.length
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
         @currPos = pos852
         while(poss.length > posl852)
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
            @currPos = pos852
            while(poss.length > posl852)
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
               @currPos = pos852
               while(poss.length > posl852)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               poss.push(posobj) if posobj?
               posobj = {}
               posobj.start = @currPos
               while(result isnt false)
                  posl847 = poss.length
                  pos847 = @currPos
                  pos845 = @currPos
                  result = @nez$EOL()
                  @currPos = pos845
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
               @currPos = pos847
               while(poss.length > posl847)
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
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
                                             pos973 = @currPos
                                             result = @nez$W()
                                             @currPos = pos973
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                                                if(result isnt false)
                                                   pos1134 = @currPos
                                                   posl1134 = poss.length
                                                   result = true
                                                   result = @nez$Character()
                                                   outs.push result if typeof result isnt "boolean"
                                                   if(result is false)
                                                      @currPos = pos1134
                                                      while(poss.length > posl1134)
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
      pos1098 = @currPos
      posl1098 = poss.length
      result = true
      if(/[\*]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1098
         while(poss.length > posl1098)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         result = @nez$NAME()
         if(result isnt false)
            pos1096 = @currPos
            posl1096 = poss.length
            if(/[\.]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result isnt false)
               pos1094 = @currPos
               posl1094 = poss.length
               result = true
               if(/[\*]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               if(result is false)
                  @currPos = pos1094
                  while(poss.length > posl1094)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  result = @nez$NAME()
            if(result is false)
               @currPos = pos1096
               while(poss.length > posl1096)
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
            posl1190 = poss.length
            pos1190 = @currPos
            pos1189 = @currPos
            posl1189 = poss.length
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
               @currPos = pos1189
               while(poss.length > posl1189)
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
                  @currPos = pos1189
                  while(poss.length > posl1189)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  pos1187 = @currPos
                  if(/[\n\r\']/).test(@input.charAt(@currPos))
                     result = true
                     @currPos++
                  else
                     result = false
                  @currPos = pos1187
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
         @currPos = pos1190
         while(poss.length > posl1190)
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
            posl857 = poss.length
            pos857 = @currPos
            pos856 = @currPos
            posl856 = poss.length
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
               @currPos = pos856
               while(poss.length > posl856)
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
                  @currPos = pos856
                  while(poss.length > posl856)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  pos854 = @currPos
                  if(/[\n\r"]/).test(@input.charAt(@currPos))
                     result = true
                     @currPos++
                  else
                     result = false
                  @currPos = pos854
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
         @currPos = pos857
         while(poss.length > posl857)
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
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
      pos899 = @currPos
      posl899 = poss.length
      result = true
      if(/[\*]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos899
         while(poss.length > posl899)
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
         posl1483 = poss.length
         pos1483 = @currPos
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
            pos1481 = @currPos
            posl1481 = poss.length
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
               @currPos = pos1481
               while(poss.length > posl1481)
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
                              pos1462 = @currPos
                              posl1462 = poss.length
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
                                 @currPos = pos1462
                                 while(poss.length > posl1462)
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
                  @currPos = pos1481
                  while(poss.length > posl1481)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  poss.push(posobj) if posobj?
                  posobj = {}
                  posobj.start = @currPos
                  pos1477 = @currPos
                  posl1477 = poss.length
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
                     @currPos = pos1477
                     while(poss.length > posl1477)
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
                        @currPos = pos1477
                        while(poss.length > posl1477)
                           posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        pos1474 = @currPos
                        pos1473 = @currPos
                        posl1473 = poss.length
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
                           @currPos = pos1473
                           while(poss.length > posl1473)
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
                              @currPos = pos1473
                              while(poss.length > posl1473)
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
                                 @currPos = pos1473
                                 while(poss.length > posl1473)
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
                                    @currPos = pos1473
                                    while(poss.length > posl1473)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    if(/[`]/.test(@input.charAt(@currPos)))
                                       @currPos++
                                       result = true
                                    else
                                       result = false
                        @currPos = pos1474
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
                              pos1476 = @currPos
                              posl1476 = poss.length
                              pos1474 = @currPos
                              pos1473 = @currPos
                              posl1473 = poss.length
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
                                 @currPos = pos1473
                                 while(poss.length > posl1473)
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
                                    @currPos = pos1473
                                    while(poss.length > posl1473)
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
                                       @currPos = pos1473
                                       while(poss.length > posl1473)
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
                                          @currPos = pos1473
                                          while(poss.length > posl1473)
                                             posobj = poss.pop(posobj) if poss.length > 0
                                          result = true
                                          if(/[`]/.test(@input.charAt(@currPos)))
                                             @currPos++
                                             result = true
                                          else
                                             result = false
                              @currPos = pos1474
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
                           @currPos = pos1476
                           while(poss.length > posl1476)
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
      @currPos = pos1483
      while(poss.length > posl1483)
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
                              pos973 = @currPos
                              result = @nez$W()
                              @currPos = pos973
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
            posl1001 = poss.length
            pos1001 = @currPos
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
         @currPos = pos1001
         while(poss.length > posl1001)
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
         pos1092 = @currPos
         posl1092 = poss.length
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
               pos1089 = @currPos
               posl1089 = poss.length
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
            @currPos = pos1089
            while(poss.length > posl1089)
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
            @currPos = pos1092
            while(poss.length > posl1092)
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
         pos1079 = @currPos
         posl1079 = poss.length
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
               pos1076 = @currPos
               posl1076 = poss.length
               result = @nez$Prefix()
               ltmp.push result if typeof result isnt "boolean"
            @currPos = pos1076
            while(poss.length > posl1076)
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
            @currPos = pos1079
            while(poss.length > posl1079)
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
      pos1128 = @currPos
      posl1128 = poss.length
      result = true
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      pos1122 = @currPos
      posl1122 = poss.length
      result = true
      if(/[\&]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      tag = "And" if result isnt false
      if(result is false)
         @currPos = pos1122
         while(poss.length > posl1122)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[\!]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         tag = "Not" if result isnt false
         if(result is false)
            @currPos = pos1122
            while(poss.length > posl1122)
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
               @currPos = pos1122
               while(poss.length > posl1122)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               if(/[@]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               tag = "Link" if result isnt false
               if(result is false)
                  @currPos = pos1122
                  while(poss.length > posl1122)
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
         @currPos = pos1128
         while(poss.length > posl1128)
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
         pos924 = @currPos
         posl924 = poss.length
         ltmp = []
         if(ltmp[ltmp.length-1] isnt result)
            ltmp.push result if typeof result isnt "boolean"
         poss.push(posobj) if posobj?
         posobj = {}
         posobj.start = @currPos
         pos921 = @currPos
         posl921 = poss.length
         result = true
         if(/[\*]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            pos918 = @currPos
            posl918 = poss.length
            result = @nez$Integer()
            ltmp.push result if typeof result isnt "boolean"
            if(result is false)
               @currPos = pos918
               while(poss.length > posl918)
                  posobj = poss.pop(posobj) if poss.length > 0
            result = true
            tag = "Repetition" if result isnt false
         if(result is false)
            @currPos = pos921
            while(poss.length > posl921)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\+]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            tag = "Repetition1" if result isnt false
            if(result is false)
               @currPos = pos921
               while(poss.length > posl921)
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
            @currPos = pos924
            while(poss.length > posl924)
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
      pos1350 = @currPos
      posl1350 = poss.length
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
                  pos973 = @currPos
                  result = @nez$W()
                  @currPos = pos973
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
         @currPos = pos1350
         while(poss.length > posl1350)
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
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
            @currPos = pos1350
            while(poss.length > posl1350)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$Character()
            if(result is false)
               @currPos = pos1350
               while(poss.length > posl1350)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               result = @nez$Charset()
               if(result is false)
                  @currPos = pos1350
                  while(poss.length > posl1350)
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
                     @currPos = pos1350
                     while(poss.length > posl1350)
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
                        @currPos = pos1350
                        while(poss.length > posl1350)
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
                           @currPos = pos1350
                           while(poss.length > posl1350)
                              posobj = poss.pop(posobj) if poss.length > 0
                           result = true
                           poss.push(posobj) if posobj?
                           posobj = {}
                           posobj.start = @currPos
                           if(/[$]/.test(@input.charAt(@currPos)))
                              @currPos++
                              result = true
                           else
                              result = false
                           if(result isnt false)
                              pos1201 = @currPos
                              posl1201 = poss.length
                              result = @nez$Label()
                              outs.push result if typeof result isnt "boolean"
                              if(result is false)
                                 @currPos = pos1201
                                 while(poss.length > posl1201)
                                    posobj = poss.pop(posobj) if poss.length > 0
                              result = true
                              if(result isnt false)
                                 if(/[\(]/.test(@input.charAt(@currPos)))
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
                                          if(/[\)]/.test(@input.charAt(@currPos)))
                                             @currPos++
                                             result = true
                                          else
                                             result = false
                                          if(result isnt false)
                                             result = @nez$_()
                                             if(result isnt false)
                                                tag = "label" if result isnt false
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
                              @currPos = pos1350
                              while(poss.length > posl1350)
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
                                 @currPos = pos1350
                                 while(poss.length > posl1350)
                                    posobj = poss.pop(posobj) if poss.length > 0
                                 result = true
                                 result = @nez$Constructor()
                                 if(result is false)
                                    @currPos = pos1350
                                    while(poss.length > posl1350)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    result = @nez$Replace()
                                    if(result is false)
                                       @currPos = pos1350
                                       while(poss.length > posl1350)
                                          posobj = poss.pop(posobj) if poss.length > 0
                                       result = true
                                       result = @nez$Tagging()
                                       if(result is false)
                                          @currPos = pos1350
                                          while(poss.length > posl1350)
                                             posobj = poss.pop(posobj) if poss.length > 0
                                          result = true
                                          result = @nez$String()
                                          if(result isnt false)
                                             pos1331 = @currPos
                                             if(/[=]/.test(@input.charAt(@currPos)))
                                                @currPos++
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                                             @currPos = pos1331
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                          if(result is false)
                                             @currPos = pos1350
                                             while(poss.length > posl1350)
                                                posobj = poss.pop(posobj) if poss.length > 0
                                             result = true
                                             result = @nez$Extension()
                                             if(result is false)
                                                @currPos = pos1350
                                                while(poss.length > posl1350)
                                                   posobj = poss.pop(posobj) if poss.length > 0
                                                result = true
                                                result = @nez$NonTerminal()
                                                if(result isnt false)
                                                   pos1348 = @currPos
                                                   pos1347 = @currPos
                                                   posl1347 = poss.length
                                                   result = true
                                                   if(/[=]/.test(@input.charAt(@currPos)))
                                                      @currPos++
                                                      result = true
                                                   else
                                                      result = false
                                                   if(result isnt false)
                                                      result = @nez$_()
                                                   if(result is false)
                                                      @currPos = pos1347
                                                      while(poss.length > posl1347)
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
                                                         @currPos = pos1347
                                                         while(poss.length > posl1347)
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
                                                   @currPos = pos1348
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
            posl1032 = poss.length
            pos1032 = @currPos
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
                  pos1026 = @currPos
                  posl1026 = poss.length
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
                     @currPos = pos1026
                     while(poss.length > posl1026)
                        posobj = poss.pop(posobj) if poss.length > 0
                  result = true
            outs.push result if typeof result isnt "boolean"
         @currPos = pos1032
         while(poss.length > posl1032)
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
      pos1109 = @currPos
      posl1109 = poss.length
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
         @currPos = pos1109
         while(poss.length > posl1109)
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
            @currPos = pos1109
            while(poss.length > posl1109)
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
               @currPos = pos1109
               while(poss.length > posl1109)
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
                  @currPos = pos1109
                  while(poss.length > posl1109)
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
                     @currPos = pos1109
                     while(poss.length > posl1109)
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
                        @currPos = pos1109
                        while(poss.length > posl1109)
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
                           @currPos = pos1109
                           while(poss.length > posl1109)
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
                              @currPos = pos1109
                              while(poss.length > posl1109)
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
                                 @currPos = pos1109
                                 while(poss.length > posl1109)
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
                                    @currPos = pos1109
                                    while(poss.length > posl1109)
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
      pos1216 = @currPos
      posl1216 = poss.length
      result = true
      if(/[0-9]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1216
         while(poss.length > posl1216)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[A-F]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
         else
            result = false
         if(result is false)
            @currPos = pos1216
            while(poss.length > posl1216)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[a-f]/).test(@input.charAt(@currPos))
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

   nez$Label: () ->
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
         pos910 = @currPos
         posl910 = poss.length
         if(/[\.]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            result = @nez$NAME()
         if(result is false)
            @currPos = pos910
            while(poss.length > posl910)
               posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(result isnt false)
            tag = "Label" if result isnt false
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
         pos1205 = @currPos
         posl1205 = poss.length
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
            @currPos = pos1205
            while(poss.length > posl1205)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[$]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result isnt false)
               pos1201 = @currPos
               posl1201 = poss.length
               result = @nez$Label()
               outs.push result if typeof result isnt "boolean"
               if(result is false)
                  @currPos = pos1201
                  while(poss.length > posl1201)
                     posobj = poss.pop(posobj) if poss.length > 0
               result = true
               tag = "LabelNew" if result isnt false
            if(result is false)
               @currPos = pos1205
               while(poss.length > posl1205)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               tag = "New" if result isnt false
         if(result isnt false)
            result = @nez$_()
            if(result isnt false)
               pos1207 = @currPos
               posl1207 = poss.length
               result = @nez$Expression()
               outs.push result if typeof result isnt "boolean"
               if(result is false)
                  @currPos = pos1207
                  while(poss.length > posl1207)
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
            posl1500 = poss.length
            pos1500 = @currPos
            pos1499 = @currPos
            posl1499 = poss.length
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
               @currPos = pos1499
               while(poss.length > posl1499)
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
                  @currPos = pos1499
                  while(poss.length > posl1499)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  pos1497 = @currPos
                  if(/[\n\r`]/).test(@input.charAt(@currPos))
                     result = true
                     @currPos++
                  else
                     result = false
                  @currPos = pos1497
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
         @currPos = pos1500
         while(poss.length > posl1500)
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
               posl904 = poss.length
               pos904 = @currPos
               result = @nez$W()
            @currPos = pos904
            while(poss.length > posl904)
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
                     posl1065 = poss.length
                     pos1065 = @currPos
                     result = @nez$S()
                  @currPos = pos1065
                  while(poss.length > posl1065)
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
      pos1446 = @currPos
      posl1446 = poss.length
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
            pos973 = @currPos
            result = @nez$W()
            @currPos = pos973
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
         @currPos = pos1446
         while(poss.length > posl1446)
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
               pos973 = @currPos
               result = @nez$W()
               @currPos = pos973
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
            @currPos = pos1446
            while(poss.length > posl1446)
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
                           pos973 = @currPos
                           result = @nez$W()
                           @currPos = pos973
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
               @currPos = pos1446
               while(poss.length > posl1446)
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
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
                  @currPos = pos1446
                  while(poss.length > posl1446)
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
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
                     @currPos = pos1446
                     while(poss.length > posl1446)
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
                              pos973 = @currPos
                              result = @nez$W()
                              @currPos = pos973
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
                        @currPos = pos1446
                        while(poss.length > posl1446)
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
                                          pos973 = @currPos
                                          result = @nez$W()
                                          @currPos = pos973
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
                           @currPos = pos1446
                           while(poss.length > posl1446)
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
                                          pos973 = @currPos
                                          result = @nez$W()
                                          @currPos = pos973
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
                              @currPos = pos1446
                              while(poss.length > posl1446)
                                 posobj = poss.pop(posobj) if poss.length > 0
                              result = true
                              result = @nez$Identifier()
                              outs.push result if typeof result isnt "boolean"
                              if(result isnt false)
                                 result = @nez$Expression()
                                 outs.push result if typeof result isnt "boolean"
                                 if(result isnt false)
                                    while(result isnt false)
                                       posl1441 = poss.length
                                       pos1441 = @currPos
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
                                    @currPos = pos1441
                                    while(poss.length > posl1441)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    tag = "Expand" if result isnt false
                              if(result is false)
                                 @currPos = pos1446
                                 while(poss.length > posl1446)
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
               posl904 = poss.length
               pos904 = @currPos
               result = @nez$W()
            @currPos = pos904
            while(poss.length > posl904)
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
            posl904 = poss.length
            pos904 = @currPos
            result = @nez$W()
         @currPos = pos904
         while(poss.length > posl904)
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
      pos929 = @currPos
      posl929 = poss.length
      result = @nez$Modifiers()
      outs.push result if typeof result isnt "boolean"
      if(result is false)
         @currPos = pos929
         while(poss.length > posl929)
            posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
         pos934 = @currPos
         posl934 = poss.length
         result = true
         result = @nez$Identifier()
         outs.push result if typeof result isnt "boolean"
         if(result is false)
            @currPos = pos934
            while(poss.length > posl934)
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
                        posl938 = poss.length
                        pos938 = @currPos
                        result = @nez$OldExample()
                        outs.push result if typeof result isnt "boolean"
                     @currPos = pos938
                     while(poss.length > posl938)
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
         posl1082 = poss.length
         pos1082 = @currPos
         result = @nez$Modifier()
      @currPos = pos1082
      while(poss.length > posl1082)
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
      pos1018 = @currPos
      posl1018 = poss.length
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
                        pos973 = @currPos
                        result = @nez$W()
                        @currPos = pos973
                        if(result is false)
                           result = true
                        else
                           result = false
                        if(result isnt false)
                           result = @nez$_()
      if(result is false)
         @currPos = pos1018
         while(poss.length > posl1018)
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
                           pos973 = @currPos
                           result = @nez$W()
                           @currPos = pos973
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
         posl876 = poss.length
         pos876 = @currPos
         result = @nez$_ANNOTATION_()
      @currPos = pos876
      while(poss.length > posl876)
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
         pos827 = @currPos
         posl827 = poss.length
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
            @currPos = pos827
            while(poss.length > posl827)
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
         pos954 = @currPos
         posl954 = poss.length
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
            @currPos = pos954
            while(poss.length > posl954)
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
                                       posl957 = poss.length
                                       pos957 = @currPos
                                       if(/[\x00-\\^-\xff]/).test(@input.charAt(@currPos))
                                          result = true
                                          @currPos++
                                       else
                                          result = false
                                    @currPos = pos957
                                    while(poss.length > posl957)
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
