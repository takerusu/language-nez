/**
 * @license
 * Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
 * This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
 * The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
 * The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
 * Code distributed by Google as part of the polymer project is also
 * subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
 */
window.PolymerGestures={},function(a){var b=!1,c=document.createElement("meta");if(c.createShadowRoot){var d=c.createShadowRoot(),e=document.createElement("span");d.appendChild(e),c.addEventListener("testpath",function(a){a.path&&(b=a.path[0]===e),a.stopPropagation()});var f=new CustomEvent("testpath",{bubbles:!0});document.head.appendChild(c),e.dispatchEvent(f),c.parentNode.removeChild(c),d=e=null}c=null;var g={shadow:function(a){return a?a.shadowRoot||a.webkitShadowRoot:void 0},canTarget:function(a){return a&&Boolean(a.elementFromPoint)},targetingShadow:function(a){var b=this.shadow(a);return this.canTarget(b)?b:void 0},olderShadow:function(a){var b=a.olderShadowRoot;if(!b){var c=a.querySelector("shadow");c&&(b=c.olderShadowRoot)}return b},allShadows:function(a){for(var b=[],c=this.shadow(a);c;)b.push(c),c=this.olderShadow(c);return b},searchRoot:function(a,b,c){var d,e;return a?(d=a.elementFromPoint(b,c),d?e=this.targetingShadow(d):a!==document&&(e=this.olderShadow(a)),this.searchRoot(e,b,c)||d):void 0},owner:function(a){if(!a)return document;for(var b=a;b.parentNode;)b=b.parentNode;return b.nodeType!=Node.DOCUMENT_NODE&&b.nodeType!=Node.DOCUMENT_FRAGMENT_NODE&&(b=document),b},findTarget:function(a){if(b&&a.path&&a.path.length)return a.path[0];var c=a.clientX,d=a.clientY,e=this.owner(a.target);return e.elementFromPoint(c,d)||(e=document),this.searchRoot(e,c,d)},findTouchAction:function(a){var c;if(b&&a.path&&a.path.length){for(var d=a.path,e=0;e<d.length;e++)if(c=d[e],c.nodeType===Node.ELEMENT_NODE&&c.hasAttribute("touch-action"))return c.getAttribute("touch-action")}else for(c=a.target;c;){if(c.nodeType===Node.ELEMENT_NODE&&c.hasAttribute("touch-action"))return c.getAttribute("touch-action");c=c.parentNode||c.host}return"auto"},LCA:function(a,b){if(a===b)return a;if(a&&!b)return a;if(b&&!a)return b;if(!b&&!a)return document;if(a.contains&&a.contains(b))return a;if(b.contains&&b.contains(a))return b;var c=this.depth(a),d=this.depth(b),e=c-d;for(e>=0?a=this.walk(a,e):b=this.walk(b,-e);a&&b&&a!==b;)a=a.parentNode||a.host,b=b.parentNode||b.host;return a},walk:function(a,b){for(var c=0;a&&b>c;c++)a=a.parentNode||a.host;return a},depth:function(a){for(var b=0;a;)b++,a=a.parentNode||a.host;return b},deepContains:function(a,b){var c=this.LCA(a,b);return c===a},insideNode:function(a,b,c){var d=a.getBoundingClientRect();return d.left<=b&&b<=d.right&&d.top<=c&&c<=d.bottom},path:function(a){var c;if(b&&a.path&&a.path.length)c=a.path;else{c=[];for(var d=this.findTarget(a);d;)c.push(d),d=d.parentNode||d.host}return c}};a.targetFinding=g,a.findTarget=g.findTarget.bind(g),a.deepContains=g.deepContains.bind(g),a.insideNode=g.insideNode}(window.PolymerGestures),function(){function a(a){return"html /deep/ "+b(a)}function b(a){return'[touch-action="'+a+'"]'}function c(a){return"{ -ms-touch-action: "+a+"; touch-action: "+a+";}"}var d=["none","auto","pan-x","pan-y",{rule:"pan-x pan-y",selectors:["pan-x pan-y","pan-y pan-x"]},"manipulation"],e="",f="string"==typeof document.head.style.touchAction,g=!window.ShadowDOMPolyfill&&document.head.createShadowRoot;if(f){d.forEach(function(d){String(d)===d?(e+=b(d)+c(d)+"\n",g&&(e+=a(d)+c(d)+"\n")):(e+=d.selectors.map(b)+c(d.rule)+"\n",g&&(e+=d.selectors.map(a)+c(d.rule)+"\n"))});var h=document.createElement("style");h.textContent=e,document.head.appendChild(h)}}(),function(a){var b=["bubbles","cancelable","view","detail","screenX","screenY","clientX","clientY","ctrlKey","altKey","shiftKey","metaKey","button","relatedTarget","pageX","pageY"],c=[!1,!1,null,null,0,0,0,0,!1,!1,!1,!1,0,null,0,0],d=function(){return function(){}},e={preventTap:d,makeBaseEvent:function(a,b){var c=document.createEvent("Event");return c.initEvent(a,b.bubbles||!1,b.cancelable||!1),c.preventTap=e.preventTap(c),c},makeGestureEvent:function(a,b){b=b||Object.create(null);for(var c,d=this.makeBaseEvent(a,b),e=0,f=Object.keys(b);e<f.length;e++)c=f[e],d[c]=b[c];return d},makePointerEvent:function(a,d){d=d||Object.create(null);for(var e,f=this.makeBaseEvent(a,d),g=0;g<b.length;g++)e=b[g],f[e]=d[e]||c[g];f.buttons=d.buttons||0;var h=0;return h=d.pressure?d.pressure:f.buttons?.5:0,f.x=f.clientX,f.y=f.clientY,f.pointerId=d.pointerId||0,f.width=d.width||0,f.height=d.height||0,f.pressure=h,f.tiltX=d.tiltX||0,f.tiltY=d.tiltY||0,f.pointerType=d.pointerType||"",f.hwTimestamp=d.hwTimestamp||0,f.isPrimary=d.isPrimary||!1,f._source=d._source||"",f}};a.eventFactory=e}(window.PolymerGestures),function(a){function b(){if(c){var a=new Map;return a.pointers=d,a}this.keys=[],this.values=[]}var c=window.Map&&window.Map.prototype.forEach,d=function(){return this.size};b.prototype={set:function(a,b){var c=this.keys.indexOf(a);c>-1?this.values[c]=b:(this.keys.push(a),this.values.push(b))},has:function(a){return this.keys.indexOf(a)>-1},"delete":function(a){var b=this.keys.indexOf(a);b>-1&&(this.keys.splice(b,1),this.values.splice(b,1))},get:function(a){var b=this.keys.indexOf(a);return this.values[b]},clear:function(){this.keys.length=0,this.values.length=0},forEach:function(a,b){this.values.forEach(function(c,d){a.call(b,c,this.keys[d],this)},this)},pointers:function(){return this.keys.length}},a.PointerMap=b}(window.PolymerGestures),function(a){var b,c=["bubbles","cancelable","view","detail","screenX","screenY","clientX","clientY","ctrlKey","altKey","shiftKey","metaKey","button","relatedTarget","buttons","pointerId","width","height","pressure","tiltX","tiltY","pointerType","hwTimestamp","isPrimary","type","target","currentTarget","which","pageX","pageY","timeStamp","preventTap","tapPrevented","_source"],d=[!1,!1,null,null,0,0,0,0,!1,!1,!1,!1,0,null,0,0,0,0,0,0,0,"",0,!1,"",null,null,0,0,0,0,function(){},!1],e="undefined"!=typeof SVGElementInstance,f=a.eventFactory,g={IS_IOS:!1,pointermap:new a.PointerMap,requiredGestures:new a.PointerMap,eventMap:Object.create(null),eventSources:Object.create(null),eventSourceList:[],gestures:[],dependencyMap:{down:{listeners:0,index:-1},up:{listeners:0,index:-1}},gestureQueue:[],registerSource:function(a,b){var c=b,d=c.events;d&&(d.forEach(function(a){c[a]&&(this.eventMap[a]=c[a].bind(c))},this),this.eventSources[a]=c,this.eventSourceList.push(c))},registerGesture:function(a,b){var c=Object.create(null);c.listeners=0,c.index=this.gestures.length;for(var d,e=0;e<b.exposes.length;e++)d=b.exposes[e].toLowerCase(),this.dependencyMap[d]=c;this.gestures.push(b)},register:function(a,b){for(var c,d=this.eventSourceList.length,e=0;d>e&&(c=this.eventSourceList[e]);e++)c.register.call(c,a,b)},unregister:function(a){for(var b,c=this.eventSourceList.length,d=0;c>d&&(b=this.eventSourceList[d]);d++)b.unregister.call(b,a)},down:function(a){this.requiredGestures.set(a.pointerId,b),this.fireEvent("down",a)},move:function(a){a.type="move",this.fillGestureQueue(a)},up:function(a){this.fireEvent("up",a),this.requiredGestures.delete(a.pointerId)},cancel:function(a){a.tapPrevented=!0,this.fireEvent("up",a),this.requiredGestures.delete(a.pointerId)},addGestureDependency:function(a,b){var c=a._pgEvents;if(c)for(var d,e,f,g=Object.keys(c),h=0;h<g.length;h++)f=g[h],c[f]>0&&(d=this.dependencyMap[f],e=d?d.index:-1,b[e]=!0)},eventHandler:function(c){var d=c.type;if("touchstart"===d||"mousedown"===d||"pointerdown"===d||"MSPointerDown"===d)if(c._handledByPG||(b={}),this.IS_IOS){var e=c;if("touchstart"===d){var f=c.changedTouches[0];e={target:c.target,clientX:f.clientX,clientY:f.clientY,path:c.path}}for(var g,h=c.path||a.targetFinding.path(e),i=0;i<h.length;i++)g=h[i],this.addGestureDependency(g,b)}else this.addGestureDependency(c.currentTarget,b);if(!c._handledByPG){var j=this.eventMap&&this.eventMap[d];j&&j(c),c._handledByPG=!0}},listen:function(a,b){for(var c,d=0,e=b.length;e>d&&(c=b[d]);d++)this.addEvent(a,c)},unlisten:function(a,b){for(var c,d=0,e=b.length;e>d&&(c=b[d]);d++)this.removeEvent(a,c)},addEvent:function(a,b){a.addEventListener(b,this.boundHandler)},removeEvent:function(a,b){a.removeEventListener(b,this.boundHandler)},makeEvent:function(a,b){var c=f.makePointerEvent(a,b);return c.preventDefault=b.preventDefault,c.tapPrevented=b.tapPrevented,c._target=c._target||b.target,c},fireEvent:function(a,b){var c=this.makeEvent(a,b);return this.dispatchEvent(c)},cloneEvent:function(a){for(var b,f=Object.create(null),g=0;g<c.length;g++)b=c[g],f[b]=a[b]||d[g],("target"===b||"relatedTarget"===b)&&e&&f[b]instanceof SVGElementInstance&&(f[b]=f[b].correspondingUseElement);return f.preventDefault=function(){a.preventDefault()},f},dispatchEvent:function(a){var b=a._target;if(b){b.dispatchEvent(a);var c=this.cloneEvent(a);c.target=b,this.fillGestureQueue(c)}},gestureTrigger:function(){for(var a,b,c=0;c<this.gestureQueue.length;c++)if(a=this.gestureQueue[c],b=a._requiredGestures)for(var d,e,f=0;f<this.gestures.length;f++)b[f]&&(d=this.gestures[f],e=d[a.type],e&&e.call(d,a));this.gestureQueue.length=0},fillGestureQueue:function(a){this.gestureQueue.length||requestAnimationFrame(this.boundGestureTrigger),a._requiredGestures=this.requiredGestures.get(a.pointerId),this.gestureQueue.push(a)}};g.boundHandler=g.eventHandler.bind(g),g.boundGestureTrigger=g.gestureTrigger.bind(g),a.dispatcher=g,a.activateGesture=function(a,b){var c=b.toLowerCase(),d=g.dependencyMap[c];if(d){var e=g.gestures[d.index];if(a._pgListeners||(g.register(a),a._pgListeners=0),e){var f,h=e.defaultActions&&e.defaultActions[c];switch(a.nodeType){case Node.ELEMENT_NODE:f=a;break;case Node.DOCUMENT_FRAGMENT_NODE:f=a.host;break;default:f=null}h&&f&&!f.hasAttribute("touch-action")&&f.setAttribute("touch-action",h)}a._pgEvents||(a._pgEvents={}),a._pgEvents[c]=(a._pgEvents[c]||0)+1,a._pgListeners++}return Boolean(d)},a.addEventListener=function(b,c,d,e){d&&(a.activateGesture(b,c),b.addEventListener(c,d,e))},a.deactivateGesture=function(a,b){var c=b.toLowerCase(),d=g.dependencyMap[c];return d&&(a._pgListeners>0&&a._pgListeners--,0===a._pgListeners&&g.unregister(a),a._pgEvents&&(a._pgEvents[c]>0?a._pgEvents[c]--:a._pgEvents[c]=0)),Boolean(d)},a.removeEventListener=function(b,c,d,e){d&&(a.deactivateGesture(b,c),b.removeEventListener(c,d,e))}}(window.PolymerGestures),function(a){var b=a.dispatcher,c=b.pointermap,d=25,e=[0,1,4,2],f=0,g=!1;try{g=1===new MouseEvent("test",{buttons:1}).buttons}catch(h){}var i={POINTER_ID:1,POINTER_TYPE:"mouse",events:["mousedown","mousemove","mouseup"],exposes:["down","up","move"],register:function(a){b.listen(a,this.events)},unregister:function(a){a!==document&&b.unlisten(a,this.events)},lastTouches:[],isEventSimulatedFromTouch:function(a){for(var b,c=this.lastTouches,e=a.clientX,f=a.clientY,g=0,h=c.length;h>g&&(b=c[g]);g++){var i=Math.abs(e-b.x),j=Math.abs(f-b.y);if(d>=i&&d>=j)return!0}},prepareEvent:function(a){var c=b.cloneEvent(a);if(c.pointerId=this.POINTER_ID,c.isPrimary=!0,c.pointerType=this.POINTER_TYPE,c._source="mouse",!g){var d=a.type,h=e[a.which]||0;"mousedown"===d?f|=h:"mouseup"===d&&(f&=~h),c.buttons=f}return c},mousedown:function(d){if(!this.isEventSimulatedFromTouch(d)){var e=(c.has(this.POINTER_ID),this.prepareEvent(d));e.target=a.findTarget(d),c.set(this.POINTER_ID,e.target),b.down(e)}},mousemove:function(a){if(!this.isEventSimulatedFromTouch(a)){var d=c.get(this.POINTER_ID);if(d){var e=this.prepareEvent(a);e.target=d,0===(g?e.buttons:e.which)?(g||(f=e.buttons=0),b.cancel(e),this.cleanupMouse(e.buttons)):b.move(e)}}},mouseup:function(d){if(!this.isEventSimulatedFromTouch(d)){var e=this.prepareEvent(d);e.relatedTarget=a.findTarget(d),e.target=c.get(this.POINTER_ID),b.up(e),this.cleanupMouse(e.buttons)}},cleanupMouse:function(a){0===a&&c.delete(this.POINTER_ID)}};a.mouseEvents=i}(window.PolymerGestures),function(a){var b=a.dispatcher,c=(a.targetFinding.allShadows.bind(a.targetFinding),b.pointermap),d=(Array.prototype.map.call.bind(Array.prototype.map),2500),e=25,f=200,g=20,h=!1,i={IS_IOS:!1,events:["touchstart","touchmove","touchend","touchcancel"],exposes:["down","up","move"],register:function(a,c){(this.IS_IOS?c:!c)&&b.listen(a,this.events)},unregister:function(a){this.IS_IOS||b.unlisten(a,this.events)},scrollTypes:{EMITTER:"none",XSCROLLER:"pan-x",YSCROLLER:"pan-y"},touchActionToScrollType:function(a){var b=a,c=this.scrollTypes;return b===c.EMITTER?"none":b===c.XSCROLLER?"X":b===c.YSCROLLER?"Y":"XY"},POINTER_TYPE:"touch",firstTouch:null,isPrimaryTouch:function(a){return this.firstTouch===a.identifier},setPrimaryTouch:function(a){(0===c.pointers()||1===c.pointers()&&c.has(1))&&(this.firstTouch=a.identifier,this.firstXY={X:a.clientX,Y:a.clientY},this.firstTarget=a.target,this.scrolling=null,this.cancelResetClickCount())},removePrimaryPointer:function(a){a.isPrimary&&(this.firstTouch=null,this.firstXY=null,this.resetClickCount())},clickCount:0,resetId:null,resetClickCount:function(){var a=function(){this.clickCount=0,this.resetId=null}.bind(this);this.resetId=setTimeout(a,f)},cancelResetClickCount:function(){this.resetId&&clearTimeout(this.resetId)},typeToButtons:function(a){var b=0;return("touchstart"===a||"touchmove"===a)&&(b=1),b},findTarget:function(b,d){if("touchstart"===this.currentTouchEvent.type){if(this.isPrimaryTouch(b)){var e={clientX:b.clientX,clientY:b.clientY,path:this.currentTouchEvent.path,target:this.currentTouchEvent.target};return a.findTarget(e)}return a.findTarget(b)}return c.get(d)},touchToPointer:function(a){var c=this.currentTouchEvent,d=b.cloneEvent(a),e=d.pointerId=a.identifier+2;d.target=this.findTarget(a,e),d.bubbles=!0,d.cancelable=!0,d.detail=this.clickCount,d.buttons=this.typeToButtons(c.type),d.width=a.webkitRadiusX||a.radiusX||0,d.height=a.webkitRadiusY||a.radiusY||0,d.pressure=a.webkitForce||a.force||.5,d.isPrimary=this.isPrimaryTouch(a),d.pointerType=this.POINTER_TYPE,d._source="touch";var f=this;return d.preventDefault=function(){f.scrolling=!1,f.firstXY=null,c.preventDefault()},d},processTouches:function(a,b){var d=a.changedTouches;this.currentTouchEvent=a;for(var e,f,g=0;g<d.length;g++)e=d[g],f=this.touchToPointer(e),"touchstart"===a.type&&c.set(f.pointerId,f.target),c.has(f.pointerId)&&b.call(this,f),("touchend"===a.type||a._cancel)&&this.cleanUpPointer(f)},shouldScroll:function(b){if(this.firstXY){var c,d=a.targetFinding.findTouchAction(b),e=this.touchActionToScrollType(d);if("none"===e)c=!1;else if("XY"===e)c=!0;else{var f=b.changedTouches[0],g=e,h="Y"===e?"X":"Y",i=Math.abs(f["client"+g]-this.firstXY[g]),j=Math.abs(f["client"+h]-this.firstXY[h]);c=i>=j}return c}},findTouch:function(a,b){for(var c,d=0,e=a.length;e>d&&(c=a[d]);d++)if(c.identifier===b)return!0},vacuumTouches:function(a){var b=a.touches;if(c.pointers()>=b.length){var d=[];c.forEach(function(a,c){if(1!==c&&!this.findTouch(b,c-2)){var e=a;d.push(e)}},this),d.forEach(function(a){this.cancel(a),c.delete(a.pointerId)})}},touchstart:function(a){this.vacuumTouches(a),this.setPrimaryTouch(a.changedTouches[0]),this.dedupSynthMouse(a),this.scrolling||(this.clickCount++,this.processTouches(a,this.down))},down:function(a){b.down(a)},touchmove:function(a){if(h)a.cancelable&&this.processTouches(a,this.move);else if(this.scrolling){if(this.firstXY){var b=a.changedTouches[0],c=b.clientX-this.firstXY.X,d=b.clientY-this.firstXY.Y,e=Math.sqrt(c*c+d*d);e>=g&&(this.touchcancel(a),this.scrolling=!0,this.firstXY=null)}}else null===this.scrolling&&this.shouldScroll(a)?this.scrolling=!0:(this.scrolling=!1,a.preventDefault(),this.processTouches(a,this.move))},move:function(a){b.move(a)},touchend:function(a){this.dedupSynthMouse(a),this.processTouches(a,this.up)},up:function(c){c.relatedTarget=a.findTarget(c),b.up(c)},cancel:function(a){b.cancel(a)},touchcancel:function(a){a._cancel=!0,this.processTouches(a,this.cancel)},cleanUpPointer:function(a){c["delete"](a.pointerId),this.removePrimaryPointer(a)},dedupSynthMouse:function(b){var c=a.mouseEvents.lastTouches,e=b.changedTouches[0];if(this.isPrimaryTouch(e)){var f={x:e.clientX,y:e.clientY};c.push(f);var g=function(a,b){var c=a.indexOf(b);c>-1&&a.splice(c,1)}.bind(null,c,f);setTimeout(g,d)}}},j=Event.prototype.stopImmediatePropagation||Event.prototype.stopPropagation;document.addEventListener("click",function(b){var c=b.clientX,d=b.clientY,f=function(a){var b=Math.abs(c-a.x),f=Math.abs(d-a.y);return e>=b&&e>=f},g=a.mouseEvents.lastTouches.some(f);g&&b.target!==i.firstTarget&&(b.preventDefault(),j.call(b))},!0),a.touchEvents=i}(window.PolymerGestures),function(a){var b=a.dispatcher,c=b.pointermap,d=window.MSPointerEvent&&"number"==typeof window.MSPointerEvent.MSPOINTER_TYPE_MOUSE,e={events:["MSPointerDown","MSPointerMove","MSPointerUp","MSPointerCancel"],register:function(a){b.listen(a,this.events)},unregister:function(a){a!==document&&b.unlisten(a,this.events)},POINTER_TYPES:["","unavailable","touch","pen","mouse"],prepareEvent:function(a){var c=a;return c=b.cloneEvent(a),d&&(c.pointerType=this.POINTER_TYPES[a.pointerType]),c._source="ms",c},cleanup:function(a){c["delete"](a)},MSPointerDown:function(d){var e=this.prepareEvent(d);e.target=a.findTarget(d),c.set(d.pointerId,e.target),b.down(e)},MSPointerMove:function(a){var d=c.get(a.pointerId);if(d){var e=this.prepareEvent(a);e.target=d,b.move(e)}},MSPointerUp:function(d){var e=this.prepareEvent(d);e.relatedTarget=a.findTarget(d),e.target=c.get(e.pointerId),b.up(e),this.cleanup(d.pointerId)},MSPointerCancel:function(d){var e=this.prepareEvent(d);e.relatedTarget=a.findTarget(d),e.target=c.get(e.pointerId),b.cancel(e),this.cleanup(d.pointerId)}};a.msEvents=e}(window.PolymerGestures),function(a){var b=a.dispatcher,c=b.pointermap,d={events:["pointerdown","pointermove","pointerup","pointercancel"],prepareEvent:function(a){var c=b.cloneEvent(a);return c._source="pointer",c},register:function(a){b.listen(a,this.events)},unregister:function(a){a!==document&&b.unlisten(a,this.events)},cleanup:function(a){c["delete"](a)},pointerdown:function(d){var e=this.prepareEvent(d);e.target=a.findTarget(d),c.set(e.pointerId,e.target),b.down(e)},pointermove:function(a){var d=c.get(a.pointerId);if(d){var e=this.prepareEvent(a);e.target=d,b.move(e)}},pointerup:function(d){var e=this.prepareEvent(d);e.relatedTarget=a.findTarget(d),e.target=c.get(e.pointerId),b.up(e),this.cleanup(d.pointerId)},pointercancel:function(d){var e=this.prepareEvent(d);e.relatedTarget=a.findTarget(d),e.target=c.get(e.pointerId),b.cancel(e),this.cleanup(d.pointerId)}};a.pointerEvents=d}(window.PolymerGestures),function(a){var b=a.dispatcher,c=window.navigator;window.PointerEvent?b.registerSource("pointer",a.pointerEvents):c.msPointerEnabled?b.registerSource("ms",a.msEvents):(b.registerSource("mouse",a.mouseEvents),void 0!==window.ontouchstart&&b.registerSource("touch",a.touchEvents));var d=navigator.userAgent,e=d.match(/iPad|iPhone|iPod/)&&"ontouchstart"in window;b.IS_IOS=e,a.touchEvents.IS_IOS=e,b.register(document,!0)}(window.PolymerGestures),function(a){var b=a.dispatcher,c=a.eventFactory,d=new a.PointerMap,e={events:["down","move","up"],exposes:["trackstart","track","trackx","tracky","trackend"],defaultActions:{track:"none",trackx:"pan-y",tracky:"pan-x"},WIGGLE_THRESHOLD:4,clampDir:function(a){return a>0?1:-1},calcPositionDelta:function(a,b){var c=0,d=0;return a&&b&&(c=b.pageX-a.pageX,d=b.pageY-a.pageY),{x:c,y:d}},fireTrack:function(a,b,d){var e=d,f=this.calcPositionDelta(e.downEvent,b),g=this.calcPositionDelta(e.lastMoveEvent,b);if(g.x)e.xDirection=this.clampDir(g.x);else if("trackx"===a)return;if(g.y)e.yDirection=this.clampDir(g.y);else if("tracky"===a)return;var h={bubbles:!0,cancelable:!0,trackInfo:e.trackInfo,relatedTarget:b.relatedTarget,pointerType:b.pointerType,pointerId:b.pointerId,_source:"track"};"tracky"!==a&&(h.x=b.x,h.dx=f.x,h.ddx=g.x,h.clientX=b.clientX,h.pageX=b.pageX,h.screenX=b.screenX,h.xDirection=e.xDirection),"trackx"!==a&&(h.dy=f.y,h.ddy=g.y,h.y=b.y,h.clientY=b.clientY,h.pageY=b.pageY,h.screenY=b.screenY,h.yDirection=e.yDirection);var i=c.makeGestureEvent(a,h);e.downTarget.dispatchEvent(i)},down:function(a){if(a.isPrimary&&("mouse"===a.pointerType?1===a.buttons:!0)){var b={downEvent:a,downTarget:a.target,trackInfo:{},lastMoveEvent:null,xDirection:0,yDirection:0,tracking:!1};d.set(a.pointerId,b)}},move:function(a){var b=d.get(a.pointerId);if(b){if(!b.tracking){var c=this.calcPositionDelta(b.downEvent,a),e=c.x*c.x+c.y*c.y;e>this.WIGGLE_THRESHOLD&&(b.tracking=!0,b.lastMoveEvent=b.downEvent,this.fireTrack("trackstart",a,b))}b.tracking&&(this.fireTrack("track",a,b),this.fireTrack("trackx",a,b),this.fireTrack("tracky",a,b)),b.lastMoveEvent=a}},up:function(a){var b=d.get(a.pointerId);b&&(b.tracking&&this.fireTrack("trackend",a,b),d.delete(a.pointerId))}};b.registerGesture("track",e)}(window.PolymerGestures),function(a){var b=a.dispatcher,c=a.eventFactory,d={HOLD_DELAY:200,WIGGLE_THRESHOLD:16,events:["down","move","up"],exposes:["hold","holdpulse","release"],heldPointer:null,holdJob:null,pulse:function(){var a=Date.now()-this.heldPointer.timeStamp,b=this.held?"holdpulse":"hold";this.fireHold(b,a),this.held=!0},cancel:function(){clearInterval(this.holdJob),this.held&&this.fireHold("release"),this.held=!1,this.heldPointer=null,this.target=null,this.holdJob=null},down:function(a){a.isPrimary&&!this.heldPointer&&(this.heldPointer=a,this.target=a.target,this.holdJob=setInterval(this.pulse.bind(this),this.HOLD_DELAY))},up:function(a){this.heldPointer&&this.heldPointer.pointerId===a.pointerId&&this.cancel()},move:function(a){if(this.heldPointer&&this.heldPointer.pointerId===a.pointerId){var b=a.clientX-this.heldPointer.clientX,c=a.clientY-this.heldPointer.clientY;b*b+c*c>this.WIGGLE_THRESHOLD&&this.cancel()}},fireHold:function(a,b){var d={bubbles:!0,cancelable:!0,pointerType:this.heldPointer.pointerType,pointerId:this.heldPointer.pointerId,x:this.heldPointer.clientX,y:this.heldPointer.clientY,_source:"hold"};b&&(d.holdTime=b);var e=c.makeGestureEvent(a,d);this.target.dispatchEvent(e)}};b.registerGesture("hold",d)}(window.PolymerGestures),function(a){var b=a.dispatcher,c=a.eventFactory,d=new a.PointerMap,e={events:["down","up"],exposes:["tap"],down:function(a){a.isPrimary&&!a.tapPrevented&&d.set(a.pointerId,{target:a.target,buttons:a.buttons,x:a.clientX,y:a.clientY})},shouldTap:function(a,b){var c=!0;return"mouse"===a.pointerType&&(c=1^a.buttons&&1&b.buttons),c&&!a.tapPrevented},up:function(b){var e=d.get(b.pointerId);if(e&&this.shouldTap(b,e)){var f=a.targetFinding.LCA(e.target,b.relatedTarget);if(f){var g=c.makeGestureEvent("tap",{bubbles:!0,cancelable:!0,x:b.clientX,y:b.clientY,detail:b.detail,pointerType:b.pointerType,pointerId:b.pointerId,altKey:b.altKey,ctrlKey:b.ctrlKey,metaKey:b.metaKey,shiftKey:b.shiftKey,_source:"tap"});f.dispatchEvent(g)}}d.delete(b.pointerId)}};c.preventTap=function(a){return function(){a.tapPrevented=!0,d.delete(a.pointerId)}},b.registerGesture("tap",e)}(window.PolymerGestures),function(a){var b=a.dispatcher,c=a.eventFactory,d=new a.PointerMap,e=180/Math.PI,f={events:["down","up","move","cancel"],exposes:["pinch","rotate"],defaultActions:{pinch:"none",rotate:"none"},reference:{},down:function(b){if(d.set(b.pointerId,b),2==d.pointers()){var c=this.calcChord(),e=this.calcAngle(c);this.reference={angle:e,diameter:c.diameter,target:a.targetFinding.LCA(c.a.target,c.b.target)}}},up:function(a){var b=d.get(a.pointerId);b&&d.delete(a.pointerId)},move:function(a){d.has(a.pointerId)&&(d.set(a.pointerId,a),d.pointers()>1&&this.calcPinchRotate())},cancel:function(a){this.up(a)},firePinch:function(a,b){var d=a/this.reference.diameter,e=c.makeGestureEvent("pinch",{bubbles:!0,cancelable:!0,scale:d,centerX:b.center.x,centerY:b.center.y,_source:"pinch"});this.reference.target.dispatchEvent(e)},fireRotate:function(a,b){var d=Math.round((a-this.reference.angle)%360),e=c.makeGestureEvent("rotate",{bubbles:!0,cancelable:!0,angle:d,centerX:b.center.x,centerY:b.center.y,_source:"pinch"});this.reference.target.dispatchEvent(e)},calcPinchRotate:function(){var a=this.calcChord(),b=a.diameter,c=this.calcAngle(a);b!=this.reference.diameter&&this.firePinch(b,a),c!=this.reference.angle&&this.fireRotate(c,a)},calcChord:function(){var a=[];d.forEach(function(b){a.push(b)});for(var b,c,e,f=0,g={a:a[0],b:a[1]},h=0;h<a.length;h++)for(var i=a[h],j=h+1;j<a.length;j++){var k=a[j];b=Math.abs(i.clientX-k.clientX),c=Math.abs(i.clientY-k.clientY),e=b+c,e>f&&(f=e,g={a:i,b:k})}return b=Math.abs(g.a.clientX+g.b.clientX)/2,c=Math.abs(g.a.clientY+g.b.clientY)/2,g.center={x:b,y:c},g.diameter=f,g},calcAngle:function(a){var b=a.a.clientX-a.b.clientX,c=a.a.clientY-a.b.clientY;return(360+Math.atan2(c,b)*e)%360}};b.registerGesture("pinch",f)}(window.PolymerGestures);

