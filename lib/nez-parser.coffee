
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
         posl1075 = poss.length
         pos1075 = @currPos
         result = @nez$S()
      @currPos = pos1075
      while(poss.length > posl1075)
         posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
         while(result isnt false)
            posl1078 = poss.length
            pos1078 = @currPos
            result = @nez$Statement()
            outs.push result if typeof result isnt "boolean"
         @currPos = pos1078
         while(poss.length > posl1078)
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
      pos1172 = @currPos
      posl1172 = poss.length
      result = true
      if(/[\t]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1172
         while(poss.length > posl1172)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[\n]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1172
            while(poss.length > posl1172)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\r]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1172
               while(poss.length > posl1172)
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
      pos1183 = @currPos
      posl1183 = poss.length
      result = true
      result = @nez$Document()
      if(result is false)
         @currPos = pos1183
         while(poss.length > posl1183)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         result = @nez$ExampleStatement()
         if(result is false)
            @currPos = pos1183
            while(poss.length > posl1183)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$ImportStatement()
            if(result is false)
               @currPos = pos1183
               while(poss.length > posl1183)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               result = @nez$FormatStatement()
               if(result is false)
                  @currPos = pos1183
                  while(poss.length > posl1183)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  result = @nez$TemplateStatement()
                  if(result is false)
                     @currPos = pos1183
                     while(poss.length > posl1183)
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
      pos1165 = @currPos
      posl1165 = poss.length
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
         @currPos = pos1165
         while(poss.length > posl1165)
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
      pos1167 = @currPos
      posl1167 = poss.length
      result = true
      if(/[\n]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1167
         while(poss.length > posl1167)
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
            @currPos = pos1167
            while(poss.length > posl1167)
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
         posl1195 = poss.length
         pos1195 = @currPos
         pos1194 = @currPos
         posl1194 = poss.length
         result = true
         if(/[\t]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1194
            while(poss.length > posl1194)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\n]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1194
               while(poss.length > posl1194)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               if(/[\r]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               if(result is false)
                  @currPos = pos1194
                  while(poss.length > posl1194)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  if(/[ ]/.test(@input.charAt(@currPos)))
                     @currPos++
                     result = true
                  else
                     result = false
                  if(result is false)
                     @currPos = pos1194
                     while(poss.length > posl1194)
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
                        @currPos = pos1194
                        while(poss.length > posl1194)
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
      @currPos = pos1195
      while(poss.length > posl1195)
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
                                          pos890 = @currPos
                                          posl890 = poss.length
                                          poss.push(posobj) if posobj?
                                          posobj = {}
                                          posobj.start = @currPos
                                          if(/[~]/.test(@input.charAt(@currPos)))
                                             @currPos++
                                             result = true
                                          else
                                             result = false
                                          if(result isnt false)
                                             result = @nez$W()
                                             if(result isnt false)
                                                while(result isnt false)
                                                   pos882 = @currPos
                                                   posl882 = poss.length
                                                   result = @nez$W()
                                                @currPos = pos882
                                                while(poss.length > posl882)
                                                   posobj = poss.pop(posobj) if poss.length > 0
                                                result = true
                                             if(result isnt false)
                                                tag = "Hash" if result isnt false
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
                                             result = @nez$_()
                                          if(result is false)
                                             @currPos = pos890
                                             while(poss.length > posl890)
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
         @NonTerminalList[@obj.value] = [] if !@NonTerminalList[@obj.value]?
         @NonTerminalList[@obj.value].push pos: @obj.pos
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
         pos920 = @currPos
         posl920 = poss.length
         if(/[\.]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            result = @nez$NAME()
         if(result is false)
            @currPos = pos920
            while(poss.length > posl920)
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
      result
   
   nez$NAME: () ->
      obj = null
      outs = []
      poss = []
      tags = []
      tag = ""
      pos1387 = @currPos
      result = @nez$KEYWORD()
      @currPos = pos1387
      if(result is false)
         result = true
      else
         result = false
      if(result isnt false)
         result = @nez$LETTER()
         if(result isnt false)
            while(result isnt false)
               posl914 = poss.length
               pos914 = @currPos
               result = @nez$W()
            @currPos = pos914
            while(poss.length > posl914)
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
      pos1285 = @currPos
      posl1285 = poss.length
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
                        if(result is false)
                           result = true
                        else
                           result = false
                        if(result isnt false)
                           result = @nez$_()
      if(result is false)
         @currPos = pos1285
         while(poss.length > posl1285)
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
                           pos983 = @currPos
                           result = @nez$W()
                           @currPos = pos983
                           if(result is false)
                              result = true
                           else
                              result = false
                           if(result isnt false)
                              result = @nez$_()
         if(result is false)
            @currPos = pos1285
            while(poss.length > posl1285)
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
                              pos983 = @currPos
                              result = @nez$W()
                              @currPos = pos983
                              if(result is false)
                                 result = true
                              else
                                 result = false
                              if(result isnt false)
                                 result = @nez$_()
            if(result is false)
               @currPos = pos1285
               while(poss.length > posl1285)
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
                           pos983 = @currPos
                           result = @nez$W()
                           @currPos = pos983
                           if(result is false)
                              result = true
                           else
                              result = false
                           if(result isnt false)
                              result = @nez$_()
               if(result is false)
                  @currPos = pos1285
                  while(poss.length > posl1285)
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
                                       pos983 = @currPos
                                       result = @nez$W()
                                       @currPos = pos983
                                       if(result is false)
                                          result = true
                                       else
                                          result = false
                                       if(result isnt false)
                                          result = @nez$_()
                  if(result is false)
                     @currPos = pos1285
                     while(poss.length > posl1285)
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
                        @currPos = pos1285
                        while(poss.length > posl1285)
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
                                                pos983 = @currPos
                                                result = @nez$W()
                                                @currPos = pos983
                                                if(result is false)
                                                   result = true
                                                else
                                                   result = false
                                                if(result isnt false)
                                                   result = @nez$_()
                        if(result is false)
                           @currPos = pos1285
                           while(poss.length > posl1285)
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
                                             pos983 = @currPos
                                             result = @nez$W()
                                             @currPos = pos983
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                           if(result is false)
                              @currPos = pos1285
                              while(poss.length > posl1285)
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
                                          pos983 = @currPos
                                          result = @nez$W()
                                          @currPos = pos983
                                          if(result is false)
                                             result = true
                                          else
                                             result = false
                                          if(result isnt false)
                                             result = @nez$_()
                              if(result is false)
                                 @currPos = pos1285
                                 while(poss.length > posl1285)
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
                                                pos983 = @currPos
                                                result = @nez$W()
                                                @currPos = pos983
                                                if(result is false)
                                                   result = true
                                                else
                                                   result = false
                                                if(result isnt false)
                                                   result = @nez$_()
                                 if(result is false)
                                    @currPos = pos1285
                                    while(poss.length > posl1285)
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
                                                      pos983 = @currPos
                                                      result = @nez$W()
                                                      @currPos = pos983
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
      pos1176 = @currPos
      posl1176 = poss.length
      result = true
      if(/[0-9]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1176
         while(poss.length > posl1176)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[A-Z]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
         else
            result = false
         if(result is false)
            @currPos = pos1176
            while(poss.length > posl1176)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[_]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result is false)
               @currPos = pos1176
               while(poss.length > posl1176)
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
      pos1237 = @currPos
      posl1237 = poss.length
      result = true
      if(/[A-Z]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1237
         while(poss.length > posl1237)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[_]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result is false)
            @currPos = pos1237
            while(poss.length > posl1237)
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
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
                                             pos983 = @currPos
                                             result = @nez$W()
                                             @currPos = pos983
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                                                if(result isnt false)
                                                   pos1144 = @currPos
                                                   posl1144 = poss.length
                                                   result = true
                                                   result = @nez$Character()
                                                   outs.push result if typeof result isnt "boolean"
                                                   if(result is false)
                                                      @currPos = pos1144
                                                      while(poss.length > posl1144)
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
      pos1108 = @currPos
      posl1108 = poss.length
      result = true
      if(/[\*]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos1108
         while(poss.length > posl1108)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         result = @nez$NAME()
         if(result isnt false)
            pos1106 = @currPos
            posl1106 = poss.length
            if(/[\.]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result isnt false)
               pos1104 = @currPos
               posl1104 = poss.length
               result = true
               if(/[\*]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               if(result is false)
                  @currPos = pos1104
                  while(poss.length > posl1104)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  result = @nez$NAME()
            if(result is false)
               @currPos = pos1106
               while(poss.length > posl1106)
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
            posl1200 = poss.length
            pos1200 = @currPos
            pos1199 = @currPos
            posl1199 = poss.length
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
               @currPos = pos1199
               while(poss.length > posl1199)
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
                  @currPos = pos1199
                  while(poss.length > posl1199)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  pos1197 = @currPos
                  if(/[\n\r\']/).test(@input.charAt(@currPos))
                     result = true
                     @currPos++
                  else
                     result = false
                  @currPos = pos1197
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
         @currPos = pos1200
         while(poss.length > posl1200)
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
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
      pos910 = @currPos
      posl910 = poss.length
      result = true
      if(/[\*]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      if(result is false)
         @currPos = pos910
         while(poss.length > posl910)
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
         posl1493 = poss.length
         pos1493 = @currPos
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
            pos1491 = @currPos
            posl1491 = poss.length
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
               @currPos = pos1491
               while(poss.length > posl1491)
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
                              pos1472 = @currPos
                              posl1472 = poss.length
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
                                 @currPos = pos1472
                                 while(poss.length > posl1472)
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
                  @currPos = pos1491
                  while(poss.length > posl1491)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  poss.push(posobj) if posobj?
                  posobj = {}
                  posobj.start = @currPos
                  pos1487 = @currPos
                  posl1487 = poss.length
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
                     @currPos = pos1487
                     while(poss.length > posl1487)
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
                        @currPos = pos1487
                        while(poss.length > posl1487)
                           posobj = poss.pop(posobj) if poss.length > 0
                        result = true
                        pos1484 = @currPos
                        pos1483 = @currPos
                        posl1483 = poss.length
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
                           @currPos = pos1483
                           while(poss.length > posl1483)
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
                              @currPos = pos1483
                              while(poss.length > posl1483)
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
                                 @currPos = pos1483
                                 while(poss.length > posl1483)
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
                                    @currPos = pos1483
                                    while(poss.length > posl1483)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    if(/[`]/.test(@input.charAt(@currPos)))
                                       @currPos++
                                       result = true
                                    else
                                       result = false
                        @currPos = pos1484
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
                              pos1486 = @currPos
                              posl1486 = poss.length
                              pos1484 = @currPos
                              pos1483 = @currPos
                              posl1483 = poss.length
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
                                 @currPos = pos1483
                                 while(poss.length > posl1483)
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
                                    @currPos = pos1483
                                    while(poss.length > posl1483)
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
                                       @currPos = pos1483
                                       while(poss.length > posl1483)
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
                                          @currPos = pos1483
                                          while(poss.length > posl1483)
                                             posobj = poss.pop(posobj) if poss.length > 0
                                          result = true
                                          if(/[`]/.test(@input.charAt(@currPos)))
                                             @currPos++
                                             result = true
                                          else
                                             result = false
                              @currPos = pos1484
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
                           @currPos = pos1486
                           while(poss.length > posl1486)
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
      @currPos = pos1493
      while(poss.length > posl1493)
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
                              pos983 = @currPos
                              result = @nez$W()
                              @currPos = pos983
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
            posl1011 = poss.length
            pos1011 = @currPos
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
         @currPos = pos1011
         while(poss.length > posl1011)
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
         pos1102 = @currPos
         posl1102 = poss.length
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
               pos1099 = @currPos
               posl1099 = poss.length
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
            @currPos = pos1099
            while(poss.length > posl1099)
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
            @currPos = pos1102
            while(poss.length > posl1102)
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
         pos1089 = @currPos
         posl1089 = poss.length
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
               pos1086 = @currPos
               posl1086 = poss.length
               result = @nez$Prefix()
               ltmp.push result if typeof result isnt "boolean"
            @currPos = pos1086
            while(poss.length > posl1086)
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
            @currPos = pos1089
            while(poss.length > posl1089)
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
      pos1138 = @currPos
      posl1138 = poss.length
      result = true
      poss.push(posobj) if posobj?
      posobj = {}
      posobj.start = @currPos
      pos1132 = @currPos
      posl1132 = poss.length
      result = true
      if(/[\&]/.test(@input.charAt(@currPos)))
         @currPos++
         result = true
      else
         result = false
      tag = "And" if result isnt false
      if(result is false)
         @currPos = pos1132
         while(poss.length > posl1132)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[\!]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         tag = "Not" if result isnt false
         if(result is false)
            @currPos = pos1132
            while(poss.length > posl1132)
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
               @currPos = pos1132
               while(poss.length > posl1132)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               if(/[@]/.test(@input.charAt(@currPos)))
                  @currPos++
                  result = true
               else
                  result = false
               tag = "Link" if result isnt false
               if(result is false)
                  @currPos = pos1132
                  while(poss.length > posl1132)
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
         @currPos = pos1138
         while(poss.length > posl1138)
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
         pos934 = @currPos
         posl934 = poss.length
         ltmp = []
         if(ltmp[ltmp.length-1] isnt result)
            ltmp.push result if typeof result isnt "boolean"
         poss.push(posobj) if posobj?
         posobj = {}
         posobj.start = @currPos
         pos931 = @currPos
         posl931 = poss.length
         result = true
         if(/[\*]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            pos928 = @currPos
            posl928 = poss.length
            result = @nez$Integer()
            ltmp.push result if typeof result isnt "boolean"
            if(result is false)
               @currPos = pos928
               while(poss.length > posl928)
                  posobj = poss.pop(posobj) if poss.length > 0
            result = true
            tag = "Repetition" if result isnt false
         if(result is false)
            @currPos = pos931
            while(poss.length > posl931)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[\+]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            tag = "Repetition1" if result isnt false
            if(result is false)
               @currPos = pos931
               while(poss.length > posl931)
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
            @currPos = pos934
            while(poss.length > posl934)
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
      pos1360 = @currPos
      posl1360 = poss.length
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
                  pos983 = @currPos
                  result = @nez$W()
                  @currPos = pos983
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
         @currPos = pos1360
         while(poss.length > posl1360)
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
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
            @currPos = pos1360
            while(poss.length > posl1360)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            result = @nez$Character()
            if(result is false)
               @currPos = pos1360
               while(poss.length > posl1360)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               result = @nez$Charset()
               if(result is false)
                  @currPos = pos1360
                  while(poss.length > posl1360)
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
                     @currPos = pos1360
                     while(poss.length > posl1360)
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
                        @currPos = pos1360
                        while(poss.length > posl1360)
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
                           @currPos = pos1360
                           while(poss.length > posl1360)
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
                              pos1211 = @currPos
                              posl1211 = poss.length
                              result = @nez$Label()
                              outs.push result if typeof result isnt "boolean"
                              if(result is false)
                                 @currPos = pos1211
                                 while(poss.length > posl1211)
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
                              @currPos = pos1360
                              while(poss.length > posl1360)
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
                                 @currPos = pos1360
                                 while(poss.length > posl1360)
                                    posobj = poss.pop(posobj) if poss.length > 0
                                 result = true
                                 result = @nez$Constructor()
                                 if(result is false)
                                    @currPos = pos1360
                                    while(poss.length > posl1360)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    result = @nez$Replace()
                                    if(result is false)
                                       @currPos = pos1360
                                       while(poss.length > posl1360)
                                          posobj = poss.pop(posobj) if poss.length > 0
                                       result = true
                                       result = @nez$Tagging()
                                       if(result is false)
                                          @currPos = pos1360
                                          while(poss.length > posl1360)
                                             posobj = poss.pop(posobj) if poss.length > 0
                                          result = true
                                          result = @nez$String()
                                          if(result isnt false)
                                             pos1341 = @currPos
                                             if(/[=]/.test(@input.charAt(@currPos)))
                                                @currPos++
                                                result = true
                                             else
                                                result = false
                                             if(result isnt false)
                                                result = @nez$_()
                                             @currPos = pos1341
                                             if(result is false)
                                                result = true
                                             else
                                                result = false
                                          if(result is false)
                                             @currPos = pos1360
                                             while(poss.length > posl1360)
                                                posobj = poss.pop(posobj) if poss.length > 0
                                             result = true
                                             result = @nez$Extension()
                                             if(result is false)
                                                @currPos = pos1360
                                                while(poss.length > posl1360)
                                                   posobj = poss.pop(posobj) if poss.length > 0
                                                result = true
                                                result = @nez$NonTerminal()
                                                if(result isnt false)
                                                   pos1358 = @currPos
                                                   pos1357 = @currPos
                                                   posl1357 = poss.length
                                                   result = true
                                                   if(/[=]/.test(@input.charAt(@currPos)))
                                                      @currPos++
                                                      result = true
                                                   else
                                                      result = false
                                                   if(result isnt false)
                                                      result = @nez$_()
                                                   if(result is false)
                                                      @currPos = pos1357
                                                      while(poss.length > posl1357)
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
                                                         @currPos = pos1357
                                                         while(poss.length > posl1357)
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
                                                   @currPos = pos1358
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
            posl1042 = poss.length
            pos1042 = @currPos
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
                  pos1036 = @currPos
                  posl1036 = poss.length
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
                     @currPos = pos1036
                     while(poss.length > posl1036)
                        posobj = poss.pop(posobj) if poss.length > 0
                  result = true
            outs.push result if typeof result isnt "boolean"
         @currPos = pos1042
         while(poss.length > posl1042)
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
      pos1119 = @currPos
      posl1119 = poss.length
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
         @currPos = pos1119
         while(poss.length > posl1119)
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
            @currPos = pos1119
            while(poss.length > posl1119)
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
               @currPos = pos1119
               while(poss.length > posl1119)
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
                  @currPos = pos1119
                  while(poss.length > posl1119)
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
                     @currPos = pos1119
                     while(poss.length > posl1119)
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
                        @currPos = pos1119
                        while(poss.length > posl1119)
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
                           @currPos = pos1119
                           while(poss.length > posl1119)
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
                              @currPos = pos1119
                              while(poss.length > posl1119)
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
                                 @currPos = pos1119
                                 while(poss.length > posl1119)
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
                                    @currPos = pos1119
                                    while(poss.length > posl1119)
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
      pos1226 = @currPos
      posl1226 = poss.length
      result = true
      if(/[0-9]/).test(@input.charAt(@currPos))
         result = true
         @currPos++
      else
         result = false
      if(result is false)
         @currPos = pos1226
         while(poss.length > posl1226)
            posobj = poss.pop(posobj) if poss.length > 0
         result = true
         if(/[A-F]/).test(@input.charAt(@currPos))
            result = true
            @currPos++
         else
            result = false
         if(result is false)
            @currPos = pos1226
            while(poss.length > posl1226)
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
         pos920 = @currPos
         posl920 = poss.length
         if(/[\.]/.test(@input.charAt(@currPos)))
            @currPos++
            result = true
         else
            result = false
         if(result isnt false)
            result = @nez$NAME()
         if(result is false)
            @currPos = pos920
            while(poss.length > posl920)
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
         pos1215 = @currPos
         posl1215 = poss.length
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
            @currPos = pos1215
            while(poss.length > posl1215)
               posobj = poss.pop(posobj) if poss.length > 0
            result = true
            if(/[$]/.test(@input.charAt(@currPos)))
               @currPos++
               result = true
            else
               result = false
            if(result isnt false)
               pos1211 = @currPos
               posl1211 = poss.length
               result = @nez$Label()
               outs.push result if typeof result isnt "boolean"
               if(result is false)
                  @currPos = pos1211
                  while(poss.length > posl1211)
                     posobj = poss.pop(posobj) if poss.length > 0
               result = true
               tag = "LabelNew" if result isnt false
            if(result is false)
               @currPos = pos1215
               while(poss.length > posl1215)
                  posobj = poss.pop(posobj) if poss.length > 0
               result = true
               tag = "New" if result isnt false
         if(result isnt false)
            result = @nez$_()
            if(result isnt false)
               pos1217 = @currPos
               posl1217 = poss.length
               result = @nez$Expression()
               outs.push result if typeof result isnt "boolean"
               if(result is false)
                  @currPos = pos1217
                  while(poss.length > posl1217)
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
            posl1510 = poss.length
            pos1510 = @currPos
            pos1509 = @currPos
            posl1509 = poss.length
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
               @currPos = pos1509
               while(poss.length > posl1509)
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
                  @currPos = pos1509
                  while(poss.length > posl1509)
                     posobj = poss.pop(posobj) if poss.length > 0
                  result = true
                  pos1507 = @currPos
                  if(/[\n\r`]/).test(@input.charAt(@currPos))
                     result = true
                     @currPos++
                  else
                     result = false
                  @currPos = pos1507
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
         @currPos = pos1510
         while(poss.length > posl1510)
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
               posl914 = poss.length
               pos914 = @currPos
               result = @nez$W()
            @currPos = pos914
            while(poss.length > posl914)
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
                     posl1075 = poss.length
                     pos1075 = @currPos
                     result = @nez$S()
                  @currPos = pos1075
                  while(poss.length > posl1075)
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
      pos1456 = @currPos
      posl1456 = poss.length
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
            pos983 = @currPos
            result = @nez$W()
            @currPos = pos983
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
         @currPos = pos1456
         while(poss.length > posl1456)
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
               pos983 = @currPos
               result = @nez$W()
               @currPos = pos983
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
            @currPos = pos1456
            while(poss.length > posl1456)
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
                           pos983 = @currPos
                           result = @nez$W()
                           @currPos = pos983
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
               @currPos = pos1456
               while(poss.length > posl1456)
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
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
                  @currPos = pos1456
                  while(poss.length > posl1456)
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
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
                     @currPos = pos1456
                     while(poss.length > posl1456)
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
                              pos983 = @currPos
                              result = @nez$W()
                              @currPos = pos983
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
                        @currPos = pos1456
                        while(poss.length > posl1456)
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
                                          pos983 = @currPos
                                          result = @nez$W()
                                          @currPos = pos983
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
                           @currPos = pos1456
                           while(poss.length > posl1456)
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
                                          pos983 = @currPos
                                          result = @nez$W()
                                          @currPos = pos983
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
                              @currPos = pos1456
                              while(poss.length > posl1456)
                                 posobj = poss.pop(posobj) if poss.length > 0
                              result = true
                              result = @nez$Identifier()
                              outs.push result if typeof result isnt "boolean"
                              if(result isnt false)
                                 result = @nez$Expression()
                                 outs.push result if typeof result isnt "boolean"
                                 if(result isnt false)
                                    while(result isnt false)
                                       posl1451 = poss.length
                                       pos1451 = @currPos
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
                                    @currPos = pos1451
                                    while(poss.length > posl1451)
                                       posobj = poss.pop(posobj) if poss.length > 0
                                    result = true
                                    tag = "Expand" if result isnt false
                              if(result is false)
                                 @currPos = pos1456
                                 while(poss.length > posl1456)
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
               posl914 = poss.length
               pos914 = @currPos
               result = @nez$W()
            @currPos = pos914
            while(poss.length > posl914)
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
            posl914 = poss.length
            pos914 = @currPos
            result = @nez$W()
         @currPos = pos914
         while(poss.length > posl914)
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
      pos939 = @currPos
      posl939 = poss.length
      result = @nez$Modifiers()
      outs.push result if typeof result isnt "boolean"
      if(result is false)
         @currPos = pos939
         while(poss.length > posl939)
            posobj = poss.pop(posobj) if poss.length > 0
      result = true
      if(result isnt false)
         pos944 = @currPos
         posl944 = poss.length
         result = true
         result = @nez$Identifier()
         outs.push result if typeof result isnt "boolean"
         if(result is false)
            @currPos = pos944
            while(poss.length > posl944)
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
                        posl948 = poss.length
                        pos948 = @currPos
                        result = @nez$OldExample()
                        outs.push result if typeof result isnt "boolean"
                     @currPos = pos948
                     while(poss.length > posl948)
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
         posl1092 = poss.length
         pos1092 = @currPos
         result = @nez$Modifier()
      @currPos = pos1092
      while(poss.length > posl1092)
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
      pos1028 = @currPos
      posl1028 = poss.length
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
                        pos983 = @currPos
                        result = @nez$W()
                        @currPos = pos983
                        if(result is false)
                           result = true
                        else
                           result = false
                        if(result isnt false)
                           result = @nez$_()
      if(result is false)
         @currPos = pos1028
         while(poss.length > posl1028)
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
                           pos983 = @currPos
                           result = @nez$W()
                           @currPos = pos983
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
         pos964 = @currPos
         posl964 = poss.length
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
            @currPos = pos964
            while(poss.length > posl964)
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
                                       posl967 = poss.length
                                       pos967 = @currPos
                                       if(/[\x00-\\^-\xff]/).test(@input.charAt(@currPos))
                                          result = true
                                          @currPos++
                                       else
                                          result = false
                                    @currPos = pos967
                                    while(poss.length > posl967)
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