// Copyright (c) 2013 The Polymer Authors. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//    * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//    * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"undefined"==typeof WeakMap&&!function(){var a=Object.defineProperty,b=Date.now()%1e9,c=function(){this.name="__st"+(1e9*Math.random()>>>0)+(b++ +"__")};c.prototype={set:function(b,c){var d=b[this.name];d&&d[0]===b?d[1]=c:a(b,this.name,{value:[b,c],writable:!0})},get:function(a){var b;return(b=a[this.name])&&b[0]===a?b[1]:void 0},"delete":function(a){this.set(a,void 0)}},window.WeakMap=c}(),function(a){a=a||{},a.external=a.external||{};var b={shadow:function(a){return a?a.shadowRoot||a.webkitShadowRoot:void 0},canTarget:function(a){return a&&Boolean(a.elementFromPoint)},targetingShadow:function(a){var b=this.shadow(a);return this.canTarget(b)?b:void 0},olderShadow:function(a){var b=a.olderShadowRoot;if(!b){var c=a.querySelector("shadow");c&&(b=c.olderShadowRoot)}return b},allShadows:function(a){for(var b=[],c=this.shadow(a);c;)b.push(c),c=this.olderShadow(c);return b},searchRoot:function(a,b,c){if(a){var d,e,f=a.elementFromPoint(b,c);for(e=this.targetingShadow(f);e;){if(d=e.elementFromPoint(b,c)){var g=this.targetingShadow(d);return this.searchRoot(g,b,c)||d}e=this.olderShadow(e)}return f}},owner:function(a){for(var b=a;b.parentNode;)b=b.parentNode;return b},findTarget:function(a){var b=a.clientX,c=a.clientY,d=this.owner(a.target);return d.elementFromPoint(b,c)||(d=document),this.searchRoot(d,b,c)}};a.targetFinding=b,a.findTarget=b.findTarget.bind(b),window.PointerEventsPolyfill=a}(window.PointerEventsPolyfill),function(){function a(a){return"body ^^ "+b(a)}function b(a){return'[touch-action="'+a+'"]'}function c(a){return"{ -ms-touch-action: "+a+"; touch-action: "+a+"; touch-action-delay: none; }"}var d=["none","auto","pan-x","pan-y",{rule:"pan-x pan-y",selectors:["pan-x pan-y","pan-y pan-x"]}],e="";d.forEach(function(d){String(d)===d?(e+=b(d)+c(d)+"\n",e+=a(d)+c(d)+"\n"):(e+=d.selectors.map(b)+c(d.rule)+"\n",e+=d.selectors.map(a)+c(d.rule)+"\n")});var f=document.createElement("style");f.textContent=e,document.head.appendChild(f)}(),function(a){function b(a,e){e=e||{};var f=e.buttons;if(void 0===f)switch(e.which){case 1:f=1;break;case 2:f=4;break;case 3:f=2;break;default:f=0}var i;if(c)i=new MouseEvent(a,e);else{i=document.createEvent("MouseEvent");for(var j,k={},l=0;l<g.length;l++)j=g[l],k[j]=e[j]||h[l];i.initMouseEvent(a,k.bubbles,k.cancelable,k.view,k.detail,k.screenX,k.screenY,k.clientX,k.clientY,k.ctrlKey,k.altKey,k.shiftKey,k.metaKey,k.button,k.relatedTarget)}i.__proto__=b.prototype,d||Object.defineProperty(i,"buttons",{get:function(){return f},enumerable:!0});var m=0;return m=e.pressure?e.pressure:f?.5:0,Object.defineProperties(i,{pointerId:{value:e.pointerId||0,enumerable:!0},width:{value:e.width||0,enumerable:!0},height:{value:e.height||0,enumerable:!0},pressure:{value:m,enumerable:!0},tiltX:{value:e.tiltX||0,enumerable:!0},tiltY:{value:e.tiltY||0,enumerable:!0},pointerType:{value:e.pointerType||"",enumerable:!0},hwTimestamp:{value:e.hwTimestamp||0,enumerable:!0},isPrimary:{value:e.isPrimary||!1,enumerable:!0}}),i}var c=!1,d=!1;try{var e=new MouseEvent("click",{buttons:1});c=!0,d=1===e.buttons}catch(f){}var g=["bubbles","cancelable","view","detail","screenX","screenY","clientX","clientY","ctrlKey","altKey","shiftKey","metaKey","button","relatedTarget"],h=[!1,!1,null,null,0,0,0,0,!1,!1,!1,!1,0,null];b.prototype=Object.create(MouseEvent.prototype),a.PointerEvent||(a.PointerEvent=b)}(window),function(a){function b(){if(c){var a=new Map;return a.pointers=d,a}this.keys=[],this.values=[]}var c=window.Map&&window.Map.prototype.forEach,d=function(){return this.size};b.prototype={set:function(a,b){var c=this.keys.indexOf(a);c>-1?this.values[c]=b:(this.keys.push(a),this.values.push(b))},has:function(a){return this.keys.indexOf(a)>-1},"delete":function(a){var b=this.keys.indexOf(a);b>-1&&(this.keys.splice(b,1),this.values.splice(b,1))},get:function(a){var b=this.keys.indexOf(a);return this.values[b]},clear:function(){this.keys.length=0,this.values.length=0},forEach:function(a,b){this.values.forEach(function(c,d){a.call(b,c,this.keys[d],this)},this)},pointers:function(){return this.keys.length}},a.PointerMap=b}(window.PointerEventsPolyfill),function(a){var b=["bubbles","cancelable","view","detail","screenX","screenY","clientX","clientY","ctrlKey","altKey","shiftKey","metaKey","button","relatedTarget","buttons","pointerId","width","height","pressure","tiltX","tiltY","pointerType","hwTimestamp","isPrimary","type","target","currentTarget","which"],c=[!1,!1,null,null,0,0,0,0,!1,!1,!1,!1,0,null,void 0,0,0,0,0,0,0,"",0,!1,"",null,null,0],d={targets:new WeakMap,handledEvents:new WeakMap,pointermap:new a.PointerMap,eventMap:{},eventSources:{},eventSourceList:[],registerSource:function(a,b){var c=b,d=c.events;d&&(d.forEach(function(a){c[a]&&(this.eventMap[a]=c[a].bind(c))},this),this.eventSources[a]=c,this.eventSourceList.push(c))},register:function(a){for(var b,c=this.eventSourceList.length,d=0;c>d&&(b=this.eventSourceList[d]);d++)b.register.call(b,a)},unregister:function(a){for(var b,c=this.eventSourceList.length,d=0;c>d&&(b=this.eventSourceList[d]);d++)b.unregister.call(b,a)},contains:a.external.contains||function(a,b){return a.contains(b)},down:function(a){this.fireEvent("pointerdown",a)},move:function(a){this.fireEvent("pointermove",a)},up:function(a){this.fireEvent("pointerup",a)},enter:function(a){a.bubbles=!1,this.fireEvent("pointerenter",a)},leave:function(a){a.bubbles=!1,this.fireEvent("pointerleave",a)},over:function(a){a.bubbles=!0,this.fireEvent("pointerover",a)},out:function(a){a.bubbles=!0,this.fireEvent("pointerout",a)},cancel:function(a){this.fireEvent("pointercancel",a)},leaveOut:function(a){this.contains(a.target,a.relatedTarget)||this.leave(a),this.out(a)},enterOver:function(a){this.contains(a.target,a.relatedTarget)||this.enter(a),this.over(a)},eventHandler:function(a){if(!this.handledEvents.get(a)){var b=a.type,c=this.eventMap&&this.eventMap[b];c&&c(a),this.handledEvents.set(a,!0)}},listen:function(a,b){b.forEach(function(b){this.addEvent(a,b)},this)},unlisten:function(a,b){b.forEach(function(b){this.removeEvent(a,b)},this)},addEvent:a.external.addEvent||function(a,b){a.addEventListener(b,this.boundHandler)},removeEvent:a.external.removeEvent||function(a,b){a.removeEventListener(b,this.boundHandler)},makeEvent:function(a,b){this.captureInfo&&(b.relatedTarget=null);var c=new PointerEvent(a,b);return b.preventDefault&&(c.preventDefault=b.preventDefault),this.targets.set(c,this.targets.get(b)||b.target),c},fireEvent:function(a,b){var c=this.makeEvent(a,b);return this.dispatchEvent(c)},cloneEvent:function(a){for(var d,e={},f=0;f<b.length;f++)d=b[f],e[d]=a[d]||c[f];return a.preventDefault&&(e.preventDefault=function(){a.preventDefault()}),e},getTarget:function(a){return this.captureInfo&&this.captureInfo.id===a.pointerId?this.captureInfo.target:this.targets.get(a)},setCapture:function(a,b){this.captureInfo&&this.releaseCapture(this.captureInfo.id),this.captureInfo={id:a,target:b};var c=new PointerEvent("gotpointercapture",{bubbles:!0});this.implicitRelease=this.releaseCapture.bind(this,a),document.addEventListener("pointerup",this.implicitRelease),document.addEventListener("pointercancel",this.implicitRelease),this.targets.set(c,b),this.asyncDispatchEvent(c)},releaseCapture:function(a){if(this.captureInfo&&this.captureInfo.id===a){var b=new PointerEvent("lostpointercapture",{bubbles:!0}),c=this.captureInfo.target;this.captureInfo=null,document.removeEventListener("pointerup",this.implicitRelease),document.removeEventListener("pointercancel",this.implicitRelease),this.targets.set(b,c),this.asyncDispatchEvent(b)}},dispatchEvent:a.external.dispatchEvent||function(a){var b=this.getTarget(a);return b?b.dispatchEvent(a):void 0},asyncDispatchEvent:function(a){setTimeout(this.dispatchEvent.bind(this,a),0)}};d.boundHandler=d.eventHandler.bind(d),a.dispatcher=d,a.register=d.register.bind(d),a.unregister=d.unregister.bind(d)}(window.PointerEventsPolyfill),function(a){function b(a,b,c,d){this.addCallback=a.bind(d),this.removeCallback=b.bind(d),this.changedCallback=c.bind(d),g&&(this.observer=new g(this.mutationWatcher.bind(this)))}var c=Array.prototype.forEach.call.bind(Array.prototype.forEach),d=Array.prototype.map.call.bind(Array.prototype.map),e=Array.prototype.slice.call.bind(Array.prototype.slice),f=Array.prototype.filter.call.bind(Array.prototype.filter),g=window.MutationObserver||window.WebKitMutationObserver,h="[touch-action]",i={subtree:!0,childList:!0,attributes:!0,attributeOldValue:!0,attributeFilter:["touch-action"]};b.prototype={watchSubtree:function(b){a.targetFinding.canTarget(b)&&this.observer.observe(b,i)},enableOnSubtree:function(a){this.watchSubtree(a),a===document&&"complete"!==document.readyState?this.installOnLoad():this.installNewSubtree(a)},installNewSubtree:function(a){c(this.findElements(a),this.addElement,this)},findElements:function(a){return a.querySelectorAll?a.querySelectorAll(h):[]},removeElement:function(a){this.removeCallback(a)},addElement:function(a){this.addCallback(a)},elementChanged:function(a,b){this.changedCallback(a,b)},concatLists:function(a,b){return a.concat(e(b))},installOnLoad:function(){document.addEventListener("DOMContentLoaded",this.installNewSubtree.bind(this,document))},isElement:function(a){return a.nodeType===Node.ELEMENT_NODE},flattenMutationTree:function(a){var b=d(a,this.findElements,this);return b.push(f(a,this.isElement)),b.reduce(this.concatLists,[])},mutationWatcher:function(a){a.forEach(this.mutationHandler,this)},mutationHandler:function(a){if("childList"===a.type){var b=this.flattenMutationTree(a.addedNodes);b.forEach(this.addElement,this);var c=this.flattenMutationTree(a.removedNodes);c.forEach(this.removeElement,this)}else"attributes"===a.type&&this.elementChanged(a.target,a.oldValue)}},g||(b.prototype.watchSubtree=function(){console.warn("PointerEventsPolyfill: MutationObservers not found, touch-action will not be dynamically detected")}),a.Installer=b}(window.PointerEventsPolyfill),function(a){var b=a.dispatcher,c=b.pointermap,d=25,e={POINTER_ID:1,POINTER_TYPE:"mouse",events:["mousedown","mousemove","mouseup","mouseover","mouseout"],register:function(a){b.listen(a,this.events)},unregister:function(a){b.unlisten(a,this.events)},lastTouches:[],isEventSimulatedFromTouch:function(a){for(var b,c=this.lastTouches,e=a.clientX,f=a.clientY,g=0,h=c.length;h>g&&(b=c[g]);g++){var i=Math.abs(e-b.x),j=Math.abs(f-b.y);if(d>=i&&d>=j)return!0}},prepareEvent:function(a){var c=b.cloneEvent(a),d=c.preventDefault;return c.preventDefault=function(){a.preventDefault(),d()},c.pointerId=this.POINTER_ID,c.isPrimary=!0,c.pointerType=this.POINTER_TYPE,c},mousedown:function(a){if(!this.isEventSimulatedFromTouch(a)){var d=c.has(this.POINTER_ID);d&&this.cancel(a);var e=this.prepareEvent(a);c.set(this.POINTER_ID,a),b.down(e)}},mousemove:function(a){if(!this.isEventSimulatedFromTouch(a)){var c=this.prepareEvent(a);b.move(c)}},mouseup:function(a){if(!this.isEventSimulatedFromTouch(a)){var d=c.get(this.POINTER_ID);if(d&&d.button===a.button){var e=this.prepareEvent(a);b.up(e),this.cleanupMouse()}}},mouseover:function(a){if(!this.isEventSimulatedFromTouch(a)){var c=this.prepareEvent(a);b.enterOver(c)}},mouseout:function(a){if(!this.isEventSimulatedFromTouch(a)){var c=this.prepareEvent(a);b.leaveOut(c)}},cancel:function(a){var c=this.prepareEvent(a);b.cancel(c),this.cleanupMouse()},cleanupMouse:function(){c["delete"](this.POINTER_ID)}};a.mouseEvents=e}(window.PointerEventsPolyfill),function(a){var b,c=a.dispatcher,d=a.findTarget,e=a.targetFinding.allShadows.bind(a.targetFinding),f=c.pointermap,g=Array.prototype.map.call.bind(Array.prototype.map),h=2500,i=200,j="touch-action",k="string"==typeof document.head.style.touchAction,l={scrollType:new WeakMap,events:["touchstart","touchmove","touchend","touchcancel"],register:function(a){k?c.listen(a,this.events):b.enableOnSubtree(a)},unregister:function(a){k&&c.unlisten(a,this.events)},elementAdded:function(a){var b=a.getAttribute(j),d=this.touchActionToScrollType(b);d&&(this.scrollType.set(a,d),c.listen(a,this.events),e(a).forEach(function(a){this.scrollType.set(a,d),c.listen(a,this.events)},this))},elementRemoved:function(a){this.scrollType["delete"](a),c.unlisten(a,this.events),e(a).forEach(function(a){this.scrollType["delete"](a),c.unlisten(a,this.events)},this)},elementChanged:function(a,b){var c=a.getAttribute(j),d=this.touchActionToScrollType(c),f=this.touchActionToScrollType(b);d&&f?(this.scrollType.set(a,d),e(a).forEach(function(a){this.scrollType.set(a,d)},this)):f?this.elementRemoved(a):d&&this.elementAdded(a)},scrollTypes:{EMITTER:"none",XSCROLLER:"pan-x",YSCROLLER:"pan-y",SCROLLER:/^(?:pan-x pan-y)|(?:pan-y pan-x)|auto$/},touchActionToScrollType:function(a){var b=a,c=this.scrollTypes;return"none"===b?"none":b===c.XSCROLLER?"X":b===c.YSCROLLER?"Y":c.SCROLLER.exec(b)?"XY":void 0},POINTER_TYPE:"touch",firstTouch:null,isPrimaryTouch:function(a){return this.firstTouch===a.identifier},setPrimaryTouch:function(a){(0===f.pointers()||1===f.pointers()&&f.has(1))&&(this.firstTouch=a.identifier,this.firstXY={X:a.clientX,Y:a.clientY},this.scrolling=!1,this.cancelResetClickCount())},removePrimaryPointer:function(a){a.isPrimary&&(this.firstTouch=null,this.firstXY=null,this.resetClickCount())},clickCount:0,resetId:null,resetClickCount:function(){var a=function(){this.clickCount=0,this.resetId=null}.bind(this);this.resetId=setTimeout(a,i)},cancelResetClickCount:function(){this.resetId&&clearTimeout(this.resetId)},touchToPointer:function(a){var b=c.cloneEvent(a);return b.pointerId=a.identifier+2,b.target=d(b),b.bubbles=!0,b.cancelable=!0,b.detail=this.clickCount,b.button=0,b.buttons=1,b.width=a.webkitRadiusX||a.radiusX||0,b.height=a.webkitRadiusY||a.radiusY||0,b.pressure=a.webkitForce||a.force||.5,b.isPrimary=this.isPrimaryTouch(a),b.pointerType=this.POINTER_TYPE,b},processTouches:function(a,b){var c=a.changedTouches,d=g(c,this.touchToPointer,this);d.forEach(function(b){b.preventDefault=function(){this.scrolling=!1,this.firstXY=null,a.preventDefault()}},this),d.forEach(b,this)},shouldScroll:function(a){if(this.firstXY){var b,c=this.scrollType.get(a.currentTarget);if("none"===c)b=!1;else if("XY"===c)b=!0;else{var d=a.changedTouches[0],e=c,f="Y"===c?"X":"Y",g=Math.abs(d["client"+e]-this.firstXY[e]),h=Math.abs(d["client"+f]-this.firstXY[f]);b=g>=h}return this.firstXY=null,b}},findTouch:function(a,b){for(var c,d=0,e=a.length;e>d&&(c=a[d]);d++)if(c.identifier===b)return!0},vacuumTouches:function(a){var b=a.touches;if(f.pointers()>=b.length){var c=[];f.forEach(function(a,d){if(1!==d&&!this.findTouch(b,d-2)){var e=a.out;c.push(this.touchToPointer(e))}},this),c.forEach(this.cancelOut,this)}},touchstart:function(a){this.vacuumTouches(a),this.setPrimaryTouch(a.changedTouches[0]),this.dedupSynthMouse(a),this.scrolling||(this.clickCount++,this.processTouches(a,this.overDown))},overDown:function(a){f.set(a.pointerId,{target:a.target,out:a,outTarget:a.target});c.over(a),c.down(a)},touchmove:function(a){this.scrolling||(this.shouldScroll(a)?(this.scrolling=!0,this.touchcancel(a)):(a.preventDefault(),this.processTouches(a,this.moveOverOut)))},moveOverOut:function(a){var b=a,d=f.get(b.pointerId);if(d){var e=d.out,g=d.outTarget;c.move(b),e&&g!==b.target&&(e.relatedTarget=b.target,b.relatedTarget=g,e.target=g,b.target?(c.leaveOut(e),c.enterOver(b)):(b.target=g,b.relatedTarget=null,this.cancelOut(b))),d.out=b,d.outTarget=b.target}},touchend:function(a){this.dedupSynthMouse(a),this.processTouches(a,this.upOut)},upOut:function(a){this.scrolling||(c.up(a),c.out(a)),this.cleanUpPointer(a)},touchcancel:function(a){this.processTouches(a,this.cancelOut)},cancelOut:function(a){c.cancel(a),c.out(a),this.cleanUpPointer(a)},cleanUpPointer:function(a){f["delete"](a.pointerId),this.removePrimaryPointer(a)},dedupSynthMouse:function(b){var c=a.mouseEvents.lastTouches,d=b.changedTouches[0];if(this.isPrimaryTouch(d)){var e={x:d.clientX,y:d.clientY};c.push(e);var f=function(a,b){var c=a.indexOf(b);c>-1&&a.splice(c,1)}.bind(null,c,e);setTimeout(f,h)}}};k||(b=new a.Installer(l.elementAdded,l.elementRemoved,l.elementChanged,l)),a.touchEvents=l}(window.PointerEventsPolyfill),function(a){var b=a.dispatcher,c=b.pointermap,d=window.MSPointerEvent&&"number"==typeof window.MSPointerEvent.MSPOINTER_TYPE_MOUSE,e={events:["MSPointerDown","MSPointerMove","MSPointerUp","MSPointerOut","MSPointerOver","MSPointerCancel","MSGotPointerCapture","MSLostPointerCapture"],register:function(a){b.listen(a,this.events)},unregister:function(a){b.unlisten(a,this.events)},POINTER_TYPES:["","unavailable","touch","pen","mouse"],prepareEvent:function(a){var c=a;return d&&(c=b.cloneEvent(a),c.pointerType=this.POINTER_TYPES[a.pointerType]),c},cleanup:function(a){c["delete"](a)},MSPointerDown:function(a){c.set(a.pointerId,a);var d=this.prepareEvent(a);b.down(d)},MSPointerMove:function(a){var c=this.prepareEvent(a);b.move(c)},MSPointerUp:function(a){var c=this.prepareEvent(a);b.up(c),this.cleanup(a.pointerId)},MSPointerOut:function(a){var c=this.prepareEvent(a);b.leaveOut(c)},MSPointerOver:function(a){var c=this.prepareEvent(a);b.enterOver(c)},MSPointerCancel:function(a){var c=this.prepareEvent(a);b.cancel(c),this.cleanup(a.pointerId)},MSLostPointerCapture:function(a){var c=b.makeEvent("lostpointercapture",a);b.dispatchEvent(c)},MSGotPointerCapture:function(a){var c=b.makeEvent("gotpointercapture",a);b.dispatchEvent(c)}};a.msEvents=e}(window.PointerEventsPolyfill),function(a){var b=a.dispatcher;if(void 0===window.navigator.pointerEnabled){if(Object.defineProperty(window.navigator,"pointerEnabled",{value:!0,enumerable:!0}),window.navigator.msPointerEnabled){var c=window.navigator.msMaxTouchPoints;Object.defineProperty(window.navigator,"maxTouchPoints",{value:c,enumerable:!0}),b.registerSource("ms",a.msEvents)}else b.registerSource("mouse",a.mouseEvents),void 0!==window.ontouchstart&&b.registerSource("touch",a.touchEvents);b.register(document)}}(window.PointerEventsPolyfill),function(a){function b(a){if(!e.pointermap.has(a))throw new Error("InvalidPointerId")}var c,d,e=a.dispatcher,f=window.navigator;f.msPointerEnabled?(c=function(a){b(a),this.msSetPointerCapture(a)},d=function(a){b(a),this.msReleasePointerCapture(a)}):(c=function(a){b(a),e.setCapture(a,this)},d=function(a){b(a),e.releaseCapture(a,this)}),window.Element&&!Element.prototype.setPointerCapture&&Object.defineProperties(Element.prototype,{setPointerCapture:{value:c},releasePointerCapture:{value:d}})}(window.PointerEventsPolyfill);

var __extends = this.__extends || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    __.prototype = b.prototype;
    d.prototype = new __();
};
var VisModelJS;
(function (VisModelJS) {
    var LayoutEngine = (function () {
        function LayoutEngine() {
        }
        LayoutEngine.prototype.doLayout = function (pictgramPanel, nodeView) {
        };
        return LayoutEngine;
    })();
    VisModelJS.LayoutEngine = LayoutEngine;
    var VerticalTreeLayoutEngine = (function (_super) {
        __extends(VerticalTreeLayoutEngine, _super);
        function VerticalTreeLayoutEngine() {
            _super.apply(this, arguments);
        }
        VerticalTreeLayoutEngine.prototype.render = function (thisNode, divFrag, SVGNodeFrag, SVGConnectionFrag) {
            var _this = this;
            if (thisNode.visible) {
                thisNode.shape.prepareContent();
                thisNode.shape.render(divFrag, SVGNodeFrag, SVGConnectionFrag);
                if (!thisNode.folded) {
                    thisNode.forEachVisibleAllSubNodes(function (SubNode) {
                        _this.render(SubNode, divFrag, SVGNodeFrag, SVGConnectionFrag);
                    });
                }
            }
        };
        VerticalTreeLayoutEngine.prototype.doLayout = function (pictgramPanel, nodeView) {
            var divFragment = document.createDocumentFragment();
            var svgNodeFragment = document.createDocumentFragment();
            var svgConnectionFragment = document.createDocumentFragment();
            var dummy = document.createDocumentFragment();
            this.render(nodeView, divFragment, svgNodeFragment, svgConnectionFragment);
            pictgramPanel.contentLayer.appendChild(divFragment);
            pictgramPanel.SVGLayerConnectorGroup.appendChild(svgConnectionFragment);
            pictgramPanel.SVGLayerNodeGroup.appendChild(svgNodeFragment);
            this.prepareNodeSize(nodeView);
            dummy.appendChild(divFragment);
            dummy.appendChild(svgConnectionFragment);
            dummy.appendChild(svgNodeFragment);
            this.layout(nodeView);
            pictgramPanel.contentLayer.appendChild(divFragment);
            pictgramPanel.SVGLayer.appendChild(svgConnectionFragment);
            pictgramPanel.SVGLayer.appendChild(svgNodeFragment);
        };
        VerticalTreeLayoutEngine.prototype.prepareNodeSize = function (thisNode) {
            var _this = this;
            var Shape = thisNode.shape;
            Shape.nodeWidth;
            Shape.nodeHeight;
            if (thisNode.folded) {
                return;
            }
            thisNode.forEachVisibleLeftNodes(function (SubNode) {
                _this.prepareNodeSize(SubNode);
            });
            thisNode.forEachVisibleRightNodes(function (SubNode) {
                _this.prepareNodeSize(SubNode);
            });
            thisNode.forEachVisibleChildren(function (SubNode) {
                _this.prepareNodeSize(SubNode);
            });
        };
        VerticalTreeLayoutEngine.prototype.layout = function (thisNode) {
            var _this = this;
            if (!thisNode.visible) {
                return;
            }
            var shape = thisNode.shape;
            if (!thisNode.shouldReLayout) {
                thisNode.traverseVisibleNode(function (Node) {
                    Node.shape.fitSizeToContent();
                });
                return;
            }
            thisNode.shouldReLayout = false;
            shape.fitSizeToContent();
            var treeLeftX = 0;
            var thisNodeWidth = shape.nodeWidth;
            var treeRightX = thisNodeWidth;
            var treeHeight = shape.nodeHeight;
            if (thisNode.folded) {
                shape.setHeadRect(0, 0, thisNodeWidth, treeHeight);
                shape.setTreeRect(0, 0, thisNodeWidth, treeHeight);
                return;
            }
            if (thisNode.leftNodes != null) {
                var leftNodesWidth = 0;
                var leftNodesHeight = -VerticalTreeLayoutEngine.sideNodeVerticalMargin;
                thisNode.forEachVisibleLeftNodes(function (subNode) {
                    subNode.shape.fitSizeToContent();
                    leftNodesHeight += VerticalTreeLayoutEngine.sideNodeVerticalMargin;
                    subNode.relativeX = -(subNode.shape.nodeWidth + VerticalTreeLayoutEngine.sideNodeHorizontalMargin);
                    subNode.relativeY = leftNodesHeight;
                    leftNodesWidth = Math.max(leftNodesWidth, subNode.shape.nodeWidth);
                    leftNodesHeight += subNode.shape.nodeHeight;
                });
                var leftShift = (thisNode.shape.nodeHeight - leftNodesHeight) / 2;
                if (leftShift > 0) {
                    thisNode.forEachVisibleLeftNodes(function (SubNode) {
                        SubNode.relativeY += leftShift;
                    });
                }
                if (leftNodesHeight > 0) {
                    treeLeftX = -(leftNodesWidth + VerticalTreeLayoutEngine.sideNodeHorizontalMargin);
                    treeHeight = Math.max(treeHeight, leftNodesHeight);
                }
            }
            if (thisNode.rightNodes != null) {
                var rightNodesWidth = 0;
                var rightNodesHeight = -VerticalTreeLayoutEngine.sideNodeVerticalMargin;
                thisNode.forEachVisibleRightNodes(function (subNode) {
                    subNode.shape.fitSizeToContent();
                    rightNodesHeight += VerticalTreeLayoutEngine.sideNodeVerticalMargin;
                    subNode.relativeX = (thisNodeWidth + VerticalTreeLayoutEngine.sideNodeHorizontalMargin);
                    subNode.relativeY = rightNodesHeight;
                    rightNodesWidth = Math.max(rightNodesWidth, subNode.shape.nodeWidth);
                    rightNodesHeight += subNode.shape.nodeHeight;
                });
                var rightShift = (thisNode.shape.nodeHeight - rightNodesHeight) / 2;
                if (rightShift > 0) {
                    thisNode.forEachVisibleRightNodes(function (SubNode) {
                        SubNode.relativeY += rightShift;
                    });
                }
                if (rightNodesHeight > 0) {
                    treeRightX += rightNodesWidth + VerticalTreeLayoutEngine.sideNodeHorizontalMargin;
                    treeHeight = Math.max(treeHeight, rightNodesHeight);
                }
            }
            var headRightX = treeRightX;
            var headWidth = treeRightX - treeLeftX;
            shape.setHeadRect(treeLeftX, 0, headWidth, treeHeight);
            treeHeight += VerticalTreeLayoutEngine.childrenVerticalMargin;
            var childrenTopWidth = 0;
            var childrenBottomWidth = 0;
            var childrenHeight = 0;
            var formarUnfoldedChildHeight = Infinity;
            var foldedNodeRun = [];
            var visibleChildrenCount = 0;
            if (thisNode.childNodes != null && thisNode.childNodes.length > 0) {
                var isPreviousChildFolded = false;
                thisNode.forEachVisibleChildren(function (subNode) {
                    visibleChildrenCount++;
                    _this.layout(subNode);
                    var childTreeWidth = subNode.shape.treeWidth;
                    var childHeadWidth = subNode.folded ? subNode.shape.nodeWidth : subNode.shape.headWidth;
                    var childHeadHeight = subNode.folded ? subNode.shape.nodeHeight : subNode.shape.headHeight;
                    var childHeadLeftSideMargin = subNode.shape.headLeftLocalX - subNode.shape.treeLeftLocalX;
                    var childHeadRightX = childHeadLeftSideMargin + childHeadWidth;
                    var childTreeHeight = subNode.shape.treeHeight;
                    var hMargin = VerticalTreeLayoutEngine.childrenHorizontalMargin;
                    var isUndeveloped = subNode.childNodes == null || subNode.childNodes.length == 0;
                    var isFoldedLike = (subNode.folded || isUndeveloped) && childHeadHeight <= formarUnfoldedChildHeight;
                    if (isFoldedLike) {
                        subNode.relativeX = childrenTopWidth;
                        childrenTopWidth = childrenTopWidth + childHeadWidth + hMargin;
                        foldedNodeRun.push(subNode);
                    }
                    else {
                        if (isPreviousChildFolded) {
                            // Arrange the folded nodes between open nodes to equal distance
                            var widthDiff = childrenTopWidth - childrenBottomWidth;
                            if (widthDiff < childHeadLeftSideMargin) {
                                subNode.relativeX = childrenBottomWidth;
                                childrenTopWidth = childrenBottomWidth + childHeadRightX + hMargin;
                                childrenBottomWidth = childrenBottomWidth + childTreeWidth + hMargin;
                                if (subNode.relativeX == 0) {
                                    for (var i = 0; i < foldedNodeRun.length; i++) {
                                        foldedNodeRun[i].relativeX += childHeadLeftSideMargin - widthDiff;
                                    }
                                }
                                else {
                                    var foldedRunMargin = (childHeadLeftSideMargin - widthDiff) / (foldedNodeRun.length + 1);
                                    for (var i = 0; i < foldedNodeRun.length; i++) {
                                        foldedNodeRun[i].relativeX += foldedRunMargin * (i + 1);
                                    }
                                }
                            }
                            else {
                                subNode.relativeX = childrenTopWidth - childHeadLeftSideMargin;
                                childrenBottomWidth = childrenTopWidth + childTreeWidth - childHeadLeftSideMargin + hMargin;
                                childrenTopWidth = childrenTopWidth + childHeadWidth + hMargin;
                            }
                        }
                        else {
                            var childrenWidth = Math.max(childrenTopWidth, childrenBottomWidth);
                            subNode.relativeX = childrenWidth;
                            childrenTopWidth = childrenWidth + childHeadRightX + hMargin;
                            childrenBottomWidth = childrenWidth + childTreeWidth + hMargin;
                        }
                        foldedNodeRun = [];
                        formarUnfoldedChildHeight = childHeadHeight;
                    }
                    subNode.relativeX += -subNode.shape.treeLeftLocalX;
                    subNode.relativeY = treeHeight;
                    isPreviousChildFolded = isFoldedLike;
                    childrenHeight = Math.max(childrenHeight, childTreeHeight);
                    //console.log("T" + ChildrenTopWidth + ", B" + ChildrenBottomWidth);
                });
                var childrenWidth = Math.max(childrenTopWidth, childrenBottomWidth) - VerticalTreeLayoutEngine.childrenHorizontalMargin;
                var shiftX = (childrenWidth - thisNodeWidth) / 2;
                if (visibleChildrenCount == 1) {
                    thisNode.forEachVisibleChildren(function (subNode) {
                        shiftX = -subNode.shape.treeLeftLocalX;
                        if (!subNode.hasSideNode || subNode.folded) {
                            var shiftY = 0;
                            var subNodeHeight = subNode.shape.nodeHeight;
                            var thisHeight = thisNode.shape.nodeHeight;
                            var vMargin = VerticalTreeLayoutEngine.childrenVerticalMargin;
                            if (!subNode.hasChildren || thisHeight + vMargin * 2 + subNodeHeight > treeHeight) {
                                shiftY = treeHeight - (thisHeight + vMargin);
                            }
                            else {
                                shiftY = subNodeHeight + vMargin;
                            }
                            subNode.relativeY -= shiftY;
                            childrenHeight -= shiftY;
                        }
                    });
                }
                treeLeftX = Math.min(treeLeftX, -shiftX);
                thisNode.forEachVisibleChildren(function (SubNode) {
                    SubNode.relativeX -= shiftX;
                });
                treeHeight += childrenHeight;
                treeRightX = Math.max(treeLeftX + childrenWidth, headRightX);
            }
            shape.setTreeRect(treeLeftX, 0, treeRightX - treeLeftX, treeHeight);
            //console.log(ThisNode.Label + ": " + (<any>ThisNode.Shape).TreeBoundingBox.toString());
        };
        VerticalTreeLayoutEngine.sideNodeHorizontalMargin = 32;
        VerticalTreeLayoutEngine.sideNodeVerticalMargin = 10;
        VerticalTreeLayoutEngine.childrenVerticalMargin = 64;
        VerticalTreeLayoutEngine.childrenHorizontalMargin = 12;
        return VerticalTreeLayoutEngine;
    })(LayoutEngine);
    VisModelJS.VerticalTreeLayoutEngine = VerticalTreeLayoutEngine;
})(VisModelJS || (VisModelJS = {}));
var VisModelJS;
(function (VisModelJS) {
    var TreeNodeView = (function () {
        function TreeNodeView() {
            this.relativeX = 0; // relative x from parent node
            this.relativeY = 0; // relative y from parent node
            this.leftNodes = null;
            this.rightNodes = null;
            this.childNodes = null;
            this._shape = null;
            this._shouldReLayout = true;
            this.visible = true;
            this._folded = false;
        }
        Object.defineProperty(TreeNodeView.prototype, "folded", {
            get: function () {
                return this._folded;
            },
            set: function (value) {
                if (this._folded != value) {
                    this.shouldReLayout = true;
                }
                this._folded = value;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "shouldReLayout", {
            get: function () {
                return this._shouldReLayout;
            },
            set: function (value) {
                if (!this._shouldReLayout && value && this.parent) {
                    this.parent.shouldReLayout = true;
                }
                this._shouldReLayout = value;
            },
            enumerable: true,
            configurable: true
        });
        //FixMe
        TreeNodeView.prototype.UpdateViewMap = function (viewMap) {
            viewMap[this.label] = this;
            if (this.leftNodes != null) {
                for (var i = 0; i < this.leftNodes.length; i++) {
                    this.leftNodes[i].UpdateViewMap(viewMap);
                }
            }
            if (this.rightNodes != null) {
                for (var i = 0; i < this.rightNodes.length; i++) {
                    this.rightNodes[i].UpdateViewMap(viewMap);
                }
            }
            if (this.childNodes != null) {
                for (var i = 0; i < this.childNodes.length; i++) {
                    this.childNodes[i].UpdateViewMap(viewMap);
                }
            }
        };
        TreeNodeView.prototype.appendChild = function (node) {
            if (this.childNodes == null) {
                this.childNodes = [];
            }
            this.childNodes.push(node);
            node.parent = this;
        };
        TreeNodeView.prototype.appendLeftNode = function (node) {
            if (this.leftNodes == null) {
                this.leftNodes = [];
            }
            this.leftNodes.push(node);
            node.parent = this;
        };
        TreeNodeView.prototype.appendRightNode = function (node) {
            if (this.rightNodes == null) {
                this.rightNodes = [];
            }
            this.rightNodes.push(node);
            node.parent = this;
        };
        Object.defineProperty(TreeNodeView.prototype, "shape", {
            get: function () {
                if (this._shape == null) {
                    this._shape = VisModelJS.ShapeFactory.createShape(this);
                }
                return this._shape;
            },
            set: function (value) {
                if (this._shape) {
                    this._shape.nodeView = null;
                }
                if (value) {
                    value.nodeView = this;
                }
                this._shape = value;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "gx", {
            /**
                Global X: Scale-independent and transform-independent X distance from leftside of the top goal.
                @return always 0 if this is top goal.
            */
            get: function () {
                if (TreeNodeView.globalPositionCache != null && TreeNodeView.globalPositionCache[this.label]) {
                    return TreeNodeView.globalPositionCache[this.label].x;
                }
                if (this.parent == null) {
                    return this.relativeX;
                }
                return this.parent.gx + this.relativeX;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "gy", {
            /**
                Global Y: Scale-independent and transform-independent Y distance from top of the top goal.
                @eturn always 0 if this is top goal.
            */
            get: function () {
                if (TreeNodeView.globalPositionCache != null && TreeNodeView.globalPositionCache[this.label]) {
                    return TreeNodeView.globalPositionCache[this.label].y;
                }
                if (this.parent == null) {
                    return this.relativeY;
                }
                return this.parent.gy + this.relativeY;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "centerGx", {
            // Global center X/Y: Node center position
            get: function () {
                return this.gx + this._shape.nodeWidth * 0.5;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "centerGy", {
            get: function () {
                return this.gy + this._shape.nodeHeight * 0.5;
            },
            enumerable: true,
            configurable: true
        });
        TreeNodeView.setGlobalPositionCacheEnabled = function (State) {
            if (State && TreeNodeView.globalPositionCache == null) {
                TreeNodeView.globalPositionCache = {};
            }
            else if (!State) {
                TreeNodeView.globalPositionCache = null;
            }
        };
        Object.defineProperty(TreeNodeView.prototype, "globalPosition", {
            /**
                Scale-independent and transform-independent distance from leftside of GSN.
                @return always (0, 0) if this is top goal.
            */
            get: function () {
                if (TreeNodeView.globalPositionCache != null && TreeNodeView.globalPositionCache[this.label]) {
                    return TreeNodeView.globalPositionCache[this.label].clone();
                }
                if (this.parent == null) {
                    return new VisModelJS.Point(this.relativeX, this.relativeY);
                }
                var parentPos = this.parent.globalPosition;
                parentPos.x += this.relativeX;
                parentPos.y += this.relativeY;
                if (TreeNodeView.globalPositionCache != null) {
                    TreeNodeView.globalPositionCache[this.label] = parentPos.clone();
                }
                return parentPos;
            },
            enumerable: true,
            configurable: true
        });
        /**
            Try to reuse shape.
        */
        TreeNodeView.prototype.copyFlagsFromOldView = function (oldView) {
            if (oldView) {
                this._folded = oldView._folded;
                var isContentChanged = this.content != oldView.content;
                if (isContentChanged) {
                    this.shape.setColorStyle(oldView.shape.getColorStyle());
                }
                else {
                    this.shape = oldView.shape;
                }
            }
        };
        TreeNodeView.prototype.getConnectorPosition = function (dir, globalPosition) {
            var P = this._shape.getConnectorPosition(dir);
            P.x += globalPosition.x;
            P.y += globalPosition.y;
            return P;
        };
        /**
            Update DOM node position by the position that layout engine caluculated
        */
        TreeNodeView.prototype.updateNodePosition = function (animationCallbacks, duration, screenRect, unfoldBaseNode) {
            var _this = this;
            duration = duration || 0;
            if (!this.visible) {
                return;
            }
            var updateSubNode = function (SubNode) {
                var base = unfoldBaseNode;
                if (!base && SubNode._shape.willFadein) {
                    base = _this;
                }
                if (base && duration > 0) {
                    SubNode._shape.setFadeinBasePosition(base._shape.gxCache, base._shape.gyCache);
                    SubNode.updateNodePosition(animationCallbacks, duration, screenRect, base);
                }
                else {
                    SubNode.updateNodePosition(animationCallbacks, duration, screenRect);
                }
            };
            var gp = this.globalPosition;
            this._shape.moveTo(animationCallbacks, gp.x, gp.y, duration, screenRect);
            var directions = [VisModelJS.Direction.Bottom, VisModelJS.Direction.Right, VisModelJS.Direction.Left];
            var subNodeTypes = [this.childNodes, this.rightNodes, this.leftNodes];
            for (var i = 0; i < 3; ++i) {
                var p1 = this.getConnectorPosition(directions[i], gp);
                var arrowGoalDirection = VisModelJS.reverseDirection(directions[i]);
                this.forEachVisibleSubNode(subNodeTypes[i], function (SubNode) {
                    var p2 = SubNode.getConnectorPosition(arrowGoalDirection, SubNode.globalPosition);
                    updateSubNode(SubNode);
                    SubNode._shape.moveArrowTo(animationCallbacks, p1, p2, directions[i], duration, screenRect);
                    SubNode.parentDirection = VisModelJS.reverseDirection(directions[i]);
                });
            }
        };
        TreeNodeView.prototype.forEachVisibleSubNode = function (subNodes, action) {
            if (subNodes != null && !this._folded) {
                for (var i = 0; i < subNodes.length; i++) {
                    if (subNodes[i].visible) {
                        if (action(subNodes[i]) === false) {
                            return false;
                        }
                    }
                }
            }
            return true;
        };
        TreeNodeView.prototype.forEachVisibleChildren = function (action) {
            this.forEachVisibleSubNode(this.childNodes, action);
        };
        TreeNodeView.prototype.forEachVisibleRightNodes = function (action) {
            this.forEachVisibleSubNode(this.rightNodes, action);
        };
        TreeNodeView.prototype.forEachVisibleLeftNodes = function (action) {
            this.forEachVisibleSubNode(this.leftNodes, action);
        };
        TreeNodeView.prototype.forEachVisibleAllSubNodes = function (action) {
            if (this.forEachVisibleSubNode(this.leftNodes, action) &&
                this.forEachVisibleSubNode(this.rightNodes, action) &&
                this.forEachVisibleSubNode(this.childNodes, action))
                return true;
            return false;
        };
        TreeNodeView.prototype.traverseVisibleNode = function (action) {
            action(this);
            this.forEachVisibleAllSubNodes(function (subNode) { subNode.traverseVisibleNode(action); });
        };
        TreeNodeView.prototype.forEachSubNode = function (subNodes, action) {
            if (subNodes != null) {
                for (var i = 0; i < subNodes.length; i++) {
                    if (action(subNodes[i]) === false) {
                        return false;
                    }
                }
            }
            return true;
        };
        TreeNodeView.prototype.forEachAllSubNodes = function (action) {
            if (this.forEachSubNode(this.leftNodes, action) &&
                this.forEachSubNode(this.rightNodes, action) &&
                this.forEachSubNode(this.childNodes, action))
                return true;
            return false;
        };
        TreeNodeView.prototype.traverseNode = function (action) {
            if (action(this) === false)
                return false;
            if (this.forEachAllSubNodes(function (subNode) { return subNode.traverseNode(action); }))
                return true;
            return false;
        };
        /**
            Clear position cache and enable to fading in when the node re-appearing.
            This method should be called after the node became invibible or the node never fade in.
        */
        TreeNodeView.prototype.clearAnimationCache = function (force) {
            if (force || !this.visible) {
                this.shape.clearAnimationCache();
            }
            if (force || this._folded) {
                this.forEachAllSubNodes(function (SubNode) {
                    SubNode.clearAnimationCache(true);
                });
            }
            else {
                this.forEachAllSubNodes(function (SubNode) {
                    SubNode.clearAnimationCache(false);
                });
            }
        };
        Object.defineProperty(TreeNodeView.prototype, "hasSideNode", {
            get: function () {
                return (this.leftNodes != null && this.leftNodes.length > 0) || (this.rightNodes != null && this.rightNodes.length > 0);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(TreeNodeView.prototype, "hasChildren", {
            get: function () {
                return (this.childNodes != null && this.childNodes.length > 0);
            },
            enumerable: true,
            configurable: true
        });
        TreeNodeView.prototype.isInRect = function (target) {
            // While animation playing, cached position(visible position) != this.position(logical position)
            var gyCached = this._shape.gyCache;
            var gxCached = this._shape.gxCache;
            var pos;
            if (gxCached != null && gyCached != null) {
                pos = new VisModelJS.Point(gxCached, gyCached);
            }
            else {
                pos = this.globalPosition;
            }
            if (pos.x > target.x + target.width || pos.y > target.y + target.height) {
                return false;
            }
            pos.x += this._shape.nodeWidth;
            pos.y += this._shape.nodeHeight;
            if (pos.x < target.x || pos.y < target.y) {
                return false;
            }
            return true;
        };
        TreeNodeView.prototype.isConnectorInRect = function (target) {
            if (!this.parent) {
                return false;
            }
            var pa;
            var pb;
            if (this._shape.gxCache != null && this._shape.gyCache != null) {
                pa = this._shape.arrowP1Cache;
                pb = this._shape.arrowP2Cache;
            }
            else {
                pa = this.getConnectorPosition(this.parentDirection, this.globalPosition);
                pb = this.parent.getConnectorPosition(VisModelJS.reverseDirection(this.parentDirection), this.parent.globalPosition);
            }
            var pos = new VisModelJS.Point(Math.min(pa.x, pb.x), Math.min(pa.y, pb.y));
            if (pos.x > target.x + target.width || pos.y > target.y + target.height) {
                return false;
            }
            pos.x = Math.max(pa.x, pb.x);
            pos.y = Math.max(pa.y, pb.y);
            if (pos.x < target.x || pos.y < target.y) {
                return false;
            }
            return true;
        };
        /**
           @method FoldDeepSubGoals
           @param {NodeView} NodeView
        */
        TreeNodeView.prototype.foldDeepSubGoals = function (limitDepth) {
            if (limitDepth <= 0) {
                this.folded = true;
            }
            else {
                this.forEachVisibleChildren(function (SubNode) { return SubNode.foldDeepSubGoals(limitDepth - 1); });
            }
        };
        // For memorization
        TreeNodeView.globalPositionCache = null;
        return TreeNodeView;
    })();
    VisModelJS.TreeNodeView = TreeNodeView;
})(VisModelJS || (VisModelJS = {}));
var VisModelJS;
(function (VisModelJS) {
    var Utils;
    (function (Utils) {
        function saveStringAs(content, fileName) {
            var blob = new Blob([content], { type: 'text/plain; charset=UTF-8' });
            saveAs(blob, fileName);
        }
        Utils.saveStringAs = saveStringAs;
        function getNodeLabelFromEvent(event) {
            var element = event.target || event.srcElement;
            while (element != null) {
                var label = element.getAttribute("data-nodelabel");
                if (label != null && label != "") {
                    return label;
                }
                element = element.parentElement;
            }
            return "";
        }
        Utils.getNodeLabelFromEvent = getNodeLabelFromEvent;
        function getPositionById(Label) {
            var element = document.getElementById(Label);
            var view = element.getBoundingClientRect();
            return new Point(view.left, view.top);
        }
        Utils.getPositionById = getPositionById;
        function createSVGElement(name) {
            return document.createElementNS('http://www.w3.org/2000/svg', name);
        }
        Utils.createSVGElement = createSVGElement;
        var element = document.createElement('div');
        function HTMLEncode(text) {
            element.textContent = text;
            return element.innerHTML;
        }
        Utils.HTMLEncode = HTMLEncode;
        function foreachLine(Text, LineWidth, Callback) {
            if (!Callback)
                return;
            var rest = Text;
            var maxLength = LineWidth || 20;
            maxLength = maxLength < 1 ? 1 : maxLength;
            var length = 0;
            var i = 0;
            for (var pos = 0; pos < rest.length; ++pos) {
                var code = rest.charCodeAt(pos);
                length += code < 128 ? 1 : 2;
                if (length > maxLength || rest.charAt(pos) == "\n") {
                    Callback(rest.substr(0, pos), i);
                    if (rest.charAt(pos) == "\n") {
                        pos++;
                    }
                    rest = rest.substr(pos, rest.length - pos);
                    pos = -1;
                    length = 0;
                    i++;
                }
            }
            Callback(rest, i);
        }
        Utils.foreachLine = foreachLine;
        function removeFirstLine(Text) {
            return Text.replace(/^.+$(\r\n|\r|\n)?/m, "");
        }
        Utils.removeFirstLine = removeFirstLine;
        function generateUID() {
            return Math.floor(Math.random() * 2147483647);
        }
        Utils.generateUID = generateUID;
        function generateRandomString() {
            return generateUID().toString(36);
        }
        Utils.generateRandomString = generateRandomString;
        function updateHash(hash) {
            if (!hash)
                hash = '';
            window.location.hash = hash;
        }
        Utils.updateHash = updateHash;
        var UserAgant = (function () {
            function UserAgant() {
            }
            UserAgant.isLessThanIE6 = function () {
                return !!UserAgant.ua.ltIE6;
            };
            UserAgant.isLessThanIE7 = function () {
                return !!UserAgant.ua.ltIE7;
            };
            UserAgant.isLessThanIE8 = function () {
                return !!UserAgant.ua.ltIE8;
            };
            UserAgant.isLessThanIE9 = function () {
                return !!UserAgant.ua.ltIE9;
            };
            UserAgant.isGreaterThanIE10 = function () {
                return !!UserAgant.ua.gtIE10;
            };
            UserAgant.isTrident = function () {
                return !!UserAgant.ua.Trident;
            };
            UserAgant.isGecko = function () {
                return !!UserAgant.ua.Gecko;
            };
            UserAgant.isPresto = function () {
                return !!UserAgant.ua.Presto;
            };
            UserAgant.isBlink = function () {
                return !!UserAgant.ua.Blink;
            };
            UserAgant.isWebkit = function () {
                return !!UserAgant.ua.Webkit;
            };
            UserAgant.isTouchEnabled = function () {
                return !!UserAgant.ua.Touch;
            };
            UserAgant.isPointerEnabled = function () {
                return !!UserAgant.ua.Pointer;
            };
            UserAgant.isMSPoniterEnabled = function () {
                return !!UserAgant.ua.MSPoniter;
            };
            UserAgant.isPerformanceEnabled = function () {
                return !!UserAgant.ua.Performance;
            };
            UserAgant.isAnimationFrameEnabled = function () {
                return !!UserAgant.ua.AnimationFrame;
            };
            UserAgant.isTouchDevice = function () {
                return UserAgant.ua.Touch;
            };
            UserAgant.ua = (function () {
                return {
                    ltIE6: typeof window.addEventListener == "undefined" && typeof document.documentElement.style.maxHeight == "undefined",
                    ltIE7: typeof window.addEventListener == "undefined" && typeof document.querySelectorAll == "undefined",
                    ltIE8: typeof window.addEventListener == "undefined" && typeof document.getElementsByClassName == "undefined",
                    ltIE9: document.uniqueID && !window.matchMedia,
                    gtIE10: document.uniqueID && document.documentMode >= 10,
                    Trident: document.uniqueID,
                    Gecko: 'MozAppearance' in document.documentElement.style,
                    Presto: window.opera,
                    Blink: window.chrome,
                    Webkit: !window.chrome && 'WebkitAppearance' in document.documentElement.style,
                    Touch: typeof document.ontouchstart != "undefined",
                    Mobile: typeof document.orientation != "undefined",
                    Pointer: (typeof document.navigator != "undefined") && !!document.navigator.pointerEnabled,
                    MSPoniter: (typeof document.navigator != "undefined") && !!document.navigator.msPointerEnabled,
                    Performance: typeof window.performance != "undefined",
                    AnimationFrame: typeof window.requestAnimationFrame != "undefined"
                };
            })();
            return UserAgant;
        })();
        Utils.UserAgant = UserAgant;
        Utils.requestAnimationFrame = UserAgant.isAnimationFrameEnabled() ? window.requestAnimationFrame.bind(window) : (function (c) { return setTimeout(c, 16.7); });
        Utils.cancelAnimationFrame = UserAgant.isAnimationFrameEnabled() ? window.cancelAnimationFrame.bind(window) : window.clearTimeout.bind(window);
        Utils.getTime = UserAgant.isPerformanceEnabled() ? performance.now.bind(performance) : Date.now.bind(Date);
        /**
        Define new color style.
        @param {string} StyleName Style name. The name can be used as a parameter for NodeView#Addd/RemoveColorStyle
        @param {Object} StyleDef jQuery.css style definition. ex) { fill: #FFFFFF, stroke: #000000 }
        */
        //export function defineColorStyle(StyleName: string, StyleDef: Object): void {
        //    $("<style>").html("." + StyleName + " { " + $("span").css(StyleDef).attr("style") + " }").appendTo("head");
        //}
        function generateStyleSetter(originalName) {
            var cameledName = originalName.substring(0, 1).toUpperCase() + originalName.substring(1);
            if (UserAgant.isTrident()) {
                cameledName = "ms" + cameledName;
                return function (Element, Value) { Element.style[cameledName] = Value; };
            }
            if (UserAgant.isGecko()) {
                cameledName = "Moz" + cameledName;
                return function (Element, Value) { Element.style[cameledName] = Value; };
            }
            if (UserAgant.isWebkit() || UserAgant.isBlink()) {
                cameledName = "webkit" + cameledName;
                return function (Element, Value) { Element.style[cameledName] = Value; };
            }
            return function (Element, Value) { Element.style[originalName] = Value; };
        }
        Utils.setTransformOriginToElement = generateStyleSetter("transformOrigin");
        Utils.setTransformToElement = generateStyleSetter("transform");
    })(Utils = VisModelJS.Utils || (VisModelJS.Utils = {}));
    var AnimationFrameTask = (function () {
        function AnimationFrameTask() {
        }
        AnimationFrameTask.prototype.start = function (duration, callback) {
            var _this = this;
            this.cancel();
            this.lastTime = this.startTime = Utils.getTime();
            this.endTime = this.startTime + duration;
            this.callback = callback;
            var update = function () {
                var currentTime = Utils.getTime();
                var deltaT = currentTime - _this.lastTime;
                if (currentTime < _this.endTime) {
                    _this.timerHandle = Utils.requestAnimationFrame(update);
                }
                else {
                    deltaT = _this.endTime - _this.lastTime;
                    _this.timerHandle = 0;
                }
                _this.callback(deltaT, currentTime, _this.startTime);
                _this.lastTime = currentTime;
            };
            update();
        };
        AnimationFrameTask.prototype.startMany = function (Duration, Callbacks) {
            if (Callbacks && Callbacks.length > 0) {
                this.start(Duration, function (DeltaT, CurrentTime, StartTime) {
                    for (var i = 0; i < Callbacks.length; ++i) {
                        Callbacks[i](DeltaT, CurrentTime, StartTime);
                    }
                });
            }
        };
        AnimationFrameTask.prototype.isRunning = function () {
            return this.timerHandle != 0;
        };
        AnimationFrameTask.prototype.cancel = function (RunToEnd) {
            if (this.timerHandle) {
                Utils.cancelAnimationFrame(this.timerHandle);
                this.timerHandle = 0;
                if (RunToEnd) {
                    var DeltaT = this.endTime - this.lastTime;
                    this.callback(DeltaT, this.endTime, this.startTime);
                }
            }
        };
        return AnimationFrameTask;
    })();
    VisModelJS.AnimationFrameTask = AnimationFrameTask;
    var VisModelEvent = (function () {
        function VisModelEvent() {
        }
        VisModelEvent.prototype.preventDefault = function () {
            this.defaultPrevented = true;
        };
        return VisModelEvent;
    })();
    VisModelJS.VisModelEvent = VisModelEvent;
    var EventTarget = (function () {
        function EventTarget() {
            this.Listeners = {};
        }
        EventTarget.prototype.removeEventListener = function (type, listener) {
            var listeners = this.Listeners[type];
            if (listeners != null) {
                var i = listeners.indexOf(listener);
                if (i !== -1) {
                    listeners.splice(i, 1);
                }
            }
        };
        EventTarget.prototype.addEventListener = function (type, listener) {
            var listeners = this.Listeners[type];
            if (listeners == null) {
                this.Listeners[type] = [listener];
            }
            else if (listeners.indexOf(listener) === -1) {
                listeners.unshift(listener);
            }
        };
        EventTarget.prototype.dispatchEvent = function (e) {
            e.target = this;
            if (this["on" + e.type] != null) {
                this["on" + e.type](e);
            }
            if (this["On" + e.type] != null) {
                this["On" + e.type](e);
            }
            var listeners = this.Listeners[e.type];
            if (listeners != null) {
                listeners = listeners.slice(0);
                for (var i = 0, len = listeners.length; i < len; i++) {
                    listeners[i].call(this, e);
                }
            }
            return !e.defaultPrevented;
        };
        return EventTarget;
    })();
    VisModelJS.EventTarget = EventTarget;
    var ColorStyle = (function () {
        function ColorStyle() {
        }
        ColorStyle.Default = "node-default";
        ColorStyle.Highlight = "node-selected";
        return ColorStyle;
    })();
    VisModelJS.ColorStyle = ColorStyle;
    var Rect = (function () {
        function Rect(x, y, width, height) {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }
        Rect.prototype.toString = function () {
            return "(" + [this.x, this.y, this.width, this.height].join(", ") + ")";
        };
        Rect.prototype.clone = function () {
            return new Rect(this.x, this.y, this.width, this.height);
        };
        return Rect;
    })();
    VisModelJS.Rect = Rect;
    var Point = (function () {
        function Point(x, y) {
            this.x = x;
            this.y = y;
        }
        Point.prototype.clone = function () {
            return new Point(this.x, this.y);
        };
        Point.prototype.toString = function () {
            return "(" + this.x + ", " + this.y + ")";
        };
        return Point;
    })();
    VisModelJS.Point = Point;
    (function (Direction) {
        Direction[Direction["Left"] = 0] = "Left";
        Direction[Direction["Top"] = 1] = "Top";
        Direction[Direction["Right"] = 2] = "Right";
        Direction[Direction["Bottom"] = 3] = "Bottom";
    })(VisModelJS.Direction || (VisModelJS.Direction = {}));
    var Direction = VisModelJS.Direction;
    function reverseDirection(Dir) {
        return (Dir + 2) & 3;
    }
    VisModelJS.reverseDirection = reverseDirection;
})(VisModelJS || (VisModelJS = {}));
// ***************************************************************************
// Copyright (c) 2014, AssureNote project authors. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// *  Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
// *  Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// **************************************************************************
var VisModelJS;
(function (VisModelJS) {
    var ShapeSizePreFetcher = (function () {
        function ShapeSizePreFetcher() {
            this.queue = [];
            this.timerHandle = 0;
            this.dummyDiv = document.createElement("div");
            this.dummyDiv.style.position = "absolute";
            this.dummyDiv.style.top = "1000%";
            document.body.appendChild(this.dummyDiv);
        }
        ShapeSizePreFetcher.prototype.start = function () {
            var _this = this;
            this.timerHandle = setInterval(function () {
                var StartTime = VisModelJS.Utils.getTime();
                while (_this.queue.length > 0 && VisModelJS.Utils.getTime() - StartTime < 16) {
                    var shape = _this.queue.shift();
                    if (shape.nodeView && !shape.isSizeCached) {
                        shape.prepareContent();
                        if (!shape.content.parentElement) {
                            _this.dummyDiv.appendChild(shape.content);
                        }
                        shape.nodeWidth;
                        shape.headHeight;
                        _this.dummyDiv.removeChild(shape.content);
                    }
                }
                if (_this.queue.length == 0) {
                    clearInterval(_this.timerHandle);
                    _this.timerHandle = 0;
                }
            }, 20);
        };
        ShapeSizePreFetcher.prototype.addShape = function (shape) {
            this.queue.push(shape);
            if (!this.timerHandle) {
                this.start();
            }
        };
        return ShapeSizePreFetcher;
    })();
    VisModelJS.ShapeSizePreFetcher = ShapeSizePreFetcher;
    var ShapeFactory = (function () {
        function ShapeFactory() {
        }
        ShapeFactory.setFactory = function (factory) {
            ShapeFactory.factory = factory;
        };
        ShapeFactory.createShape = function (node) {
            return ShapeFactory.factory.createShape(node);
        };
        ShapeFactory.prototype.createShape = function (node) {
            throw Error("Not impremented");
            return null;
        };
        return ShapeFactory;
    })();
    VisModelJS.ShapeFactory = ShapeFactory;
    var Shape = (function () {
        function Shape(nodeView) {
            this.nodeView = nodeView;
            this.colorStyles = [VisModelJS.ColorStyle.Default];
            this._willFadein = false;
            this._gxCache = null;
            this._gyCache = null;
            this.content = null;
            this.nodeWidthCache = Shape.defaultWidth;
            this.nodeHeightCache = 0;
            this.headBoundingBox = new VisModelJS.Rect(0, 0, 0, 0);
            this.treeBoundingBox = new VisModelJS.Rect(0, 0, 0, 0);
            if (Shape.asyncSizePrefetcher == null) {
                Shape.asyncSizePrefetcher = new ShapeSizePreFetcher();
            }
            Shape.asyncSizePrefetcher.addShape(this);
        }
        Object.defineProperty(Shape.prototype, "isSizeCached", {
            get: function () {
                return this.nodeHeightCache != 0 && this.nodeWidthCache != 0;
            },
            enumerable: true,
            configurable: true
        });
        Shape.createArrowPath = function () {
            return Shape.arrowPathMaster.cloneNode();
        };
        Shape.prototype.setTreeRect = function (localX, localY, width, height) {
            this.setTreeUpperLeft(localX, localY);
            this.setTreeSize(width, height);
        };
        Shape.prototype.setHeadRect = function (localX, localY, width, height) {
            this.setHeadUpperLeft(localX, localY);
            this.setHeadSize(width, height);
        };
        Shape.prototype.setTreeSize = function (width, height) {
            this.treeBoundingBox.width = width;
            this.treeBoundingBox.height = height;
        };
        Shape.prototype.setHeadSize = function (width, height) {
            this.headBoundingBox.width = width;
            this.headBoundingBox.height = height;
        };
        Object.defineProperty(Shape.prototype, "nodeWidth", {
            get: function () {
                return this.nodeWidthCache;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "nodeHeight", {
            get: function () {
                if (this.nodeHeightCache == 0) {
                    var Cached = Shape.nodeHeightCache[this.content.innerHTML];
                    if (Cached) {
                        this.nodeHeightCache = Cached;
                    }
                    else {
                        Shape.nodeHeightCache[this.content.innerHTML] = this.nodeHeightCache = this.content.clientHeight;
                    }
                }
                return this.nodeHeightCache;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "treeWidth", {
            get: function () {
                if (this.treeBoundingBox.width == 0) {
                    this.treeBoundingBox.width = 150; //FIXME
                }
                return this.treeBoundingBox.width;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "treeHeight", {
            get: function () {
                if (this.treeBoundingBox.height == 0) {
                    this.treeBoundingBox.height = 100; //FIXME
                }
                return this.treeBoundingBox.height;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "headWidth", {
            get: function () {
                if (this.headBoundingBox.width == 0) {
                    this.headBoundingBox.width = 150; //FIXME
                }
                return this.headBoundingBox.width;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "headHeight", {
            get: function () {
                if (this.headBoundingBox.height == 0) {
                    this.headBoundingBox.height = 100; //FIXME
                }
                return this.headBoundingBox.height;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "treeLeftLocalX", {
            get: function () {
                return this.treeBoundingBox.x;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "headLeftLocalX", {
            get: function () {
                return this.headBoundingBox.x;
            },
            enumerable: true,
            configurable: true
        });
        Shape.prototype.setTreeUpperLeft = function (localX, localY) {
            this.treeBoundingBox.x = localX;
            this.treeBoundingBox.y = localY;
        };
        Shape.prototype.setHeadUpperLeft = function (localX, localY) {
            this.headBoundingBox.x = localX;
            this.headBoundingBox.y = localY;
        };
        Shape.prototype.updateHtmlClass = function () {
            this.content.className = "node";
        };
        Shape.prototype.formatNewLine = function (doc) {
            return doc.replace(/\r\n|\n|\r/g, '<br>');
        };
        Shape.prototype.prepareHTMLContent = function () {
            if (this.content == null) {
                var div = document.createElement("div");
                this.content = div;
                div.id = this.nodeView.label;
                div.setAttribute("data-nodelabel", this.nodeView.label);
                if (this.nodeView.label) {
                    var h4 = document.createElement("h4");
                    h4.textContent = this.nodeView.label;
                    div.appendChild(h4);
                }
                if (this.nodeView.content) {
                    var p = document.createElement("p");
                    p.innerText = this.nodeView.content.trim();
                    div.appendChild(p);
                }
                this.updateHtmlClass();
            }
        };
        Shape.prototype.prepareContent = function () {
            this.prepareHTMLContent();
            this.prepareSVGContent();
        };
        Shape.prototype.render = function (htmlContentFragment, svgNodeFragment, svgConnectionFragment) {
            svgNodeFragment.appendChild(this.shapeGroup);
            if (this.arrowPath != null && this.nodeView.parent != null) {
                svgConnectionFragment.appendChild(this.arrowPath);
            }
            htmlContentFragment.appendChild(this.content);
        };
        Shape.prototype.fitSizeToContent = function () {
        };
        Shape.prototype.setPosition = function (x, y) {
            if (this.nodeView.visible) {
                var div = this.content;
                if (div != null) {
                    div.style.left = x + "px";
                    div.style.top = y + "px";
                }
                var mat = this.shapeGroup.transform.baseVal.getItem(0).matrix;
                mat.e = x;
                mat.f = y;
            }
            this._gxCache = x;
            this._gyCache = y;
        };
        Object.defineProperty(Shape.prototype, "opacity", {
            set: function (value) {
                this.content.style.opacity = value.toString();
                this.shapeGroup.style.opacity = value.toString();
            },
            enumerable: true,
            configurable: true
        });
        Shape.prototype.fadein = function (animationCallbacks, duration) {
            var _this = this;
            var V = 1 / duration;
            var opacity = 0;
            animationCallbacks.push(function (deltaT) {
                opacity += V * deltaT;
                _this.opacity = _this.arrowOpacity = opacity;
            });
        };
        Shape.prototype.moveTo = function (animationCallbacks, x, y, duration, screenRect) {
            var _this = this;
            if (duration <= 0) {
                this.setPosition(x, y);
                return;
            }
            if (this.willFadein) {
                if (screenRect && (y + this.nodeHeight < screenRect.y || y > screenRect.y + screenRect.height)) {
                    this.setPosition(x, y);
                    this._willFadein = false;
                    return;
                }
                this.fadein(animationCallbacks, duration);
                this._willFadein = false;
                if (this._gxCache == null || this._gyCache == null) {
                    this.setPosition(x, y);
                    return;
                }
            }
            if (screenRect) {
                Shape.__Debug_Animation_TotalNodeCount++;
                if (this._gxCache + this.nodeWidth < screenRect.x || this._gxCache > screenRect.x + screenRect.width) {
                    if (x + this.nodeWidth < screenRect.x || x > screenRect.x + screenRect.width) {
                        this.setPosition(x, y);
                        return;
                    }
                }
                if (this._gyCache + this.nodeHeight < screenRect.y || this._gyCache > screenRect.y + screenRect.height) {
                    this.setPosition(x, y);
                    return;
                }
            }
            var VX = (x - this._gxCache) / duration;
            var VY = (y - this._gyCache) / duration;
            animationCallbacks.push(function (deltaT) { return _this.setPosition(_this._gxCache + VX * deltaT, _this._gyCache + VY * deltaT); });
        };
        Shape.prototype.setFadeinBasePosition = function (startGX, startGY) {
            this._willFadein = true;
            this._gxCache = startGX;
            this._gyCache = startGY;
            this._arrowP1Cache = this._arrowP2Cache = new VisModelJS.Point(startGX + this.nodeWidth * 0.5, startGY + this.nodeHeight * 0.5);
        };
        Object.defineProperty(Shape.prototype, "gxCache", {
            get: function () {
                return this._gxCache;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "gyCache", {
            get: function () {
                return this._gyCache;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "willFadein", {
            get: function () {
                return this._willFadein || this._gxCache == null || this._gyCache == null;
            },
            enumerable: true,
            configurable: true
        });
        Shape.prototype.clearAnimationCache = function () {
            this._gxCache = null;
            this._gyCache = null;
        };
        Shape.prototype.prepareSVGContent = function () {
            this.shapeGroup = VisModelJS.Utils.createSVGElement("g");
            this.shapeGroup.setAttribute("transform", "translate(0,0)");
            this.shapeGroup.setAttribute("class", this.colorStyles.join(" "));
            this.arrowPath = Shape.createArrowPath();
            this.arrowStart = this.arrowPath.pathSegList.getItem(0);
            this.arrowCurve = this.arrowPath.pathSegList.getItem(1);
        };
        Object.defineProperty(Shape.prototype, "arrowP1Cache", {
            get: function () {
                return this._arrowP1Cache;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(Shape.prototype, "arrowP2Cache", {
            get: function () {
                return this._arrowP2Cache;
            },
            enumerable: true,
            configurable: true
        });
        Shape.prototype.setArrowPosition = function (p1, p2, dir) {
            var start = this.arrowStart;
            var curve = this.arrowCurve;
            start.x = p1.x;
            start.y = p1.y;
            curve.x = p2.x;
            curve.y = p2.y;
            if (dir == VisModelJS.Direction.Bottom || dir == VisModelJS.Direction.Top) {
                var dx = Math.abs(p1.x - p2.x);
                curve.x1 = (9 * p1.x + p2.x) / 10;
                curve.y1 = p2.y;
                curve.x2 = (9 * p2.x + p1.x) / 10;
                curve.y2 = p1.y;
                if (dx > 300) {
                    curve.x1 = p1.x - 10 * (p1.x - p2.x < 0 ? -1 : 1);
                    curve.x2 = p2.x + 10 * (p1.x - p2.x < 0 ? -1 : 1);
                }
                if (dx < 50) {
                    curve.y1 = curve.y2 = (p1.y + p2.y) * 0.5;
                }
            }
            else {
                curve.x1 = (p1.x + p2.x) / 2;
                curve.y1 = (9 * p1.y + p2.y) / 10;
                curve.x2 = (p1.x + p2.x) / 2;
                curve.y2 = (9 * p2.y + p1.y) / 10;
            }
            this._arrowP1Cache = p1;
            this._arrowP2Cache = p2;
        };
        Object.defineProperty(Shape.prototype, "arrowOpacity", {
            set: function (opacity) {
                this.arrowPath.style.opacity = opacity.toString();
            },
            enumerable: true,
            configurable: true
        });
        Shape.prototype.moveArrowTo = function (animationCallbacks, p1, p2, dir, duration, screenRect) {
            var _this = this;
            if (duration <= 0) {
                this.setArrowPosition(p1, p2, dir);
                return;
            }
            if (screenRect) {
                var R0 = this._arrowP1Cache.x < this._arrowP2Cache.x ? this._arrowP2Cache.x : this._arrowP1Cache.x;
                var L0 = this._arrowP1Cache.x < this._arrowP2Cache.x ? this._arrowP1Cache.x : this._arrowP2Cache.x;
                if (R0 < screenRect.x || L0 > screenRect.x + screenRect.width) {
                    var R1 = p1.x < p2.x ? p2.x : p1.x;
                    var L1 = p1.x < p2.x ? p1.x : p2.x;
                    if (R1 < screenRect.x || L1 > screenRect.x + screenRect.width) {
                        this.setArrowPosition(p1, p2, dir);
                        return;
                    }
                }
                if (this._arrowP2Cache.y < screenRect.y || this._arrowP1Cache.y > screenRect.y + screenRect.height) {
                    this.setArrowPosition(p1, p2, dir);
                    return;
                }
            }
            if (this._arrowP1Cache == this._arrowP2Cache && screenRect && (p2.y + this.nodeHeight < screenRect.y || p1.y > screenRect.y + screenRect.height)) {
                this.setArrowPosition(p1, p2, dir);
                return;
            }
            var P1VX = (p1.x - this._arrowP1Cache.x) / duration;
            var P1VY = (p1.y - this._arrowP1Cache.y) / duration;
            var P2VX = (p2.x - this._arrowP2Cache.x) / duration;
            var P2VY = (p2.y - this._arrowP2Cache.y) / duration;
            var CurrentP1 = this._arrowP1Cache.clone();
            var CurrentP2 = this._arrowP2Cache.clone();
            animationCallbacks.push(function (deltaT) {
                CurrentP1.x += P1VX * deltaT;
                CurrentP1.y += P1VY * deltaT;
                CurrentP2.x += P2VX * deltaT;
                CurrentP2.y += P2VY * deltaT;
                _this.setArrowPosition(CurrentP1, CurrentP2, dir);
            });
        };
        Shape.prototype.setArrowColorWhite = function (isWhite) {
            if (isWhite) {
                this.arrowPath.setAttribute("marker-end", "url(#Triangle-white)");
            }
            else {
                this.arrowPath.setAttribute("marker-end", "url(#Triangle-black)");
            }
        };
        Shape.prototype.getConnectorPosition = function (dir) {
            switch (dir) {
                case VisModelJS.Direction.Right:
                    return new VisModelJS.Point(this.nodeWidth, this.nodeHeight / 2);
                case VisModelJS.Direction.Left:
                    return new VisModelJS.Point(0, this.nodeHeight / 2);
                case VisModelJS.Direction.Top:
                    return new VisModelJS.Point(this.nodeWidth / 2, 0);
                case VisModelJS.Direction.Bottom:
                    return new VisModelJS.Point(this.nodeWidth / 2, this.nodeHeight);
                default:
                    return new VisModelJS.Point(0, 0);
            }
        };
        Shape.prototype.addColorStyle = function (colorStyleCode) {
            if (colorStyleCode) {
                if (this.colorStyles.indexOf(colorStyleCode) < 0) {
                    this.colorStyles.push(colorStyleCode);
                }
                if (this.shapeGroup) {
                    this.shapeGroup.setAttribute("class", this.colorStyles.join(" "));
                }
            }
        };
        Shape.prototype.removeColorStyle = function (ColorStyleCode) {
            if (ColorStyleCode && ColorStyleCode != VisModelJS.ColorStyle.Default) {
                var Index = this.colorStyles.indexOf(ColorStyleCode);
                if (Index > 0) {
                    this.colorStyles.splice(Index, 1);
                }
                if (this.shapeGroup) {
                    this.shapeGroup.setAttribute("class", this.colorStyles.join(" "));
                }
            }
        };
        Shape.prototype.getColorStyle = function () {
            return this.colorStyles;
        };
        Shape.prototype.setColorStyle = function (styles) {
            this.colorStyles = styles;
            if (this.colorStyles.indexOf(VisModelJS.ColorStyle.Default) < 0) {
                this.colorStyles.push(VisModelJS.ColorStyle.Default);
            }
        };
        Shape.prototype.clearColorStyle = function () {
            this.colorStyles = [VisModelJS.ColorStyle.Default];
            if (this.shapeGroup) {
                this.shapeGroup.setAttribute("class", this.colorStyles.join(" "));
            }
        };
        Shape.nodeHeightCache = {};
        Shape.defaultWidth = 150;
        Shape.arrowPathMaster = (function () {
            var Master = VisModelJS.Utils.createSVGElement("path");
            Master.setAttribute("marker-end", "url(#Triangle-black)");
            Master.setAttribute("fill", "none");
            Master.setAttribute("stroke", "gray");
            Master.setAttribute("d", "M0,0 C0,0 0,0 0,0");
            return Master;
        })();
        return Shape;
    })();
    VisModelJS.Shape = Shape;
})(VisModelJS || (VisModelJS = {}));
/// <reference path = "./pointer.d.ts" />
var VisModelJS;
(function (VisModelJS) {
    var Pointer = (function () {
        function Pointer(x, y, id) {
            this.x = x;
            this.y = y;
            this.id = id;
        }
        Pointer.prototype.setPosition = function (x, y) {
            this.x = x;
            this.y = y;
        };
        return Pointer;
    })();
    VisModelJS.Pointer = Pointer;
    /**
        Controll scroll by mouse, touch and pen and zoom by wheel.
        @class VisModelJS.ScrollManager
        @for VisModelJS.ViewportManager
    */
    var ScrollManager = (function () {
        function ScrollManager() {
            this.currentX = 0;
            this.currentY = 0;
            this.dx = 0;
            this.dy = 0;
            this.mainPointerID = null;
            this.pointers = [];
            this.timer = 0;
            this.ANIMATE_THRESHOLD = 5;
            this.SPEED_MAX = 100;
            this.onDragged = function (dx, dy) { };
        }
        ScrollManager.prototype.startDrag = function (initialX, initialY) {
            this.currentX = initialX;
            this.currentY = initialY;
        };
        ScrollManager.prototype.updateDrag = function (currentX, currentY) {
            this.dx = currentX - this.currentX;
            this.dy = currentY - this.currentY;
            var speed = this.dx * this.dx + this.dy + this.dy;
            if (speed > this.SPEED_MAX * this.SPEED_MAX) {
                this.dx *= ((this.SPEED_MAX * this.SPEED_MAX) / speed);
                this.dy *= ((this.SPEED_MAX * this.SPEED_MAX) / speed);
            }
            this.currentX = currentX;
            this.currentY = currentY;
        };
        ScrollManager.prototype.getMainPointer = function () {
            return this.pointers[this.mainPointerID];
        };
        ScrollManager.prototype.isDragging = function () {
            return this.mainPointerID != null;
        };
        ScrollManager.prototype.stopAnimation = function () {
            clearInterval(this.timer);
            this.dx = 0;
            this.dy = 0;
        };
        ScrollManager.prototype.endDrag = function () {
            this.mainPointerID = null;
        };
        ScrollManager.prototype.onPointerEvent = function (e, viewport) {
            var _this = this;
            //var Log = (e: PointerEvent) => {
            //    console.log("pointer#" + e.pointerId + " " + e.type);
            //    //console.log("#pointers " + Object.keys(this.pointers).length)
            //}
            switch (e.type) {
                case "trackstart":
                    if (!this.pointers[e.pointerId]) {
                        this.pointers[e.pointerId] = new Pointer(e.clientX, e.clientY, e.pointerId);
                        e.preventDefault();
                        e.stopPropagation();
                    }
                    break;
                case "trackend":
                    if (!this.pointers[e.pointerId]) {
                        return;
                    }
                    delete this.pointers[e.pointerId];
                    e.preventDefault();
                    e.stopPropagation();
                    //Log(e);
                    break;
                case "track":
                    if (!this.pointers[e.pointerId]) {
                        return;
                    }
                    this.pointers[e.pointerId].setPosition(e.clientX, e.clientY);
                    e.preventDefault();
                    e.stopPropagation();
                    break;
                default:
                    return;
            }
            var isTherePointer = Object.keys(this.pointers).length > 0;
            var hasDragJustStarted = isTherePointer && !this.isDragging();
            var hasDragJustEnded = !this.getMainPointer() && this.isDragging();
            if (isTherePointer) {
                if (hasDragJustStarted) {
                    this.stopAnimation();
                    this.timer = null;
                    var mainPointer = this.pointers[Object.keys(this.pointers)[0]];
                    this.mainPointerID = mainPointer.id;
                    this.startDrag(mainPointer.x, mainPointer.y);
                }
                else {
                    var mainPointer = this.getMainPointer();
                    if (mainPointer) {
                        this.updateDrag(mainPointer.x, mainPointer.y);
                        this.onDragged(this.dx, this.dy);
                    }
                    else {
                        this.endDrag();
                    }
                }
            }
            else {
                if (hasDragJustEnded) {
                    if (this.timer) {
                        this.stopAnimation();
                        this.timer = null;
                    }
                    this.timer = setInterval(function () {
                        if (Math.abs(_this.dx) < _this.ANIMATE_THRESHOLD && Math.abs(_this.dy) < _this.ANIMATE_THRESHOLD) {
                            _this.stopAnimation();
                        }
                        _this.currentX += _this.dx;
                        _this.currentY += _this.dy;
                        _this.dx *= 0.95;
                        _this.dy *= 0.95;
                        _this.onDragged(_this.dx, _this.dy);
                    }, 16);
                }
                this.endDrag();
            }
        };
        ScrollManager.prototype.onMouseWheel = function (e, screen) {
            screen.camera.scale *= 1 + e.deltaY * 0.02;
        };
        return ScrollManager;
    })();
    VisModelJS.ScrollManager = ScrollManager;
    /**
        @class VisModelJS.ViewportManager
    */
    var ViewportManager = (function (_super) {
        __extends(ViewportManager, _super);
        function ViewportManager(panel) {
            var _this = this;
            _super.call(this);
            this.panel = panel;
            this.scrollManager = new ScrollManager();
            this.cameraGx = 0;
            this.cameraGy = 0;
            this.scale = 1.0;
            this.isPointerEnabled = true;
            this.cameraMoveTask = new VisModelJS.AnimationFrameTask();
            var _viewport = this;
            var __camera = {
                get gx() { return _viewport.cameraGx; },
                set gx(value) { var camera = this; camera.setPosition(value, _viewport.cameraGy); },
                get gy() { return _viewport.cameraGy; },
                set gy(value) { var camera = this; camera.setPosition(_viewport.cameraGx, value); },
                get scale() { return _viewport.scale; },
                set scale(value) {
                    var camera = this;
                    _viewport.scale = value < camera.minScale ? camera.minScale :
                        value > camera.maxScale ? camera.maxScale :
                            value;
                    _viewport.updateAttr();
                },
                setPosition: function (gx, gy) {
                    this.setOffset(_viewport.cameraCenterPageX - gx * _viewport.scale, _viewport.cameraCenterPageY - gy * _viewport.scale);
                },
                setPositionAndScale: function (gx, gy, scale) {
                    _viewport.scale = scale;
                    this.setOffset(_viewport.cameraCenterPageX - gx * _viewport.scale, _viewport.cameraCenterPageY - gy * _viewport.scale);
                },
                get centerPageX() { return _viewport.cameraCenterPageX; },
                set centerPageX(value) { _viewport.cameraCenterPageX = value; },
                get centerPageY() { return _viewport.cameraCenterPageY; },
                set centerPageY(value) { _viewport.cameraCenterPageY = value; },
                setCenterPagePosition: function (pageX, pageY) {
                    _viewport.cameraCenterPageX = pageX;
                    _viewport.cameraCenterPageY = pageY;
                },
                limitRect: null,
                /**
                    Move camera position relatively and change scale.
                    @method Move
                    @param {number} GX Scale-independent camera relative X difference.
                    @param {number} GY Scale-independent camera relative Y difference.
                    @param {number} Scale Scale of camera. 1.0 for 100%.
                    @param {number} Duration Time for moving in millisecond.
                    @async
                */
                move: function (gx, gy, scale, duration) {
                    this.moveTo(_viewport.cameraGx + gx, _viewport.cameraGy + gy, scale, duration);
                },
                /**
                    Move camera position and scale one time.
                    @method MoveTo
                    @param {number} GX Scale-independent camera X position in GSN. 0 for leftside of topgoal.
                    @param {number} GY Scale-independent camera Y position in GSN. 0 for top of topgoal.
                    @param {number} Scale Scale of camera. 1.0 for 100%.
                    @param {number} Duration Time for moving in millisecond.
                    @async
                */
                moveTo: function (gx, gy, scale, duration) {
                    var Task = _viewport.createMoveToTaskFunction(gx, gy, scale, duration);
                    if (!Task) {
                        this.setPositionAndScale(gx, gy, scale);
                        return;
                    }
                    this.cameraMoveTask.start(duration, Task);
                },
                // private
                setOffset: function (pageX, pageY) {
                    _viewport.cameraGx = (_viewport.cameraCenterPageX - pageX) / _viewport.scale;
                    _viewport.cameraGy = (_viewport.cameraCenterPageY - pageY) / _viewport.scale;
                    this.limitPosition();
                    _viewport.updateAttr();
                },
                maxScale: 2.0,
                minScale: 0.2,
                limitPosition: function () {
                    var R = this.limitRect;
                    if (R) {
                        if (_viewport.cameraGx < R.x)
                            _viewport.cameraGx = R.x;
                        if (_viewport.cameraGy < R.y)
                            _viewport.cameraGy = R.y;
                        if (_viewport.cameraGx > R.x + R.width)
                            _viewport.cameraGx = R.x + R.width;
                        if (_viewport.cameraGy > R.y + R.height)
                            _viewport.cameraGy = R.y + R.height;
                    }
                },
                addOffset: function (pageX, pageY) {
                    _viewport.cameraGx -= pageX / _viewport.scale;
                    _viewport.cameraGy -= pageY / _viewport.scale;
                    this.limitPosition();
                    _viewport.updateAttr();
                },
                cameraMoveTask: new VisModelJS.AnimationFrameTask(),
            };
            this._camera = __camera;
            this.scrollManager.onDragged = __camera.addOffset.bind(__camera);
            window.addEventListener("resize", function (e) { _this.updatePageRect(); });
            this.updatePageSize();
            this.updatePageRect();
            this._camera.setCenterPagePosition(this.areaCenterX, this.areaCenterY);
            VisModelJS.Utils.setTransformOriginToElement(this.panel.contentLayer, "left top");
            this.updateAttr();
            var onPointer = function (e) { if (_this.isPointerEnabled) {
                _this.scrollManager.onPointerEvent(e, _this);
            } };
            ["trackstart", "trackend", "track"].forEach(function (name) {
                PolymerGestures.addEventListener(_this.panel.rootElement, name, onPointer);
            });
            var OnWheel = function (e) {
                if (_this.isPointerEnabled) {
                    e.preventDefault();
                    _this.scrollManager.onMouseWheel(e, _this);
                }
            };
            this.panel.rootElement.addEventListener('wheel', OnWheel);
        }
        Object.defineProperty(ViewportManager.prototype, "camera", {
            get: function () {
                return this._camera;
            },
            enumerable: true,
            configurable: true
        });
        ViewportManager.prototype.limitScale = function (scale) {
            return scale < this.camera.minScale ? this.camera.minScale :
                scale > this.camera.maxScale ? this.camera.maxScale :
                    scale;
        };
        Object.defineProperty(ViewportManager.prototype, "offsetPageX", {
            get: function () {
                return this.cameraCenterPageX - this.cameraGx * this.scale;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ViewportManager.prototype, "offsetPageY", {
            get: function () {
                return this.cameraCenterPageY - this.cameraGy * this.scale;
            },
            enumerable: true,
            configurable: true
        });
        /**
            Calcurate PageX from GX
            @method PageXFromGX
            @param {number} GX Scale-independent X position in GSN.
            @return {number} PageX for given GX. It is depend on camera's position, scale and vanishing point.
        */
        ViewportManager.prototype.pageXFromGX = function (gx) {
            return this.cameraCenterPageX + (gx - this.cameraGx) * this.scale;
        };
        /**
            Calcurate PageY from GY
            @method PageYFromGY
            @param {number} GY Scale-independent Y position in GSN.
            @return {number} PageY for given GY. It is depend on camera's position, scale and vanishing point.
        */
        ViewportManager.prototype.pageYFromGY = function (gy) {
            return this.cameraCenterPageY + (gy - this.cameraGy) * this.scale;
        };
        /**
            Calcurate GX from PageX
            @method GXFromPageX
            @param {number} PageX X position in web page.
            @return {number} GX for given PageX. It is depend on camera's position, scale and vanishing point.
        */
        ViewportManager.prototype.gxFromPageX = function (pageX) {
            return (pageX - this.cameraCenterPageX) / this.scale + this.cameraGx;
        };
        /**
            Calcurate GY from PageY
            @method GYFromPageY
            @param {number} PageY Y position in web page.
            @return {number} GY for given PageY. It is depend on camera's position, scale and vanishing point.
        */
        ViewportManager.prototype.gyFromPageY = function (pageY) {
            return (pageY - this.cameraCenterPageY) / this.scale + this.cameraGy;
        };
        ViewportManager.prototype.convertRectGlobalXYFromPageXY = function (pageRect) {
            var x1 = this.gxFromPageX(pageRect.x);
            var y1 = this.gyFromPageY(pageRect.y);
            var x2 = this.gxFromPageX(pageRect.x + pageRect.width);
            var y2 = this.gyFromPageY(pageRect.y + pageRect.height);
            return new VisModelJS.Rect(x1, y1, x2 - x1, y2 - y1);
        };
        Object.defineProperty(ViewportManager.prototype, "pageRectInGxGy", {
            get: function () {
                var x1 = this.gxFromPageX(0);
                var y1 = this.gyFromPageY(0);
                var x2 = this.gxFromPageX(this._areaWidth);
                var y2 = this.gyFromPageY(this._areaHeight);
                return new VisModelJS.Rect(x1, y1, x2 - x1, y2 - y1);
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ViewportManager.prototype, "areaWidth", {
            get: function () {
                return this._areaWidth;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ViewportManager.prototype, "areaHeight", {
            get: function () {
                return this._areaHeight;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ViewportManager.prototype, "areaCenterX", {
            get: function () {
                return this._areaWidth * 0.5;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(ViewportManager.prototype, "areaCenterY", {
            get: function () {
                return this._areaHeight * 0.5;
            },
            enumerable: true,
            configurable: true
        });
        ViewportManager.prototype.moveCamera = function (gx, gy, scale) {
            this.scale += scale;
            this.cameraGx += gx;
            this.cameraGy += gy;
            this.updateAttr();
        };
        ViewportManager.prototype.createMoveTaskFunction = function (gx, gy, scale, duration) {
            return this.createMoveToTaskFunction(this.cameraGx + gx, this.cameraGy + gy, scale, duration);
        };
        ViewportManager.prototype.createMoveToTaskFunction = function (gx, gy, scale, duration) {
            var _this = this;
            scale = this.limitScale(scale);
            if (duration <= 0) {
                return null;
            }
            var VX = (gx - this.cameraGx) / duration;
            var VY = (gy - this.cameraGy) / duration;
            var S0 = this.scale;
            var ScaleRate = scale / S0;
            var DInv = 1 / duration;
            var ScaleFunction = function (t) { return S0 * Math.pow(ScaleRate, t * DInv); };
            if (VY == 0 && VX == 0 && (scale == S0)) {
                return null;
            }
            return (function (deltaT, currentTime, startTime) {
                var DeltaS = ScaleFunction(currentTime - startTime) - ScaleFunction(currentTime - deltaT - startTime);
                _this.moveCamera(VX * deltaT, VY * deltaT, DeltaS);
            });
        };
        ViewportManager.prototype.updatePageSize = function () {
            var rootRect = this.panel.rootElement.getBoundingClientRect();
            this._areaWidth = rootRect.width;
            this._areaHeight = rootRect.height;
        };
        ViewportManager.prototype.updatePageRect = function () {
            var cameraCenterXRate = this.cameraCenterPageX / this._areaWidth;
            var cameraCenterYRate = this.cameraCenterPageY / this._areaHeight;
            var cameraPX = this.pageXFromGX(this.cameraGx);
            var cameraPY = this.pageYFromGY(this.cameraGy);
            this.updatePageSize();
            this.camera.setCenterPagePosition(this._areaWidth * cameraCenterXRate, this._areaHeight * cameraCenterYRate);
            this.updateAttr();
        };
        ViewportManager.createTranformAttr = function (x, y, scale) {
            return "translate(" + x + " " + y + ") scale(" + scale + ")";
        };
        ViewportManager.createTransformStyle = function (x, y, scale) {
            return "translate(" + x + "px, " + y + "px) scale(" + scale + ") ";
        };
        ViewportManager.prototype.updateAttr = function () {
            var offsetX = this.offsetPageX;
            var offsetY = this.offsetPageY;
            if (!isNaN(offsetX) && !isNaN(offsetY)) {
                var attr = ViewportManager.createTranformAttr(offsetX, offsetY, this.scale);
                var style = ViewportManager.createTransformStyle(offsetX, offsetY, this.scale);
                this.panel.SVGLayer.setAttribute("transform", attr);
                VisModelJS.Utils.setTransformToElement(this.panel.contentLayer, style);
            }
            var event = new VisModelJS.VisModelEvent();
            event.type = "cameramove";
            event.target = this;
            this.dispatchEvent(event);
        };
        return ViewportManager;
    })(VisModelJS.EventTarget);
    VisModelJS.ViewportManager = ViewportManager;
})(VisModelJS || (VisModelJS = {}));
var VisModelJS;
(function (VisModelJS) {
    var NodeViewEvent = (function (_super) {
        __extends(NodeViewEvent, _super);
        function NodeViewEvent() {
            _super.apply(this, arguments);
        }
        return NodeViewEvent;
    })(VisModelJS.VisModelEvent);
    VisModelJS.NodeViewEvent = NodeViewEvent;
    /**
        @class VisModelJS.VisualModelPanel
    */
    var VisualModelPanel = (function (_super) {
        __extends(VisualModelPanel, _super);
        function VisualModelPanel(placeHolder) {
            var _this = this;
            _super.call(this);
            this.onScreenNodeMap = {};
            this.hiddenNodeMap = {};
            // We do not use FocusedView but FocusedLabel to make it modular.
            this.foldingAnimationTask = new VisModelJS.AnimationFrameTask();
            if (!placeHolder) {
                throw new TypeError("placeHolder cannot be null.");
            }
            // Create Inner DOM
            this.rootElement = placeHolder;
            var rootStyle = this.rootElement.style;
            if (rootStyle.position == "static") {
                rootStyle.position = "relative";
            }
            rootStyle.overflow = "hidden";
            // Create SVG Layer
            this.SVGLayerBox = VisModelJS.Utils.createSVGElement("svg");
            this.makeItLayer(this.SVGLayerBox, "100%", "100%");
            this.SVGLayer = VisModelJS.Utils.createSVGElement("g");
            this.SVGLayer.className.baseVal = "vismodel-svglayer";
            this.SVGLayerConnectorGroup = VisModelJS.Utils.createSVGElement("g");
            this.SVGLayerNodeGroup = VisModelJS.Utils.createSVGElement("g");
            this.SVGLayer.appendChild(this.SVGLayerConnectorGroup);
            this.SVGLayer.appendChild(this.SVGLayerNodeGroup);
            this.SVGLayer.id = "svg-layer";
            this.SVGLayer.setAttribute("transform", "translate(0,0)");
            this.SVGLayerBox.appendChild(this.SVGLayer);
            this.rootElement.appendChild(this.SVGLayerBox);
            // Create HTML Layer
            this.eventMapLayer = document.createElement("div");
            this.contentLayer = document.createElement("div");
            this.eventMapLayer.className = "vismodel-eventmaplayer";
            this.contentLayer.className = "vismodel-contentlayer";
            this.makeItLayer(this.eventMapLayer, "100%", "100%");
            this.makeItLayer(this.contentLayer, "0px", "0px");
            this.contentLayer.style.pointerEvents = "none";
            this.rootElement.appendChild(this.eventMapLayer);
            this.rootElement.appendChild(this.contentLayer);
            // End of DOM creation
            this.hiddenNodeBuffer = document.createDocumentFragment();
            this.viewport = new VisModelJS.ViewportManager(this);
            this.layoutEngine = new VisModelJS.VerticalTreeLayoutEngine();
            this.viewport.addEventListener("cameramove", function () {
                _this.updateHiddenNodeList();
            });
            var clickEventIsHandledInViewport = false;
            var focused = false;
            document.addEventListener("click", function (event) {
                clickEventIsHandledInViewport = false;
                setTimeout(function () {
                    if (focused && !clickEventIsHandledInViewport) {
                        focused = false;
                    }
                    else if (!focused && clickEventIsHandledInViewport) {
                        focused = true;
                    }
                }, 0);
            }, true);
            this.rootElement.addEventListener("click", function (event) {
                var label = VisModelJS.Utils.getNodeLabelFromEvent(event);
                if (_this.active) {
                    _this.changeFocusedLabel(label);
                }
                clickEventIsHandledInViewport = true;
                event.preventDefault();
                event.stopPropagation();
            });
            this.contentLayer.addEventListener("dblclick", function (event) {
                var Label = VisModelJS.Utils.getNodeLabelFromEvent(event);
                if (Label) {
                    var node = _this.viewMap[Label];
                    var nodeevent = new NodeViewEvent();
                    nodeevent.type = "dblclick";
                    nodeevent.target = _this;
                    nodeevent.node = node;
                    _this.dispatchEvent(nodeevent);
                    event.stopPropagation();
                    event.preventDefault();
                }
            });
            document.addEventListener("keydown", function (event) {
                if (focused) {
                    _this.onKeyDown(event);
                }
            }, true);
            this._active = true;
        }
        VisualModelPanel.prototype.makeItLayer = function (element, width, height) {
            var style = element.style;
            style.position = "absolute";
            style.width = width;
            style.height = height;
            style.top = "0px";
            style.left = "0px";
        };
        Object.defineProperty(VisualModelPanel.prototype, "active", {
            get: function () {
                return this._active;
            },
            enumerable: true,
            configurable: true
        });
        VisualModelPanel.prototype.onKeyDown = function (event) {
            var Label;
            var handled = true;
            switch (event.keyCode) {
                case 27:
                    event.preventDefault();
                    break;
                case 13:
                    event.preventDefault();
                    break;
                case 72: /*h*/
                case 37:
                    this.navigateLeft();
                    event.preventDefault();
                    break;
                case 74: /*j*/
                case 40:
                    this.navigateDown();
                    event.preventDefault();
                    break;
                case 75: /*k*/
                case 38:
                    var Moved = this.navigateUp();
                    if (!Moved && this._focusedLabel) {
                        this.navigateParent();
                    }
                    event.preventDefault();
                    break;
                case 76: /*l*/
                case 39:
                    this.navigateRight();
                    event.preventDefault();
                    break;
                case 36:
                    this.navigateHome();
                    event.preventDefault();
                    break;
                case 187:
                    if (event.shiftKey) {
                        this.viewport.camera.scale += 0.1;
                    }
                    event.preventDefault();
                    break;
                case 189:
                    if (event.shiftKey) {
                        this.viewport.camera.scale -= 0.1;
                    }
                    event.preventDefault();
                    break;
                default:
                    handled = false;
                    break;
            }
            //if (handled) {
            //    Event.stopPropagation();
            //}
        };
        VisualModelPanel.prototype.onActivate = function () {
            this.viewport.isPointerEnabled = true;
        };
        VisualModelPanel.prototype.onDeactivate = function () {
            this.viewport.isPointerEnabled = false;
        };
        /**
            @method MoveToNearestNode
            @param {AssureNote.Direction} Dir
        */
        VisualModelPanel.prototype.moveToNearestNode = function (dir) {
            var nextNode = this.findNearestNode(this.viewMap[this._focusedLabel], dir);
            if (nextNode) {
                this.focusAndMoveToNode(nextNode);
            }
            return !!nextNode;
        };
        VisualModelPanel.prototype.focusAndMoveToNode = function (node) {
            if (node != null) {
                var nextNode = node.constructor == String ? this.viewMap[node] : node;
                if (nextNode != null) {
                    this.changeFocusedLabel(nextNode.label);
                    this.viewport.camera.moveTo(nextNode.centerGx, nextNode.centerGy, this.viewport.camera.scale, 50);
                }
            }
        };
        /**
            @method FindNearestNode
            @param {AssureNote.NodeView} CenterNode. If null is given, Camera position is used instead of the node.
            @param {AssureNote.Direction} Dir
            @return {AssureNote.NodeView} Found node. If no node is found, null is retured.
        */
        VisualModelPanel.prototype.findNearestNode = function (centerNode, dir) {
            var rightLimitVectorX = 1;
            var rightLimitVectorY = 1;
            var leftLimitVectorX = 1;
            var leftLimitVectorY = 1;
            switch (dir) {
                case VisModelJS.Direction.Right:
                    leftLimitVectorY = -1;
                    break;
                case VisModelJS.Direction.Left:
                    rightLimitVectorX = -1;
                    rightLimitVectorY = -1;
                    leftLimitVectorX = -1;
                    break;
                case VisModelJS.Direction.Top:
                    rightLimitVectorY = -1;
                    leftLimitVectorX = -1;
                    leftLimitVectorY = -1;
                    break;
                case VisModelJS.Direction.Bottom:
                    rightLimitVectorX = -1;
                    break;
            }
            var nearestNode = null;
            var currentMinimumDistanceSquere = Infinity;
            var cx = centerNode ? centerNode.centerGx : this.viewport.camera.gx;
            var cy = centerNode ? centerNode.centerGy : this.viewport.camera.gy;
            this.topNodeView.traverseVisibleNode(function (Node) {
                var dx = Node.centerGx - cx;
                var dy = Node.centerGy - cy;
                var DDotR = dx * rightLimitVectorX + dy * rightLimitVectorY;
                var DDotL = dx * leftLimitVectorX + dy * leftLimitVectorY;
                if (DDotR > 0 && DDotL > 0) {
                    var distanceSquere = dx * dx + dy * dy;
                    if (distanceSquere < currentMinimumDistanceSquere) {
                        currentMinimumDistanceSquere = distanceSquere;
                        nearestNode = Node;
                    }
                }
            });
            return nearestNode;
        };
        /**
           @method ChangeFocusedLabel
           @param {string} Label If label is null, there is no focused label.
        */
        VisualModelPanel.prototype.changeFocusedLabel = function (label) {
            //Utils.UpdateHash(Label);
            if (label == null) {
                var oldNodeView = this.viewMap[this._focusedLabel];
                if (oldNodeView != null) {
                    oldNodeView.shape.removeColorStyle(VisModelJS.ColorStyle.Highlight);
                }
                this._focusedLabel = null;
                return;
            }
            var nodeview = this.viewMap[label];
            if (nodeview != null) {
                var oldNodeView = this.viewMap[this._focusedLabel];
                if (oldNodeView != null) {
                    oldNodeView.shape.removeColorStyle(VisModelJS.ColorStyle.Highlight);
                }
                this._focusedLabel = label;
                nodeview.shape.addColorStyle(VisModelJS.ColorStyle.Highlight);
            }
        };
        Object.defineProperty(VisualModelPanel.prototype, "focusedLabel", {
            get: function () {
                return this._focusedLabel;
            },
            enumerable: true,
            configurable: true
        });
        VisualModelPanel.prototype.initializeView = function (nodeView) {
            this.topNodeView = nodeView;
            this.viewMap = {};
            this.topNodeView.UpdateViewMap(this.viewMap);
        };
        VisualModelPanel.prototype.draw = function (label, duration, fixedNode) {
            var _this = this;
            var t0 = VisModelJS.Utils.getTime();
            this.clear();
            var t1 = VisModelJS.Utils.getTime();
            //console.log("Clear: " + (t1 - t0));
            var target = this.viewMap[label];
            if (target == null) {
                target = this.topNodeView;
            }
            var fixedNodeGX0;
            var fixedNodeGY0;
            var fixedNodeDX;
            var fixedNodeDY;
            if (fixedNode) {
                fixedNodeGX0 = fixedNode.gx;
                fixedNodeGY0 = fixedNode.gy;
            }
            this.layoutEngine.doLayout(this, target);
            this.contentLayer.style.display = "none";
            this.SVGLayer.style.display = "none";
            //GSNShape.__Debug_Animation_SkippedNodeCount = 0;
            //GSNShape.__Debug_Animation_TotalNodeCount = 0;
            this.foldingAnimationTask.cancel(true);
            VisModelJS.TreeNodeView.setGlobalPositionCacheEnabled(true);
            var foldingAnimationCallbacks = [];
            var pageRect = this.viewport.pageRectInGxGy;
            if (fixedNode) {
                fixedNodeDX = fixedNode.gx - fixedNodeGX0;
                fixedNodeDY = fixedNode.gy - fixedNodeGY0;
                if (fixedNodeDX > 0) {
                    pageRect.width += fixedNodeDX;
                }
                else {
                    pageRect.width -= fixedNodeDX;
                    pageRect.x += fixedNodeDX;
                }
                var Scale = this.viewport.camera.scale;
                var Task = this.viewport.createMoveTaskFunction(fixedNodeDX, fixedNodeDY, Scale, duration);
                if (Task) {
                    foldingAnimationCallbacks.push(Task);
                }
                else {
                    foldingAnimationCallbacks.push(function () { _this.updateHiddenNodeList(); });
                }
            }
            else {
                foldingAnimationCallbacks.push(function () { _this.updateHiddenNodeList(); });
            }
            var t2 = VisModelJS.Utils.getTime();
            target.updateNodePosition(foldingAnimationCallbacks, duration, pageRect);
            target.clearAnimationCache();
            var t3 = VisModelJS.Utils.getTime();
            //console.log("Update: " + (t3 - t2));
            this.foldingAnimationTask.startMany(duration, foldingAnimationCallbacks);
            var Shape = target.shape;
            this.viewport.camera.limitRect = new VisModelJS.Rect(Shape.treeLeftLocalX - 100, -100, Shape.treeWidth + 200, Shape.treeHeight + 200);
            this.topNodeView.traverseVisibleNode(function (Node) {
                if (Node.isInRect(pageRect)) {
                    _this.onScreenNodeMap[Node.label] = Node;
                }
                else {
                    _this.hiddenNodeMap[Node.label] = Node;
                    _this.hiddenNodeBuffer.appendChild(Node.shape.content);
                    _this.hiddenNodeBuffer.appendChild(Node.shape.shapeGroup);
                }
            });
            VisModelJS.TreeNodeView.setGlobalPositionCacheEnabled(false);
            this.contentLayer.style.display = "";
            this.SVGLayer.style.display = "";
            //console.log("Animation: " + GSNShape.__Debug_Animation_TotalNodeCount + " nodes moved, " +
            //    GSNShape.__Debug_Animation_SkippedNodeCount + " nodes skipped. reduce rate = " +
            //    GSNShape.__Debug_Animation_SkippedNodeCount / GSNShape.__Debug_Animation_TotalNodeCount);
        };
        VisualModelPanel.prototype.forceAppendAllOutOfScreenNode = function () {
            var _this = this;
            var UpdateArrow = function (node) {
                if (node.parent) {
                    var Arrow = node.shape.arrowPath;
                    if (Arrow.parentNode != _this.hiddenNodeBuffer) {
                        _this.hiddenNodeBuffer.appendChild(Arrow);
                    }
                }
            };
            for (var label in this.hiddenNodeMap) {
                var node = this.hiddenNodeMap[label];
                delete this.hiddenNodeMap[label];
                this.onScreenNodeMap[label] = node;
                this.contentLayer.appendChild(node.shape.content);
                this.SVGLayerNodeGroup.appendChild(node.shape.shapeGroup);
                UpdateArrow(node);
            }
        };
        VisualModelPanel.prototype.updateHiddenNodeList = function () {
            var _this = this;
            VisModelJS.TreeNodeView.setGlobalPositionCacheEnabled(true);
            var pageRect = this.viewport.pageRectInGxGy;
            var updateArrow = function (node) {
                if (node.parent) {
                    var arrow = node.shape.arrowPath;
                    if (node.isConnectorInRect(pageRect)) {
                        if (arrow.parentNode != _this.SVGLayerConnectorGroup) {
                            _this.SVGLayerConnectorGroup.appendChild(arrow);
                        }
                    }
                    else {
                        if (arrow.parentNode != _this.hiddenNodeBuffer) {
                            _this.hiddenNodeBuffer.appendChild(arrow);
                        }
                    }
                }
            };
            for (var label in this.onScreenNodeMap) {
                var node = this.onScreenNodeMap[label];
                if (!node.isInRect(pageRect)) {
                    delete this.onScreenNodeMap[label];
                    this.hiddenNodeMap[label] = node;
                    this.hiddenNodeBuffer.appendChild(node.shape.content);
                    this.hiddenNodeBuffer.appendChild(node.shape.shapeGroup);
                }
                updateArrow(node);
            }
            for (var label in this.hiddenNodeMap) {
                var node = this.hiddenNodeMap[label];
                if (node.isInRect(pageRect)) {
                    delete this.hiddenNodeMap[label];
                    this.onScreenNodeMap[label] = node;
                    this.contentLayer.appendChild(node.shape.content);
                    this.SVGLayerNodeGroup.appendChild(node.shape.shapeGroup);
                }
                updateArrow(node);
            }
            VisModelJS.TreeNodeView.setGlobalPositionCacheEnabled(false);
            ////console.log("Visible:Hidden = " + Object.keys(this.OnScreenNodeMap).length + ":" + Object.keys(this.HiddenNodeMap).length);
        };
        VisualModelPanel.prototype.clear = function () {
            this.rootElement.style.display = "none";
            this.contentLayer.innerHTML = "";
            this.SVGLayer.removeChild(this.SVGLayerConnectorGroup);
            this.SVGLayer.removeChild(this.SVGLayerNodeGroup);
            this.SVGLayerConnectorGroup = VisModelJS.Utils.createSVGElement("g");
            this.SVGLayerNodeGroup = VisModelJS.Utils.createSVGElement("g");
            this.SVGLayer.appendChild(this.SVGLayerConnectorGroup);
            this.SVGLayer.appendChild(this.SVGLayerNodeGroup);
            this.hiddenNodeMap = {};
            this.onScreenNodeMap = {};
            this.hiddenNodeBuffer = document.createDocumentFragment();
            this.rootElement.style.display = "";
        };
        Object.defineProperty(VisualModelPanel.prototype, "focusedView", {
            get: function () {
                if (this.viewMap) {
                    return this.viewMap[this._focusedLabel];
                }
                return null;
            },
            enumerable: true,
            configurable: true
        });
        VisualModelPanel.prototype.navigateUp = function () {
            return this.moveToNearestNode(VisModelJS.Direction.Top);
        };
        VisualModelPanel.prototype.navigateDown = function () {
            return this.moveToNearestNode(VisModelJS.Direction.Bottom);
        };
        VisualModelPanel.prototype.navigateLeft = function () {
            return this.moveToNearestNode(VisModelJS.Direction.Left);
        };
        VisualModelPanel.prototype.navigateRight = function () {
            return this.moveToNearestNode(VisModelJS.Direction.Right);
        };
        VisualModelPanel.prototype.navigateHome = function () {
            this.focusAndMoveToNode(this.topNodeView);
        };
        VisualModelPanel.prototype.navigateParent = function () {
            if (this._focusedLabel) {
                var Parent = this.viewMap[this._focusedLabel].parent;
                if (Parent) {
                    this.focusAndMoveToNode(this.viewMap[this._focusedLabel].parent);
                    return;
                }
            }
            this.focusAndMoveToNode(this.topNodeView);
        };
        return VisualModelPanel;
    })(VisModelJS.EventTarget);
    VisModelJS.VisualModelPanel = VisualModelPanel;
})(VisModelJS || (VisModelJS = {}));

var pegOperator = {
  "NonTerminal": "#NonTerminal"
}

var pegClass = {
  "NonTerminal": "nez-nonterminal"
}

var PegNodeShape = (function (_super) {
    __extends(PegNodeShape, _super);
    function PegNodeShape() {
        _super.apply(this, arguments);
    }
    PegNodeShape.prototype.prepareHTMLContent = function () {
        if (this.content == null) {
            var div = document.createElement("div");
            this.content = div;

            div.id = this.nodeView.label;
            div.setAttribute("data-nodelabel", this.nodeView.label);

            if (this.nodeView.label) {
                var h4 = document.createElement("h4");
                h4.textContent = "#" + this.nodeView.label.split("#")[1];
                if (h4.textContent === pegOperator.NonTerminal){
                  div.setAttribute("class", pegClass.NonTerminal)
                }
                div.appendChild(h4);
            }
            if (this.nodeView.content) {
                var p = document.createElement("p");
                p.textContent = this.nodeView.content.trim();
                div.appendChild(p);
            }
            this.updateHtmlClass();
        }
    };

    PegNodeShape.prototype.prepareSVGContent = function () {
        _super.prototype.prepareSVGContent.call(this);
        this.BodyRect = VisModelJS.Utils.createSVGElement("rect");
        this.shapeGroup.appendChild(this.BodyRect);
        if (this.nodeView.folded) {
            this.shapeGroup.appendChild(PegNodeShape.ModuleSymbolMaster.cloneNode());
        }
    };

    PegNodeShape.prototype.fitSizeToContent = function () {
        this.BodyRect.setAttribute("width", this.nodeWidth.toString());
        this.BodyRect.setAttribute("height", this.nodeHeight.toString());
        if (this.nodeView.childNodes == null && !this.nodeView.folded) {
            var x = (this.nodeWidth / 2).toString();
            var y = (this.nodeHeight + 20).toString();
        }
    };

    PegNodeShape.prototype.updateHtmlClass = function () {
        this.content.className = "node node-peg";
    };
    PegNodeShape.ModuleSymbolMaster = (function () {
        var Master = VisModelJS.Utils.createSVGElement("rect");
        Master.setAttribute("width", "80px");
        Master.setAttribute("height", "13px");
        Master.setAttribute("y", "-13px");
        return Master;
    })();
    return PegNodeShape;
})(VisModelJS.Shape);

var PegShapeFactory = (function (_super) {
    __extends(PegShapeFactory, _super);
    function PegShapeFactory() {
        _super.apply(this, arguments);
    }
    PegShapeFactory.prototype.createShape = function (Node) {
        return new PegNodeShape(Node);
    };
    return PegShapeFactory;
})(VisModelJS.ShapeFactory);

VisModelJS.ShapeFactory.setFactory(new PegShapeFactory());

VisModelJS.createNodeViewFromP4DJson = function () {
    var i = 0;
    return function (json) {
        var node = new VisModelJS.TreeNodeView();
        node.label = (i++).toString() + "#" + json.tag;
        if (json.value) {
            if (json.value.constructor.name == "Array") {
                json.value.forEach(function (json) {
                    node.appendChild(VisModelJS.createNodeViewFromP4DJson(json));
                });
            } else if (json.value.constructor.name == "String") {
                node.content = json.value.toString();
            } else {
                node.appendChild(VisModelJS.createNodeViewFromP4DJson(json.value));
            }
        }
        return node;
    };
}();


module.exports = VisModelJS
