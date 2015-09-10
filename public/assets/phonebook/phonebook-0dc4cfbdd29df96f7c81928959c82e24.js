/*! jQuery v2.1.1 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */

!function(a,b){"object"==typeof module&&"object"==typeof module.exports?module.exports=a.document?b(a,!0):function(a){if(!a.document)throw new Error("jQuery requires a window with a document");return b(a)}:b(a)}("undefined"!=typeof window?window:this,function(a,b){var c=[],d=c.slice,e=c.concat,f=c.push,g=c.indexOf,h={},i=h.toString,j=h.hasOwnProperty,k={},l=a.document,m="2.1.1",n=function(a,b){return new n.fn.init(a,b)},o=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,p=/^-ms-/,q=/-([\da-z])/gi,r=function(a,b){return b.toUpperCase()};n.fn=n.prototype={jquery:m,constructor:n,selector:"",length:0,toArray:function(){return d.call(this)},get:function(a){return null!=a?0>a?this[a+this.length]:this[a]:d.call(this)},pushStack:function(a){var b=n.merge(this.constructor(),a);return b.prevObject=this,b.context=this.context,b},each:function(a,b){return n.each(this,a,b)},map:function(a){return this.pushStack(n.map(this,function(b,c){return a.call(b,c,b)}))},slice:function(){return this.pushStack(d.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(a){var b=this.length,c=+a+(0>a?b:0);return this.pushStack(c>=0&&b>c?[this[c]]:[])},end:function(){return this.prevObject||this.constructor(null)},push:f,sort:c.sort,splice:c.splice},n.extend=n.fn.extend=function(){var a,b,c,d,e,f,g=arguments[0]||{},h=1,i=arguments.length,j=!1;for("boolean"==typeof g&&(j=g,g=arguments[h]||{},h++),"object"==typeof g||n.isFunction(g)||(g={}),h===i&&(g=this,h--);i>h;h++)if(null!=(a=arguments[h]))for(b in a)c=g[b],d=a[b],g!==d&&(j&&d&&(n.isPlainObject(d)||(e=n.isArray(d)))?(e?(e=!1,f=c&&n.isArray(c)?c:[]):f=c&&n.isPlainObject(c)?c:{},g[b]=n.extend(j,f,d)):void 0!==d&&(g[b]=d));return g},n.extend({expando:"jQuery"+(m+Math.random()).replace(/\D/g,""),isReady:!0,error:function(a){throw new Error(a)},noop:function(){},isFunction:function(a){return"function"===n.type(a)},isArray:Array.isArray,isWindow:function(a){return null!=a&&a===a.window},isNumeric:function(a){return!n.isArray(a)&&a-parseFloat(a)>=0},isPlainObject:function(a){return"object"!==n.type(a)||a.nodeType||n.isWindow(a)?!1:a.constructor&&!j.call(a.constructor.prototype,"isPrototypeOf")?!1:!0},isEmptyObject:function(a){var b;for(b in a)return!1;return!0},type:function(a){return null==a?a+"":"object"==typeof a||"function"==typeof a?h[i.call(a)]||"object":typeof a},globalEval:function(a){var b,c=eval;a=n.trim(a),a&&(1===a.indexOf("use strict")?(b=l.createElement("script"),b.text=a,l.head.appendChild(b).parentNode.removeChild(b)):c(a))},camelCase:function(a){return a.replace(p,"ms-").replace(q,r)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toLowerCase()===b.toLowerCase()},each:function(a,b,c){var d,e=0,f=a.length,g=s(a);if(c){if(g){for(;f>e;e++)if(d=b.apply(a[e],c),d===!1)break}else for(e in a)if(d=b.apply(a[e],c),d===!1)break}else if(g){for(;f>e;e++)if(d=b.call(a[e],e,a[e]),d===!1)break}else for(e in a)if(d=b.call(a[e],e,a[e]),d===!1)break;return a},trim:function(a){return null==a?"":(a+"").replace(o,"")},makeArray:function(a,b){var c=b||[];return null!=a&&(s(Object(a))?n.merge(c,"string"==typeof a?[a]:a):f.call(c,a)),c},inArray:function(a,b,c){return null==b?-1:g.call(b,a,c)},merge:function(a,b){for(var c=+b.length,d=0,e=a.length;c>d;d++)a[e++]=b[d];return a.length=e,a},grep:function(a,b,c){for(var d,e=[],f=0,g=a.length,h=!c;g>f;f++)d=!b(a[f],f),d!==h&&e.push(a[f]);return e},map:function(a,b,c){var d,f=0,g=a.length,h=s(a),i=[];if(h)for(;g>f;f++)d=b(a[f],f,c),null!=d&&i.push(d);else for(f in a)d=b(a[f],f,c),null!=d&&i.push(d);return e.apply([],i)},guid:1,proxy:function(a,b){var c,e,f;return"string"==typeof b&&(c=a[b],b=a,a=c),n.isFunction(a)?(e=d.call(arguments,2),f=function(){return a.apply(b||this,e.concat(d.call(arguments)))},f.guid=a.guid=a.guid||n.guid++,f):void 0},now:Date.now,support:k}),n.each("Boolean Number String Function Array Date RegExp Object Error".split(" "),function(a,b){h["[object "+b+"]"]=b.toLowerCase()});function s(a){var b=a.length,c=n.type(a);return"function"===c||n.isWindow(a)?!1:1===a.nodeType&&b?!0:"array"===c||0===b||"number"==typeof b&&b>0&&b-1 in a}var t=function(a){var b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u="sizzle"+-new Date,v=a.document,w=0,x=0,y=gb(),z=gb(),A=gb(),B=function(a,b){return a===b&&(l=!0),0},C="undefined",D=1<<31,E={}.hasOwnProperty,F=[],G=F.pop,H=F.push,I=F.push,J=F.slice,K=F.indexOf||function(a){for(var b=0,c=this.length;c>b;b++)if(this[b]===a)return b;return-1},L="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",M="[\\x20\\t\\r\\n\\f]",N="(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",O=N.replace("w","w#"),P="\\["+M+"*("+N+")(?:"+M+"*([*^$|!~]?=)"+M+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+O+"))|)"+M+"*\\]",Q=":("+N+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+P+")*)|.*)\\)|)",R=new RegExp("^"+M+"+|((?:^|[^\\\\])(?:\\\\.)*)"+M+"+$","g"),S=new RegExp("^"+M+"*,"+M+"*"),T=new RegExp("^"+M+"*([>+~]|"+M+")"+M+"*"),U=new RegExp("="+M+"*([^\\]'\"]*?)"+M+"*\\]","g"),V=new RegExp(Q),W=new RegExp("^"+O+"$"),X={ID:new RegExp("^#("+N+")"),CLASS:new RegExp("^\\.("+N+")"),TAG:new RegExp("^("+N.replace("w","w*")+")"),ATTR:new RegExp("^"+P),PSEUDO:new RegExp("^"+Q),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+M+"*(even|odd|(([+-]|)(\\d*)n|)"+M+"*(?:([+-]|)"+M+"*(\\d+)|))"+M+"*\\)|)","i"),bool:new RegExp("^(?:"+L+")$","i"),needsContext:new RegExp("^"+M+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+M+"*((?:-\\d)?\\d*)"+M+"*\\)|)(?=[^-]|$)","i")},Y=/^(?:input|select|textarea|button)$/i,Z=/^h\d$/i,$=/^[^{]+\{\s*\[native \w/,_=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,ab=/[+~]/,bb=/'|\\/g,cb=new RegExp("\\\\([\\da-f]{1,6}"+M+"?|("+M+")|.)","ig"),db=function(a,b,c){var d="0x"+b-65536;return d!==d||c?b:0>d?String.fromCharCode(d+65536):String.fromCharCode(d>>10|55296,1023&d|56320)};try{I.apply(F=J.call(v.childNodes),v.childNodes),F[v.childNodes.length].nodeType}catch(eb){I={apply:F.length?function(a,b){H.apply(a,J.call(b))}:function(a,b){var c=a.length,d=0;while(a[c++]=b[d++]);a.length=c-1}}}function fb(a,b,d,e){var f,h,j,k,l,o,r,s,w,x;if((b?b.ownerDocument||b:v)!==n&&m(b),b=b||n,d=d||[],!a||"string"!=typeof a)return d;if(1!==(k=b.nodeType)&&9!==k)return[];if(p&&!e){if(f=_.exec(a))if(j=f[1]){if(9===k){if(h=b.getElementById(j),!h||!h.parentNode)return d;if(h.id===j)return d.push(h),d}else if(b.ownerDocument&&(h=b.ownerDocument.getElementById(j))&&t(b,h)&&h.id===j)return d.push(h),d}else{if(f[2])return I.apply(d,b.getElementsByTagName(a)),d;if((j=f[3])&&c.getElementsByClassName&&b.getElementsByClassName)return I.apply(d,b.getElementsByClassName(j)),d}if(c.qsa&&(!q||!q.test(a))){if(s=r=u,w=b,x=9===k&&a,1===k&&"object"!==b.nodeName.toLowerCase()){o=g(a),(r=b.getAttribute("id"))?s=r.replace(bb,"\\$&"):b.setAttribute("id",s),s="[id='"+s+"'] ",l=o.length;while(l--)o[l]=s+qb(o[l]);w=ab.test(a)&&ob(b.parentNode)||b,x=o.join(",")}if(x)try{return I.apply(d,w.querySelectorAll(x)),d}catch(y){}finally{r||b.removeAttribute("id")}}}return i(a.replace(R,"$1"),b,d,e)}function gb(){var a=[];function b(c,e){return a.push(c+" ")>d.cacheLength&&delete b[a.shift()],b[c+" "]=e}return b}function hb(a){return a[u]=!0,a}function ib(a){var b=n.createElement("div");try{return!!a(b)}catch(c){return!1}finally{b.parentNode&&b.parentNode.removeChild(b),b=null}}function jb(a,b){var c=a.split("|"),e=a.length;while(e--)d.attrHandle[c[e]]=b}function kb(a,b){var c=b&&a,d=c&&1===a.nodeType&&1===b.nodeType&&(~b.sourceIndex||D)-(~a.sourceIndex||D);if(d)return d;if(c)while(c=c.nextSibling)if(c===b)return-1;return a?1:-1}function lb(a){return function(b){var c=b.nodeName.toLowerCase();return"input"===c&&b.type===a}}function mb(a){return function(b){var c=b.nodeName.toLowerCase();return("input"===c||"button"===c)&&b.type===a}}function nb(a){return hb(function(b){return b=+b,hb(function(c,d){var e,f=a([],c.length,b),g=f.length;while(g--)c[e=f[g]]&&(c[e]=!(d[e]=c[e]))})})}function ob(a){return a&&typeof a.getElementsByTagName!==C&&a}c=fb.support={},f=fb.isXML=function(a){var b=a&&(a.ownerDocument||a).documentElement;return b?"HTML"!==b.nodeName:!1},m=fb.setDocument=function(a){var b,e=a?a.ownerDocument||a:v,g=e.defaultView;return e!==n&&9===e.nodeType&&e.documentElement?(n=e,o=e.documentElement,p=!f(e),g&&g!==g.top&&(g.addEventListener?g.addEventListener("unload",function(){m()},!1):g.attachEvent&&g.attachEvent("onunload",function(){m()})),c.attributes=ib(function(a){return a.className="i",!a.getAttribute("className")}),c.getElementsByTagName=ib(function(a){return a.appendChild(e.createComment("")),!a.getElementsByTagName("*").length}),c.getElementsByClassName=$.test(e.getElementsByClassName)&&ib(function(a){return a.innerHTML="<div class='a'></div><div class='a i'></div>",a.firstChild.className="i",2===a.getElementsByClassName("i").length}),c.getById=ib(function(a){return o.appendChild(a).id=u,!e.getElementsByName||!e.getElementsByName(u).length}),c.getById?(d.find.ID=function(a,b){if(typeof b.getElementById!==C&&p){var c=b.getElementById(a);return c&&c.parentNode?[c]:[]}},d.filter.ID=function(a){var b=a.replace(cb,db);return function(a){return a.getAttribute("id")===b}}):(delete d.find.ID,d.filter.ID=function(a){var b=a.replace(cb,db);return function(a){var c=typeof a.getAttributeNode!==C&&a.getAttributeNode("id");return c&&c.value===b}}),d.find.TAG=c.getElementsByTagName?function(a,b){return typeof b.getElementsByTagName!==C?b.getElementsByTagName(a):void 0}:function(a,b){var c,d=[],e=0,f=b.getElementsByTagName(a);if("*"===a){while(c=f[e++])1===c.nodeType&&d.push(c);return d}return f},d.find.CLASS=c.getElementsByClassName&&function(a,b){return typeof b.getElementsByClassName!==C&&p?b.getElementsByClassName(a):void 0},r=[],q=[],(c.qsa=$.test(e.querySelectorAll))&&(ib(function(a){a.innerHTML="<select msallowclip=''><option selected=''></option></select>",a.querySelectorAll("[msallowclip^='']").length&&q.push("[*^$]="+M+"*(?:''|\"\")"),a.querySelectorAll("[selected]").length||q.push("\\["+M+"*(?:value|"+L+")"),a.querySelectorAll(":checked").length||q.push(":checked")}),ib(function(a){var b=e.createElement("input");b.setAttribute("type","hidden"),a.appendChild(b).setAttribute("name","D"),a.querySelectorAll("[name=d]").length&&q.push("name"+M+"*[*^$|!~]?="),a.querySelectorAll(":enabled").length||q.push(":enabled",":disabled"),a.querySelectorAll("*,:x"),q.push(",.*:")})),(c.matchesSelector=$.test(s=o.matches||o.webkitMatchesSelector||o.mozMatchesSelector||o.oMatchesSelector||o.msMatchesSelector))&&ib(function(a){c.disconnectedMatch=s.call(a,"div"),s.call(a,"[s!='']:x"),r.push("!=",Q)}),q=q.length&&new RegExp(q.join("|")),r=r.length&&new RegExp(r.join("|")),b=$.test(o.compareDocumentPosition),t=b||$.test(o.contains)?function(a,b){var c=9===a.nodeType?a.documentElement:a,d=b&&b.parentNode;return a===d||!(!d||1!==d.nodeType||!(c.contains?c.contains(d):a.compareDocumentPosition&&16&a.compareDocumentPosition(d)))}:function(a,b){if(b)while(b=b.parentNode)if(b===a)return!0;return!1},B=b?function(a,b){if(a===b)return l=!0,0;var d=!a.compareDocumentPosition-!b.compareDocumentPosition;return d?d:(d=(a.ownerDocument||a)===(b.ownerDocument||b)?a.compareDocumentPosition(b):1,1&d||!c.sortDetached&&b.compareDocumentPosition(a)===d?a===e||a.ownerDocument===v&&t(v,a)?-1:b===e||b.ownerDocument===v&&t(v,b)?1:k?K.call(k,a)-K.call(k,b):0:4&d?-1:1)}:function(a,b){if(a===b)return l=!0,0;var c,d=0,f=a.parentNode,g=b.parentNode,h=[a],i=[b];if(!f||!g)return a===e?-1:b===e?1:f?-1:g?1:k?K.call(k,a)-K.call(k,b):0;if(f===g)return kb(a,b);c=a;while(c=c.parentNode)h.unshift(c);c=b;while(c=c.parentNode)i.unshift(c);while(h[d]===i[d])d++;return d?kb(h[d],i[d]):h[d]===v?-1:i[d]===v?1:0},e):n},fb.matches=function(a,b){return fb(a,null,null,b)},fb.matchesSelector=function(a,b){if((a.ownerDocument||a)!==n&&m(a),b=b.replace(U,"='$1']"),!(!c.matchesSelector||!p||r&&r.test(b)||q&&q.test(b)))try{var d=s.call(a,b);if(d||c.disconnectedMatch||a.document&&11!==a.document.nodeType)return d}catch(e){}return fb(b,n,null,[a]).length>0},fb.contains=function(a,b){return(a.ownerDocument||a)!==n&&m(a),t(a,b)},fb.attr=function(a,b){(a.ownerDocument||a)!==n&&m(a);var e=d.attrHandle[b.toLowerCase()],f=e&&E.call(d.attrHandle,b.toLowerCase())?e(a,b,!p):void 0;return void 0!==f?f:c.attributes||!p?a.getAttribute(b):(f=a.getAttributeNode(b))&&f.specified?f.value:null},fb.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)},fb.uniqueSort=function(a){var b,d=[],e=0,f=0;if(l=!c.detectDuplicates,k=!c.sortStable&&a.slice(0),a.sort(B),l){while(b=a[f++])b===a[f]&&(e=d.push(f));while(e--)a.splice(d[e],1)}return k=null,a},e=fb.getText=function(a){var b,c="",d=0,f=a.nodeType;if(f){if(1===f||9===f||11===f){if("string"==typeof a.textContent)return a.textContent;for(a=a.firstChild;a;a=a.nextSibling)c+=e(a)}else if(3===f||4===f)return a.nodeValue}else while(b=a[d++])c+=e(b);return c},d=fb.selectors={cacheLength:50,createPseudo:hb,match:X,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(a){return a[1]=a[1].replace(cb,db),a[3]=(a[3]||a[4]||a[5]||"").replace(cb,db),"~="===a[2]&&(a[3]=" "+a[3]+" "),a.slice(0,4)},CHILD:function(a){return a[1]=a[1].toLowerCase(),"nth"===a[1].slice(0,3)?(a[3]||fb.error(a[0]),a[4]=+(a[4]?a[5]+(a[6]||1):2*("even"===a[3]||"odd"===a[3])),a[5]=+(a[7]+a[8]||"odd"===a[3])):a[3]&&fb.error(a[0]),a},PSEUDO:function(a){var b,c=!a[6]&&a[2];return X.CHILD.test(a[0])?null:(a[3]?a[2]=a[4]||a[5]||"":c&&V.test(c)&&(b=g(c,!0))&&(b=c.indexOf(")",c.length-b)-c.length)&&(a[0]=a[0].slice(0,b),a[2]=c.slice(0,b)),a.slice(0,3))}},filter:{TAG:function(a){var b=a.replace(cb,db).toLowerCase();return"*"===a?function(){return!0}:function(a){return a.nodeName&&a.nodeName.toLowerCase()===b}},CLASS:function(a){var b=y[a+" "];return b||(b=new RegExp("(^|"+M+")"+a+"("+M+"|$)"))&&y(a,function(a){return b.test("string"==typeof a.className&&a.className||typeof a.getAttribute!==C&&a.getAttribute("class")||"")})},ATTR:function(a,b,c){return function(d){var e=fb.attr(d,a);return null==e?"!="===b:b?(e+="","="===b?e===c:"!="===b?e!==c:"^="===b?c&&0===e.indexOf(c):"*="===b?c&&e.indexOf(c)>-1:"$="===b?c&&e.slice(-c.length)===c:"~="===b?(" "+e+" ").indexOf(c)>-1:"|="===b?e===c||e.slice(0,c.length+1)===c+"-":!1):!0}},CHILD:function(a,b,c,d,e){var f="nth"!==a.slice(0,3),g="last"!==a.slice(-4),h="of-type"===b;return 1===d&&0===e?function(a){return!!a.parentNode}:function(b,c,i){var j,k,l,m,n,o,p=f!==g?"nextSibling":"previousSibling",q=b.parentNode,r=h&&b.nodeName.toLowerCase(),s=!i&&!h;if(q){if(f){while(p){l=b;while(l=l[p])if(h?l.nodeName.toLowerCase()===r:1===l.nodeType)return!1;o=p="only"===a&&!o&&"nextSibling"}return!0}if(o=[g?q.firstChild:q.lastChild],g&&s){k=q[u]||(q[u]={}),j=k[a]||[],n=j[0]===w&&j[1],m=j[0]===w&&j[2],l=n&&q.childNodes[n];while(l=++n&&l&&l[p]||(m=n=0)||o.pop())if(1===l.nodeType&&++m&&l===b){k[a]=[w,n,m];break}}else if(s&&(j=(b[u]||(b[u]={}))[a])&&j[0]===w)m=j[1];else while(l=++n&&l&&l[p]||(m=n=0)||o.pop())if((h?l.nodeName.toLowerCase()===r:1===l.nodeType)&&++m&&(s&&((l[u]||(l[u]={}))[a]=[w,m]),l===b))break;return m-=e,m===d||m%d===0&&m/d>=0}}},PSEUDO:function(a,b){var c,e=d.pseudos[a]||d.setFilters[a.toLowerCase()]||fb.error("unsupported pseudo: "+a);return e[u]?e(b):e.length>1?(c=[a,a,"",b],d.setFilters.hasOwnProperty(a.toLowerCase())?hb(function(a,c){var d,f=e(a,b),g=f.length;while(g--)d=K.call(a,f[g]),a[d]=!(c[d]=f[g])}):function(a){return e(a,0,c)}):e}},pseudos:{not:hb(function(a){var b=[],c=[],d=h(a.replace(R,"$1"));return d[u]?hb(function(a,b,c,e){var f,g=d(a,null,e,[]),h=a.length;while(h--)(f=g[h])&&(a[h]=!(b[h]=f))}):function(a,e,f){return b[0]=a,d(b,null,f,c),!c.pop()}}),has:hb(function(a){return function(b){return fb(a,b).length>0}}),contains:hb(function(a){return function(b){return(b.textContent||b.innerText||e(b)).indexOf(a)>-1}}),lang:hb(function(a){return W.test(a||"")||fb.error("unsupported lang: "+a),a=a.replace(cb,db).toLowerCase(),function(b){var c;do if(c=p?b.lang:b.getAttribute("xml:lang")||b.getAttribute("lang"))return c=c.toLowerCase(),c===a||0===c.indexOf(a+"-");while((b=b.parentNode)&&1===b.nodeType);return!1}}),target:function(b){var c=a.location&&a.location.hash;return c&&c.slice(1)===b.id},root:function(a){return a===o},focus:function(a){return a===n.activeElement&&(!n.hasFocus||n.hasFocus())&&!!(a.type||a.href||~a.tabIndex)},enabled:function(a){return a.disabled===!1},disabled:function(a){return a.disabled===!0},checked:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&!!a.checked||"option"===b&&!!a.selected},selected:function(a){return a.parentNode&&a.parentNode.selectedIndex,a.selected===!0},empty:function(a){for(a=a.firstChild;a;a=a.nextSibling)if(a.nodeType<6)return!1;return!0},parent:function(a){return!d.pseudos.empty(a)},header:function(a){return Z.test(a.nodeName)},input:function(a){return Y.test(a.nodeName)},button:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&"button"===a.type||"button"===b},text:function(a){var b;return"input"===a.nodeName.toLowerCase()&&"text"===a.type&&(null==(b=a.getAttribute("type"))||"text"===b.toLowerCase())},first:nb(function(){return[0]}),last:nb(function(a,b){return[b-1]}),eq:nb(function(a,b,c){return[0>c?c+b:c]}),even:nb(function(a,b){for(var c=0;b>c;c+=2)a.push(c);return a}),odd:nb(function(a,b){for(var c=1;b>c;c+=2)a.push(c);return a}),lt:nb(function(a,b,c){for(var d=0>c?c+b:c;--d>=0;)a.push(d);return a}),gt:nb(function(a,b,c){for(var d=0>c?c+b:c;++d<b;)a.push(d);return a})}},d.pseudos.nth=d.pseudos.eq;for(b in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})d.pseudos[b]=lb(b);for(b in{submit:!0,reset:!0})d.pseudos[b]=mb(b);function pb(){}pb.prototype=d.filters=d.pseudos,d.setFilters=new pb,g=fb.tokenize=function(a,b){var c,e,f,g,h,i,j,k=z[a+" "];if(k)return b?0:k.slice(0);h=a,i=[],j=d.preFilter;while(h){(!c||(e=S.exec(h)))&&(e&&(h=h.slice(e[0].length)||h),i.push(f=[])),c=!1,(e=T.exec(h))&&(c=e.shift(),f.push({value:c,type:e[0].replace(R," ")}),h=h.slice(c.length));for(g in d.filter)!(e=X[g].exec(h))||j[g]&&!(e=j[g](e))||(c=e.shift(),f.push({value:c,type:g,matches:e}),h=h.slice(c.length));if(!c)break}return b?h.length:h?fb.error(a):z(a,i).slice(0)};function qb(a){for(var b=0,c=a.length,d="";c>b;b++)d+=a[b].value;return d}function rb(a,b,c){var d=b.dir,e=c&&"parentNode"===d,f=x++;return b.first?function(b,c,f){while(b=b[d])if(1===b.nodeType||e)return a(b,c,f)}:function(b,c,g){var h,i,j=[w,f];if(g){while(b=b[d])if((1===b.nodeType||e)&&a(b,c,g))return!0}else while(b=b[d])if(1===b.nodeType||e){if(i=b[u]||(b[u]={}),(h=i[d])&&h[0]===w&&h[1]===f)return j[2]=h[2];if(i[d]=j,j[2]=a(b,c,g))return!0}}}function sb(a){return a.length>1?function(b,c,d){var e=a.length;while(e--)if(!a[e](b,c,d))return!1;return!0}:a[0]}function tb(a,b,c){for(var d=0,e=b.length;e>d;d++)fb(a,b[d],c);return c}function ub(a,b,c,d,e){for(var f,g=[],h=0,i=a.length,j=null!=b;i>h;h++)(f=a[h])&&(!c||c(f,d,e))&&(g.push(f),j&&b.push(h));return g}function vb(a,b,c,d,e,f){return d&&!d[u]&&(d=vb(d)),e&&!e[u]&&(e=vb(e,f)),hb(function(f,g,h,i){var j,k,l,m=[],n=[],o=g.length,p=f||tb(b||"*",h.nodeType?[h]:h,[]),q=!a||!f&&b?p:ub(p,m,a,h,i),r=c?e||(f?a:o||d)?[]:g:q;if(c&&c(q,r,h,i),d){j=ub(r,n),d(j,[],h,i),k=j.length;while(k--)(l=j[k])&&(r[n[k]]=!(q[n[k]]=l))}if(f){if(e||a){if(e){j=[],k=r.length;while(k--)(l=r[k])&&j.push(q[k]=l);e(null,r=[],j,i)}k=r.length;while(k--)(l=r[k])&&(j=e?K.call(f,l):m[k])>-1&&(f[j]=!(g[j]=l))}}else r=ub(r===g?r.splice(o,r.length):r),e?e(null,g,r,i):I.apply(g,r)})}function wb(a){for(var b,c,e,f=a.length,g=d.relative[a[0].type],h=g||d.relative[" "],i=g?1:0,k=rb(function(a){return a===b},h,!0),l=rb(function(a){return K.call(b,a)>-1},h,!0),m=[function(a,c,d){return!g&&(d||c!==j)||((b=c).nodeType?k(a,c,d):l(a,c,d))}];f>i;i++)if(c=d.relative[a[i].type])m=[rb(sb(m),c)];else{if(c=d.filter[a[i].type].apply(null,a[i].matches),c[u]){for(e=++i;f>e;e++)if(d.relative[a[e].type])break;return vb(i>1&&sb(m),i>1&&qb(a.slice(0,i-1).concat({value:" "===a[i-2].type?"*":""})).replace(R,"$1"),c,e>i&&wb(a.slice(i,e)),f>e&&wb(a=a.slice(e)),f>e&&qb(a))}m.push(c)}return sb(m)}function xb(a,b){var c=b.length>0,e=a.length>0,f=function(f,g,h,i,k){var l,m,o,p=0,q="0",r=f&&[],s=[],t=j,u=f||e&&d.find.TAG("*",k),v=w+=null==t?1:Math.random()||.1,x=u.length;for(k&&(j=g!==n&&g);q!==x&&null!=(l=u[q]);q++){if(e&&l){m=0;while(o=a[m++])if(o(l,g,h)){i.push(l);break}k&&(w=v)}c&&((l=!o&&l)&&p--,f&&r.push(l))}if(p+=q,c&&q!==p){m=0;while(o=b[m++])o(r,s,g,h);if(f){if(p>0)while(q--)r[q]||s[q]||(s[q]=G.call(i));s=ub(s)}I.apply(i,s),k&&!f&&s.length>0&&p+b.length>1&&fb.uniqueSort(i)}return k&&(w=v,j=t),r};return c?hb(f):f}return h=fb.compile=function(a,b){var c,d=[],e=[],f=A[a+" "];if(!f){b||(b=g(a)),c=b.length;while(c--)f=wb(b[c]),f[u]?d.push(f):e.push(f);f=A(a,xb(e,d)),f.selector=a}return f},i=fb.select=function(a,b,e,f){var i,j,k,l,m,n="function"==typeof a&&a,o=!f&&g(a=n.selector||a);if(e=e||[],1===o.length){if(j=o[0]=o[0].slice(0),j.length>2&&"ID"===(k=j[0]).type&&c.getById&&9===b.nodeType&&p&&d.relative[j[1].type]){if(b=(d.find.ID(k.matches[0].replace(cb,db),b)||[])[0],!b)return e;n&&(b=b.parentNode),a=a.slice(j.shift().value.length)}i=X.needsContext.test(a)?0:j.length;while(i--){if(k=j[i],d.relative[l=k.type])break;if((m=d.find[l])&&(f=m(k.matches[0].replace(cb,db),ab.test(j[0].type)&&ob(b.parentNode)||b))){if(j.splice(i,1),a=f.length&&qb(j),!a)return I.apply(e,f),e;break}}}return(n||h(a,o))(f,b,!p,e,ab.test(a)&&ob(b.parentNode)||b),e},c.sortStable=u.split("").sort(B).join("")===u,c.detectDuplicates=!!l,m(),c.sortDetached=ib(function(a){return 1&a.compareDocumentPosition(n.createElement("div"))}),ib(function(a){return a.innerHTML="<a href='#'></a>","#"===a.firstChild.getAttribute("href")})||jb("type|href|height|width",function(a,b,c){return c?void 0:a.getAttribute(b,"type"===b.toLowerCase()?1:2)}),c.attributes&&ib(function(a){return a.innerHTML="<input/>",a.firstChild.setAttribute("value",""),""===a.firstChild.getAttribute("value")})||jb("value",function(a,b,c){return c||"input"!==a.nodeName.toLowerCase()?void 0:a.defaultValue}),ib(function(a){return null==a.getAttribute("disabled")})||jb(L,function(a,b,c){var d;return c?void 0:a[b]===!0?b.toLowerCase():(d=a.getAttributeNode(b))&&d.specified?d.value:null}),fb}(a);n.find=t,n.expr=t.selectors,n.expr[":"]=n.expr.pseudos,n.unique=t.uniqueSort,n.text=t.getText,n.isXMLDoc=t.isXML,n.contains=t.contains;var u=n.expr.match.needsContext,v=/^<(\w+)\s*\/?>(?:<\/\1>|)$/,w=/^.[^:#\[\.,]*$/;function x(a,b,c){if(n.isFunction(b))return n.grep(a,function(a,d){return!!b.call(a,d,a)!==c});if(b.nodeType)return n.grep(a,function(a){return a===b!==c});if("string"==typeof b){if(w.test(b))return n.filter(b,a,c);b=n.filter(b,a)}return n.grep(a,function(a){return g.call(b,a)>=0!==c})}n.filter=function(a,b,c){var d=b[0];return c&&(a=":not("+a+")"),1===b.length&&1===d.nodeType?n.find.matchesSelector(d,a)?[d]:[]:n.find.matches(a,n.grep(b,function(a){return 1===a.nodeType}))},n.fn.extend({find:function(a){var b,c=this.length,d=[],e=this;if("string"!=typeof a)return this.pushStack(n(a).filter(function(){for(b=0;c>b;b++)if(n.contains(e[b],this))return!0}));for(b=0;c>b;b++)n.find(a,e[b],d);return d=this.pushStack(c>1?n.unique(d):d),d.selector=this.selector?this.selector+" "+a:a,d},filter:function(a){return this.pushStack(x(this,a||[],!1))},not:function(a){return this.pushStack(x(this,a||[],!0))},is:function(a){return!!x(this,"string"==typeof a&&u.test(a)?n(a):a||[],!1).length}});var y,z=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/,A=n.fn.init=function(a,b){var c,d;if(!a)return this;if("string"==typeof a){if(c="<"===a[0]&&">"===a[a.length-1]&&a.length>=3?[null,a,null]:z.exec(a),!c||!c[1]&&b)return!b||b.jquery?(b||y).find(a):this.constructor(b).find(a);if(c[1]){if(b=b instanceof n?b[0]:b,n.merge(this,n.parseHTML(c[1],b&&b.nodeType?b.ownerDocument||b:l,!0)),v.test(c[1])&&n.isPlainObject(b))for(c in b)n.isFunction(this[c])?this[c](b[c]):this.attr(c,b[c]);return this}return d=l.getElementById(c[2]),d&&d.parentNode&&(this.length=1,this[0]=d),this.context=l,this.selector=a,this}return a.nodeType?(this.context=this[0]=a,this.length=1,this):n.isFunction(a)?"undefined"!=typeof y.ready?y.ready(a):a(n):(void 0!==a.selector&&(this.selector=a.selector,this.context=a.context),n.makeArray(a,this))};A.prototype=n.fn,y=n(l);var B=/^(?:parents|prev(?:Until|All))/,C={children:!0,contents:!0,next:!0,prev:!0};n.extend({dir:function(a,b,c){var d=[],e=void 0!==c;while((a=a[b])&&9!==a.nodeType)if(1===a.nodeType){if(e&&n(a).is(c))break;d.push(a)}return d},sibling:function(a,b){for(var c=[];a;a=a.nextSibling)1===a.nodeType&&a!==b&&c.push(a);return c}}),n.fn.extend({has:function(a){var b=n(a,this),c=b.length;return this.filter(function(){for(var a=0;c>a;a++)if(n.contains(this,b[a]))return!0})},closest:function(a,b){for(var c,d=0,e=this.length,f=[],g=u.test(a)||"string"!=typeof a?n(a,b||this.context):0;e>d;d++)for(c=this[d];c&&c!==b;c=c.parentNode)if(c.nodeType<11&&(g?g.index(c)>-1:1===c.nodeType&&n.find.matchesSelector(c,a))){f.push(c);break}return this.pushStack(f.length>1?n.unique(f):f)},index:function(a){return a?"string"==typeof a?g.call(n(a),this[0]):g.call(this,a.jquery?a[0]:a):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(a,b){return this.pushStack(n.unique(n.merge(this.get(),n(a,b))))},addBack:function(a){return this.add(null==a?this.prevObject:this.prevObject.filter(a))}});function D(a,b){while((a=a[b])&&1!==a.nodeType);return a}n.each({parent:function(a){var b=a.parentNode;return b&&11!==b.nodeType?b:null},parents:function(a){return n.dir(a,"parentNode")},parentsUntil:function(a,b,c){return n.dir(a,"parentNode",c)},next:function(a){return D(a,"nextSibling")},prev:function(a){return D(a,"previousSibling")},nextAll:function(a){return n.dir(a,"nextSibling")},prevAll:function(a){return n.dir(a,"previousSibling")},nextUntil:function(a,b,c){return n.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return n.dir(a,"previousSibling",c)},siblings:function(a){return n.sibling((a.parentNode||{}).firstChild,a)},children:function(a){return n.sibling(a.firstChild)},contents:function(a){return a.contentDocument||n.merge([],a.childNodes)}},function(a,b){n.fn[a]=function(c,d){var e=n.map(this,b,c);return"Until"!==a.slice(-5)&&(d=c),d&&"string"==typeof d&&(e=n.filter(d,e)),this.length>1&&(C[a]||n.unique(e),B.test(a)&&e.reverse()),this.pushStack(e)}});var E=/\S+/g,F={};function G(a){var b=F[a]={};return n.each(a.match(E)||[],function(a,c){b[c]=!0}),b}n.Callbacks=function(a){a="string"==typeof a?F[a]||G(a):n.extend({},a);var b,c,d,e,f,g,h=[],i=!a.once&&[],j=function(l){for(b=a.memory&&l,c=!0,g=e||0,e=0,f=h.length,d=!0;h&&f>g;g++)if(h[g].apply(l[0],l[1])===!1&&a.stopOnFalse){b=!1;break}d=!1,h&&(i?i.length&&j(i.shift()):b?h=[]:k.disable())},k={add:function(){if(h){var c=h.length;!function g(b){n.each(b,function(b,c){var d=n.type(c);"function"===d?a.unique&&k.has(c)||h.push(c):c&&c.length&&"string"!==d&&g(c)})}(arguments),d?f=h.length:b&&(e=c,j(b))}return this},remove:function(){return h&&n.each(arguments,function(a,b){var c;while((c=n.inArray(b,h,c))>-1)h.splice(c,1),d&&(f>=c&&f--,g>=c&&g--)}),this},has:function(a){return a?n.inArray(a,h)>-1:!(!h||!h.length)},empty:function(){return h=[],f=0,this},disable:function(){return h=i=b=void 0,this},disabled:function(){return!h},lock:function(){return i=void 0,b||k.disable(),this},locked:function(){return!i},fireWith:function(a,b){return!h||c&&!i||(b=b||[],b=[a,b.slice?b.slice():b],d?i.push(b):j(b)),this},fire:function(){return k.fireWith(this,arguments),this},fired:function(){return!!c}};return k},n.extend({Deferred:function(a){var b=[["resolve","done",n.Callbacks("once memory"),"resolved"],["reject","fail",n.Callbacks("once memory"),"rejected"],["notify","progress",n.Callbacks("memory")]],c="pending",d={state:function(){return c},always:function(){return e.done(arguments).fail(arguments),this},then:function(){var a=arguments;return n.Deferred(function(c){n.each(b,function(b,f){var g=n.isFunction(a[b])&&a[b];e[f[1]](function(){var a=g&&g.apply(this,arguments);a&&n.isFunction(a.promise)?a.promise().done(c.resolve).fail(c.reject).progress(c.notify):c[f[0]+"With"](this===d?c.promise():this,g?[a]:arguments)})}),a=null}).promise()},promise:function(a){return null!=a?n.extend(a,d):d}},e={};return d.pipe=d.then,n.each(b,function(a,f){var g=f[2],h=f[3];d[f[1]]=g.add,h&&g.add(function(){c=h},b[1^a][2].disable,b[2][2].lock),e[f[0]]=function(){return e[f[0]+"With"](this===e?d:this,arguments),this},e[f[0]+"With"]=g.fireWith}),d.promise(e),a&&a.call(e,e),e},when:function(a){var b=0,c=d.call(arguments),e=c.length,f=1!==e||a&&n.isFunction(a.promise)?e:0,g=1===f?a:n.Deferred(),h=function(a,b,c){return function(e){b[a]=this,c[a]=arguments.length>1?d.call(arguments):e,c===i?g.notifyWith(b,c):--f||g.resolveWith(b,c)}},i,j,k;if(e>1)for(i=new Array(e),j=new Array(e),k=new Array(e);e>b;b++)c[b]&&n.isFunction(c[b].promise)?c[b].promise().done(h(b,k,c)).fail(g.reject).progress(h(b,j,i)):--f;return f||g.resolveWith(k,c),g.promise()}});var H;n.fn.ready=function(a){return n.ready.promise().done(a),this},n.extend({isReady:!1,readyWait:1,holdReady:function(a){a?n.readyWait++:n.ready(!0)},ready:function(a){(a===!0?--n.readyWait:n.isReady)||(n.isReady=!0,a!==!0&&--n.readyWait>0||(H.resolveWith(l,[n]),n.fn.triggerHandler&&(n(l).triggerHandler("ready"),n(l).off("ready"))))}});function I(){l.removeEventListener("DOMContentLoaded",I,!1),a.removeEventListener("load",I,!1),n.ready()}n.ready.promise=function(b){return H||(H=n.Deferred(),"complete"===l.readyState?setTimeout(n.ready):(l.addEventListener("DOMContentLoaded",I,!1),a.addEventListener("load",I,!1))),H.promise(b)},n.ready.promise();var J=n.access=function(a,b,c,d,e,f,g){var h=0,i=a.length,j=null==c;if("object"===n.type(c)){e=!0;for(h in c)n.access(a,b,h,c[h],!0,f,g)}else if(void 0!==d&&(e=!0,n.isFunction(d)||(g=!0),j&&(g?(b.call(a,d),b=null):(j=b,b=function(a,b,c){return j.call(n(a),c)})),b))for(;i>h;h++)b(a[h],c,g?d:d.call(a[h],h,b(a[h],c)));return e?a:j?b.call(a):i?b(a[0],c):f};n.acceptData=function(a){return 1===a.nodeType||9===a.nodeType||!+a.nodeType};function K(){Object.defineProperty(this.cache={},0,{get:function(){return{}}}),this.expando=n.expando+Math.random()}K.uid=1,K.accepts=n.acceptData,K.prototype={key:function(a){if(!K.accepts(a))return 0;var b={},c=a[this.expando];if(!c){c=K.uid++;try{b[this.expando]={value:c},Object.defineProperties(a,b)}catch(d){b[this.expando]=c,n.extend(a,b)}}return this.cache[c]||(this.cache[c]={}),c},set:function(a,b,c){var d,e=this.key(a),f=this.cache[e];if("string"==typeof b)f[b]=c;else if(n.isEmptyObject(f))n.extend(this.cache[e],b);else for(d in b)f[d]=b[d];return f},get:function(a,b){var c=this.cache[this.key(a)];return void 0===b?c:c[b]},access:function(a,b,c){var d;return void 0===b||b&&"string"==typeof b&&void 0===c?(d=this.get(a,b),void 0!==d?d:this.get(a,n.camelCase(b))):(this.set(a,b,c),void 0!==c?c:b)},remove:function(a,b){var c,d,e,f=this.key(a),g=this.cache[f];if(void 0===b)this.cache[f]={};else{n.isArray(b)?d=b.concat(b.map(n.camelCase)):(e=n.camelCase(b),b in g?d=[b,e]:(d=e,d=d in g?[d]:d.match(E)||[])),c=d.length;while(c--)delete g[d[c]]}},hasData:function(a){return!n.isEmptyObject(this.cache[a[this.expando]]||{})},discard:function(a){a[this.expando]&&delete this.cache[a[this.expando]]}};var L=new K,M=new K,N=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,O=/([A-Z])/g;function P(a,b,c){var d;if(void 0===c&&1===a.nodeType)if(d="data-"+b.replace(O,"-$1").toLowerCase(),c=a.getAttribute(d),"string"==typeof c){try{c="true"===c?!0:"false"===c?!1:"null"===c?null:+c+""===c?+c:N.test(c)?n.parseJSON(c):c}catch(e){}M.set(a,b,c)}else c=void 0;return c}n.extend({hasData:function(a){return M.hasData(a)||L.hasData(a)},data:function(a,b,c){return M.access(a,b,c)},removeData:function(a,b){M.remove(a,b)
},_data:function(a,b,c){return L.access(a,b,c)},_removeData:function(a,b){L.remove(a,b)}}),n.fn.extend({data:function(a,b){var c,d,e,f=this[0],g=f&&f.attributes;if(void 0===a){if(this.length&&(e=M.get(f),1===f.nodeType&&!L.get(f,"hasDataAttrs"))){c=g.length;while(c--)g[c]&&(d=g[c].name,0===d.indexOf("data-")&&(d=n.camelCase(d.slice(5)),P(f,d,e[d])));L.set(f,"hasDataAttrs",!0)}return e}return"object"==typeof a?this.each(function(){M.set(this,a)}):J(this,function(b){var c,d=n.camelCase(a);if(f&&void 0===b){if(c=M.get(f,a),void 0!==c)return c;if(c=M.get(f,d),void 0!==c)return c;if(c=P(f,d,void 0),void 0!==c)return c}else this.each(function(){var c=M.get(this,d);M.set(this,d,b),-1!==a.indexOf("-")&&void 0!==c&&M.set(this,a,b)})},null,b,arguments.length>1,null,!0)},removeData:function(a){return this.each(function(){M.remove(this,a)})}}),n.extend({queue:function(a,b,c){var d;return a?(b=(b||"fx")+"queue",d=L.get(a,b),c&&(!d||n.isArray(c)?d=L.access(a,b,n.makeArray(c)):d.push(c)),d||[]):void 0},dequeue:function(a,b){b=b||"fx";var c=n.queue(a,b),d=c.length,e=c.shift(),f=n._queueHooks(a,b),g=function(){n.dequeue(a,b)};"inprogress"===e&&(e=c.shift(),d--),e&&("fx"===b&&c.unshift("inprogress"),delete f.stop,e.call(a,g,f)),!d&&f&&f.empty.fire()},_queueHooks:function(a,b){var c=b+"queueHooks";return L.get(a,c)||L.access(a,c,{empty:n.Callbacks("once memory").add(function(){L.remove(a,[b+"queue",c])})})}}),n.fn.extend({queue:function(a,b){var c=2;return"string"!=typeof a&&(b=a,a="fx",c--),arguments.length<c?n.queue(this[0],a):void 0===b?this:this.each(function(){var c=n.queue(this,a,b);n._queueHooks(this,a),"fx"===a&&"inprogress"!==c[0]&&n.dequeue(this,a)})},dequeue:function(a){return this.each(function(){n.dequeue(this,a)})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,b){var c,d=1,e=n.Deferred(),f=this,g=this.length,h=function(){--d||e.resolveWith(f,[f])};"string"!=typeof a&&(b=a,a=void 0),a=a||"fx";while(g--)c=L.get(f[g],a+"queueHooks"),c&&c.empty&&(d++,c.empty.add(h));return h(),e.promise(b)}});var Q=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,R=["Top","Right","Bottom","Left"],S=function(a,b){return a=b||a,"none"===n.css(a,"display")||!n.contains(a.ownerDocument,a)},T=/^(?:checkbox|radio)$/i;!function(){var a=l.createDocumentFragment(),b=a.appendChild(l.createElement("div")),c=l.createElement("input");c.setAttribute("type","radio"),c.setAttribute("checked","checked"),c.setAttribute("name","t"),b.appendChild(c),k.checkClone=b.cloneNode(!0).cloneNode(!0).lastChild.checked,b.innerHTML="<textarea>x</textarea>",k.noCloneChecked=!!b.cloneNode(!0).lastChild.defaultValue}();var U="undefined";k.focusinBubbles="onfocusin"in a;var V=/^key/,W=/^(?:mouse|pointer|contextmenu)|click/,X=/^(?:focusinfocus|focusoutblur)$/,Y=/^([^.]*)(?:\.(.+)|)$/;function Z(){return!0}function $(){return!1}function _(){try{return l.activeElement}catch(a){}}n.event={global:{},add:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,o,p,q,r=L.get(a);if(r){c.handler&&(f=c,c=f.handler,e=f.selector),c.guid||(c.guid=n.guid++),(i=r.events)||(i=r.events={}),(g=r.handle)||(g=r.handle=function(b){return typeof n!==U&&n.event.triggered!==b.type?n.event.dispatch.apply(a,arguments):void 0}),b=(b||"").match(E)||[""],j=b.length;while(j--)h=Y.exec(b[j])||[],o=q=h[1],p=(h[2]||"").split(".").sort(),o&&(l=n.event.special[o]||{},o=(e?l.delegateType:l.bindType)||o,l=n.event.special[o]||{},k=n.extend({type:o,origType:q,data:d,handler:c,guid:c.guid,selector:e,needsContext:e&&n.expr.match.needsContext.test(e),namespace:p.join(".")},f),(m=i[o])||(m=i[o]=[],m.delegateCount=0,l.setup&&l.setup.call(a,d,p,g)!==!1||a.addEventListener&&a.addEventListener(o,g,!1)),l.add&&(l.add.call(a,k),k.handler.guid||(k.handler.guid=c.guid)),e?m.splice(m.delegateCount++,0,k):m.push(k),n.event.global[o]=!0)}},remove:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,o,p,q,r=L.hasData(a)&&L.get(a);if(r&&(i=r.events)){b=(b||"").match(E)||[""],j=b.length;while(j--)if(h=Y.exec(b[j])||[],o=q=h[1],p=(h[2]||"").split(".").sort(),o){l=n.event.special[o]||{},o=(d?l.delegateType:l.bindType)||o,m=i[o]||[],h=h[2]&&new RegExp("(^|\\.)"+p.join("\\.(?:.*\\.|)")+"(\\.|$)"),g=f=m.length;while(f--)k=m[f],!e&&q!==k.origType||c&&c.guid!==k.guid||h&&!h.test(k.namespace)||d&&d!==k.selector&&("**"!==d||!k.selector)||(m.splice(f,1),k.selector&&m.delegateCount--,l.remove&&l.remove.call(a,k));g&&!m.length&&(l.teardown&&l.teardown.call(a,p,r.handle)!==!1||n.removeEvent(a,o,r.handle),delete i[o])}else for(o in i)n.event.remove(a,o+b[j],c,d,!0);n.isEmptyObject(i)&&(delete r.handle,L.remove(a,"events"))}},trigger:function(b,c,d,e){var f,g,h,i,k,m,o,p=[d||l],q=j.call(b,"type")?b.type:b,r=j.call(b,"namespace")?b.namespace.split("."):[];if(g=h=d=d||l,3!==d.nodeType&&8!==d.nodeType&&!X.test(q+n.event.triggered)&&(q.indexOf(".")>=0&&(r=q.split("."),q=r.shift(),r.sort()),k=q.indexOf(":")<0&&"on"+q,b=b[n.expando]?b:new n.Event(q,"object"==typeof b&&b),b.isTrigger=e?2:3,b.namespace=r.join("."),b.namespace_re=b.namespace?new RegExp("(^|\\.)"+r.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,b.result=void 0,b.target||(b.target=d),c=null==c?[b]:n.makeArray(c,[b]),o=n.event.special[q]||{},e||!o.trigger||o.trigger.apply(d,c)!==!1)){if(!e&&!o.noBubble&&!n.isWindow(d)){for(i=o.delegateType||q,X.test(i+q)||(g=g.parentNode);g;g=g.parentNode)p.push(g),h=g;h===(d.ownerDocument||l)&&p.push(h.defaultView||h.parentWindow||a)}f=0;while((g=p[f++])&&!b.isPropagationStopped())b.type=f>1?i:o.bindType||q,m=(L.get(g,"events")||{})[b.type]&&L.get(g,"handle"),m&&m.apply(g,c),m=k&&g[k],m&&m.apply&&n.acceptData(g)&&(b.result=m.apply(g,c),b.result===!1&&b.preventDefault());return b.type=q,e||b.isDefaultPrevented()||o._default&&o._default.apply(p.pop(),c)!==!1||!n.acceptData(d)||k&&n.isFunction(d[q])&&!n.isWindow(d)&&(h=d[k],h&&(d[k]=null),n.event.triggered=q,d[q](),n.event.triggered=void 0,h&&(d[k]=h)),b.result}},dispatch:function(a){a=n.event.fix(a);var b,c,e,f,g,h=[],i=d.call(arguments),j=(L.get(this,"events")||{})[a.type]||[],k=n.event.special[a.type]||{};if(i[0]=a,a.delegateTarget=this,!k.preDispatch||k.preDispatch.call(this,a)!==!1){h=n.event.handlers.call(this,a,j),b=0;while((f=h[b++])&&!a.isPropagationStopped()){a.currentTarget=f.elem,c=0;while((g=f.handlers[c++])&&!a.isImmediatePropagationStopped())(!a.namespace_re||a.namespace_re.test(g.namespace))&&(a.handleObj=g,a.data=g.data,e=((n.event.special[g.origType]||{}).handle||g.handler).apply(f.elem,i),void 0!==e&&(a.result=e)===!1&&(a.preventDefault(),a.stopPropagation()))}return k.postDispatch&&k.postDispatch.call(this,a),a.result}},handlers:function(a,b){var c,d,e,f,g=[],h=b.delegateCount,i=a.target;if(h&&i.nodeType&&(!a.button||"click"!==a.type))for(;i!==this;i=i.parentNode||this)if(i.disabled!==!0||"click"!==a.type){for(d=[],c=0;h>c;c++)f=b[c],e=f.selector+" ",void 0===d[e]&&(d[e]=f.needsContext?n(e,this).index(i)>=0:n.find(e,this,null,[i]).length),d[e]&&d.push(f);d.length&&g.push({elem:i,handlers:d})}return h<b.length&&g.push({elem:this,handlers:b.slice(h)}),g},props:"altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){return null==a.which&&(a.which=null!=b.charCode?b.charCode:b.keyCode),a}},mouseHooks:{props:"button buttons clientX clientY offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,b){var c,d,e,f=b.button;return null==a.pageX&&null!=b.clientX&&(c=a.target.ownerDocument||l,d=c.documentElement,e=c.body,a.pageX=b.clientX+(d&&d.scrollLeft||e&&e.scrollLeft||0)-(d&&d.clientLeft||e&&e.clientLeft||0),a.pageY=b.clientY+(d&&d.scrollTop||e&&e.scrollTop||0)-(d&&d.clientTop||e&&e.clientTop||0)),a.which||void 0===f||(a.which=1&f?1:2&f?3:4&f?2:0),a}},fix:function(a){if(a[n.expando])return a;var b,c,d,e=a.type,f=a,g=this.fixHooks[e];g||(this.fixHooks[e]=g=W.test(e)?this.mouseHooks:V.test(e)?this.keyHooks:{}),d=g.props?this.props.concat(g.props):this.props,a=new n.Event(f),b=d.length;while(b--)c=d[b],a[c]=f[c];return a.target||(a.target=l),3===a.target.nodeType&&(a.target=a.target.parentNode),g.filter?g.filter(a,f):a},special:{load:{noBubble:!0},focus:{trigger:function(){return this!==_()&&this.focus?(this.focus(),!1):void 0},delegateType:"focusin"},blur:{trigger:function(){return this===_()&&this.blur?(this.blur(),!1):void 0},delegateType:"focusout"},click:{trigger:function(){return"checkbox"===this.type&&this.click&&n.nodeName(this,"input")?(this.click(),!1):void 0},_default:function(a){return n.nodeName(a.target,"a")}},beforeunload:{postDispatch:function(a){void 0!==a.result&&a.originalEvent&&(a.originalEvent.returnValue=a.result)}}},simulate:function(a,b,c,d){var e=n.extend(new n.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?n.event.trigger(e,null,b):n.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},n.removeEvent=function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)},n.Event=function(a,b){return this instanceof n.Event?(a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||void 0===a.defaultPrevented&&a.returnValue===!1?Z:$):this.type=a,b&&n.extend(this,b),this.timeStamp=a&&a.timeStamp||n.now(),void(this[n.expando]=!0)):new n.Event(a,b)},n.Event.prototype={isDefaultPrevented:$,isPropagationStopped:$,isImmediatePropagationStopped:$,preventDefault:function(){var a=this.originalEvent;this.isDefaultPrevented=Z,a&&a.preventDefault&&a.preventDefault()},stopPropagation:function(){var a=this.originalEvent;this.isPropagationStopped=Z,a&&a.stopPropagation&&a.stopPropagation()},stopImmediatePropagation:function(){var a=this.originalEvent;this.isImmediatePropagationStopped=Z,a&&a.stopImmediatePropagation&&a.stopImmediatePropagation(),this.stopPropagation()}},n.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(a,b){n.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c,d=this,e=a.relatedTarget,f=a.handleObj;return(!e||e!==d&&!n.contains(d,e))&&(a.type=f.origType,c=f.handler.apply(this,arguments),a.type=b),c}}}),k.focusinBubbles||n.each({focus:"focusin",blur:"focusout"},function(a,b){var c=function(a){n.event.simulate(b,a.target,n.event.fix(a),!0)};n.event.special[b]={setup:function(){var d=this.ownerDocument||this,e=L.access(d,b);e||d.addEventListener(a,c,!0),L.access(d,b,(e||0)+1)},teardown:function(){var d=this.ownerDocument||this,e=L.access(d,b)-1;e?L.access(d,b,e):(d.removeEventListener(a,c,!0),L.remove(d,b))}}}),n.fn.extend({on:function(a,b,c,d,e){var f,g;if("object"==typeof a){"string"!=typeof b&&(c=c||b,b=void 0);for(g in a)this.on(g,b,c,a[g],e);return this}if(null==c&&null==d?(d=b,c=b=void 0):null==d&&("string"==typeof b?(d=c,c=void 0):(d=c,c=b,b=void 0)),d===!1)d=$;else if(!d)return this;return 1===e&&(f=d,d=function(a){return n().off(a),f.apply(this,arguments)},d.guid=f.guid||(f.guid=n.guid++)),this.each(function(){n.event.add(this,a,d,c,b)})},one:function(a,b,c,d){return this.on(a,b,c,d,1)},off:function(a,b,c){var d,e;if(a&&a.preventDefault&&a.handleObj)return d=a.handleObj,n(a.delegateTarget).off(d.namespace?d.origType+"."+d.namespace:d.origType,d.selector,d.handler),this;if("object"==typeof a){for(e in a)this.off(e,b,a[e]);return this}return(b===!1||"function"==typeof b)&&(c=b,b=void 0),c===!1&&(c=$),this.each(function(){n.event.remove(this,a,c,b)})},trigger:function(a,b){return this.each(function(){n.event.trigger(a,b,this)})},triggerHandler:function(a,b){var c=this[0];return c?n.event.trigger(a,b,c,!0):void 0}});var ab=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi,bb=/<([\w:]+)/,cb=/<|&#?\w+;/,db=/<(?:script|style|link)/i,eb=/checked\s*(?:[^=]|=\s*.checked.)/i,fb=/^$|\/(?:java|ecma)script/i,gb=/^true\/(.*)/,hb=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,ib={option:[1,"<select multiple='multiple'>","</select>"],thead:[1,"<table>","</table>"],col:[2,"<table><colgroup>","</colgroup></table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:[0,"",""]};ib.optgroup=ib.option,ib.tbody=ib.tfoot=ib.colgroup=ib.caption=ib.thead,ib.th=ib.td;function jb(a,b){return n.nodeName(a,"table")&&n.nodeName(11!==b.nodeType?b:b.firstChild,"tr")?a.getElementsByTagName("tbody")[0]||a.appendChild(a.ownerDocument.createElement("tbody")):a}function kb(a){return a.type=(null!==a.getAttribute("type"))+"/"+a.type,a}function lb(a){var b=gb.exec(a.type);return b?a.type=b[1]:a.removeAttribute("type"),a}function mb(a,b){for(var c=0,d=a.length;d>c;c++)L.set(a[c],"globalEval",!b||L.get(b[c],"globalEval"))}function nb(a,b){var c,d,e,f,g,h,i,j;if(1===b.nodeType){if(L.hasData(a)&&(f=L.access(a),g=L.set(b,f),j=f.events)){delete g.handle,g.events={};for(e in j)for(c=0,d=j[e].length;d>c;c++)n.event.add(b,e,j[e][c])}M.hasData(a)&&(h=M.access(a),i=n.extend({},h),M.set(b,i))}}function ob(a,b){var c=a.getElementsByTagName?a.getElementsByTagName(b||"*"):a.querySelectorAll?a.querySelectorAll(b||"*"):[];return void 0===b||b&&n.nodeName(a,b)?n.merge([a],c):c}function pb(a,b){var c=b.nodeName.toLowerCase();"input"===c&&T.test(a.type)?b.checked=a.checked:("input"===c||"textarea"===c)&&(b.defaultValue=a.defaultValue)}n.extend({clone:function(a,b,c){var d,e,f,g,h=a.cloneNode(!0),i=n.contains(a.ownerDocument,a);if(!(k.noCloneChecked||1!==a.nodeType&&11!==a.nodeType||n.isXMLDoc(a)))for(g=ob(h),f=ob(a),d=0,e=f.length;e>d;d++)pb(f[d],g[d]);if(b)if(c)for(f=f||ob(a),g=g||ob(h),d=0,e=f.length;e>d;d++)nb(f[d],g[d]);else nb(a,h);return g=ob(h,"script"),g.length>0&&mb(g,!i&&ob(a,"script")),h},buildFragment:function(a,b,c,d){for(var e,f,g,h,i,j,k=b.createDocumentFragment(),l=[],m=0,o=a.length;o>m;m++)if(e=a[m],e||0===e)if("object"===n.type(e))n.merge(l,e.nodeType?[e]:e);else if(cb.test(e)){f=f||k.appendChild(b.createElement("div")),g=(bb.exec(e)||["",""])[1].toLowerCase(),h=ib[g]||ib._default,f.innerHTML=h[1]+e.replace(ab,"<$1></$2>")+h[2],j=h[0];while(j--)f=f.lastChild;n.merge(l,f.childNodes),f=k.firstChild,f.textContent=""}else l.push(b.createTextNode(e));k.textContent="",m=0;while(e=l[m++])if((!d||-1===n.inArray(e,d))&&(i=n.contains(e.ownerDocument,e),f=ob(k.appendChild(e),"script"),i&&mb(f),c)){j=0;while(e=f[j++])fb.test(e.type||"")&&c.push(e)}return k},cleanData:function(a){for(var b,c,d,e,f=n.event.special,g=0;void 0!==(c=a[g]);g++){if(n.acceptData(c)&&(e=c[L.expando],e&&(b=L.cache[e]))){if(b.events)for(d in b.events)f[d]?n.event.remove(c,d):n.removeEvent(c,d,b.handle);L.cache[e]&&delete L.cache[e]}delete M.cache[c[M.expando]]}}}),n.fn.extend({text:function(a){return J(this,function(a){return void 0===a?n.text(this):this.empty().each(function(){(1===this.nodeType||11===this.nodeType||9===this.nodeType)&&(this.textContent=a)})},null,a,arguments.length)},append:function(){return this.domManip(arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=jb(this,a);b.appendChild(a)}})},prepend:function(){return this.domManip(arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=jb(this,a);b.insertBefore(a,b.firstChild)}})},before:function(){return this.domManip(arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this)})},after:function(){return this.domManip(arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this.nextSibling)})},remove:function(a,b){for(var c,d=a?n.filter(a,this):this,e=0;null!=(c=d[e]);e++)b||1!==c.nodeType||n.cleanData(ob(c)),c.parentNode&&(b&&n.contains(c.ownerDocument,c)&&mb(ob(c,"script")),c.parentNode.removeChild(c));return this},empty:function(){for(var a,b=0;null!=(a=this[b]);b++)1===a.nodeType&&(n.cleanData(ob(a,!1)),a.textContent="");return this},clone:function(a,b){return a=null==a?!1:a,b=null==b?a:b,this.map(function(){return n.clone(this,a,b)})},html:function(a){return J(this,function(a){var b=this[0]||{},c=0,d=this.length;if(void 0===a&&1===b.nodeType)return b.innerHTML;if("string"==typeof a&&!db.test(a)&&!ib[(bb.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(ab,"<$1></$2>");try{for(;d>c;c++)b=this[c]||{},1===b.nodeType&&(n.cleanData(ob(b,!1)),b.innerHTML=a);b=0}catch(e){}}b&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(){var a=arguments[0];return this.domManip(arguments,function(b){a=this.parentNode,n.cleanData(ob(this)),a&&a.replaceChild(b,this)}),a&&(a.length||a.nodeType)?this:this.remove()},detach:function(a){return this.remove(a,!0)},domManip:function(a,b){a=e.apply([],a);var c,d,f,g,h,i,j=0,l=this.length,m=this,o=l-1,p=a[0],q=n.isFunction(p);if(q||l>1&&"string"==typeof p&&!k.checkClone&&eb.test(p))return this.each(function(c){var d=m.eq(c);q&&(a[0]=p.call(this,c,d.html())),d.domManip(a,b)});if(l&&(c=n.buildFragment(a,this[0].ownerDocument,!1,this),d=c.firstChild,1===c.childNodes.length&&(c=d),d)){for(f=n.map(ob(c,"script"),kb),g=f.length;l>j;j++)h=c,j!==o&&(h=n.clone(h,!0,!0),g&&n.merge(f,ob(h,"script"))),b.call(this[j],h,j);if(g)for(i=f[f.length-1].ownerDocument,n.map(f,lb),j=0;g>j;j++)h=f[j],fb.test(h.type||"")&&!L.access(h,"globalEval")&&n.contains(i,h)&&(h.src?n._evalUrl&&n._evalUrl(h.src):n.globalEval(h.textContent.replace(hb,"")))}return this}}),n.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){n.fn[a]=function(a){for(var c,d=[],e=n(a),g=e.length-1,h=0;g>=h;h++)c=h===g?this:this.clone(!0),n(e[h])[b](c),f.apply(d,c.get());return this.pushStack(d)}});var qb,rb={};function sb(b,c){var d,e=n(c.createElement(b)).appendTo(c.body),f=a.getDefaultComputedStyle&&(d=a.getDefaultComputedStyle(e[0]))?d.display:n.css(e[0],"display");return e.detach(),f}function tb(a){var b=l,c=rb[a];return c||(c=sb(a,b),"none"!==c&&c||(qb=(qb||n("<iframe frameborder='0' width='0' height='0'/>")).appendTo(b.documentElement),b=qb[0].contentDocument,b.write(),b.close(),c=sb(a,b),qb.detach()),rb[a]=c),c}var ub=/^margin/,vb=new RegExp("^("+Q+")(?!px)[a-z%]+$","i"),wb=function(a){return a.ownerDocument.defaultView.getComputedStyle(a,null)};function xb(a,b,c){var d,e,f,g,h=a.style;return c=c||wb(a),c&&(g=c.getPropertyValue(b)||c[b]),c&&(""!==g||n.contains(a.ownerDocument,a)||(g=n.style(a,b)),vb.test(g)&&ub.test(b)&&(d=h.width,e=h.minWidth,f=h.maxWidth,h.minWidth=h.maxWidth=h.width=g,g=c.width,h.width=d,h.minWidth=e,h.maxWidth=f)),void 0!==g?g+"":g}function yb(a,b){return{get:function(){return a()?void delete this.get:(this.get=b).apply(this,arguments)}}}!function(){var b,c,d=l.documentElement,e=l.createElement("div"),f=l.createElement("div");if(f.style){f.style.backgroundClip="content-box",f.cloneNode(!0).style.backgroundClip="",k.clearCloneStyle="content-box"===f.style.backgroundClip,e.style.cssText="border:0;width:0;height:0;top:0;left:-9999px;margin-top:1px;position:absolute",e.appendChild(f);function g(){f.style.cssText="-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;display:block;margin-top:1%;top:1%;border:1px;padding:1px;width:4px;position:absolute",f.innerHTML="",d.appendChild(e);var g=a.getComputedStyle(f,null);b="1%"!==g.top,c="4px"===g.width,d.removeChild(e)}a.getComputedStyle&&n.extend(k,{pixelPosition:function(){return g(),b},boxSizingReliable:function(){return null==c&&g(),c},reliableMarginRight:function(){var b,c=f.appendChild(l.createElement("div"));return c.style.cssText=f.style.cssText="-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0",c.style.marginRight=c.style.width="0",f.style.width="1px",d.appendChild(e),b=!parseFloat(a.getComputedStyle(c,null).marginRight),d.removeChild(e),b}})}}(),n.swap=function(a,b,c,d){var e,f,g={};for(f in b)g[f]=a.style[f],a.style[f]=b[f];e=c.apply(a,d||[]);for(f in b)a.style[f]=g[f];return e};var zb=/^(none|table(?!-c[ea]).+)/,Ab=new RegExp("^("+Q+")(.*)$","i"),Bb=new RegExp("^([+-])=("+Q+")","i"),Cb={position:"absolute",visibility:"hidden",display:"block"},Db={letterSpacing:"0",fontWeight:"400"},Eb=["Webkit","O","Moz","ms"];function Fb(a,b){if(b in a)return b;var c=b[0].toUpperCase()+b.slice(1),d=b,e=Eb.length;while(e--)if(b=Eb[e]+c,b in a)return b;return d}function Gb(a,b,c){var d=Ab.exec(b);return d?Math.max(0,d[1]-(c||0))+(d[2]||"px"):b}function Hb(a,b,c,d,e){for(var f=c===(d?"border":"content")?4:"width"===b?1:0,g=0;4>f;f+=2)"margin"===c&&(g+=n.css(a,c+R[f],!0,e)),d?("content"===c&&(g-=n.css(a,"padding"+R[f],!0,e)),"margin"!==c&&(g-=n.css(a,"border"+R[f]+"Width",!0,e))):(g+=n.css(a,"padding"+R[f],!0,e),"padding"!==c&&(g+=n.css(a,"border"+R[f]+"Width",!0,e)));return g}function Ib(a,b,c){var d=!0,e="width"===b?a.offsetWidth:a.offsetHeight,f=wb(a),g="border-box"===n.css(a,"boxSizing",!1,f);if(0>=e||null==e){if(e=xb(a,b,f),(0>e||null==e)&&(e=a.style[b]),vb.test(e))return e;d=g&&(k.boxSizingReliable()||e===a.style[b]),e=parseFloat(e)||0}return e+Hb(a,b,c||(g?"border":"content"),d,f)+"px"}function Jb(a,b){for(var c,d,e,f=[],g=0,h=a.length;h>g;g++)d=a[g],d.style&&(f[g]=L.get(d,"olddisplay"),c=d.style.display,b?(f[g]||"none"!==c||(d.style.display=""),""===d.style.display&&S(d)&&(f[g]=L.access(d,"olddisplay",tb(d.nodeName)))):(e=S(d),"none"===c&&e||L.set(d,"olddisplay",e?c:n.css(d,"display"))));for(g=0;h>g;g++)d=a[g],d.style&&(b&&"none"!==d.style.display&&""!==d.style.display||(d.style.display=b?f[g]||"":"none"));return a}n.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=xb(a,"opacity");return""===c?"1":c}}}},cssNumber:{columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":"cssFloat"},style:function(a,b,c,d){if(a&&3!==a.nodeType&&8!==a.nodeType&&a.style){var e,f,g,h=n.camelCase(b),i=a.style;return b=n.cssProps[h]||(n.cssProps[h]=Fb(i,h)),g=n.cssHooks[b]||n.cssHooks[h],void 0===c?g&&"get"in g&&void 0!==(e=g.get(a,!1,d))?e:i[b]:(f=typeof c,"string"===f&&(e=Bb.exec(c))&&(c=(e[1]+1)*e[2]+parseFloat(n.css(a,b)),f="number"),null!=c&&c===c&&("number"!==f||n.cssNumber[h]||(c+="px"),k.clearCloneStyle||""!==c||0!==b.indexOf("background")||(i[b]="inherit"),g&&"set"in g&&void 0===(c=g.set(a,c,d))||(i[b]=c)),void 0)}},css:function(a,b,c,d){var e,f,g,h=n.camelCase(b);return b=n.cssProps[h]||(n.cssProps[h]=Fb(a.style,h)),g=n.cssHooks[b]||n.cssHooks[h],g&&"get"in g&&(e=g.get(a,!0,c)),void 0===e&&(e=xb(a,b,d)),"normal"===e&&b in Db&&(e=Db[b]),""===c||c?(f=parseFloat(e),c===!0||n.isNumeric(f)?f||0:e):e}}),n.each(["height","width"],function(a,b){n.cssHooks[b]={get:function(a,c,d){return c?zb.test(n.css(a,"display"))&&0===a.offsetWidth?n.swap(a,Cb,function(){return Ib(a,b,d)}):Ib(a,b,d):void 0},set:function(a,c,d){var e=d&&wb(a);return Gb(a,c,d?Hb(a,b,d,"border-box"===n.css(a,"boxSizing",!1,e),e):0)}}}),n.cssHooks.marginRight=yb(k.reliableMarginRight,function(a,b){return b?n.swap(a,{display:"inline-block"},xb,[a,"marginRight"]):void 0}),n.each({margin:"",padding:"",border:"Width"},function(a,b){n.cssHooks[a+b]={expand:function(c){for(var d=0,e={},f="string"==typeof c?c.split(" "):[c];4>d;d++)e[a+R[d]+b]=f[d]||f[d-2]||f[0];return e}},ub.test(a)||(n.cssHooks[a+b].set=Gb)}),n.fn.extend({css:function(a,b){return J(this,function(a,b,c){var d,e,f={},g=0;if(n.isArray(b)){for(d=wb(a),e=b.length;e>g;g++)f[b[g]]=n.css(a,b[g],!1,d);return f}return void 0!==c?n.style(a,b,c):n.css(a,b)},a,b,arguments.length>1)},show:function(){return Jb(this,!0)},hide:function(){return Jb(this)},toggle:function(a){return"boolean"==typeof a?a?this.show():this.hide():this.each(function(){S(this)?n(this).show():n(this).hide()})}});function Kb(a,b,c,d,e){return new Kb.prototype.init(a,b,c,d,e)}n.Tween=Kb,Kb.prototype={constructor:Kb,init:function(a,b,c,d,e,f){this.elem=a,this.prop=c,this.easing=e||"swing",this.options=b,this.start=this.now=this.cur(),this.end=d,this.unit=f||(n.cssNumber[c]?"":"px")},cur:function(){var a=Kb.propHooks[this.prop];return a&&a.get?a.get(this):Kb.propHooks._default.get(this)},run:function(a){var b,c=Kb.propHooks[this.prop];return this.pos=b=this.options.duration?n.easing[this.easing](a,this.options.duration*a,0,1,this.options.duration):a,this.now=(this.end-this.start)*b+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),c&&c.set?c.set(this):Kb.propHooks._default.set(this),this}},Kb.prototype.init.prototype=Kb.prototype,Kb.propHooks={_default:{get:function(a){var b;return null==a.elem[a.prop]||a.elem.style&&null!=a.elem.style[a.prop]?(b=n.css(a.elem,a.prop,""),b&&"auto"!==b?b:0):a.elem[a.prop]},set:function(a){n.fx.step[a.prop]?n.fx.step[a.prop](a):a.elem.style&&(null!=a.elem.style[n.cssProps[a.prop]]||n.cssHooks[a.prop])?n.style(a.elem,a.prop,a.now+a.unit):a.elem[a.prop]=a.now}}},Kb.propHooks.scrollTop=Kb.propHooks.scrollLeft={set:function(a){a.elem.nodeType&&a.elem.parentNode&&(a.elem[a.prop]=a.now)}},n.easing={linear:function(a){return a},swing:function(a){return.5-Math.cos(a*Math.PI)/2}},n.fx=Kb.prototype.init,n.fx.step={};var Lb,Mb,Nb=/^(?:toggle|show|hide)$/,Ob=new RegExp("^(?:([+-])=|)("+Q+")([a-z%]*)$","i"),Pb=/queueHooks$/,Qb=[Vb],Rb={"*":[function(a,b){var c=this.createTween(a,b),d=c.cur(),e=Ob.exec(b),f=e&&e[3]||(n.cssNumber[a]?"":"px"),g=(n.cssNumber[a]||"px"!==f&&+d)&&Ob.exec(n.css(c.elem,a)),h=1,i=20;if(g&&g[3]!==f){f=f||g[3],e=e||[],g=+d||1;do h=h||".5",g/=h,n.style(c.elem,a,g+f);while(h!==(h=c.cur()/d)&&1!==h&&--i)}return e&&(g=c.start=+g||+d||0,c.unit=f,c.end=e[1]?g+(e[1]+1)*e[2]:+e[2]),c}]};function Sb(){return setTimeout(function(){Lb=void 0}),Lb=n.now()}function Tb(a,b){var c,d=0,e={height:a};for(b=b?1:0;4>d;d+=2-b)c=R[d],e["margin"+c]=e["padding"+c]=a;return b&&(e.opacity=e.width=a),e}function Ub(a,b,c){for(var d,e=(Rb[b]||[]).concat(Rb["*"]),f=0,g=e.length;g>f;f++)if(d=e[f].call(c,b,a))return d}function Vb(a,b,c){var d,e,f,g,h,i,j,k,l=this,m={},o=a.style,p=a.nodeType&&S(a),q=L.get(a,"fxshow");c.queue||(h=n._queueHooks(a,"fx"),null==h.unqueued&&(h.unqueued=0,i=h.empty.fire,h.empty.fire=function(){h.unqueued||i()}),h.unqueued++,l.always(function(){l.always(function(){h.unqueued--,n.queue(a,"fx").length||h.empty.fire()})})),1===a.nodeType&&("height"in b||"width"in b)&&(c.overflow=[o.overflow,o.overflowX,o.overflowY],j=n.css(a,"display"),k="none"===j?L.get(a,"olddisplay")||tb(a.nodeName):j,"inline"===k&&"none"===n.css(a,"float")&&(o.display="inline-block")),c.overflow&&(o.overflow="hidden",l.always(function(){o.overflow=c.overflow[0],o.overflowX=c.overflow[1],o.overflowY=c.overflow[2]}));for(d in b)if(e=b[d],Nb.exec(e)){if(delete b[d],f=f||"toggle"===e,e===(p?"hide":"show")){if("show"!==e||!q||void 0===q[d])continue;p=!0}m[d]=q&&q[d]||n.style(a,d)}else j=void 0;if(n.isEmptyObject(m))"inline"===("none"===j?tb(a.nodeName):j)&&(o.display=j);else{q?"hidden"in q&&(p=q.hidden):q=L.access(a,"fxshow",{}),f&&(q.hidden=!p),p?n(a).show():l.done(function(){n(a).hide()}),l.done(function(){var b;L.remove(a,"fxshow");for(b in m)n.style(a,b,m[b])});for(d in m)g=Ub(p?q[d]:0,d,l),d in q||(q[d]=g.start,p&&(g.end=g.start,g.start="width"===d||"height"===d?1:0))}}function Wb(a,b){var c,d,e,f,g;for(c in a)if(d=n.camelCase(c),e=b[d],f=a[c],n.isArray(f)&&(e=f[1],f=a[c]=f[0]),c!==d&&(a[d]=f,delete a[c]),g=n.cssHooks[d],g&&"expand"in g){f=g.expand(f),delete a[d];for(c in f)c in a||(a[c]=f[c],b[c]=e)}else b[d]=e}function Xb(a,b,c){var d,e,f=0,g=Qb.length,h=n.Deferred().always(function(){delete i.elem}),i=function(){if(e)return!1;for(var b=Lb||Sb(),c=Math.max(0,j.startTime+j.duration-b),d=c/j.duration||0,f=1-d,g=0,i=j.tweens.length;i>g;g++)j.tweens[g].run(f);return h.notifyWith(a,[j,f,c]),1>f&&i?c:(h.resolveWith(a,[j]),!1)},j=h.promise({elem:a,props:n.extend({},b),opts:n.extend(!0,{specialEasing:{}},c),originalProperties:b,originalOptions:c,startTime:Lb||Sb(),duration:c.duration,tweens:[],createTween:function(b,c){var d=n.Tween(a,j.opts,b,c,j.opts.specialEasing[b]||j.opts.easing);return j.tweens.push(d),d},stop:function(b){var c=0,d=b?j.tweens.length:0;if(e)return this;for(e=!0;d>c;c++)j.tweens[c].run(1);return b?h.resolveWith(a,[j,b]):h.rejectWith(a,[j,b]),this}}),k=j.props;for(Wb(k,j.opts.specialEasing);g>f;f++)if(d=Qb[f].call(j,a,k,j.opts))return d;return n.map(k,Ub,j),n.isFunction(j.opts.start)&&j.opts.start.call(a,j),n.fx.timer(n.extend(i,{elem:a,anim:j,queue:j.opts.queue})),j.progress(j.opts.progress).done(j.opts.done,j.opts.complete).fail(j.opts.fail).always(j.opts.always)}n.Animation=n.extend(Xb,{tweener:function(a,b){n.isFunction(a)?(b=a,a=["*"]):a=a.split(" ");for(var c,d=0,e=a.length;e>d;d++)c=a[d],Rb[c]=Rb[c]||[],Rb[c].unshift(b)},prefilter:function(a,b){b?Qb.unshift(a):Qb.push(a)}}),n.speed=function(a,b,c){var d=a&&"object"==typeof a?n.extend({},a):{complete:c||!c&&b||n.isFunction(a)&&a,duration:a,easing:c&&b||b&&!n.isFunction(b)&&b};return d.duration=n.fx.off?0:"number"==typeof d.duration?d.duration:d.duration in n.fx.speeds?n.fx.speeds[d.duration]:n.fx.speeds._default,(null==d.queue||d.queue===!0)&&(d.queue="fx"),d.old=d.complete,d.complete=function(){n.isFunction(d.old)&&d.old.call(this),d.queue&&n.dequeue(this,d.queue)},d},n.fn.extend({fadeTo:function(a,b,c,d){return this.filter(S).css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){var e=n.isEmptyObject(a),f=n.speed(b,c,d),g=function(){var b=Xb(this,n.extend({},a),f);(e||L.get(this,"finish"))&&b.stop(!0)};return g.finish=g,e||f.queue===!1?this.each(g):this.queue(f.queue,g)},stop:function(a,b,c){var d=function(a){var b=a.stop;delete a.stop,b(c)};return"string"!=typeof a&&(c=b,b=a,a=void 0),b&&a!==!1&&this.queue(a||"fx",[]),this.each(function(){var b=!0,e=null!=a&&a+"queueHooks",f=n.timers,g=L.get(this);if(e)g[e]&&g[e].stop&&d(g[e]);else for(e in g)g[e]&&g[e].stop&&Pb.test(e)&&d(g[e]);for(e=f.length;e--;)f[e].elem!==this||null!=a&&f[e].queue!==a||(f[e].anim.stop(c),b=!1,f.splice(e,1));(b||!c)&&n.dequeue(this,a)})},finish:function(a){return a!==!1&&(a=a||"fx"),this.each(function(){var b,c=L.get(this),d=c[a+"queue"],e=c[a+"queueHooks"],f=n.timers,g=d?d.length:0;for(c.finish=!0,n.queue(this,a,[]),e&&e.stop&&e.stop.call(this,!0),b=f.length;b--;)f[b].elem===this&&f[b].queue===a&&(f[b].anim.stop(!0),f.splice(b,1));for(b=0;g>b;b++)d[b]&&d[b].finish&&d[b].finish.call(this);delete c.finish})}}),n.each(["toggle","show","hide"],function(a,b){var c=n.fn[b];n.fn[b]=function(a,d,e){return null==a||"boolean"==typeof a?c.apply(this,arguments):this.animate(Tb(b,!0),a,d,e)}}),n.each({slideDown:Tb("show"),slideUp:Tb("hide"),slideToggle:Tb("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){n.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),n.timers=[],n.fx.tick=function(){var a,b=0,c=n.timers;for(Lb=n.now();b<c.length;b++)a=c[b],a()||c[b]!==a||c.splice(b--,1);c.length||n.fx.stop(),Lb=void 0},n.fx.timer=function(a){n.timers.push(a),a()?n.fx.start():n.timers.pop()},n.fx.interval=13,n.fx.start=function(){Mb||(Mb=setInterval(n.fx.tick,n.fx.interval))},n.fx.stop=function(){clearInterval(Mb),Mb=null},n.fx.speeds={slow:600,fast:200,_default:400},n.fn.delay=function(a,b){return a=n.fx?n.fx.speeds[a]||a:a,b=b||"fx",this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},function(){var a=l.createElement("input"),b=l.createElement("select"),c=b.appendChild(l.createElement("option"));a.type="checkbox",k.checkOn=""!==a.value,k.optSelected=c.selected,b.disabled=!0,k.optDisabled=!c.disabled,a=l.createElement("input"),a.value="t",a.type="radio",k.radioValue="t"===a.value}();var Yb,Zb,$b=n.expr.attrHandle;n.fn.extend({attr:function(a,b){return J(this,n.attr,a,b,arguments.length>1)},removeAttr:function(a){return this.each(function(){n.removeAttr(this,a)})}}),n.extend({attr:function(a,b,c){var d,e,f=a.nodeType;if(a&&3!==f&&8!==f&&2!==f)return typeof a.getAttribute===U?n.prop(a,b,c):(1===f&&n.isXMLDoc(a)||(b=b.toLowerCase(),d=n.attrHooks[b]||(n.expr.match.bool.test(b)?Zb:Yb)),void 0===c?d&&"get"in d&&null!==(e=d.get(a,b))?e:(e=n.find.attr(a,b),null==e?void 0:e):null!==c?d&&"set"in d&&void 0!==(e=d.set(a,c,b))?e:(a.setAttribute(b,c+""),c):void n.removeAttr(a,b))
},removeAttr:function(a,b){var c,d,e=0,f=b&&b.match(E);if(f&&1===a.nodeType)while(c=f[e++])d=n.propFix[c]||c,n.expr.match.bool.test(c)&&(a[d]=!1),a.removeAttribute(c)},attrHooks:{type:{set:function(a,b){if(!k.radioValue&&"radio"===b&&n.nodeName(a,"input")){var c=a.value;return a.setAttribute("type",b),c&&(a.value=c),b}}}}}),Zb={set:function(a,b,c){return b===!1?n.removeAttr(a,c):a.setAttribute(c,c),c}},n.each(n.expr.match.bool.source.match(/\w+/g),function(a,b){var c=$b[b]||n.find.attr;$b[b]=function(a,b,d){var e,f;return d||(f=$b[b],$b[b]=e,e=null!=c(a,b,d)?b.toLowerCase():null,$b[b]=f),e}});var _b=/^(?:input|select|textarea|button)$/i;n.fn.extend({prop:function(a,b){return J(this,n.prop,a,b,arguments.length>1)},removeProp:function(a){return this.each(function(){delete this[n.propFix[a]||a]})}}),n.extend({propFix:{"for":"htmlFor","class":"className"},prop:function(a,b,c){var d,e,f,g=a.nodeType;if(a&&3!==g&&8!==g&&2!==g)return f=1!==g||!n.isXMLDoc(a),f&&(b=n.propFix[b]||b,e=n.propHooks[b]),void 0!==c?e&&"set"in e&&void 0!==(d=e.set(a,c,b))?d:a[b]=c:e&&"get"in e&&null!==(d=e.get(a,b))?d:a[b]},propHooks:{tabIndex:{get:function(a){return a.hasAttribute("tabindex")||_b.test(a.nodeName)||a.href?a.tabIndex:-1}}}}),k.optSelected||(n.propHooks.selected={get:function(a){var b=a.parentNode;return b&&b.parentNode&&b.parentNode.selectedIndex,null}}),n.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){n.propFix[this.toLowerCase()]=this});var ac=/[\t\r\n\f]/g;n.fn.extend({addClass:function(a){var b,c,d,e,f,g,h="string"==typeof a&&a,i=0,j=this.length;if(n.isFunction(a))return this.each(function(b){n(this).addClass(a.call(this,b,this.className))});if(h)for(b=(a||"").match(E)||[];j>i;i++)if(c=this[i],d=1===c.nodeType&&(c.className?(" "+c.className+" ").replace(ac," "):" ")){f=0;while(e=b[f++])d.indexOf(" "+e+" ")<0&&(d+=e+" ");g=n.trim(d),c.className!==g&&(c.className=g)}return this},removeClass:function(a){var b,c,d,e,f,g,h=0===arguments.length||"string"==typeof a&&a,i=0,j=this.length;if(n.isFunction(a))return this.each(function(b){n(this).removeClass(a.call(this,b,this.className))});if(h)for(b=(a||"").match(E)||[];j>i;i++)if(c=this[i],d=1===c.nodeType&&(c.className?(" "+c.className+" ").replace(ac," "):"")){f=0;while(e=b[f++])while(d.indexOf(" "+e+" ")>=0)d=d.replace(" "+e+" "," ");g=a?n.trim(d):"",c.className!==g&&(c.className=g)}return this},toggleClass:function(a,b){var c=typeof a;return"boolean"==typeof b&&"string"===c?b?this.addClass(a):this.removeClass(a):this.each(n.isFunction(a)?function(c){n(this).toggleClass(a.call(this,c,this.className,b),b)}:function(){if("string"===c){var b,d=0,e=n(this),f=a.match(E)||[];while(b=f[d++])e.hasClass(b)?e.removeClass(b):e.addClass(b)}else(c===U||"boolean"===c)&&(this.className&&L.set(this,"__className__",this.className),this.className=this.className||a===!1?"":L.get(this,"__className__")||"")})},hasClass:function(a){for(var b=" "+a+" ",c=0,d=this.length;d>c;c++)if(1===this[c].nodeType&&(" "+this[c].className+" ").replace(ac," ").indexOf(b)>=0)return!0;return!1}});var bc=/\r/g;n.fn.extend({val:function(a){var b,c,d,e=this[0];{if(arguments.length)return d=n.isFunction(a),this.each(function(c){var e;1===this.nodeType&&(e=d?a.call(this,c,n(this).val()):a,null==e?e="":"number"==typeof e?e+="":n.isArray(e)&&(e=n.map(e,function(a){return null==a?"":a+""})),b=n.valHooks[this.type]||n.valHooks[this.nodeName.toLowerCase()],b&&"set"in b&&void 0!==b.set(this,e,"value")||(this.value=e))});if(e)return b=n.valHooks[e.type]||n.valHooks[e.nodeName.toLowerCase()],b&&"get"in b&&void 0!==(c=b.get(e,"value"))?c:(c=e.value,"string"==typeof c?c.replace(bc,""):null==c?"":c)}}}),n.extend({valHooks:{option:{get:function(a){var b=n.find.attr(a,"value");return null!=b?b:n.trim(n.text(a))}},select:{get:function(a){for(var b,c,d=a.options,e=a.selectedIndex,f="select-one"===a.type||0>e,g=f?null:[],h=f?e+1:d.length,i=0>e?h:f?e:0;h>i;i++)if(c=d[i],!(!c.selected&&i!==e||(k.optDisabled?c.disabled:null!==c.getAttribute("disabled"))||c.parentNode.disabled&&n.nodeName(c.parentNode,"optgroup"))){if(b=n(c).val(),f)return b;g.push(b)}return g},set:function(a,b){var c,d,e=a.options,f=n.makeArray(b),g=e.length;while(g--)d=e[g],(d.selected=n.inArray(d.value,f)>=0)&&(c=!0);return c||(a.selectedIndex=-1),f}}}}),n.each(["radio","checkbox"],function(){n.valHooks[this]={set:function(a,b){return n.isArray(b)?a.checked=n.inArray(n(a).val(),b)>=0:void 0}},k.checkOn||(n.valHooks[this].get=function(a){return null===a.getAttribute("value")?"on":a.value})}),n.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){n.fn[b]=function(a,c){return arguments.length>0?this.on(b,null,a,c):this.trigger(b)}}),n.fn.extend({hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return 1===arguments.length?this.off(a,"**"):this.off(b,a||"**",c)}});var cc=n.now(),dc=/\?/;n.parseJSON=function(a){return JSON.parse(a+"")},n.parseXML=function(a){var b,c;if(!a||"string"!=typeof a)return null;try{c=new DOMParser,b=c.parseFromString(a,"text/xml")}catch(d){b=void 0}return(!b||b.getElementsByTagName("parsererror").length)&&n.error("Invalid XML: "+a),b};var ec,fc,gc=/#.*$/,hc=/([?&])_=[^&]*/,ic=/^(.*?):[ \t]*([^\r\n]*)$/gm,jc=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,kc=/^(?:GET|HEAD)$/,lc=/^\/\//,mc=/^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,nc={},oc={},pc="*/".concat("*");try{fc=location.href}catch(qc){fc=l.createElement("a"),fc.href="",fc=fc.href}ec=mc.exec(fc.toLowerCase())||[];function rc(a){return function(b,c){"string"!=typeof b&&(c=b,b="*");var d,e=0,f=b.toLowerCase().match(E)||[];if(n.isFunction(c))while(d=f[e++])"+"===d[0]?(d=d.slice(1)||"*",(a[d]=a[d]||[]).unshift(c)):(a[d]=a[d]||[]).push(c)}}function sc(a,b,c,d){var e={},f=a===oc;function g(h){var i;return e[h]=!0,n.each(a[h]||[],function(a,h){var j=h(b,c,d);return"string"!=typeof j||f||e[j]?f?!(i=j):void 0:(b.dataTypes.unshift(j),g(j),!1)}),i}return g(b.dataTypes[0])||!e["*"]&&g("*")}function tc(a,b){var c,d,e=n.ajaxSettings.flatOptions||{};for(c in b)void 0!==b[c]&&((e[c]?a:d||(d={}))[c]=b[c]);return d&&n.extend(!0,a,d),a}function uc(a,b,c){var d,e,f,g,h=a.contents,i=a.dataTypes;while("*"===i[0])i.shift(),void 0===d&&(d=a.mimeType||b.getResponseHeader("Content-Type"));if(d)for(e in h)if(h[e]&&h[e].test(d)){i.unshift(e);break}if(i[0]in c)f=i[0];else{for(e in c){if(!i[0]||a.converters[e+" "+i[0]]){f=e;break}g||(g=e)}f=f||g}return f?(f!==i[0]&&i.unshift(f),c[f]):void 0}function vc(a,b,c,d){var e,f,g,h,i,j={},k=a.dataTypes.slice();if(k[1])for(g in a.converters)j[g.toLowerCase()]=a.converters[g];f=k.shift();while(f)if(a.responseFields[f]&&(c[a.responseFields[f]]=b),!i&&d&&a.dataFilter&&(b=a.dataFilter(b,a.dataType)),i=f,f=k.shift())if("*"===f)f=i;else if("*"!==i&&i!==f){if(g=j[i+" "+f]||j["* "+f],!g)for(e in j)if(h=e.split(" "),h[1]===f&&(g=j[i+" "+h[0]]||j["* "+h[0]])){g===!0?g=j[e]:j[e]!==!0&&(f=h[0],k.unshift(h[1]));break}if(g!==!0)if(g&&a["throws"])b=g(b);else try{b=g(b)}catch(l){return{state:"parsererror",error:g?l:"No conversion from "+i+" to "+f}}}return{state:"success",data:b}}n.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:fc,type:"GET",isLocal:jc.test(ec[1]),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":pc,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":n.parseJSON,"text xml":n.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(a,b){return b?tc(tc(a,n.ajaxSettings),b):tc(n.ajaxSettings,a)},ajaxPrefilter:rc(nc),ajaxTransport:rc(oc),ajax:function(a,b){"object"==typeof a&&(b=a,a=void 0),b=b||{};var c,d,e,f,g,h,i,j,k=n.ajaxSetup({},b),l=k.context||k,m=k.context&&(l.nodeType||l.jquery)?n(l):n.event,o=n.Deferred(),p=n.Callbacks("once memory"),q=k.statusCode||{},r={},s={},t=0,u="canceled",v={readyState:0,getResponseHeader:function(a){var b;if(2===t){if(!f){f={};while(b=ic.exec(e))f[b[1].toLowerCase()]=b[2]}b=f[a.toLowerCase()]}return null==b?null:b},getAllResponseHeaders:function(){return 2===t?e:null},setRequestHeader:function(a,b){var c=a.toLowerCase();return t||(a=s[c]=s[c]||a,r[a]=b),this},overrideMimeType:function(a){return t||(k.mimeType=a),this},statusCode:function(a){var b;if(a)if(2>t)for(b in a)q[b]=[q[b],a[b]];else v.always(a[v.status]);return this},abort:function(a){var b=a||u;return c&&c.abort(b),x(0,b),this}};if(o.promise(v).complete=p.add,v.success=v.done,v.error=v.fail,k.url=((a||k.url||fc)+"").replace(gc,"").replace(lc,ec[1]+"//"),k.type=b.method||b.type||k.method||k.type,k.dataTypes=n.trim(k.dataType||"*").toLowerCase().match(E)||[""],null==k.crossDomain&&(h=mc.exec(k.url.toLowerCase()),k.crossDomain=!(!h||h[1]===ec[1]&&h[2]===ec[2]&&(h[3]||("http:"===h[1]?"80":"443"))===(ec[3]||("http:"===ec[1]?"80":"443")))),k.data&&k.processData&&"string"!=typeof k.data&&(k.data=n.param(k.data,k.traditional)),sc(nc,k,b,v),2===t)return v;i=k.global,i&&0===n.active++&&n.event.trigger("ajaxStart"),k.type=k.type.toUpperCase(),k.hasContent=!kc.test(k.type),d=k.url,k.hasContent||(k.data&&(d=k.url+=(dc.test(d)?"&":"?")+k.data,delete k.data),k.cache===!1&&(k.url=hc.test(d)?d.replace(hc,"$1_="+cc++):d+(dc.test(d)?"&":"?")+"_="+cc++)),k.ifModified&&(n.lastModified[d]&&v.setRequestHeader("If-Modified-Since",n.lastModified[d]),n.etag[d]&&v.setRequestHeader("If-None-Match",n.etag[d])),(k.data&&k.hasContent&&k.contentType!==!1||b.contentType)&&v.setRequestHeader("Content-Type",k.contentType),v.setRequestHeader("Accept",k.dataTypes[0]&&k.accepts[k.dataTypes[0]]?k.accepts[k.dataTypes[0]]+("*"!==k.dataTypes[0]?", "+pc+"; q=0.01":""):k.accepts["*"]);for(j in k.headers)v.setRequestHeader(j,k.headers[j]);if(k.beforeSend&&(k.beforeSend.call(l,v,k)===!1||2===t))return v.abort();u="abort";for(j in{success:1,error:1,complete:1})v[j](k[j]);if(c=sc(oc,k,b,v)){v.readyState=1,i&&m.trigger("ajaxSend",[v,k]),k.async&&k.timeout>0&&(g=setTimeout(function(){v.abort("timeout")},k.timeout));try{t=1,c.send(r,x)}catch(w){if(!(2>t))throw w;x(-1,w)}}else x(-1,"No Transport");function x(a,b,f,h){var j,r,s,u,w,x=b;2!==t&&(t=2,g&&clearTimeout(g),c=void 0,e=h||"",v.readyState=a>0?4:0,j=a>=200&&300>a||304===a,f&&(u=uc(k,v,f)),u=vc(k,u,v,j),j?(k.ifModified&&(w=v.getResponseHeader("Last-Modified"),w&&(n.lastModified[d]=w),w=v.getResponseHeader("etag"),w&&(n.etag[d]=w)),204===a||"HEAD"===k.type?x="nocontent":304===a?x="notmodified":(x=u.state,r=u.data,s=u.error,j=!s)):(s=x,(a||!x)&&(x="error",0>a&&(a=0))),v.status=a,v.statusText=(b||x)+"",j?o.resolveWith(l,[r,x,v]):o.rejectWith(l,[v,x,s]),v.statusCode(q),q=void 0,i&&m.trigger(j?"ajaxSuccess":"ajaxError",[v,k,j?r:s]),p.fireWith(l,[v,x]),i&&(m.trigger("ajaxComplete",[v,k]),--n.active||n.event.trigger("ajaxStop")))}return v},getJSON:function(a,b,c){return n.get(a,b,c,"json")},getScript:function(a,b){return n.get(a,void 0,b,"script")}}),n.each(["get","post"],function(a,b){n[b]=function(a,c,d,e){return n.isFunction(c)&&(e=e||d,d=c,c=void 0),n.ajax({url:a,type:b,dataType:e,data:c,success:d})}}),n.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(a,b){n.fn[b]=function(a){return this.on(b,a)}}),n._evalUrl=function(a){return n.ajax({url:a,type:"GET",dataType:"script",async:!1,global:!1,"throws":!0})},n.fn.extend({wrapAll:function(a){var b;return n.isFunction(a)?this.each(function(b){n(this).wrapAll(a.call(this,b))}):(this[0]&&(b=n(a,this[0].ownerDocument).eq(0).clone(!0),this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstElementChild)a=a.firstElementChild;return a}).append(this)),this)},wrapInner:function(a){return this.each(n.isFunction(a)?function(b){n(this).wrapInner(a.call(this,b))}:function(){var b=n(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=n.isFunction(a);return this.each(function(c){n(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){n.nodeName(this,"body")||n(this).replaceWith(this.childNodes)}).end()}}),n.expr.filters.hidden=function(a){return a.offsetWidth<=0&&a.offsetHeight<=0},n.expr.filters.visible=function(a){return!n.expr.filters.hidden(a)};var wc=/%20/g,xc=/\[\]$/,yc=/\r?\n/g,zc=/^(?:submit|button|image|reset|file)$/i,Ac=/^(?:input|select|textarea|keygen)/i;function Bc(a,b,c,d){var e;if(n.isArray(b))n.each(b,function(b,e){c||xc.test(a)?d(a,e):Bc(a+"["+("object"==typeof e?b:"")+"]",e,c,d)});else if(c||"object"!==n.type(b))d(a,b);else for(e in b)Bc(a+"["+e+"]",b[e],c,d)}n.param=function(a,b){var c,d=[],e=function(a,b){b=n.isFunction(b)?b():null==b?"":b,d[d.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};if(void 0===b&&(b=n.ajaxSettings&&n.ajaxSettings.traditional),n.isArray(a)||a.jquery&&!n.isPlainObject(a))n.each(a,function(){e(this.name,this.value)});else for(c in a)Bc(c,a[c],b,e);return d.join("&").replace(wc,"+")},n.fn.extend({serialize:function(){return n.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var a=n.prop(this,"elements");return a?n.makeArray(a):this}).filter(function(){var a=this.type;return this.name&&!n(this).is(":disabled")&&Ac.test(this.nodeName)&&!zc.test(a)&&(this.checked||!T.test(a))}).map(function(a,b){var c=n(this).val();return null==c?null:n.isArray(c)?n.map(c,function(a){return{name:b.name,value:a.replace(yc,"\r\n")}}):{name:b.name,value:c.replace(yc,"\r\n")}}).get()}}),n.ajaxSettings.xhr=function(){try{return new XMLHttpRequest}catch(a){}};var Cc=0,Dc={},Ec={0:200,1223:204},Fc=n.ajaxSettings.xhr();a.ActiveXObject&&n(a).on("unload",function(){for(var a in Dc)Dc[a]()}),k.cors=!!Fc&&"withCredentials"in Fc,k.ajax=Fc=!!Fc,n.ajaxTransport(function(a){var b;return k.cors||Fc&&!a.crossDomain?{send:function(c,d){var e,f=a.xhr(),g=++Cc;if(f.open(a.type,a.url,a.async,a.username,a.password),a.xhrFields)for(e in a.xhrFields)f[e]=a.xhrFields[e];a.mimeType&&f.overrideMimeType&&f.overrideMimeType(a.mimeType),a.crossDomain||c["X-Requested-With"]||(c["X-Requested-With"]="XMLHttpRequest");for(e in c)f.setRequestHeader(e,c[e]);b=function(a){return function(){b&&(delete Dc[g],b=f.onload=f.onerror=null,"abort"===a?f.abort():"error"===a?d(f.status,f.statusText):d(Ec[f.status]||f.status,f.statusText,"string"==typeof f.responseText?{text:f.responseText}:void 0,f.getAllResponseHeaders()))}},f.onload=b(),f.onerror=b("error"),b=Dc[g]=b("abort");try{f.send(a.hasContent&&a.data||null)}catch(h){if(b)throw h}},abort:function(){b&&b()}}:void 0}),n.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/(?:java|ecma)script/},converters:{"text script":function(a){return n.globalEval(a),a}}}),n.ajaxPrefilter("script",function(a){void 0===a.cache&&(a.cache=!1),a.crossDomain&&(a.type="GET")}),n.ajaxTransport("script",function(a){if(a.crossDomain){var b,c;return{send:function(d,e){b=n("<script>").prop({async:!0,charset:a.scriptCharset,src:a.url}).on("load error",c=function(a){b.remove(),c=null,a&&e("error"===a.type?404:200,a.type)}),l.head.appendChild(b[0])},abort:function(){c&&c()}}}});var Gc=[],Hc=/(=)\?(?=&|$)|\?\?/;n.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var a=Gc.pop()||n.expando+"_"+cc++;return this[a]=!0,a}}),n.ajaxPrefilter("json jsonp",function(b,c,d){var e,f,g,h=b.jsonp!==!1&&(Hc.test(b.url)?"url":"string"==typeof b.data&&!(b.contentType||"").indexOf("application/x-www-form-urlencoded")&&Hc.test(b.data)&&"data");return h||"jsonp"===b.dataTypes[0]?(e=b.jsonpCallback=n.isFunction(b.jsonpCallback)?b.jsonpCallback():b.jsonpCallback,h?b[h]=b[h].replace(Hc,"$1"+e):b.jsonp!==!1&&(b.url+=(dc.test(b.url)?"&":"?")+b.jsonp+"="+e),b.converters["script json"]=function(){return g||n.error(e+" was not called"),g[0]},b.dataTypes[0]="json",f=a[e],a[e]=function(){g=arguments},d.always(function(){a[e]=f,b[e]&&(b.jsonpCallback=c.jsonpCallback,Gc.push(e)),g&&n.isFunction(f)&&f(g[0]),g=f=void 0}),"script"):void 0}),n.parseHTML=function(a,b,c){if(!a||"string"!=typeof a)return null;"boolean"==typeof b&&(c=b,b=!1),b=b||l;var d=v.exec(a),e=!c&&[];return d?[b.createElement(d[1])]:(d=n.buildFragment([a],b,e),e&&e.length&&n(e).remove(),n.merge([],d.childNodes))};var Ic=n.fn.load;n.fn.load=function(a,b,c){if("string"!=typeof a&&Ic)return Ic.apply(this,arguments);var d,e,f,g=this,h=a.indexOf(" ");return h>=0&&(d=n.trim(a.slice(h)),a=a.slice(0,h)),n.isFunction(b)?(c=b,b=void 0):b&&"object"==typeof b&&(e="POST"),g.length>0&&n.ajax({url:a,type:e,dataType:"html",data:b}).done(function(a){f=arguments,g.html(d?n("<div>").append(n.parseHTML(a)).find(d):a)}).complete(c&&function(a,b){g.each(c,f||[a.responseText,b,a])}),this},n.expr.filters.animated=function(a){return n.grep(n.timers,function(b){return a===b.elem}).length};var Jc=a.document.documentElement;function Kc(a){return n.isWindow(a)?a:9===a.nodeType&&a.defaultView}n.offset={setOffset:function(a,b,c){var d,e,f,g,h,i,j,k=n.css(a,"position"),l=n(a),m={};"static"===k&&(a.style.position="relative"),h=l.offset(),f=n.css(a,"top"),i=n.css(a,"left"),j=("absolute"===k||"fixed"===k)&&(f+i).indexOf("auto")>-1,j?(d=l.position(),g=d.top,e=d.left):(g=parseFloat(f)||0,e=parseFloat(i)||0),n.isFunction(b)&&(b=b.call(a,c,h)),null!=b.top&&(m.top=b.top-h.top+g),null!=b.left&&(m.left=b.left-h.left+e),"using"in b?b.using.call(a,m):l.css(m)}},n.fn.extend({offset:function(a){if(arguments.length)return void 0===a?this:this.each(function(b){n.offset.setOffset(this,a,b)});var b,c,d=this[0],e={top:0,left:0},f=d&&d.ownerDocument;if(f)return b=f.documentElement,n.contains(b,d)?(typeof d.getBoundingClientRect!==U&&(e=d.getBoundingClientRect()),c=Kc(f),{top:e.top+c.pageYOffset-b.clientTop,left:e.left+c.pageXOffset-b.clientLeft}):e},position:function(){if(this[0]){var a,b,c=this[0],d={top:0,left:0};return"fixed"===n.css(c,"position")?b=c.getBoundingClientRect():(a=this.offsetParent(),b=this.offset(),n.nodeName(a[0],"html")||(d=a.offset()),d.top+=n.css(a[0],"borderTopWidth",!0),d.left+=n.css(a[0],"borderLeftWidth",!0)),{top:b.top-d.top-n.css(c,"marginTop",!0),left:b.left-d.left-n.css(c,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||Jc;while(a&&!n.nodeName(a,"html")&&"static"===n.css(a,"position"))a=a.offsetParent;return a||Jc})}}),n.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(b,c){var d="pageYOffset"===c;n.fn[b]=function(e){return J(this,function(b,e,f){var g=Kc(b);return void 0===f?g?g[c]:b[e]:void(g?g.scrollTo(d?a.pageXOffset:f,d?f:a.pageYOffset):b[e]=f)},b,e,arguments.length,null)}}),n.each(["top","left"],function(a,b){n.cssHooks[b]=yb(k.pixelPosition,function(a,c){return c?(c=xb(a,b),vb.test(c)?n(a).position()[b]+"px":c):void 0})}),n.each({Height:"height",Width:"width"},function(a,b){n.each({padding:"inner"+a,content:b,"":"outer"+a},function(c,d){n.fn[d]=function(d,e){var f=arguments.length&&(c||"boolean"!=typeof d),g=c||(d===!0||e===!0?"margin":"border");return J(this,function(b,c,d){var e;return n.isWindow(b)?b.document.documentElement["client"+a]:9===b.nodeType?(e=b.documentElement,Math.max(b.body["scroll"+a],e["scroll"+a],b.body["offset"+a],e["offset"+a],e["client"+a])):void 0===d?n.css(b,c,g):n.style(b,c,d,g)},b,f?d:void 0,f,null)}})}),n.fn.size=function(){return this.length},n.fn.andSelf=n.fn.addBack,"function"==typeof define&&define.amd&&define("jquery",[],function(){return n});var Lc=a.jQuery,Mc=a.$;return n.noConflict=function(b){return a.$===n&&(a.$=Mc),b&&a.jQuery===n&&(a.jQuery=Lc),n},typeof b===U&&(a.jQuery=a.$=n),n});
//     Underscore.js 1.6.0
//     http://underscorejs.org
//     (c) 2009-2014 Jeremy Ashkenas, DocumentCloud and Investigative Reporters & Editors
//     Underscore may be freely distributed under the MIT license.
(function(){var n=this,t=n._,r={},e=Array.prototype,u=Object.prototype,i=Function.prototype,a=e.push,o=e.slice,c=e.concat,l=u.toString,f=u.hasOwnProperty,s=e.forEach,p=e.map,h=e.reduce,v=e.reduceRight,g=e.filter,d=e.every,m=e.some,y=e.indexOf,b=e.lastIndexOf,x=Array.isArray,w=Object.keys,_=i.bind,j=function(n){return n instanceof j?n:this instanceof j?void(this._wrapped=n):new j(n)};"undefined"!=typeof exports?("undefined"!=typeof module&&module.exports&&(exports=module.exports=j),exports._=j):n._=j,j.VERSION="1.6.0";var A=j.each=j.forEach=function(n,t,e){if(null==n)return n;if(s&&n.forEach===s)n.forEach(t,e);else if(n.length===+n.length){for(var u=0,i=n.length;i>u;u++)if(t.call(e,n[u],u,n)===r)return}else for(var a=j.keys(n),u=0,i=a.length;i>u;u++)if(t.call(e,n[a[u]],a[u],n)===r)return;return n};j.map=j.collect=function(n,t,r){var e=[];return null==n?e:p&&n.map===p?n.map(t,r):(A(n,function(n,u,i){e.push(t.call(r,n,u,i))}),e)};var O="Reduce of empty array with no initial value";j.reduce=j.foldl=j.inject=function(n,t,r,e){var u=arguments.length>2;if(null==n&&(n=[]),h&&n.reduce===h)return e&&(t=j.bind(t,e)),u?n.reduce(t,r):n.reduce(t);if(A(n,function(n,i,a){u?r=t.call(e,r,n,i,a):(r=n,u=!0)}),!u)throw new TypeError(O);return r},j.reduceRight=j.foldr=function(n,t,r,e){var u=arguments.length>2;if(null==n&&(n=[]),v&&n.reduceRight===v)return e&&(t=j.bind(t,e)),u?n.reduceRight(t,r):n.reduceRight(t);var i=n.length;if(i!==+i){var a=j.keys(n);i=a.length}if(A(n,function(o,c,l){c=a?a[--i]:--i,u?r=t.call(e,r,n[c],c,l):(r=n[c],u=!0)}),!u)throw new TypeError(O);return r},j.find=j.detect=function(n,t,r){var e;return k(n,function(n,u,i){return t.call(r,n,u,i)?(e=n,!0):void 0}),e},j.filter=j.select=function(n,t,r){var e=[];return null==n?e:g&&n.filter===g?n.filter(t,r):(A(n,function(n,u,i){t.call(r,n,u,i)&&e.push(n)}),e)},j.reject=function(n,t,r){return j.filter(n,function(n,e,u){return!t.call(r,n,e,u)},r)},j.every=j.all=function(n,t,e){t||(t=j.identity);var u=!0;return null==n?u:d&&n.every===d?n.every(t,e):(A(n,function(n,i,a){return(u=u&&t.call(e,n,i,a))?void 0:r}),!!u)};var k=j.some=j.any=function(n,t,e){t||(t=j.identity);var u=!1;return null==n?u:m&&n.some===m?n.some(t,e):(A(n,function(n,i,a){return u||(u=t.call(e,n,i,a))?r:void 0}),!!u)};j.contains=j.include=function(n,t){return null==n?!1:y&&n.indexOf===y?n.indexOf(t)!=-1:k(n,function(n){return n===t})},j.invoke=function(n,t){var r=o.call(arguments,2),e=j.isFunction(t);return j.map(n,function(n){return(e?t:n[t]).apply(n,r)})},j.pluck=function(n,t){return j.map(n,j.property(t))},j.where=function(n,t){return j.filter(n,j.matches(t))},j.findWhere=function(n,t){return j.find(n,j.matches(t))},j.max=function(n,t,r){if(!t&&j.isArray(n)&&n[0]===+n[0]&&n.length<65535)return Math.max.apply(Math,n);var e=-1/0,u=-1/0;return A(n,function(n,i,a){var o=t?t.call(r,n,i,a):n;o>u&&(e=n,u=o)}),e},j.min=function(n,t,r){if(!t&&j.isArray(n)&&n[0]===+n[0]&&n.length<65535)return Math.min.apply(Math,n);var e=1/0,u=1/0;return A(n,function(n,i,a){var o=t?t.call(r,n,i,a):n;u>o&&(e=n,u=o)}),e},j.shuffle=function(n){var t,r=0,e=[];return A(n,function(n){t=j.random(r++),e[r-1]=e[t],e[t]=n}),e},j.sample=function(n,t,r){return null==t||r?(n.length!==+n.length&&(n=j.values(n)),n[j.random(n.length-1)]):j.shuffle(n).slice(0,Math.max(0,t))};var E=function(n){return null==n?j.identity:j.isFunction(n)?n:j.property(n)};j.sortBy=function(n,t,r){return t=E(t),j.pluck(j.map(n,function(n,e,u){return{value:n,index:e,criteria:t.call(r,n,e,u)}}).sort(function(n,t){var r=n.criteria,e=t.criteria;if(r!==e){if(r>e||r===void 0)return 1;if(e>r||e===void 0)return-1}return n.index-t.index}),"value")};var F=function(n){return function(t,r,e){var u={};return r=E(r),A(t,function(i,a){var o=r.call(e,i,a,t);n(u,o,i)}),u}};j.groupBy=F(function(n,t,r){j.has(n,t)?n[t].push(r):n[t]=[r]}),j.indexBy=F(function(n,t,r){n[t]=r}),j.countBy=F(function(n,t){j.has(n,t)?n[t]++:n[t]=1}),j.sortedIndex=function(n,t,r,e){r=E(r);for(var u=r.call(e,t),i=0,a=n.length;a>i;){var o=i+a>>>1;r.call(e,n[o])<u?i=o+1:a=o}return i},j.toArray=function(n){return n?j.isArray(n)?o.call(n):n.length===+n.length?j.map(n,j.identity):j.values(n):[]},j.size=function(n){return null==n?0:n.length===+n.length?n.length:j.keys(n).length},j.first=j.head=j.take=function(n,t,r){return null==n?void 0:null==t||r?n[0]:0>t?[]:o.call(n,0,t)},j.initial=function(n,t,r){return o.call(n,0,n.length-(null==t||r?1:t))},j.last=function(n,t,r){return null==n?void 0:null==t||r?n[n.length-1]:o.call(n,Math.max(n.length-t,0))},j.rest=j.tail=j.drop=function(n,t,r){return o.call(n,null==t||r?1:t)},j.compact=function(n){return j.filter(n,j.identity)};var M=function(n,t,r){return t&&j.every(n,j.isArray)?c.apply(r,n):(A(n,function(n){j.isArray(n)||j.isArguments(n)?t?a.apply(r,n):M(n,t,r):r.push(n)}),r)};j.flatten=function(n,t){return M(n,t,[])},j.without=function(n){return j.difference(n,o.call(arguments,1))},j.partition=function(n,t){var r=[],e=[];return A(n,function(n){(t(n)?r:e).push(n)}),[r,e]},j.uniq=j.unique=function(n,t,r,e){j.isFunction(t)&&(e=r,r=t,t=!1);var u=r?j.map(n,r,e):n,i=[],a=[];return A(u,function(r,e){(t?e&&a[a.length-1]===r:j.contains(a,r))||(a.push(r),i.push(n[e]))}),i},j.union=function(){return j.uniq(j.flatten(arguments,!0))},j.intersection=function(n){var t=o.call(arguments,1);return j.filter(j.uniq(n),function(n){return j.every(t,function(t){return j.contains(t,n)})})},j.difference=function(n){var t=c.apply(e,o.call(arguments,1));return j.filter(n,function(n){return!j.contains(t,n)})},j.zip=function(){for(var n=j.max(j.pluck(arguments,"length").concat(0)),t=new Array(n),r=0;n>r;r++)t[r]=j.pluck(arguments,""+r);return t},j.object=function(n,t){if(null==n)return{};for(var r={},e=0,u=n.length;u>e;e++)t?r[n[e]]=t[e]:r[n[e][0]]=n[e][1];return r},j.indexOf=function(n,t,r){if(null==n)return-1;var e=0,u=n.length;if(r){if("number"!=typeof r)return e=j.sortedIndex(n,t),n[e]===t?e:-1;e=0>r?Math.max(0,u+r):r}if(y&&n.indexOf===y)return n.indexOf(t,r);for(;u>e;e++)if(n[e]===t)return e;return-1},j.lastIndexOf=function(n,t,r){if(null==n)return-1;var e=null!=r;if(b&&n.lastIndexOf===b)return e?n.lastIndexOf(t,r):n.lastIndexOf(t);for(var u=e?r:n.length;u--;)if(n[u]===t)return u;return-1},j.range=function(n,t,r){arguments.length<=1&&(t=n||0,n=0),r=arguments[2]||1;for(var e=Math.max(Math.ceil((t-n)/r),0),u=0,i=new Array(e);e>u;)i[u++]=n,n+=r;return i};var R=function(){};j.bind=function(n,t){var r,e;if(_&&n.bind===_)return _.apply(n,o.call(arguments,1));if(!j.isFunction(n))throw new TypeError;return r=o.call(arguments,2),e=function(){if(!(this instanceof e))return n.apply(t,r.concat(o.call(arguments)));R.prototype=n.prototype;var u=new R;R.prototype=null;var i=n.apply(u,r.concat(o.call(arguments)));return Object(i)===i?i:u}},j.partial=function(n){var t=o.call(arguments,1);return function(){for(var r=0,e=t.slice(),u=0,i=e.length;i>u;u++)e[u]===j&&(e[u]=arguments[r++]);for(;r<arguments.length;)e.push(arguments[r++]);return n.apply(this,e)}},j.bindAll=function(n){var t=o.call(arguments,1);if(0===t.length)throw new Error("bindAll must be passed function names");return A(t,function(t){n[t]=j.bind(n[t],n)}),n},j.memoize=function(n,t){var r={};return t||(t=j.identity),function(){var e=t.apply(this,arguments);return j.has(r,e)?r[e]:r[e]=n.apply(this,arguments)}},j.delay=function(n,t){var r=o.call(arguments,2);return setTimeout(function(){return n.apply(null,r)},t)},j.defer=function(n){return j.delay.apply(j,[n,1].concat(o.call(arguments,1)))},j.throttle=function(n,t,r){var e,u,i,a=null,o=0;r||(r={});var c=function(){o=r.leading===!1?0:j.now(),a=null,i=n.apply(e,u),e=u=null};return function(){var l=j.now();o||r.leading!==!1||(o=l);var f=t-(l-o);return e=this,u=arguments,0>=f?(clearTimeout(a),a=null,o=l,i=n.apply(e,u),e=u=null):a||r.trailing===!1||(a=setTimeout(c,f)),i}},j.debounce=function(n,t,r){var e,u,i,a,o,c=function(){var l=j.now()-a;t>l?e=setTimeout(c,t-l):(e=null,r||(o=n.apply(i,u),i=u=null))};return function(){i=this,u=arguments,a=j.now();var l=r&&!e;return e||(e=setTimeout(c,t)),l&&(o=n.apply(i,u),i=u=null),o}},j.once=function(n){var t,r=!1;return function(){return r?t:(r=!0,t=n.apply(this,arguments),n=null,t)}},j.wrap=function(n,t){return j.partial(t,n)},j.compose=function(){var n=arguments;return function(){for(var t=arguments,r=n.length-1;r>=0;r--)t=[n[r].apply(this,t)];return t[0]}},j.after=function(n,t){return function(){return--n<1?t.apply(this,arguments):void 0}},j.keys=function(n){if(!j.isObject(n))return[];if(w)return w(n);var t=[];for(var r in n)j.has(n,r)&&t.push(r);return t},j.values=function(n){for(var t=j.keys(n),r=t.length,e=new Array(r),u=0;r>u;u++)e[u]=n[t[u]];return e},j.pairs=function(n){for(var t=j.keys(n),r=t.length,e=new Array(r),u=0;r>u;u++)e[u]=[t[u],n[t[u]]];return e},j.invert=function(n){for(var t={},r=j.keys(n),e=0,u=r.length;u>e;e++)t[n[r[e]]]=r[e];return t},j.functions=j.methods=function(n){var t=[];for(var r in n)j.isFunction(n[r])&&t.push(r);return t.sort()},j.extend=function(n){return A(o.call(arguments,1),function(t){if(t)for(var r in t)n[r]=t[r]}),n},j.pick=function(n){var t={},r=c.apply(e,o.call(arguments,1));return A(r,function(r){r in n&&(t[r]=n[r])}),t},j.omit=function(n){var t={},r=c.apply(e,o.call(arguments,1));for(var u in n)j.contains(r,u)||(t[u]=n[u]);return t},j.defaults=function(n){return A(o.call(arguments,1),function(t){if(t)for(var r in t)n[r]===void 0&&(n[r]=t[r])}),n},j.clone=function(n){return j.isObject(n)?j.isArray(n)?n.slice():j.extend({},n):n},j.tap=function(n,t){return t(n),n};var S=function(n,t,r,e){if(n===t)return 0!==n||1/n==1/t;if(null==n||null==t)return n===t;n instanceof j&&(n=n._wrapped),t instanceof j&&(t=t._wrapped);var u=l.call(n);if(u!=l.call(t))return!1;switch(u){case"[object String]":return n==String(t);case"[object Number]":return n!=+n?t!=+t:0==n?1/n==1/t:n==+t;case"[object Date]":case"[object Boolean]":return+n==+t;case"[object RegExp]":return n.source==t.source&&n.global==t.global&&n.multiline==t.multiline&&n.ignoreCase==t.ignoreCase}if("object"!=typeof n||"object"!=typeof t)return!1;for(var i=r.length;i--;)if(r[i]==n)return e[i]==t;var a=n.constructor,o=t.constructor;if(a!==o&&!(j.isFunction(a)&&a instanceof a&&j.isFunction(o)&&o instanceof o)&&"constructor"in n&&"constructor"in t)return!1;r.push(n),e.push(t);var c=0,f=!0;if("[object Array]"==u){if(c=n.length,f=c==t.length)for(;c--&&(f=S(n[c],t[c],r,e)););}else{for(var s in n)if(j.has(n,s)&&(c++,!(f=j.has(t,s)&&S(n[s],t[s],r,e))))break;if(f){for(s in t)if(j.has(t,s)&&!c--)break;f=!c}}return r.pop(),e.pop(),f};j.isEqual=function(n,t){return S(n,t,[],[])},j.isEmpty=function(n){if(null==n)return!0;if(j.isArray(n)||j.isString(n))return 0===n.length;for(var t in n)if(j.has(n,t))return!1;return!0},j.isElement=function(n){return!(!n||1!==n.nodeType)},j.isArray=x||function(n){return"[object Array]"==l.call(n)},j.isObject=function(n){return n===Object(n)},A(["Arguments","Function","String","Number","Date","RegExp"],function(n){j["is"+n]=function(t){return l.call(t)=="[object "+n+"]"}}),j.isArguments(arguments)||(j.isArguments=function(n){return!(!n||!j.has(n,"callee"))}),"function"!=typeof/./&&(j.isFunction=function(n){return"function"==typeof n}),j.isFinite=function(n){return isFinite(n)&&!isNaN(parseFloat(n))},j.isNaN=function(n){return j.isNumber(n)&&n!=+n},j.isBoolean=function(n){return n===!0||n===!1||"[object Boolean]"==l.call(n)},j.isNull=function(n){return null===n},j.isUndefined=function(n){return n===void 0},j.has=function(n,t){return f.call(n,t)},j.noConflict=function(){return n._=t,this},j.identity=function(n){return n},j.constant=function(n){return function(){return n}},j.property=function(n){return function(t){return t[n]}},j.matches=function(n){return function(t){if(t===n)return!0;for(var r in n)if(n[r]!==t[r])return!1;return!0}},j.times=function(n,t,r){for(var e=Array(Math.max(0,n)),u=0;n>u;u++)e[u]=t.call(r,u);return e},j.random=function(n,t){return null==t&&(t=n,n=0),n+Math.floor(Math.random()*(t-n+1))},j.now=Date.now||function(){return(new Date).getTime()};var T={escape:{"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;"}};T.unescape=j.invert(T.escape);var I={escape:new RegExp("["+j.keys(T.escape).join("")+"]","g"),unescape:new RegExp("("+j.keys(T.unescape).join("|")+")","g")};j.each(["escape","unescape"],function(n){j[n]=function(t){return null==t?"":(""+t).replace(I[n],function(t){return T[n][t]})}}),j.result=function(n,t){if(null==n)return void 0;var r=n[t];return j.isFunction(r)?r.call(n):r},j.mixin=function(n){A(j.functions(n),function(t){var r=j[t]=n[t];j.prototype[t]=function(){var n=[this._wrapped];return a.apply(n,arguments),z.call(this,r.apply(j,n))}})};var N=0;j.uniqueId=function(n){var t=++N+"";return n?n+t:t},j.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var q=/(.)^/,B={"'":"'","\\":"\\","\r":"r","\n":"n","	":"t","\u2028":"u2028","\u2029":"u2029"},D=/\\|'|\r|\n|\t|\u2028|\u2029/g;j.template=function(n,t,r){var e;r=j.defaults({},r,j.templateSettings);var u=new RegExp([(r.escape||q).source,(r.interpolate||q).source,(r.evaluate||q).source].join("|")+"|$","g"),i=0,a="__p+='";n.replace(u,function(t,r,e,u,o){return a+=n.slice(i,o).replace(D,function(n){return"\\"+B[n]}),r&&(a+="'+\n((__t=("+r+"))==null?'':_.escape(__t))+\n'"),e&&(a+="'+\n((__t=("+e+"))==null?'':__t)+\n'"),u&&(a+="';\n"+u+"\n__p+='"),i=o+t.length,t}),a+="';\n",r.variable||(a="with(obj||{}){\n"+a+"}\n"),a="var __t,__p='',__j=Array.prototype.join,"+"print=function(){__p+=__j.call(arguments,'');};\n"+a+"return __p;\n";try{e=new Function(r.variable||"obj","_",a)}catch(o){throw o.source=a,o}if(t)return e(t,j);var c=function(n){return e.call(this,n,j)};return c.source="function("+(r.variable||"obj")+"){\n"+a+"}",c},j.chain=function(n){return j(n).chain()};var z=function(n){return this._chain?j(n).chain():n};j.mixin(j),A(["pop","push","reverse","shift","sort","splice","unshift"],function(n){var t=e[n];j.prototype[n]=function(){var r=this._wrapped;return t.apply(r,arguments),"shift"!=n&&"splice"!=n||0!==r.length||delete r[0],z.call(this,r)}}),A(["concat","join","slice"],function(n){var t=e[n];j.prototype[n]=function(){return z.call(this,t.apply(this._wrapped,arguments))}}),j.extend(j.prototype,{chain:function(){return this._chain=!0,this},value:function(){return this._wrapped}}),"function"==typeof define&&define.amd&&define("underscore",[],function(){return j})}).call(this);
(function(t,e){if(typeof define==="function"&&define.amd){define(["underscore","jquery","exports"],function(i,r,s){t.Backbone=e(t,s,i,r)})}else if(typeof exports!=="undefined"){var i=require("underscore");e(t,exports,i)}else{t.Backbone=e(t,{},t._,t.jQuery||t.Zepto||t.ender||t.$)}})(this,function(t,e,i,r){var s=t.Backbone;var n=[];var a=n.push;var o=n.slice;var h=n.splice;e.VERSION="1.1.2";e.$=r;e.noConflict=function(){t.Backbone=s;return this};e.emulateHTTP=false;e.emulateJSON=false;var u=e.Events={on:function(t,e,i){if(!c(this,"on",t,[e,i])||!e)return this;this._events||(this._events={});var r=this._events[t]||(this._events[t]=[]);r.push({callback:e,context:i,ctx:i||this});return this},once:function(t,e,r){if(!c(this,"once",t,[e,r])||!e)return this;var s=this;var n=i.once(function(){s.off(t,n);e.apply(this,arguments)});n._callback=e;return this.on(t,n,r)},off:function(t,e,r){var s,n,a,o,h,u,l,f;if(!this._events||!c(this,"off",t,[e,r]))return this;if(!t&&!e&&!r){this._events=void 0;return this}o=t?[t]:i.keys(this._events);for(h=0,u=o.length;h<u;h++){t=o[h];if(a=this._events[t]){this._events[t]=s=[];if(e||r){for(l=0,f=a.length;l<f;l++){n=a[l];if(e&&e!==n.callback&&e!==n.callback._callback||r&&r!==n.context){s.push(n)}}}if(!s.length)delete this._events[t]}}return this},trigger:function(t){if(!this._events)return this;var e=o.call(arguments,1);if(!c(this,"trigger",t,e))return this;var i=this._events[t];var r=this._events.all;if(i)f(i,e);if(r)f(r,arguments);return this},stopListening:function(t,e,r){var s=this._listeningTo;if(!s)return this;var n=!e&&!r;if(!r&&typeof e==="object")r=this;if(t)(s={})[t._listenId]=t;for(var a in s){t=s[a];t.off(e,r,this);if(n||i.isEmpty(t._events))delete this._listeningTo[a]}return this}};var l=/\s+/;var c=function(t,e,i,r){if(!i)return true;if(typeof i==="object"){for(var s in i){t[e].apply(t,[s,i[s]].concat(r))}return false}if(l.test(i)){var n=i.split(l);for(var a=0,o=n.length;a<o;a++){t[e].apply(t,[n[a]].concat(r))}return false}return true};var f=function(t,e){var i,r=-1,s=t.length,n=e[0],a=e[1],o=e[2];switch(e.length){case 0:while(++r<s)(i=t[r]).callback.call(i.ctx);return;case 1:while(++r<s)(i=t[r]).callback.call(i.ctx,n);return;case 2:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a);return;case 3:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a,o);return;default:while(++r<s)(i=t[r]).callback.apply(i.ctx,e);return}};var d={listenTo:"on",listenToOnce:"once"};i.each(d,function(t,e){u[e]=function(e,r,s){var n=this._listeningTo||(this._listeningTo={});var a=e._listenId||(e._listenId=i.uniqueId("l"));n[a]=e;if(!s&&typeof r==="object")s=this;e[t](r,s,this);return this}});u.bind=u.on;u.unbind=u.off;i.extend(e,u);var p=e.Model=function(t,e){var r=t||{};e||(e={});this.cid=i.uniqueId("c");this.attributes={};if(e.collection)this.collection=e.collection;if(e.parse)r=this.parse(r,e)||{};r=i.defaults({},r,i.result(this,"defaults"));this.set(r,e);this.changed={};this.initialize.apply(this,arguments)};i.extend(p.prototype,u,{changed:null,validationError:null,idAttribute:"id",initialize:function(){},toJSON:function(t){return i.clone(this.attributes)},sync:function(){return e.sync.apply(this,arguments)},get:function(t){return this.attributes[t]},escape:function(t){return i.escape(this.get(t))},has:function(t){return this.get(t)!=null},set:function(t,e,r){var s,n,a,o,h,u,l,c;if(t==null)return this;if(typeof t==="object"){n=t;r=e}else{(n={})[t]=e}r||(r={});if(!this._validate(n,r))return false;a=r.unset;h=r.silent;o=[];u=this._changing;this._changing=true;if(!u){this._previousAttributes=i.clone(this.attributes);this.changed={}}c=this.attributes,l=this._previousAttributes;if(this.idAttribute in n)this.id=n[this.idAttribute];for(s in n){e=n[s];if(!i.isEqual(c[s],e))o.push(s);if(!i.isEqual(l[s],e)){this.changed[s]=e}else{delete this.changed[s]}a?delete c[s]:c[s]=e}if(!h){if(o.length)this._pending=r;for(var f=0,d=o.length;f<d;f++){this.trigger("change:"+o[f],this,c[o[f]],r)}}if(u)return this;if(!h){while(this._pending){r=this._pending;this._pending=false;this.trigger("change",this,r)}}this._pending=false;this._changing=false;return this},unset:function(t,e){return this.set(t,void 0,i.extend({},e,{unset:true}))},clear:function(t){var e={};for(var r in this.attributes)e[r]=void 0;return this.set(e,i.extend({},t,{unset:true}))},hasChanged:function(t){if(t==null)return!i.isEmpty(this.changed);return i.has(this.changed,t)},changedAttributes:function(t){if(!t)return this.hasChanged()?i.clone(this.changed):false;var e,r=false;var s=this._changing?this._previousAttributes:this.attributes;for(var n in t){if(i.isEqual(s[n],e=t[n]))continue;(r||(r={}))[n]=e}return r},previous:function(t){if(t==null||!this._previousAttributes)return null;return this._previousAttributes[t]},previousAttributes:function(){return i.clone(this._previousAttributes)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=this;var r=t.success;t.success=function(i){if(!e.set(e.parse(i,t),t))return false;if(r)r(e,i,t);e.trigger("sync",e,i,t)};q(this,t);return this.sync("read",this,t)},save:function(t,e,r){var s,n,a,o=this.attributes;if(t==null||typeof t==="object"){s=t;r=e}else{(s={})[t]=e}r=i.extend({validate:true},r);if(s&&!r.wait){if(!this.set(s,r))return false}else{if(!this._validate(s,r))return false}if(s&&r.wait){this.attributes=i.extend({},o,s)}if(r.parse===void 0)r.parse=true;var h=this;var u=r.success;r.success=function(t){h.attributes=o;var e=h.parse(t,r);if(r.wait)e=i.extend(s||{},e);if(i.isObject(e)&&!h.set(e,r)){return false}if(u)u(h,t,r);h.trigger("sync",h,t,r)};q(this,r);n=this.isNew()?"create":r.patch?"patch":"update";if(n==="patch")r.attrs=s;a=this.sync(n,this,r);if(s&&r.wait)this.attributes=o;return a},destroy:function(t){t=t?i.clone(t):{};var e=this;var r=t.success;var s=function(){e.trigger("destroy",e,e.collection,t)};t.success=function(i){if(t.wait||e.isNew())s();if(r)r(e,i,t);if(!e.isNew())e.trigger("sync",e,i,t)};if(this.isNew()){t.success();return false}q(this,t);var n=this.sync("delete",this,t);if(!t.wait)s();return n},url:function(){var t=i.result(this,"urlRoot")||i.result(this.collection,"url")||M();if(this.isNew())return t;return t.replace(/([^\/])$/,"$1/")+encodeURIComponent(this.id)},parse:function(t,e){return t},clone:function(){return new this.constructor(this.attributes)},isNew:function(){return!this.has(this.idAttribute)},isValid:function(t){return this._validate({},i.extend(t||{},{validate:true}))},_validate:function(t,e){if(!e.validate||!this.validate)return true;t=i.extend({},this.attributes,t);var r=this.validationError=this.validate(t,e)||null;if(!r)return true;this.trigger("invalid",this,r,i.extend(e,{validationError:r}));return false}});var v=["keys","values","pairs","invert","pick","omit"];i.each(v,function(t){p.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.attributes);return i[t].apply(i,e)}});var g=e.Collection=function(t,e){e||(e={});if(e.model)this.model=e.model;if(e.comparator!==void 0)this.comparator=e.comparator;this._reset();this.initialize.apply(this,arguments);if(t)this.reset(t,i.extend({silent:true},e))};var m={add:true,remove:true,merge:true};var y={add:true,remove:false};i.extend(g.prototype,u,{model:p,initialize:function(){},toJSON:function(t){return this.map(function(e){return e.toJSON(t)})},sync:function(){return e.sync.apply(this,arguments)},add:function(t,e){return this.set(t,i.extend({merge:false},e,y))},remove:function(t,e){var r=!i.isArray(t);t=r?[t]:i.clone(t);e||(e={});var s,n,a,o;for(s=0,n=t.length;s<n;s++){o=t[s]=this.get(t[s]);if(!o)continue;delete this._byId[o.id];delete this._byId[o.cid];a=this.indexOf(o);this.models.splice(a,1);this.length--;if(!e.silent){e.index=a;o.trigger("remove",o,this,e)}this._removeReference(o,e)}return r?t[0]:t},set:function(t,e){e=i.defaults({},e,m);if(e.parse)t=this.parse(t,e);var r=!i.isArray(t);t=r?t?[t]:[]:i.clone(t);var s,n,a,o,h,u,l;var c=e.at;var f=this.model;var d=this.comparator&&c==null&&e.sort!==false;var v=i.isString(this.comparator)?this.comparator:null;var g=[],y=[],_={};var b=e.add,w=e.merge,x=e.remove;var E=!d&&b&&x?[]:false;for(s=0,n=t.length;s<n;s++){h=t[s]||{};if(h instanceof p){a=o=h}else{a=h[f.prototype.idAttribute||"id"]}if(u=this.get(a)){if(x)_[u.cid]=true;if(w){h=h===o?o.attributes:h;if(e.parse)h=u.parse(h,e);u.set(h,e);if(d&&!l&&u.hasChanged(v))l=true}t[s]=u}else if(b){o=t[s]=this._prepareModel(h,e);if(!o)continue;g.push(o);this._addReference(o,e)}o=u||o;if(E&&(o.isNew()||!_[o.id]))E.push(o);_[o.id]=true}if(x){for(s=0,n=this.length;s<n;++s){if(!_[(o=this.models[s]).cid])y.push(o)}if(y.length)this.remove(y,e)}if(g.length||E&&E.length){if(d)l=true;this.length+=g.length;if(c!=null){for(s=0,n=g.length;s<n;s++){this.models.splice(c+s,0,g[s])}}else{if(E)this.models.length=0;var k=E||g;for(s=0,n=k.length;s<n;s++){this.models.push(k[s])}}}if(l)this.sort({silent:true});if(!e.silent){for(s=0,n=g.length;s<n;s++){(o=g[s]).trigger("add",o,this,e)}if(l||E&&E.length)this.trigger("sort",this,e)}return r?t[0]:t},reset:function(t,e){e||(e={});for(var r=0,s=this.models.length;r<s;r++){this._removeReference(this.models[r],e)}e.previousModels=this.models;this._reset();t=this.add(t,i.extend({silent:true},e));if(!e.silent)this.trigger("reset",this,e);return t},push:function(t,e){return this.add(t,i.extend({at:this.length},e))},pop:function(t){var e=this.at(this.length-1);this.remove(e,t);return e},unshift:function(t,e){return this.add(t,i.extend({at:0},e))},shift:function(t){var e=this.at(0);this.remove(e,t);return e},slice:function(){return o.apply(this.models,arguments)},get:function(t){if(t==null)return void 0;return this._byId[t]||this._byId[t.id]||this._byId[t.cid]},at:function(t){return this.models[t]},where:function(t,e){if(i.isEmpty(t))return e?void 0:[];return this[e?"find":"filter"](function(e){for(var i in t){if(t[i]!==e.get(i))return false}return true})},findWhere:function(t){return this.where(t,true)},sort:function(t){if(!this.comparator)throw new Error("Cannot sort a set without a comparator");t||(t={});if(i.isString(this.comparator)||this.comparator.length===1){this.models=this.sortBy(this.comparator,this)}else{this.models.sort(i.bind(this.comparator,this))}if(!t.silent)this.trigger("sort",this,t);return this},pluck:function(t){return i.invoke(this.models,"get",t)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=t.success;var r=this;t.success=function(i){var s=t.reset?"reset":"set";r[s](i,t);if(e)e(r,i,t);r.trigger("sync",r,i,t)};q(this,t);return this.sync("read",this,t)},create:function(t,e){e=e?i.clone(e):{};if(!(t=this._prepareModel(t,e)))return false;if(!e.wait)this.add(t,e);var r=this;var s=e.success;e.success=function(t,i){if(e.wait)r.add(t,e);if(s)s(t,i,e)};t.save(null,e);return t},parse:function(t,e){return t},clone:function(){return new this.constructor(this.models)},_reset:function(){this.length=0;this.models=[];this._byId={}},_prepareModel:function(t,e){if(t instanceof p)return t;e=e?i.clone(e):{};e.collection=this;var r=new this.model(t,e);if(!r.validationError)return r;this.trigger("invalid",this,r.validationError,e);return false},_addReference:function(t,e){this._byId[t.cid]=t;if(t.id!=null)this._byId[t.id]=t;if(!t.collection)t.collection=this;t.on("all",this._onModelEvent,this)},_removeReference:function(t,e){if(this===t.collection)delete t.collection;t.off("all",this._onModelEvent,this)},_onModelEvent:function(t,e,i,r){if((t==="add"||t==="remove")&&i!==this)return;if(t==="destroy")this.remove(e,r);if(e&&t==="change:"+e.idAttribute){delete this._byId[e.previous(e.idAttribute)];if(e.id!=null)this._byId[e.id]=e}this.trigger.apply(this,arguments)}});var _=["forEach","each","map","collect","reduce","foldl","inject","reduceRight","foldr","find","detect","filter","select","reject","every","all","some","any","include","contains","invoke","max","min","toArray","size","first","head","take","initial","rest","tail","drop","last","without","difference","indexOf","shuffle","lastIndexOf","isEmpty","chain","sample"];i.each(_,function(t){g.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.models);return i[t].apply(i,e)}});var b=["groupBy","countBy","sortBy","indexBy"];i.each(b,function(t){g.prototype[t]=function(e,r){var s=i.isFunction(e)?e:function(t){return t.get(e)};return i[t](this.models,s,r)}});var w=e.View=function(t){this.cid=i.uniqueId("view");t||(t={});i.extend(this,i.pick(t,E));this._ensureElement();this.initialize.apply(this,arguments);this.delegateEvents()};var x=/^(\S+)\s*(.*)$/;var E=["model","collection","el","id","attributes","className","tagName","events"];i.extend(w.prototype,u,{tagName:"div",$:function(t){return this.$el.find(t)},initialize:function(){},render:function(){return this},remove:function(){this.$el.remove();this.stopListening();return this},setElement:function(t,i){if(this.$el)this.undelegateEvents();this.$el=t instanceof e.$?t:e.$(t);this.el=this.$el[0];if(i!==false)this.delegateEvents();return this},delegateEvents:function(t){if(!(t||(t=i.result(this,"events"))))return this;this.undelegateEvents();for(var e in t){var r=t[e];if(!i.isFunction(r))r=this[t[e]];if(!r)continue;var s=e.match(x);var n=s[1],a=s[2];r=i.bind(r,this);n+=".delegateEvents"+this.cid;if(a===""){this.$el.on(n,r)}else{this.$el.on(n,a,r)}}return this},undelegateEvents:function(){this.$el.off(".delegateEvents"+this.cid);return this},_ensureElement:function(){if(!this.el){var t=i.extend({},i.result(this,"attributes"));if(this.id)t.id=i.result(this,"id");if(this.className)t["class"]=i.result(this,"className");var r=e.$("<"+i.result(this,"tagName")+">").attr(t);this.setElement(r,false)}else{this.setElement(i.result(this,"el"),false)}}});e.sync=function(t,r,s){var n=T[t];i.defaults(s||(s={}),{emulateHTTP:e.emulateHTTP,emulateJSON:e.emulateJSON});var a={type:n,dataType:"json"};if(!s.url){a.url=i.result(r,"url")||M()}if(s.data==null&&r&&(t==="create"||t==="update"||t==="patch")){a.contentType="application/json";a.data=JSON.stringify(s.attrs||r.toJSON(s))}if(s.emulateJSON){a.contentType="application/x-www-form-urlencoded";a.data=a.data?{model:a.data}:{}}if(s.emulateHTTP&&(n==="PUT"||n==="DELETE"||n==="PATCH")){a.type="POST";if(s.emulateJSON)a.data._method=n;var o=s.beforeSend;s.beforeSend=function(t){t.setRequestHeader("X-HTTP-Method-Override",n);if(o)return o.apply(this,arguments)}}if(a.type!=="GET"&&!s.emulateJSON){a.processData=false}if(a.type==="PATCH"&&k){a.xhr=function(){return new ActiveXObject("Microsoft.XMLHTTP")}}var h=s.xhr=e.ajax(i.extend(a,s));r.trigger("request",r,h,s);return h};var k=typeof window!=="undefined"&&!!window.ActiveXObject&&!(window.XMLHttpRequest&&(new XMLHttpRequest).dispatchEvent);var T={create:"POST",update:"PUT",patch:"PATCH","delete":"DELETE",read:"GET"};e.ajax=function(){return e.$.ajax.apply(e.$,arguments)};var $=e.Router=function(t){t||(t={});if(t.routes)this.routes=t.routes;this._bindRoutes();this.initialize.apply(this,arguments)};var S=/\((.*?)\)/g;var H=/(\(\?)?:\w+/g;var A=/\*\w+/g;var I=/[\-{}\[\]+?.,\\\^$|#\s]/g;i.extend($.prototype,u,{initialize:function(){},route:function(t,r,s){if(!i.isRegExp(t))t=this._routeToRegExp(t);if(i.isFunction(r)){s=r;r=""}if(!s)s=this[r];var n=this;e.history.route(t,function(i){var a=n._extractParameters(t,i);n.execute(s,a);n.trigger.apply(n,["route:"+r].concat(a));n.trigger("route",r,a);e.history.trigger("route",n,r,a)});return this},execute:function(t,e){if(t)t.apply(this,e)},navigate:function(t,i){e.history.navigate(t,i);return this},_bindRoutes:function(){if(!this.routes)return;this.routes=i.result(this,"routes");var t,e=i.keys(this.routes);while((t=e.pop())!=null){this.route(t,this.routes[t])}},_routeToRegExp:function(t){t=t.replace(I,"\\$&").replace(S,"(?:$1)?").replace(H,function(t,e){return e?t:"([^/?]+)"}).replace(A,"([^?]*?)");return new RegExp("^"+t+"(?:\\?([\\s\\S]*))?$")},_extractParameters:function(t,e){var r=t.exec(e).slice(1);return i.map(r,function(t,e){if(e===r.length-1)return t||null;return t?decodeURIComponent(t):null})}});var N=e.History=function(){this.handlers=[];i.bindAll(this,"checkUrl");if(typeof window!=="undefined"){this.location=window.location;this.history=window.history}};var R=/^[#\/]|\s+$/g;var O=/^\/+|\/+$/g;var P=/msie [\w.]+/;var C=/\/$/;var j=/#.*$/;N.started=false;i.extend(N.prototype,u,{interval:50,atRoot:function(){return this.location.pathname.replace(/[^\/]$/,"$&/")===this.root},getHash:function(t){var e=(t||this).location.href.match(/#(.*)$/);return e?e[1]:""},getFragment:function(t,e){if(t==null){if(this._hasPushState||!this._wantsHashChange||e){t=decodeURI(this.location.pathname+this.location.search);var i=this.root.replace(C,"");if(!t.indexOf(i))t=t.slice(i.length)}else{t=this.getHash()}}return t.replace(R,"")},start:function(t){if(N.started)throw new Error("Backbone.history has already been started");N.started=true;this.options=i.extend({root:"/"},this.options,t);this.root=this.options.root;this._wantsHashChange=this.options.hashChange!==false;this._wantsPushState=!!this.options.pushState;this._hasPushState=!!(this.options.pushState&&this.history&&this.history.pushState);var r=this.getFragment();var s=document.documentMode;var n=P.exec(navigator.userAgent.toLowerCase())&&(!s||s<=7);this.root=("/"+this.root+"/").replace(O,"/");if(n&&this._wantsHashChange){var a=e.$('<iframe src="javascript:0" tabindex="-1">');this.iframe=a.hide().appendTo("body")[0].contentWindow;this.navigate(r)}if(this._hasPushState){e.$(window).on("popstate",this.checkUrl)}else if(this._wantsHashChange&&"onhashchange"in window&&!n){e.$(window).on("hashchange",this.checkUrl)}else if(this._wantsHashChange){this._checkUrlInterval=setInterval(this.checkUrl,this.interval)}this.fragment=r;var o=this.location;if(this._wantsHashChange&&this._wantsPushState){if(!this._hasPushState&&!this.atRoot()){this.fragment=this.getFragment(null,true);this.location.replace(this.root+"#"+this.fragment);return true}else if(this._hasPushState&&this.atRoot()&&o.hash){this.fragment=this.getHash().replace(R,"");this.history.replaceState({},document.title,this.root+this.fragment)}}if(!this.options.silent)return this.loadUrl()},stop:function(){e.$(window).off("popstate",this.checkUrl).off("hashchange",this.checkUrl);if(this._checkUrlInterval)clearInterval(this._checkUrlInterval);N.started=false},route:function(t,e){this.handlers.unshift({route:t,callback:e})},checkUrl:function(t){var e=this.getFragment();if(e===this.fragment&&this.iframe){e=this.getFragment(this.getHash(this.iframe))}if(e===this.fragment)return false;if(this.iframe)this.navigate(e);this.loadUrl()},loadUrl:function(t){t=this.fragment=this.getFragment(t);return i.any(this.handlers,function(e){if(e.route.test(t)){e.callback(t);return true}})},navigate:function(t,e){if(!N.started)return false;if(!e||e===true)e={trigger:!!e};var i=this.root+(t=this.getFragment(t||""));t=t.replace(j,"");if(this.fragment===t)return;this.fragment=t;if(t===""&&i!=="/")i=i.slice(0,-1);if(this._hasPushState){this.history[e.replace?"replaceState":"pushState"]({},document.title,i)}else if(this._wantsHashChange){this._updateHash(this.location,t,e.replace);if(this.iframe&&t!==this.getFragment(this.getHash(this.iframe))){if(!e.replace)this.iframe.document.open().close();this._updateHash(this.iframe.location,t,e.replace)}}else{return this.location.assign(i)}if(e.trigger)return this.loadUrl(t)},_updateHash:function(t,e,i){if(i){var r=t.href.replace(/(javascript:|#).*$/,"");t.replace(r+"#"+e)}else{t.hash="#"+e}}});e.history=new N;var U=function(t,e){var r=this;var s;if(t&&i.has(t,"constructor")){s=t.constructor}else{s=function(){return r.apply(this,arguments)}}i.extend(s,r,e);var n=function(){this.constructor=s};n.prototype=r.prototype;s.prototype=new n;if(t)i.extend(s.prototype,t);s.__super__=r.prototype;return s};p.extend=g.extend=$.extend=w.extend=N.extend=U;var M=function(){throw new Error('A "url" property or function must be specified')};var q=function(t,e){var i=e.error;e.error=function(r){if(i)i(t,r,e);t.trigger("error",t,r,e)}};return e});

/*
Backbone dualStorage Adapter v1.4.0

A simple module to replace `Backbone.sync` with *localStorage*-based
persistence. Models are given GUIDS, and saved into a JSON object. Simple
as that.
 */

(function() {
  var S4, backboneSync, callbackTranslator, dualsync, getStoreName, localsync, modelUpdatedWithResponse, onlineSync, parseRemoteResponse,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Backbone.DualStorage = {
    offlineStatusCodes: [408, 502]
  };

  Backbone.Model.prototype.hasTempId = function() {
    return _.isString(this.id) && this.id.length === 36 && this.id.indexOf('t') === 0;
  };

  getStoreName = function(collection, model) {
    model || (model = collection.model.prototype);
    return _.result(collection, 'storeName') || _.result(model, 'storeName') || _.result(collection, 'url') || _.result(model, 'urlRoot') || _.result(model, 'url');
  };

  Backbone.Collection.prototype.syncDirty = function(options) {
    var i, id, ids, len, ref, results, store;
    store = localStorage.getItem((getStoreName(this)) + "_dirty");
    ids = (store && store.split(',')) || [];
    results = [];
    for (i = 0, len = ids.length; i < len; i++) {
      id = ids[i];
      results.push((ref = this.get(id)) != null ? ref.save(null, options) : void 0);
    }
    return results;
  };

  Backbone.Collection.prototype.dirtyModels = function() {
    var id, ids, models, store;
    store = localStorage.getItem((getStoreName(this)) + "_dirty");
    ids = (store && store.split(',')) || [];
    models = (function() {
      var i, len, results;
      results = [];
      for (i = 0, len = ids.length; i < len; i++) {
        id = ids[i];
        results.push(this.get(id));
      }
      return results;
    }).call(this);
    return _.compact(models);
  };

  Backbone.Collection.prototype.syncDestroyed = function(options) {
    var i, id, ids, len, model, results, store;
    store = localStorage.getItem((getStoreName(this)) + "_destroyed");
    ids = (store && store.split(',')) || [];
    results = [];
    for (i = 0, len = ids.length; i < len; i++) {
      id = ids[i];
      model = new this.model;
      model.set(model.idAttribute, id);
      model.collection = this;
      results.push(model.destroy(options));
    }
    return results;
  };

  Backbone.Collection.prototype.destroyedModelIds = function() {
    var ids, store;
    store = localStorage.getItem((getStoreName(this)) + "_destroyed");
    return ids = (store && store.split(',')) || [];
  };

  Backbone.Collection.prototype.syncDirtyAndDestroyed = function(options) {
    this.syncDirty(options);
    return this.syncDestroyed(options);
  };

  S4 = function() {
    return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
  };

  window.Store = (function() {
    Store.prototype.sep = '';

    function Store(name) {
      this.name = name;
      this.records = this.recordsOn(this.name);
    }

    Store.prototype.generateId = function() {
      return 't' + S4().substring(1) + S4() + '-' + S4() + '-' + S4() + '-' + S4() + '-' + S4() + S4() + S4();
    };

    Store.prototype.save = function() {
      return localStorage.setItem(this.name, this.records.join(','));
    };

    Store.prototype.recordsOn = function(key) {
      var store;
      store = localStorage.getItem(key);
      return (store && store.split(',')) || [];
    };

    Store.prototype.dirty = function(model) {
      var dirtyRecords;
      dirtyRecords = this.recordsOn(this.name + '_dirty');
      if (!_.include(dirtyRecords, model.id.toString())) {
        dirtyRecords.push(model.id);
        localStorage.setItem(this.name + '_dirty', dirtyRecords.join(','));
      }
      return model;
    };

    Store.prototype.clean = function(model, from) {
      var dirtyRecords, store;
      store = this.name + "_" + from;
      dirtyRecords = this.recordsOn(store);
      if (_.include(dirtyRecords, model.id.toString())) {
        localStorage.setItem(store, _.without(dirtyRecords, model.id.toString()).join(','));
      }
      return model;
    };

    Store.prototype.destroyed = function(model) {
      var destroyedRecords;
      destroyedRecords = this.recordsOn(this.name + '_destroyed');
      if (!_.include(destroyedRecords, model.id.toString())) {
        destroyedRecords.push(model.id);
        localStorage.setItem(this.name + '_destroyed', destroyedRecords.join(','));
      }
      return model;
    };

    Store.prototype.create = function(model, options) {
      if (!_.isObject(model)) {
        return model;
      }
      if (!model.id) {
        model.set(model.idAttribute, this.generateId());
      }
      localStorage.setItem(this.name + this.sep + model.id, JSON.stringify(model.toJSON ? model.toJSON(options) : model));
      this.records.push(model.id.toString());
      this.save();
      return model;
    };

    Store.prototype.update = function(model, options) {
      localStorage.setItem(this.name + this.sep + model.id, JSON.stringify(model.toJSON ? model.toJSON(options) : model));
      if (!_.include(this.records, model.id.toString())) {
        this.records.push(model.id.toString());
      }
      this.save();
      return model;
    };

    Store.prototype.clear = function() {
      var i, id, len, ref;
      ref = this.records;
      for (i = 0, len = ref.length; i < len; i++) {
        id = ref[i];
        localStorage.removeItem(this.name + this.sep + id);
      }
      this.records = [];
      return this.save();
    };

    Store.prototype.hasDirtyOrDestroyed = function() {
      return !_.isEmpty(localStorage.getItem(this.name + '_dirty')) || !_.isEmpty(localStorage.getItem(this.name + '_destroyed'));
    };

    Store.prototype.find = function(model) {
      var modelAsJson;
      modelAsJson = localStorage.getItem(this.name + this.sep + model.id);
      if (modelAsJson === null) {
        return null;
      }
      return JSON.parse(modelAsJson);
    };

    Store.prototype.findAll = function() {
      var i, id, len, ref, results;
      ref = this.records;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        id = ref[i];
        results.push(JSON.parse(localStorage.getItem(this.name + this.sep + id)));
      }
      return results;
    };

    Store.prototype.destroy = function(model) {
      localStorage.removeItem(this.name + this.sep + model.id);
      this.records = _.reject(this.records, function(record_id) {
        return record_id === model.id.toString();
      });
      this.save();
      return model;
    };

    return Store;

  })();

  window.Store.exists = function(storeName) {
    return localStorage.getItem(storeName) !== null;
  };

  callbackTranslator = {
    needsTranslation: Backbone.VERSION === '0.9.10',
    forBackboneCaller: function(callback) {
      if (this.needsTranslation) {
        return function(model, resp, options) {
          return callback.call(null, resp);
        };
      } else {
        return callback;
      }
    },
    forDualstorageCaller: function(callback, model, options) {
      if (this.needsTranslation) {
        return function(resp) {
          return callback.call(null, model, resp, options);
        };
      } else {
        return callback;
      }
    }
  };

  localsync = function(method, model, options) {
    var isValidModel, preExisting, response, store;
    isValidModel = (method === 'clear') || (method === 'hasDirtyOrDestroyed');
    isValidModel || (isValidModel = model instanceof Backbone.Model);
    isValidModel || (isValidModel = model instanceof Backbone.Collection);
    if (!isValidModel) {
      throw new Error('model parameter is required to be a backbone model or collection.');
    }
    store = new Store(options.storeName);
    response = (function() {
      switch (method) {
        case 'read':
          if (model instanceof Backbone.Model) {
            return store.find(model);
          } else {
            return store.findAll();
          }
          break;
        case 'hasDirtyOrDestroyed':
          return store.hasDirtyOrDestroyed();
        case 'clear':
          return store.clear();
        case 'create':
          if (options.add && !options.merge && (preExisting = store.find(model))) {
            return preExisting;
          } else {
            model = store.create(model, options);
            if (options.dirty) {
              store.dirty(model);
            }
            return model;
          }
          break;
        case 'update':
          store.update(model, options);
          if (options.dirty) {
            return store.dirty(model);
          } else {
            return store.clean(model, 'dirty');
          }
          break;
        case 'delete':
          store.destroy(model);
          if (options.dirty && !model.hasTempId()) {
            return store.destroyed(model);
          } else {
            if (model.hasTempId()) {
              return store.clean(model, 'dirty');
            } else {
              return store.clean(model, 'destroyed');
            }
          }
      }
    })();
    if (response) {
      if (response.toJSON) {
        response = response.toJSON(options);
      }
      if (response.attributes) {
        response = response.attributes;
      }
    }
    if (!options.ignoreCallbacks) {
      if (response) {
        options.success(response);
      } else {
        options.error('Record not found');
      }
    }
    return response;
  };

  parseRemoteResponse = function(object, response) {
    if (!(object && object.parseBeforeLocalSave)) {
      return response;
    }
    if (_.isFunction(object.parseBeforeLocalSave)) {
      return object.parseBeforeLocalSave(response);
    }
  };

  modelUpdatedWithResponse = function(model, response) {
    var modelClone;
    modelClone = new Backbone.Model;
    modelClone.idAttribute = model.idAttribute;
    modelClone.set(model.attributes);
    modelClone.set(model.parse(response));
    return modelClone;
  };

  backboneSync = Backbone.DualStorage.originalSync = Backbone.sync;

  onlineSync = function(method, model, options) {
    options.success = callbackTranslator.forBackboneCaller(options.success);
    options.error = callbackTranslator.forBackboneCaller(options.error);
    return Backbone.DualStorage.originalSync(method, model, options);
  };

  dualsync = function(method, model, options) {
    var error, hasOfflineStatusCode, local, relayErrorCallback, success, temporaryId, useOfflineStorage;
    options.storeName = getStoreName(model.collection, model);
    options.storeExists = Store.exists(options.storeName);
    options.success = callbackTranslator.forDualstorageCaller(options.success, model, options);
    options.error = callbackTranslator.forDualstorageCaller(options.error, model, options);
    if (_.result(model, 'remote') || _.result(model.collection, 'remote')) {
      return onlineSync(method, model, options);
    }
    local = _.result(model, 'local') || _.result(model.collection, 'local');
    options.dirty = options.remote === false && !local;
    if (options.remote === false || local) {
      return localsync(method, model, options);
    }
    options.ignoreCallbacks = true;
    success = options.success;
    error = options.error;
    useOfflineStorage = function() {
      options.dirty = true;
      options.ignoreCallbacks = false;
      options.success = success;
      options.error = error;
      return localsync(method, model, options);
    };
    hasOfflineStatusCode = function(xhr) {
      var offlineStatusCodes, ref;
      offlineStatusCodes = Backbone.DualStorage.offlineStatusCodes;
      if (_.isFunction(offlineStatusCodes)) {
        offlineStatusCodes = offlineStatusCodes(xhr);
      }
      return xhr.status === 0 || (ref = xhr.status, indexOf.call(offlineStatusCodes, ref) >= 0);
    };
    relayErrorCallback = function(xhr) {
      var online;
      online = !hasOfflineStatusCode(xhr);
      if (online || method === 'read' && !options.storeExists) {
        return error(xhr);
      } else {
        return useOfflineStorage();
      }
    };
    switch (method) {
      case 'read':
        if (localsync('hasDirtyOrDestroyed', model, options)) {
          return useOfflineStorage();
        } else {
          options.success = function(resp, _status, _xhr) {
            var collection, i, idAttribute, len, modelAttributes, responseModel;
            if (hasOfflineStatusCode(options.xhr)) {
              return useOfflineStorage();
            }
            resp = parseRemoteResponse(model, resp);
            if (model instanceof Backbone.Collection) {
              collection = model;
              idAttribute = collection.model.prototype.idAttribute;
              if (!options.add) {
                localsync('clear', collection, options);
              }
              for (i = 0, len = resp.length; i < len; i++) {
                modelAttributes = resp[i];
                model = collection.get(modelAttributes[idAttribute]);
                if (model) {
                  responseModel = modelUpdatedWithResponse(model, modelAttributes);
                } else {
                  responseModel = new collection.model(modelAttributes);
                }
                localsync('update', responseModel, options);
              }
            } else {
              responseModel = modelUpdatedWithResponse(model, resp);
              localsync('update', responseModel, options);
            }
            return success(resp, _status, _xhr);
          };
          options.error = function(xhr) {
            return relayErrorCallback(xhr);
          };
          return options.xhr = onlineSync(method, model, options);
        }
        break;
      case 'create':
        options.success = function(resp, _status, _xhr) {
          var updatedModel;
          if (hasOfflineStatusCode(options.xhr)) {
            return useOfflineStorage();
          }
          updatedModel = modelUpdatedWithResponse(model, resp);
          localsync(method, updatedModel, options);
          return success(resp, _status, _xhr);
        };
        options.error = function(xhr) {
          return relayErrorCallback(xhr);
        };
        return options.xhr = onlineSync(method, model, options);
      case 'update':
        if (model.hasTempId()) {
          temporaryId = model.id;
          options.success = function(resp, _status, _xhr) {
            var updatedModel;
            model.set(model.idAttribute, temporaryId, {
              silent: true
            });
            if (hasOfflineStatusCode(options.xhr)) {
              return useOfflineStorage();
            }
            updatedModel = modelUpdatedWithResponse(model, resp);
            localsync('delete', model, options);
            localsync('create', updatedModel, options);
            return success(resp, _status, _xhr);
          };
          options.error = function(xhr) {
            model.set(model.idAttribute, temporaryId, {
              silent: true
            });
            return relayErrorCallback(xhr);
          };
          model.set(model.idAttribute, null, {
            silent: true
          });
          return options.xhr = onlineSync('create', model, options);
        } else {
          options.success = function(resp, _status, _xhr) {
            var updatedModel;
            if (hasOfflineStatusCode(options.xhr)) {
              return useOfflineStorage();
            }
            updatedModel = modelUpdatedWithResponse(model, resp);
            localsync(method, updatedModel, options);
            return success(resp, _status, _xhr);
          };
          options.error = function(xhr) {
            return relayErrorCallback(xhr);
          };
          return options.xhr = onlineSync(method, model, options);
        }
        break;
      case 'delete':
        if (model.hasTempId()) {
          options.ignoreCallbacks = false;
          return localsync(method, model, options);
        } else {
          options.success = function(resp, _status, _xhr) {
            if (hasOfflineStatusCode(options.xhr)) {
              return useOfflineStorage();
            }
            localsync(method, model, options);
            return success(resp, _status, _xhr);
          };
          options.error = function(xhr) {
            return relayErrorCallback(xhr);
          };
          return options.xhr = onlineSync(method, model, options);
        }
    }
  };

  Backbone.sync = dualsync;

}).call(this);
// Backbone.Syphon, v0.4.1
// Copyright (c)2012 Derick Bailey, Muted Solutions, LLC.
// Distributed under MIT license
// http://github.com/derickbailey/backbone.syphon
Backbone.Syphon=function(a,b,c){var d={};d.ignoredTypes=["button","submit","reset","fieldset"],d.serialize=function(a,d){var g={},j=h(d),k=e(a,j);return c.each(k,function(a){var c=b(a),d=f(c),e=j.keyExtractors.get(d),h=e(c),k=j.inputReaders.get(d),l=k(c),m=j.keyAssignmentValidators.get(d);if(m(c,h,l)){var n=j.keySplitter(h);g=i(g,n,l)}}),g},d.deserialize=function(a,d,g){var i=h(g),k=e(a,i),l=j(i,d);c.each(k,function(a){var c=b(a),d=f(c),e=i.keyExtractors.get(d),g=e(c),h=i.inputWriters.get(d),j=l[g];h(c,j)})};var e=function(a,d){var e=g(a),h=e.elements;return h=c.reject(h,function(a){var e,g=f(a),h=d.keyExtractors.get(g),i=h(b(a)),j=c.include(d.ignoredTypes,g),k=c.include(d.include,i),l=c.include(d.exclude,i);return k?e=!1:d.include?e=!0:e=l||j,e}),h},f=function(a){var c,d=b(a),e=d[0].tagName,f=e;return e.toLowerCase()==="input"&&(c=d.attr("type"),c?f=c:f="text"),f.toLowerCase()},g=function(a){return c.isUndefined(a.$el)&&a.tagName.toLowerCase()==="form"?a:a.$el.is("form")?a.el:a.$("form")[0]},h=function(a){var b=c.clone(a)||{};return b.ignoredTypes=c.clone(d.ignoredTypes),b.inputReaders=b.inputReaders||d.InputReaders,b.inputWriters=b.inputWriters||d.InputWriters,b.keyExtractors=b.keyExtractors||d.KeyExtractors,b.keySplitter=b.keySplitter||d.KeySplitter,b.keyJoiner=b.keyJoiner||d.KeyJoiner,b.keyAssignmentValidators=b.keyAssignmentValidators||d.KeyAssignmentValidators,b},i=function(a,b,d){if(!b)return a;var e=b.shift();return a[e]||(a[e]=c.isArray(e)?[]:{}),b.length===0&&(c.isArray(a[e])?a[e].push(d):a[e]=d),b.length>0&&i(a[e],b,d),a},j=function(a,b,d){var e={};return c.each(b,function(b,f){var g={};d&&(f=a.keyJoiner(d,f)),c.isArray(b)?(f+="[]",g[f]=b):c.isObject(b)?g=j(a,b,f):g[f]=b,c.extend(e,g)}),e};return d}(Backbone,jQuery,_),Backbone.Syphon.TypeRegistry=function(){this.registeredTypes={}},Backbone.Syphon.TypeRegistry.extend=Backbone.Model.extend,_.extend(Backbone.Syphon.TypeRegistry.prototype,{get:function(a){var b=this.registeredTypes[a];return b||(b=this.registeredTypes["default"]),b},register:function(a,b){this.registeredTypes[a]=b},registerDefault:function(a){this.registeredTypes["default"]=a},unregister:function(a){this.registeredTypes[a]&&delete this.registeredTypes[a]}}),Backbone.Syphon.KeyExtractorSet=Backbone.Syphon.TypeRegistry.extend(),Backbone.Syphon.KeyExtractors=new Backbone.Syphon.KeyExtractorSet,Backbone.Syphon.KeyExtractors.registerDefault(function(a){return a.prop("name")}),Backbone.Syphon.InputReaderSet=Backbone.Syphon.TypeRegistry.extend(),Backbone.Syphon.InputReaders=new Backbone.Syphon.InputReaderSet,Backbone.Syphon.InputReaders.registerDefault(function(a){return a.val()}),Backbone.Syphon.InputReaders.register("checkbox",function(a){var b=a.prop("checked");return b}),Backbone.Syphon.InputWriterSet=Backbone.Syphon.TypeRegistry.extend(),Backbone.Syphon.InputWriters=new Backbone.Syphon.InputWriterSet,Backbone.Syphon.InputWriters.registerDefault(function(a,b){a.val(b)}),Backbone.Syphon.InputWriters.register("checkbox",function(a,b){a.prop("checked",b)}),Backbone.Syphon.InputWriters.register("radio",function(a,b){a.prop("checked",a.val()===b)}),Backbone.Syphon.KeyAssignmentValidatorSet=Backbone.Syphon.TypeRegistry.extend(),Backbone.Syphon.KeyAssignmentValidators=new Backbone.Syphon.KeyAssignmentValidatorSet,Backbone.Syphon.KeyAssignmentValidators.registerDefault(function(){return!0}),Backbone.Syphon.KeyAssignmentValidators.register("radio",function(a,b,c){return a.prop("checked")}),Backbone.Syphon.KeySplitter=function(a){var b=a.match(/[^\[\]]+/g);return a.indexOf("[]")===a.length-2&&(lastKey=b.pop(),b.push([lastKey])),b},Backbone.Syphon.KeyJoiner=function(a,b){return a+"["+b+"]"};
/*
  backbone.paginator 2.0.0
  http://github.com/backbone-paginator/backbone.paginator

  Copyright (c) 2013 Jimmy Yuen Ho Wong and contributors
  Licensed under the MIT @license.
*/

!function(a){if("object"==typeof exports&&"function"==typeof require)module.exports=a(require("underscore"),require("backbone"));else if("function"==typeof define&&define.amd)define(["underscore","backbone"],a);else if("undefined"!=typeof _&&"undefined"!=typeof Backbone){var b=Backbone.PageableCollection,c=a(_,Backbone);Backbone.PageableCollection.noConflict=function(){return Backbone.PageableCollection=b,c}}}(function(a,b){"use strict";function c(b,c){if(!a.isNumber(b)||a.isNaN(b)||!a.isFinite(b)||~~b!==b)throw new TypeError("`"+c+"` must be a finite integer");return b}function d(a){for(var b,c,d,e,f={},g=decodeURIComponent,h=a.split("&"),i=0,j=h.length;j>i;i++){var k=h[i];b=k.split("="),c=b[0],d=b[1]||!0,c=g(c),d=g(d),e=f[c],o(e)?e.push(d):f[c]=e?[e,d]:d}return f}function e(a,b,c){var d=a._events[b];if(d&&d.length){var e=d[d.length-1],f=e.callback;e.callback=function(){try{f.apply(this,arguments),c()}catch(a){throw a}finally{e.callback=f}}}else c()}var f=a.extend,g=a.omit,h=a.clone,i=a.each,j=a.pick,k=a.contains,l=a.isEmpty,m=a.pairs,n=a.invert,o=a.isArray,p=a.isFunction,q=a.isObject,r=a.keys,s=a.isUndefined,t=Math.ceil,u=Math.floor,v=Math.max,w=b.Collection.prototype,x=/[\s'"]/g,y=/[<>\s'"]/g,z=b.PageableCollection=b.Collection.extend({state:{firstPage:1,lastPage:null,currentPage:null,pageSize:25,totalPages:null,totalRecords:null,sortKey:null,order:-1},mode:"server",queryParams:{currentPage:"page",pageSize:"per_page",totalPages:"total_pages",totalRecords:"total_entries",sortKey:"sort_by",order:"order",directions:{"-1":"asc",1:"desc"}},constructor:function(a,b){w.constructor.apply(this,arguments),b=b||{};var c=this.mode=b.mode||this.mode||A.mode,d=f({},A.queryParams,this.queryParams,b.queryParams||{});d.directions=f({},A.queryParams.directions,this.queryParams.directions,d.directions||{}),this.queryParams=d;var e=this.state=f({},A.state,this.state,b.state||{});e.currentPage=null==e.currentPage?e.firstPage:e.currentPage,o(a)||(a=a?[a]:[]),a=a.slice(),"server"==c||null!=e.totalRecords||l(a)||(e.totalRecords=a.length),this.switchMode(c,f({fetch:!1,resetState:!1,models:a},b));var g=b.comparator;if(e.sortKey&&!g&&this.setSorting(e.sortKey,e.order,b),"server"!=c){var i=this.fullCollection;g&&b.full&&(this.comparator=null,i.comparator=g),b.full&&i.sort(),a&&!l(a)&&(this.reset(a,f({silent:!0},b)),this.getPage(e.currentPage),a.splice.apply(a,[0,a.length].concat(this.models)))}this._initState=h(this.state)},_makeFullCollection:function(a,c){var d,e,f,g=["url","model","sync","comparator"],h=this.constructor.prototype,i={};for(d=0,e=g.length;e>d;d++)f=g[d],s(h[f])||(i[f]=h[f]);var j=new(b.Collection.extend(i))(a,c);for(d=0,e=g.length;e>d;d++)f=g[d],this[f]!==h[f]&&(j[f]=this[f]);return j},_makeCollectionEventHandler:function(a,b){return function(c,d,g,j){var k=a._handlers;i(r(k),function(c){var d=k[c];a.off(c,d),b.off(c,d)});var l=h(a.state),m=l.firstPage,n=0===m?l.currentPage:l.currentPage-1,o=l.pageSize,p=n*o,q=p+o;if("add"==c){var u,v,w,x,j=j||{};if(g==b)v=b.indexOf(d),v>=p&&q>v&&(x=a,u=w=v-p);else{u=a.indexOf(d),v=p+u,x=b;var w=s(j.at)?v:j.at+p}if(j.onRemove||(++l.totalRecords,delete j.onRemove),a.state=a._checkState(l),x){x.add(d,f({},j||{},{at:w}));var y=u>=o?d:!s(j.at)&&q>w&&a.length>o?a.at(o):null;y&&e(g,c,function(){a.remove(y,{onAdd:!0})})}}if("remove"==c)if(j.onAdd)delete j.onAdd;else{if(--l.totalRecords){var z=l.totalPages=t(l.totalRecords/o);l.lastPage=0===m?z-1:z||m,l.currentPage>z&&(l.currentPage=l.lastPage)}else l.totalRecords=null,l.totalPages=null;a.state=a._checkState(l);var A,B=j.index;g==a?((A=b.at(q))?e(a,c,function(){a.push(A,{onRemove:!0})}):!a.length&&l.totalRecords&&a.reset(b.models.slice(p-o,q-o),f({},j,{parse:!1})),b.remove(d)):B>=p&&q>B&&((A=b.at(q-1))&&e(a,c,function(){a.push(A,{onRemove:!0})}),a.remove(d),!a.length&&l.totalRecords&&a.reset(b.models.slice(p-o,q-o),f({},j,{parse:!1})))}if("reset"==c)if(j=g,g=d,g==a&&null==j.from&&null==j.to){var C=b.models.slice(0,p),D=b.models.slice(p+a.models.length);b.reset(C.concat(a.models).concat(D),j)}else g==b&&((l.totalRecords=b.models.length)||(l.totalRecords=null,l.totalPages=null),"client"==a.mode&&(l.lastPage=l.currentPage=l.firstPage),a.state=a._checkState(l),a.reset(b.models.slice(p,q),f({},j,{parse:!1})));"sort"==c&&(j=g,g=d,g===b&&a.reset(b.models.slice(p,q),f({},j,{parse:!1}))),i(r(k),function(c){var d=k[c];i([a,b],function(a){a.on(c,d);var b=a._events[c]||[];b.unshift(b.pop())})})}},_checkState:function(a){var b=this.mode,d=this.links,e=a.totalRecords,f=a.pageSize,g=a.currentPage,h=a.firstPage,i=a.totalPages;if(null!=e&&null!=f&&null!=g&&null!=h&&("infinite"==b?d:!0)){if(e=c(e,"totalRecords"),f=c(f,"pageSize"),g=c(g,"currentPage"),h=c(h,"firstPage"),1>f)throw new RangeError("`pageSize` must be >= 1");if(i=a.totalPages=t(e/f),0>h||h>1)throw new RangeError("`firstPage must be 0 or 1`");if(a.lastPage=0===h?v(0,i-1):i||h,"infinite"==b){if(!d[g+""])throw new RangeError("No link found for page "+g)}else if(h>g||i>0&&(h?g>i:g>=i))throw new RangeError("`currentPage` must be firstPage <= currentPage "+(h?">":">=")+" totalPages if "+h+"-based. Got "+g+".")}return a},setPageSize:function(a,b){a=c(a,"pageSize"),b=b||{first:!1};var d=this.state,e=t(d.totalRecords/a),h=e?v(d.firstPage,u(e*d.currentPage/d.totalPages)):d.firstPage;return d=this.state=this._checkState(f({},d,{pageSize:a,currentPage:b.first?d.firstPage:h,totalPages:e})),this.getPage(d.currentPage,g(b,["first"]))},switchMode:function(b,c){if(!k(["server","client","infinite"],b))throw new TypeError('`mode` must be one of "server", "client" or "infinite"');c=c||{fetch:!0,resetState:!0};var d=this.state=c.resetState?h(this._initState):this._checkState(f({},this.state));this.mode=b;var e,j=this,l=this.fullCollection,m=this._handlers=this._handlers||{};if("server"==b||l)"server"==b&&l&&(i(r(m),function(a){e=m[a],j.off(a,e),l.off(a,e)}),delete this._handlers,this._fullComparator=l.comparator,delete this.fullCollection);else{l=this._makeFullCollection(c.models||[],c),l.pageableCollection=this,this.fullCollection=l;var n=this._makeCollectionEventHandler(this,l);i(["add","remove","reset","sort"],function(b){m[b]=e=a.bind(n,{},b),j.on(b,e),l.on(b,e)}),l.comparator=this._fullComparator}if("infinite"==b)for(var o=this.links={},p=d.firstPage,q=t(d.totalRecords/d.pageSize),s=0===p?v(0,q-1):q||p,u=d.firstPage;s>=u;u++)o[u]=this.url;else this.links&&delete this.links;return c.fetch?this.fetch(g(c,"fetch","resetState")):this},hasPreviousPage:function(){var a=this.state,b=a.currentPage;return"infinite"!=this.mode?b>a.firstPage:!!this.links[b-1]},hasNextPage:function(){var a=this.state,b=this.state.currentPage;return"infinite"!=this.mode?b<a.lastPage:!!this.links[b+1]},getFirstPage:function(a){return this.getPage("first",a)},getPreviousPage:function(a){return this.getPage("prev",a)},getNextPage:function(a){return this.getPage("next",a)},getLastPage:function(a){return this.getPage("last",a)},getPage:function(a,b){var d=this.mode,e=this.fullCollection;b=b||{fetch:!1};var h=this.state,i=h.firstPage,j=h.currentPage,k=h.lastPage,m=h.pageSize,n=a;switch(a){case"first":n=i;break;case"prev":n=j-1;break;case"next":n=j+1;break;case"last":n=k;break;default:n=c(a,"index")}this.state=this._checkState(f({},h,{currentPage:n})),b.from=j,b.to=n;var o=(0===i?n:n-1)*m,p=e&&e.length?e.models.slice(o,o+m):[];return"client"!=d&&("infinite"!=d||l(p))||b.fetch?("infinite"==d&&(b.url=this.links[n]),this.fetch(g(b,"fetch"))):(this.reset(p,g(b,"fetch")),this)},getPageByOffset:function(a,b){if(0>a)throw new RangeError("`offset must be > 0`");a=c(a);var d=u(a/this.state.pageSize);return 0!==this.state.firstPage&&d++,d>this.state.lastPage&&(d=this.state.lastPage),this.getPage(d,b)},sync:function(a,c,d){var e=this;if("infinite"==e.mode){var g=d.success,h=e.state.currentPage;d.success=function(a,b,c){var i=e.links,j=e.parseLinks(a,f({xhr:c},d));j.first&&(i[e.state.firstPage]=j.first),j.prev&&(i[h-1]=j.prev),j.next&&(i[h+1]=j.next),g&&g(a,b,c)}}return(w.sync||b.sync).call(e,a,c,d)},parseLinks:function(a,b){var c={},d=b.xhr.getResponseHeader("Link");if(d){var e=["first","prev","next"];i(d.split(","),function(a){var b=a.split(";"),d=b[0].replace(y,""),f=b.slice(1);i(f,function(a){var b=a.split("="),f=b[0].replace(x,""),g=b[1].replace(x,"");"rel"==f&&k(e,g)&&(c[g]=d)})})}return c},parse:function(a,b){var c=this.parseState(a,h(this.queryParams),h(this.state),b);return c&&(this.state=this._checkState(f({},this.state,c))),this.parseRecords(a,b)},parseState:function(b,c,d){if(b&&2===b.length&&q(b[0])&&o(b[1])){var e=h(d),f=b[0];return i(m(g(c,"directions")),function(b){var c=b[0],d=b[1],g=f[d];s(g)||a.isNull(g)||(e[c]=f[d])}),f.order&&(e.order=1*n(c.directions)[f.order]),e}},parseRecords:function(a){return a&&2===a.length&&q(a[0])&&o(a[1])?a[1]:a},fetch:function(a){a=a||{};var b=this._checkState(this.state),c=this.mode;"infinite"!=c||a.url||(a.url=this.links[b.currentPage]);var e=a.data||{},i=a.url||this.url||"";p(i)&&(i=i.call(this));var k=i.indexOf("?");-1!=k&&(f(e,d(i.slice(k+1))),i=i.slice(0,k)),a.url=i,a.data=e;var l,n,o,q,t="client"==this.mode?j(this.queryParams,"sortKey","order"):g(j(this.queryParams,r(A.queryParams)),"directions"),u=m(t),v=h(this);for(l=0;l<u.length;l++)n=u[l],o=n[0],q=n[1],q=p(q)?q.call(v):q,null!=b[o]&&null!=q&&(e[q]=b[o]);if(b.sortKey&&b.order){var x=p(t.order)?t.order.call(v):t.order;e[x]=this.queryParams.directions[b.order+""]}else b.sortKey||delete e[t.order];var y=m(g(this.queryParams,r(A.queryParams)));for(l=0;l<y.length;l++)n=y[l],q=n[1],q=p(q)?q.call(v):q,null!=q&&(e[n[0]]=q);if("server"!=c){var z=this,B=this.fullCollection,C=a.success;return a.success=function(b,d,e){e=e||{},s(a.silent)?delete e.silent:e.silent=a.silent;var g=b.models;"client"==c?B.reset(g,e):(B.add(g,f({at:B.length},f(e,{parse:!1}))),z.trigger("reset",z,e)),C&&C(b,d,e)},w.fetch.call(this,f({},a,{silent:!0}))}return w.fetch.call(this,a)},_makeComparator:function(a,b,c){var d=this.state;return a=a||d.sortKey,b=b||d.order,a&&b?(c||(c=function(a,b){return a.get(b)}),function(d,e){var f,g=c(d,a),h=c(e,a);return 1===b&&(f=g,g=h,h=f),g===h?0:h>g?-1:1}):void 0},setSorting:function(a,b,c){var d=this.state;d.sortKey=a,d.order=b=b||d.order;var e=this.fullCollection,g=!1,h=!1;a||(g=h=!0);var i=this.mode;c=f({side:"client"==i?i:"server",full:!0},c);var j=this._makeComparator(a,b,c.sortValue),k=c.full,l=c.side;return"client"==l?k?(e&&(e.comparator=j),g=!0):(this.comparator=j,h=!0):"server"!=l||k||(this.comparator=j),g&&(this.comparator=null),h&&e&&(e.comparator=null),this}}),A=z.prototype;return z});

/*
jquery.animate-enhanced plugin v1.11
---
http://github.com/benbarnett/jQuery-Animate-Enhanced
http://benbarnett.net
@benpbarnett
---
Copyright (c) 2013 Ben Barnett

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
---
Extends jQuery.animate() to automatically use CSS3 transformations where applicable.
Tested with jQuery 1.3.2+

Supports -moz-transition, -webkit-transition, -o-transition, transition

Targetted properties (for now):
	- left
	- top
	- opacity
	- width
	- height

Usage (exactly the same as it would be normally):

	jQuery(element).animate({left: 200},  500, function() {
		// callback
	});

Changelog:
	1.11 (08/07/2014):
	- Merging PR #157, fixes #156 for animating with 0

	1.10 (09/04/2014):
		- Merging PR #153 Don't try to restore values which weren't saved

	1.09 (09/04/2014):
		- Merging PR #154 Added support of AMD and Node.js (via browserify) environments

	1.08 (16/01/2014):
		- Merging PR #147 Access element tag name appropriately

	1.07 (06/12/2013):
		- Merging PR #139 Other units, beside '%' should also be kept

	1.06 (06/12/2013):
		- Merging PR #140 Do not change a user defined display mode for elements, after show/hide

	1.05 (14/08/2013):
		- Merging PR #124 fix for highcharts clash. Thanks @bensonc!

	1.04 (14/08/2013):
		- Using fix from issue #69 by @rickyk586 to support percentages

	1.03 (19/7/2013):
		- Merge PR #129 (Use originalAnimateMethod if a step callback function is provided.) /thx @lehni

	1.02 (8/5/2013):
		- Fixing use3D default flags. It must explicitly be set to false to disable 3d now, the plugin by default will use it if available.

	1.01 (8/5/2013):
		- Adding appropriate display value for wider range of elements (issue #121 - thanks smacky)

	1.0 (8/5/2103):
		- Fix avoidTransforms: true behaviour for directional transitions

	0.99.1 (3/4/2013):
		- Add Set or unset the 'disabled by default' value (PR #117)

	0.99 (5/12/2012):
		- PR #109 Added support for list-item nodes. FadeIn on tags was omitting the list-style support. (thx @SeanCannon)

	0.98 (12/11/2012):
		- Merging pull request #106 thx @gboysko - checking for ownerDocument before using getComputedStyle

	0.97 (6/11/2012):
		- Merging pull request #104 thx @gavrochelegnou - .bind instead of .one

	0.96a (20/08/2012):
		- Checking event is from dispatch target (issue #58)

	0.96 (20/08/2012):
		- Fixes for context, all elements returned as context (issue #84)
		- Reset position with leaveTransforms !== true fixes (issue #93)


	0.95 (20/08/2012):
		- If target opacity == current opacity, pass back to jquery native to get callback firing (#94)

	0.94 (20/08/2012):
		- Addresses Firefox callback mechanisms (issue #94)
		- using $.one() to bind to CSS callbacks in a more generic way

	0.93 (6/8/2012):
		- Adding other Opera 'transitionend' event (re: issue #90)

	0.92 (6/8/2012):
		- Seperate unbinds into different threads (re: issue #91)

	0.91 (2/4/2012):
		- Merge Pull Request #74 - Unit Management

	0.90 (7/3/2012):
		- Adding public $.toggleDisabledByDefault() feature to disable entire plugin by default (Issue #73)

	0.89 (24/1/2012):
		- Adding 'avoidCSSTransitions' property. Set to true to disable entire plugin. (Issue #47)

	0.88 (24/1/2012):
		- Fix Issue #67 for HighchartsJS compatibility

	0.87 (24/1/2012):
		- Fix Issue #66 selfCSSData.original is undefined

	0.86 (9/1/2012):
		- Strict JS fix for undefined variable

	0.85 (20/12/2011):
		- Merge Pull request #57 from Kronuz
		- Codebase cleaned and now passes jshint.
		- Fixed a few bugs (it now saves and restores the original css transition properties).
		- fadeOut() is fixed, it wasn't restoring the opacity after hiding it.

	0.80 (13/09/2011):
		- Issue #28 - Report $(el).is(':animated') fix

	0.79 (06/09/2011):
		- Issue #42 - Right negative position animation: please see issue notes on Github.

	0.78 (02/09/2011):
		- Issue #18 - jQuery/$ reference joys

	0.77 (02/09/2011):
		- Adding feature on Github issue #44 - Use 3D Transitions by default

	0.76 (28/06/2011):
		- Fixing issue #37 - fixed stop() method (with gotoEnd == false)

	0.75 (15/06/2011):
		- Fixing issue #35 to pass actual object back as context for callback

	0.74 (28/05/2011):
		- Fixing issue #29 to play nice with 1.6+

	0.73 (05/03/2011):
		- Merged Pull Request #26: Fixed issue with fadeOut() / "hide" shortcut

	0.72 (05/03/2011):
		- Merged Pull Request #23: Added Penner equation approximations from Matthew Lein's Ceaser, and added failsafe fallbacks

	0.71 (05/03/2011):
		- Merged Pull Request #24: Changes translation object to integers instead of strings to fix relative values bug with leaveTransforms = true

	0.70 (17/03/2011):
		- Merged Pull Request from amlw-nyt to add bottom/right handling

	0.68 (15/02/2011):
		- width/height fixes & queue issues resolved.

	0.67 (15/02/2011):
		- Code cleanups & file size improvements for compression.

	0.66 (15/02/2011):
		- Zero second fadeOut(), fadeIn() fixes

	0.65 (01/02/2011):
		- Callbacks with queue() support refactored to support element arrays

	0.64 (27/01/2011):
		- BUGFIX #13: .slideUp(), .slideToggle(), .slideDown() bugfixes in Webkit

	0.63 (12/01/2011):
		- BUGFIX #11: callbacks not firing when new value == old value

	0.62 (10/01/2011):
		- BUGFIX #11: queue is not a function issue fixed

	0.61 (10/01/2011):
		- BUGFIX #10: Negative positions converting to positive

	0.60 (06/01/2011):
		- Animate function rewrite in accordance with new queue system
		- BUGFIX #8: Left/top position values always assumed relative rather than absolute
		- BUGFIX #9: animation as last item in a chain - the chain is ignored?
		- BUGFIX: width/height CSS3 transformation with left/top working

	0.55 (22/12/2010):
		- isEmptyObject function for <jQuery 1.4 (requires 1.3.2)

	0.54a (22/12/2010):
		- License changed to MIT (http://www.opensource.org/licenses/mit-license.php)

	0.54 (22/12/2010):
		- Removed silly check for 'jQuery UI' bailouts. Sorry.
		- Scoping issues fixed - Issue #4: $(this) should give you a reference to the selector being animated.. per jquery's core animation funciton.

	0.53 (17/11/2010):
		- New $.translate() method to easily calculate current transformed translation
		- Repeater callback bug fix for leaveTransforms:true (was constantly appending properties)

	0.52 (16/11/2010):
		- leaveTransforms: true bug fixes
		- 'Applying' user callback function to retain 'this' context

	0.51 (08/11/2010):
		- Bailing out with jQuery UI. This is only so the plugin plays nice with others and is TEMPORARY.

	0.50 (08/11/2010):
		- Support for $.fn.stop()
		- Fewer jQuery.fn entries to preserve namespace
		- All references $ converted to jQuery
		- jsDoc Toolkit style commenting for docs (coming soon)

	0.49 (19/10/2010):
		- Handling of 'undefined' errors for secondary CSS objects
		- Support to enhance 'width' and 'height' properties (except shortcuts involving jQuery.fx.step, e.g slideToggle)
		- Bugfix: Positioning when using avoidTransforms: true (thanks Ralf Santbergen reports)
		- Bugfix: Callbacks and Scope issues

	0.48 (13/10/2010):
		- Checks for 3d support before applying

	0.47 (12/10/2010);
		- Compatible with .fadeIn(), .fadeOut()
		- Use shortcuts, no duration for jQuery default or "fast" and "slow"
		- Clean up callback event listeners on complete (preventing multiple callbacks)

	0.46 (07/10/2010);
		- Compatible with .slideUp(), .slideDown(), .slideToggle()

	0.45 (06/10/2010):
		- 'Zero' position bug fix (was originally translating by 0 zero pixels, i.e. no movement)

	0.4 (05/10/2010):
		- Iterate over multiple elements and store transforms in jQuery.data per element
		- Include support for relative values (+= / -=)
		- Better unit sanitization
		- Performance tweaks
		- Fix for optional callback function (was required)
		- Applies data[translateX] and data[translateY] to elements for easy access
		- Added 'easeInOutQuint' easing function for CSS transitions (requires jQuery UI for JS anims)
		- Less need for leaveTransforms = true due to better position detections
*/


(function (window, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module.
        define(['jquery'], function(){
            return factory.apply(window, arguments);
        });
    } else if (typeof module === 'object' && module.exports) {
        // NodeJS.
        module.exports = factory.call(window, require('jquery'));
    } else {
        // Browser globals
        factory.call(window, window.jQuery);
    }
}(typeof global === 'object' ? global : this, function (jQuery) {
    var originalAnimateMethod = jQuery.fn.animate,
        originalStopMethod = jQuery.fn.stop;

	// ----------
	// Plugin variables
	// ----------
	var	cssTransitionProperties = ['top', 'right', 'bottom', 'left', 'opacity', 'height', 'width'],
		directions = ['top', 'right', 'bottom', 'left'],
		cssPrefixes = ['-webkit-', '-moz-', '-o-', ''],
		pluginOptions = ['avoidTransforms', 'useTranslate3d', 'leaveTransforms'],
		rfxnum = /^([+-]=)?([\d+-.]+)(.*)$/,
		rupper = /([A-Z])/g,
		defaultEnhanceData = {
			secondary: {},
			meta: {
				top : 0,
				right : 0,
				bottom : 0,
				left : 0
			}
		},
		valUnit = 'px',

		DATA_KEY = 'jQe',
		CUBIC_BEZIER_OPEN = 'cubic-bezier(',
		CUBIC_BEZIER_CLOSE = ')',

		originalAnimatedFilter = null,
		pluginDisabledDefault = false;


	// ----------
	// Check if this browser supports CSS3 transitions
	// ----------
	var thisBody = document.body || document.documentElement,
		thisStyle = thisBody.style,
		transitionEndEvent = 'webkitTransitionEnd oTransitionEnd transitionend',
		cssTransitionsSupported = thisStyle.WebkitTransition !== undefined || thisStyle.MozTransition !== undefined || thisStyle.OTransition !== undefined || thisStyle.transition !== undefined,
		has3D = ('WebKitCSSMatrix' in window && 'm11' in new WebKitCSSMatrix()),
		use3DByDefault = has3D;



	// ----------
	// Extended :animated filter
	// ----------
	if ( jQuery.expr && jQuery.expr.filters ) {
		originalAnimatedFilter = jQuery.expr.filters.animated;
		jQuery.expr.filters.animated = function(elem) {
			return jQuery(elem).data('events') && jQuery(elem).data('events')[transitionEndEvent] ? true : originalAnimatedFilter.call(this, elem);
		};
	}


	/**
		@private
		@name _getUnit
		@function
		@description Return unit value ("px", "%", "em" for re-use correct one when translating)
		@param {variant} [val] Target value
	*/
	function _getUnit(val){
		return val.match(/\D+$/);
	}


	/**
		@private
		@name _interpretValue
		@function
		@description Interpret value ("px", "+=" and "-=" sanitisation)
		@param {object} [element] The Element for current CSS analysis
		@param {variant} [val] Target value
		@param {string} [prop] The property we're looking at
		@param {boolean} [isTransform] Is this a CSS3 transform?
	*/
	function _interpretValue(e, val, prop, isTransform) {
		// this is a nasty fix, but we check for prop == 'd' to see if we're dealing with SVG, and abort
		if (prop == "d") return;
		if (!_isValidElement(e)) return;

		var parts = rfxnum.exec(val),
			start = e.css(prop) === 'auto' ? 0 : e.css(prop),
			cleanCSSStart = typeof start == 'string' ? _cleanValue(start) : start,
			cleanTarget = typeof val == 'string' ? _cleanValue(val) : val,
			cleanStart = isTransform === true ? 0 : cleanCSSStart,
			hidden = e.is(':hidden'),
			translation = e.translation();

		if (prop == 'left') cleanStart = parseInt(cleanCSSStart, 10) + translation.x;
		if (prop == 'right') cleanStart = parseInt(cleanCSSStart, 10) + translation.x;
		if (prop == 'top') cleanStart = parseInt(cleanCSSStart, 10) + translation.y;
		if (prop == 'bottom') cleanStart = parseInt(cleanCSSStart, 10) + translation.y;

		// deal with shortcuts
		if (!parts && val == 'show') {
			cleanStart = 1;
			if (hidden) {
				elem = e[0];
				if (elem.style) {
					display = elem.style.display;

					// Reset the inline display of this element to learn if it is
					// being hidden by cascaded rules or not
					if (!jQuery._data(elem, 'olddisplay') && display === 'none') {
						display = elem.style.display = '';
					}

					// Set elements which have been overridden with display: none
					// in a stylesheet to whatever the default browser style is
					// for such an element
					if ( display === '' && jQuery.css(elem, 'display') === 'none' ) {
						jQuery._data(elem, 'olddisplay', _domElementVisibleDisplayValue(elem.tagName));
					}

					if (display === '' || display === 'none') {
						elem.style.display = jQuery._data(elem, 'olddisplay') || '';
					}
				}
				e.css('opacity', 0);
			}
		} else if (!parts && val == 'hide') {
			cleanStart = 0;
		}

		if (parts) {
			var end = parseFloat(parts[2]);

			// If a +=/-= token was provided, we're doing a relative animation
			if (parts[1]) end = ((parts[1] === '-=' ? -1 : 1) * end) + parseInt(cleanStart, 10);

			// check for unit  as per issue #69
			if (parts[3] && parts[3] != 'px') end = end + parts[3];

			return end;
		} else {
			return cleanStart;
		}
	}

	/**
		@private
		@name _getTranslation
		@function
		@description Make a translate or translate3d string
		@param {integer} [x]
		@param {integer} [y]
		@param {boolean} [use3D] Use translate3d if available?
	*/
	function _getTranslation(x, y, use3D) {
		return ((use3D === true || ((use3DByDefault === true && use3D !== false)) && has3D)) ? 'translate3d(' + x + 'px, ' + y + 'px, 0)' : 'translate(' + x + 'px,' + y + 'px)';
	}


	/**
		@private
		@name _applyCSSTransition
		@function
		@description Build up the CSS object
		@param {object} [e] Element
		@param {string} [property] Property we're dealing with
		@param {integer} [duration] Duration
		@param {string} [easing] Easing function
		@param {variant} [value] String/integer for target value
		@param {boolean} [isTransform] Is this a CSS transformation?
		@param {boolean} [isTranslatable] Is this a CSS translation?
		@param {boolean} [use3D] Use translate3d if available?
	*/
	function _applyCSSTransition(e, property, duration, easing, value, isTransform, isTranslatable, use3D) {
		var eCSSData = e.data(DATA_KEY),
			enhanceData = eCSSData && !_isEmptyObject(eCSSData) ? eCSSData : jQuery.extend(true, {}, defaultEnhanceData),
			offsetPosition = value,
			isDirection = jQuery.inArray(property, directions) > -1;


		if (isDirection) {
			var meta = enhanceData.meta,
				cleanPropertyValue = _cleanValue(e.css(property)) || 0,
				stashedProperty = property + '_o';

			offsetPosition = value - cleanPropertyValue;


			meta[property] = offsetPosition;
			meta[stashedProperty] = e.css(property) == 'auto' ? 0 + offsetPosition : cleanPropertyValue + offsetPosition || 0;
			enhanceData.meta = meta;

			// fix 0 issue (transition by 0 = nothing)
			if (isTranslatable && offsetPosition === 0) {
				offsetPosition = 0 - meta[stashedProperty];
				meta[property] = offsetPosition;
				meta[stashedProperty] = 0;
			}
		}

		// reapply data and return
		return e.data(DATA_KEY, _applyCSSWithPrefix(e, enhanceData, property, duration, easing, offsetPosition, isTransform, isTranslatable, use3D));
	}

	/**
		@private
		@name _applyCSSWithPrefix
		@function
		@description Helper function to build up CSS properties using the various prefixes
		@param {object} [cssProperties] Current CSS object to merge with
		@param {string} [property]
		@param {integer} [duration]
		@param {string} [easing]
		@param {variant} [value]
		@param {boolean} [isTransform] Is this a CSS transformation?
		@param {boolean} [isTranslatable] Is this a CSS translation?
		@param {boolean} [use3D] Use translate3d if available?
	*/
	function _applyCSSWithPrefix(e, cssProperties, property, duration, easing, value, isTransform, isTranslatable, use3D) {
		var saveOriginal = false,
			transform = isTransform === true && isTranslatable === true;


		cssProperties = cssProperties || {};
		if (!cssProperties.original) {
			cssProperties.original = {};
			saveOriginal = true;
		}
		cssProperties.properties = cssProperties.properties || {};
		cssProperties.secondary = cssProperties.secondary || {};

		var meta = cssProperties.meta,
			original = cssProperties.original,
			properties = cssProperties.properties,
			secondary = cssProperties.secondary;

		for (var i = cssPrefixes.length - 1; i >= 0; i--) {
			var tp = cssPrefixes[i] + 'transition-property',
				td = cssPrefixes[i] + 'transition-duration',
				tf = cssPrefixes[i] + 'transition-timing-function';

			property = (transform ? cssPrefixes[i] + 'transform' : property);

			if (saveOriginal) {
				original[tp] = e.css(tp) || '';
				original[td] = e.css(td) || '';
				original[tf] = e.css(tf) || '';
			}

			secondary[property] = transform ? _getTranslation(meta.left, meta.top, use3D) : value;

			properties[tp] = (properties[tp] ? properties[tp] + ',' : '') + property;
			properties[td] = (properties[td] ? properties[td] + ',' : '') + duration + 'ms';
			properties[tf] = (properties[tf] ? properties[tf] + ',' : '') + easing;
		}

		return cssProperties;
	}

	/**
		@private
		@name _isBoxShortcut
		@function
		@description Shortcut to detect if we need to step away from slideToggle, CSS accelerated transitions (to come later with fx.step support)
		@param {object} [prop]
	*/
	function _isBoxShortcut(prop) {
		for (var property in prop) {
			if ((property == 'width' || property == 'height') && (prop[property] == 'show' || prop[property] == 'hide' || prop[property] == 'toggle')) {
				return true;
			}
		}
		return false;
	}


	/**
		@private
		@name _isEmptyObject
		@function
		@description Check if object is empty (<1.4 compatibility)
		@param {object} [obj]
	*/
	function _isEmptyObject(obj) {
		for (var i in obj) {
			return false;
		}
		return true;
	}

	/**
	 * Fetch most appropriate display value for element types
	 * @see  https://github.com/benbarnett/jQuery-Animate-Enhanced/issues/121
	 * @private
	 * @param  {[type]} tagName [description]
	 * @return {[type]}         [description]
	 */
	function _domElementVisibleDisplayValue(tagName) {
		tagName = tagName.toUpperCase();
		var displayValues = {
			'LI'       : 'list-item',
			'TR'       : 'table-row',
			'TD'       : 'table-cell',
			'TH'       : 'table-cell',
			'CAPTION'  : 'table-caption',
			'COL'      : 'table-column',
			'COLGROUP' : 'table-column-group',
			'TFOOT'      : 'table-footer-group',
			'THEAD'      : 'table-header-group',
			'TBODY'      : 'table-row-group'
		};

		return typeof displayValues[tagName] == 'string' ? displayValues[tagName] : 'block';
	}


	/**
		@private
		@name _cleanValue
		@function
		@description Remove 'px' and other artifacts
		@param {variant} [val]
	*/
	function _cleanValue(val) {
		return parseFloat(val.replace(_getUnit(val), ''));
	}


	function _isValidElement(element) {
		var allValid=true;
		element.each(function(index, el) {
			allValid = allValid && el.ownerDocument;
			return allValid;
		});
		return allValid;
	}

	/**
		@private
		@name _appropriateProperty
		@function
		@description Function to check if property should be handled by plugin
		@param {string} [prop]
		@param {variant} [value]
	*/
	function _appropriateProperty(prop, value, element) {
		if (!_isValidElement(element)) {
			return false;
		}

		var is = jQuery.inArray(prop, cssTransitionProperties) > -1;
		if ((prop == 'width' || prop == 'height' || prop == 'opacity') && (parseFloat(value) === parseFloat(element.css(prop)))) is = false;
		return is;
	}


	jQuery.extend({
		/**
			@public
			@name toggle3DByDefault
			@function
			@description Toggle for plugin settings to automatically use translate3d (where available). Usage: $.toggle3DByDefault
		*/
		toggle3DByDefault: function() {
			return use3DByDefault = !use3DByDefault;
		},


		/**
			@public
			@name toggleDisabledByDefault
			@function
			@description Toggle the plugin to be disabled by default (can be overridden per animation with avoidCSSTransitions)
		*/
		toggleDisabledByDefault: function() {
			return pluginDisabledDefault = !pluginDisabledDefault;
		},


		/**
			@public
			@name setDisabledByDefault
			@function
			@description Set or unset the 'disabled by default' value
		*/
		setDisabledByDefault: function(newValue) {
			return pluginDisabledDefault = newValue;
		}
	});


	/**
		@public
		@name translation
		@function
		@description Get current X and Y translations
	*/
	jQuery.fn.translation = function() {
		if (!this[0]) {
			return null;
		}

		var	elem = this[0],
			cStyle = window.getComputedStyle(elem, null),
			translation = {
				x: 0,
				y: 0
			};

		if (cStyle) {
			for (var i = cssPrefixes.length - 1; i >= 0; i--) {
				var transform = cStyle.getPropertyValue(cssPrefixes[i] + 'transform');
				if (transform && (/matrix/i).test(transform)) {
					var explodedMatrix = transform.replace(/^matrix\(/i, '').split(/, |\)$/g);
					translation = {
						x: parseInt(explodedMatrix[4], 10),
						y: parseInt(explodedMatrix[5], 10)
					};

					break;
				}
			}
		}

		return translation;
	};



	/**
		@public
		@name jQuery.fn.animate
		@function
		@description The enhanced jQuery.animate function
		@param {string} [property]
		@param {string} [speed]
		@param {string} [easing]
		@param {function} [callback]
	*/
	jQuery.fn.animate = function(prop, speed, easing, callback) {
		prop = prop || {};
		var isTranslatable = !(typeof prop['bottom'] !== 'undefined' || typeof prop['right'] !== 'undefined'),
			optall = jQuery.speed(speed, easing, callback),
			callbackQueue = 0,
			propertyCallback = function() {
				callbackQueue--;
				if (callbackQueue === 0) {
					// we're done, trigger the user callback
					if (typeof optall.complete === 'function') {
						optall.complete.apply(this, arguments);
					}
				}
			},
			bypassPlugin = (typeof prop['avoidCSSTransitions'] !== 'undefined') ? prop['avoidCSSTransitions'] : pluginDisabledDefault;

		if (bypassPlugin === true || !cssTransitionsSupported || _isEmptyObject(prop) || _isBoxShortcut(prop) || optall.duration <= 0 || optall.step) {
			return originalAnimateMethod.apply(this, arguments);
		}

		return this[ optall.queue === true ? 'queue' : 'each' ](function() {
			var self = jQuery(this),
				opt = jQuery.extend({}, optall),
				cssCallback = function(e) {
					var selfCSSData = self.data(DATA_KEY) || { original: {} },
						restore = {};

					if (e.eventPhase != 2)  // not at dispatching target (thanks @warappa issue #58)
						return;

					// convert translations to left & top for layout
					if (prop.leaveTransforms !== true) {
						for (var i = cssPrefixes.length - 1; i >= 0; i--) {
							restore[cssPrefixes[i] + 'transform'] = '';
						}
						if (isTranslatable && typeof selfCSSData.meta !== 'undefined') {
							for (var j = 0, dir; (dir = directions[j]); ++j) {
								var stashedProperty = selfCSSData.meta[dir + '_o'];
								if (typeof stashedProperty !== 'undefined') {
									restore[dir] = stashedProperty + valUnit;
									jQuery(this).css(dir, restore[dir]);
								}
							}
						}
					}

					// remove transition timing functions
					self.
						unbind(transitionEndEvent).
						css(selfCSSData.original).
						css(restore).
						data(DATA_KEY, null);

					// if we used the fadeOut shortcut make sure elements are display:none
					if (prop.opacity === 'hide') {
						elem = self[0];
						if (elem.style) {
							display = jQuery.css(elem, 'display');

							if (display !== 'none' && !jQuery._data(elem, 'olddisplay')) {
								jQuery._data(elem, 'olddisplay', display);
							}
							elem.style.display = 'none';
						}

						self.css('opacity', '');
					}

					// run the main callback function
					propertyCallback.call(this);
				},
				easings = {
					bounce: CUBIC_BEZIER_OPEN + '0.0, 0.35, .5, 1.3' + CUBIC_BEZIER_CLOSE,
					linear: 'linear',
					swing: 'ease-in-out',

					// Penner equation approximations from Matthew Lein's Ceaser: http://matthewlein.com/ceaser/
					easeInQuad:     CUBIC_BEZIER_OPEN + '0.550, 0.085, 0.680, 0.530' + CUBIC_BEZIER_CLOSE,
					easeInCubic:    CUBIC_BEZIER_OPEN + '0.550, 0.055, 0.675, 0.190' + CUBIC_BEZIER_CLOSE,
					easeInQuart:    CUBIC_BEZIER_OPEN + '0.895, 0.030, 0.685, 0.220' + CUBIC_BEZIER_CLOSE,
					easeInQuint:    CUBIC_BEZIER_OPEN + '0.755, 0.050, 0.855, 0.060' + CUBIC_BEZIER_CLOSE,
					easeInSine:     CUBIC_BEZIER_OPEN + '0.470, 0.000, 0.745, 0.715' + CUBIC_BEZIER_CLOSE,
					easeInExpo:     CUBIC_BEZIER_OPEN + '0.950, 0.050, 0.795, 0.035' + CUBIC_BEZIER_CLOSE,
					easeInCirc:     CUBIC_BEZIER_OPEN + '0.600, 0.040, 0.980, 0.335' + CUBIC_BEZIER_CLOSE,
					easeInBack:     CUBIC_BEZIER_OPEN + '0.600, -0.280, 0.735, 0.045' + CUBIC_BEZIER_CLOSE,
					easeOutQuad:    CUBIC_BEZIER_OPEN + '0.250, 0.460, 0.450, 0.940' + CUBIC_BEZIER_CLOSE,
					easeOutCubic:   CUBIC_BEZIER_OPEN + '0.215, 0.610, 0.355, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutQuart:   CUBIC_BEZIER_OPEN + '0.165, 0.840, 0.440, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutQuint:   CUBIC_BEZIER_OPEN + '0.230, 1.000, 0.320, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutSine:    CUBIC_BEZIER_OPEN + '0.390, 0.575, 0.565, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutExpo:    CUBIC_BEZIER_OPEN + '0.190, 1.000, 0.220, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutCirc:    CUBIC_BEZIER_OPEN + '0.075, 0.820, 0.165, 1.000' + CUBIC_BEZIER_CLOSE,
					easeOutBack:    CUBIC_BEZIER_OPEN + '0.175, 0.885, 0.320, 1.275' + CUBIC_BEZIER_CLOSE,
					easeInOutQuad:  CUBIC_BEZIER_OPEN + '0.455, 0.030, 0.515, 0.955' + CUBIC_BEZIER_CLOSE,
					easeInOutCubic: CUBIC_BEZIER_OPEN + '0.645, 0.045, 0.355, 1.000' + CUBIC_BEZIER_CLOSE,
					easeInOutQuart: CUBIC_BEZIER_OPEN + '0.770, 0.000, 0.175, 1.000' + CUBIC_BEZIER_CLOSE,
					easeInOutQuint: CUBIC_BEZIER_OPEN + '0.860, 0.000, 0.070, 1.000' + CUBIC_BEZIER_CLOSE,
					easeInOutSine:  CUBIC_BEZIER_OPEN + '0.445, 0.050, 0.550, 0.950' + CUBIC_BEZIER_CLOSE,
					easeInOutExpo:  CUBIC_BEZIER_OPEN + '1.000, 0.000, 0.000, 1.000' + CUBIC_BEZIER_CLOSE,
					easeInOutCirc:  CUBIC_BEZIER_OPEN + '0.785, 0.135, 0.150, 0.860' + CUBIC_BEZIER_CLOSE,
					easeInOutBack:  CUBIC_BEZIER_OPEN + '0.680, -0.550, 0.265, 1.550' + CUBIC_BEZIER_CLOSE
				},
				domProperties = {},
				cssEasing = easings[opt.easing || 'swing'] ? easings[opt.easing || 'swing'] : opt.easing || 'swing';

			// seperate out the properties for the relevant animation functions
			for (var p in prop) {
				if (jQuery.inArray(p, pluginOptions) === -1) {
					var isDirection = jQuery.inArray(p, directions) > -1,
						cleanVal = _interpretValue(self, prop[p], p, (isDirection && prop.avoidTransforms !== true));


					if (/**prop.avoidTransforms !== true && **/_appropriateProperty(p, cleanVal, self)) {
						_applyCSSTransition(
							self,
							p,
							opt.duration,
							cssEasing,
							cleanVal, //isDirection && prop.avoidTransforms === true ? cleanVal + valUnit : cleanVal,
							isDirection && prop.avoidTransforms !== true,
							isTranslatable,
							prop.useTranslate3d);

					}
					else {
						domProperties[p] = prop[p];
					}
				}
			}

			self.unbind(transitionEndEvent);

			var selfCSSData = self.data(DATA_KEY);


			if (selfCSSData && !_isEmptyObject(selfCSSData) && !_isEmptyObject(selfCSSData.secondary)) {
				callbackQueue++;

				self.css(selfCSSData.properties);

				// store in a var to avoid any timing issues, depending on animation duration
				var secondary = selfCSSData.secondary;

				// has to be done in a timeout to ensure transition properties are set
				setTimeout(function() {
					self.bind(transitionEndEvent, cssCallback).css(secondary);
				});
			}
			else {
				// it won't get fired otherwise
				opt.queue = false;
			}

			// fire up DOM based animations
			if (!_isEmptyObject(domProperties)) {
				callbackQueue++;
				originalAnimateMethod.apply(self, [domProperties, {
					duration: opt.duration,
					easing: jQuery.easing[opt.easing] ? opt.easing : (jQuery.easing.swing ? 'swing' : 'linear'),
					complete: propertyCallback,
					queue: opt.queue
				}]);
			}

			// strict JS compliance
			return true;
		});
	};

    jQuery.fn.animate.defaults = {};


	/**
		@public
		@name jQuery.fn.stop
		@function
		@description The enhanced jQuery.stop function (resets transforms to left/top)
		@param {boolean} [clearQueue]
		@param {boolean} [gotoEnd]
		@param {boolean} [leaveTransforms] Leave transforms/translations as they are? Default: false (reset translations to calculated explicit left/top props)
	*/
	jQuery.fn.stop = function(clearQueue, gotoEnd, leaveTransforms) {
		if (!cssTransitionsSupported) return originalStopMethod.apply(this, [clearQueue, gotoEnd]);

		// clear the queue?
		if (clearQueue) this.queue([]);

		// route to appropriate stop methods
		this.each(function() {
			var self = jQuery(this),
				selfCSSData = self.data(DATA_KEY);

			// is this a CSS transition?
			if (selfCSSData && !_isEmptyObject(selfCSSData)) {
				var i, restore = {};

				if (gotoEnd) {
					// grab end state properties
					restore = selfCSSData.secondary;

					if (!leaveTransforms && typeof selfCSSData.meta['left_o'] !== undefined || typeof selfCSSData.meta['top_o'] !== undefined) {
						restore['left'] = typeof selfCSSData.meta['left_o'] !== undefined ? selfCSSData.meta['left_o'] : 'auto';
						restore['top'] = typeof selfCSSData.meta['top_o'] !== undefined ? selfCSSData.meta['top_o'] : 'auto';

						// remove the transformations
						for (i = cssPrefixes.length - 1; i >= 0; i--) {
							restore[cssPrefixes[i]+'transform'] = '';
						}
					}
				} else if (!_isEmptyObject(selfCSSData.secondary)) {
					var cStyle = window.getComputedStyle(self[0], null);
					if (cStyle) {
						// grab current properties
						for (var prop in selfCSSData.secondary) {
							if(selfCSSData.secondary.hasOwnProperty(prop)) {
								prop = prop.replace(rupper, '-$1').toLowerCase();
								restore[prop] = cStyle.getPropertyValue(prop);

								// is this a matrix property? extract left and top and apply
								if (!leaveTransforms && (/matrix/i).test(restore[prop])) {
									var explodedMatrix = restore[prop].replace(/^matrix\(/i, '').split(/, |\)$/g);

									// apply the explicit left/top props
									restore['left'] = (parseFloat(explodedMatrix[4]) + parseFloat(self.css('left')) + valUnit) || 'auto';
									restore['top'] = (parseFloat(explodedMatrix[5]) + parseFloat(self.css('top')) + valUnit) || 'auto';

									// remove the transformations
									for (i = cssPrefixes.length - 1; i >= 0; i--) {
										restore[cssPrefixes[i]+'transform'] = '';
									}
								}
							}
						}
					}
				}

				// Remove transition timing functions
				// Moving to seperate thread (re: Animation reverts when finished in Android - issue #91)
				self.unbind(transitionEndEvent);
				self.
					css(selfCSSData.original).
					css(restore).
					data(DATA_KEY, null);
			}
			else {
				// dom transition
				originalStopMethod.apply(self, [clearQueue, gotoEnd]);
			}
		});

		return this;
	};
}));
/** 
 * @overview datejs
 * @version 1.0.0-rc3
 * @author Gregory Wild-Smith <gregory@wild-smith.com>
 * @copyright 2015 Gregory Wild-Smith
 * @license MIT
 * @homepage https://github.com/abritinthebay/datejs
 */
/*
 2015 Gregory Wild-Smith
 @license MIT
 @homepage https://github.com/abritinthebay/datejs
*/

(function(){var h=Date,f=Date.CultureStrings?Date.CultureStrings.lang:null,d={},c={getFromKey:function(a,b){var e;e=Date.CultureStrings&&Date.CultureStrings[b]&&Date.CultureStrings[b][a]?Date.CultureStrings[b][a]:c.buildFromDefault(a);"/"===a.charAt(0)&&(e=c.buildFromRegex(a,b));return e},getFromObjectValues:function(a,b){var e,g={};for(e in a)a.hasOwnProperty(e)&&(g[e]=c.getFromKey(a[e],b));return g},getFromObjectKeys:function(a,b){var e,g={};for(e in a)a.hasOwnProperty(e)&&(g[c.getFromKey(e,b)]=
a[e]);return g},getFromArray:function(a,b){for(var e=[],g=0;g<a.length;g++)g in a&&(e[g]=c.getFromKey(a[g],b));return e},buildFromDefault:function(a){var b,e,g;switch(a){case "name":b="en-US";break;case "englishName":b="English (United States)";break;case "nativeName":b="English (United States)";break;case "twoDigitYearMax":b=2049;break;case "firstDayOfWeek":b=0;break;default:if(b=a,g=a.split("_"),e=g.length,1<e&&"/"!==a.charAt(0)&&(a=g[e-1].toLowerCase(),"initial"===a||"abbr"===a))b=g[0]}return b},
buildFromRegex:function(a,b){return Date.CultureStrings&&Date.CultureStrings[b]&&Date.CultureStrings[b][a]?new RegExp(Date.CultureStrings[b][a],"i"):new RegExp(a.replace(RegExp("/","g"),""),"i")}},a=function(a,b){var e=b?b:f;d[a]=a;return"object"===typeof a?a instanceof Array?c.getFromArray(a,e):c.getFromObjectKeys(a,e):c.getFromKey(a,e)},b=function(a){a=Date.Config.i18n+a+".js";var b=document.getElementsByTagName("head")[0]||document.documentElement,e=document.createElement("script");e.src=a;var g=
{done:function(){}};e.onload=e.onreadystatechange=function(){this.readyState&&"loaded"!==this.readyState&&"complete"!==this.readyState||(g.done(),b.removeChild(e))};setTimeout(function(){b.insertBefore(e,b.firstChild)},0);return{done:function(a){g.done=function(){a&&setTimeout(a,0)}}}},e={buildFromMethodHash:function(a){for(var b in a)a.hasOwnProperty(b)&&(a[b]=e[a[b]]());return a},timeZoneDST:function(){return a({CHADT:"+1345",NZDT:"+1300",AEDT:"+1100",ACDT:"+1030",AZST:"+0500",IRDT:"+0430",EEST:"+0300",
CEST:"+0200",BST:"+0100",PMDT:"-0200",ADT:"-0300",NDT:"-0230",EDT:"-0400",CDT:"-0500",MDT:"-0600",PDT:"-0700",AKDT:"-0800",HADT:"-0900"})},timeZoneStandard:function(){return a({LINT:"+1400",TOT:"+1300",CHAST:"+1245",NZST:"+1200",NFT:"+1130",SBT:"+1100",AEST:"+1000",ACST:"+0930",JST:"+0900",CWST:"+0845",CT:"+0800",ICT:"+0700",MMT:"+0630",BST:"+0600",NPT:"+0545",IST:"+0530",PKT:"+0500",AFT:"+0430",MSK:"+0400",IRST:"+0330",FET:"+0300",EET:"+0200",CET:"+0100",GMT:"+0000",UTC:"+0000",CVT:"-0100",GST:"-0200",
BRT:"-0300",NST:"-0330",AST:"-0400",EST:"-0500",CST:"-0600",MST:"-0700",PST:"-0800",AKST:"-0900",MIT:"-0930",HST:"-1000",SST:"-1100",BIT:"-1200"})},timeZones:function(a){var b;a.timezones=[];for(b in a.abbreviatedTimeZoneStandard)a.abbreviatedTimeZoneStandard.hasOwnProperty(b)&&a.timezones.push({name:b,offset:a.abbreviatedTimeZoneStandard[b]});for(b in a.abbreviatedTimeZoneDST)a.abbreviatedTimeZoneDST.hasOwnProperty(b)&&a.timezones.push({name:b,offset:a.abbreviatedTimeZoneDST[b],dst:!0});return a.timezones},
days:function(){return a("Sunday Monday Tuesday Wednesday Thursday Friday Saturday".split(" "))},dayAbbr:function(){return a("Sun Mon Tue Wed Thu Fri Sat".split(" "))},dayShortNames:function(){return a("Su Mo Tu We Th Fr Sa".split(" "))},dayFirstLetters:function(){return a("S_Sun_Initial M_Mon_Initial T_Tues_Initial W_Wed_Initial T_Thu_Initial F_Fri_Initial S_Sat_Initial".split(" "))},months:function(){return a("January February March April May June July August September October November December".split(" "))},
monthAbbr:function(){return a("Jan_Abbr Feb_Abbr Mar_Abbr Apr_Abbr May_Abbr Jun_Abbr Jul_Abbr Aug_Abbr Sep_Abbr Oct_Abbr Nov_Abbr Dec_Abbr".split(" "))},formatPatterns:function(){return c.getFromObjectValues({shortDate:"M/d/yyyy",longDate:"dddd, MMMM dd, yyyy",shortTime:"h:mm tt",longTime:"h:mm:ss tt",fullDateTime:"dddd, MMMM dd, yyyy h:mm:ss tt",sortableDateTime:"yyyy-MM-ddTHH:mm:ss",universalSortableDateTime:"yyyy-MM-dd HH:mm:ssZ",rfc1123:"ddd, dd MMM yyyy HH:mm:ss",monthDay:"MMMM dd",yearMonth:"MMMM, yyyy"},
Date.i18n.currentLanguage())},regex:function(){return c.getFromObjectValues({inTheMorning:"/( in the )(morn(ing)?)\\b/",thisMorning:"/(this )(morn(ing)?)\\b/",amThisMorning:"/(\b\\d(am)? )(this )(morn(ing)?)/",inTheEvening:"/( in the )(even(ing)?)\\b/",thisEvening:"/(this )(even(ing)?)\\b/",pmThisEvening:"/(\b\\d(pm)? )(this )(even(ing)?)/",jan:"/jan(uary)?/",feb:"/feb(ruary)?/",mar:"/mar(ch)?/",apr:"/apr(il)?/",may:"/may/",jun:"/jun(e)?/",jul:"/jul(y)?/",aug:"/aug(ust)?/",sep:"/sep(t(ember)?)?/",
oct:"/oct(ober)?/",nov:"/nov(ember)?/",dec:"/dec(ember)?/",sun:"/^su(n(day)?)?/",mon:"/^mo(n(day)?)?/",tue:"/^tu(e(s(day)?)?)?/",wed:"/^we(d(nesday)?)?/",thu:"/^th(u(r(s(day)?)?)?)?/",fri:"/fr(i(day)?)?/",sat:"/^sa(t(urday)?)?/",future:"/^next/",past:"/^last|past|prev(ious)?/",add:"/^(\\+|aft(er)?|from|hence)/",subtract:"/^(\\-|bef(ore)?|ago)/",yesterday:"/^yes(terday)?/",today:"/^t(od(ay)?)?/",tomorrow:"/^tom(orrow)?/",now:"/^n(ow)?/",millisecond:"/^ms|milli(second)?s?/",second:"/^sec(ond)?s?/",
minute:"/^mn|min(ute)?s?/",hour:"/^h(our)?s?/",week:"/^w(eek)?s?/",month:"/^m(onth)?s?/",day:"/^d(ay)?s?/",year:"/^y(ear)?s?/",shortMeridian:"/^(a|p)/",longMeridian:"/^(a\\.?m?\\.?|p\\.?m?\\.?)/",timezone:"/^((e(s|d)t|c(s|d)t|m(s|d)t|p(s|d)t)|((gmt)?\\s*(\\+|\\-)\\s*\\d\\d\\d\\d?)|gmt|utc)/",ordinalSuffix:"/^\\s*(st|nd|rd|th)/",timeContext:"/^\\s*(\\:|a(?!u|p)|p)/"},Date.i18n.currentLanguage())}},g=function(){var a=c.getFromObjectValues({name:"name",englishName:"englishName",nativeName:"nativeName",
amDesignator:"AM",pmDesignator:"PM",firstDayOfWeek:"firstDayOfWeek",twoDigitYearMax:"twoDigitYearMax",dateElementOrder:"mdy"},Date.i18n.currentLanguage()),b=e.buildFromMethodHash({dayNames:"days",abbreviatedDayNames:"dayAbbr",shortestDayNames:"dayShortNames",firstLetterDayNames:"dayFirstLetters",monthNames:"months",abbreviatedMonthNames:"monthAbbr",formatPatterns:"formatPatterns",regexPatterns:"regex",abbreviatedTimeZoneDST:"timeZoneDST",abbreviatedTimeZoneStandard:"timeZoneStandard"}),g;for(g in b)b.hasOwnProperty(g)&&
(a[g]=b[g]);e.timeZones(a);return a};h.i18n={__:function(m,b){return a(m,b)},currentLanguage:function(){return f||"en-US"},setLanguage:function(a,e,c){var d=!1;if(e||"en-US"===a||Date.CultureStrings&&Date.CultureStrings[a])f=a,Date.CultureStrings=Date.CultureStrings||{},Date.CultureStrings.lang=a,Date.CultureInfo=new g;else if(!Date.CultureStrings||!Date.CultureStrings[a])if("undefined"!==typeof exports&&this.exports!==exports)try{require("../i18n/"+a+".js"),f=a,Date.CultureStrings.lang=a,Date.CultureInfo=
new g}catch(p){throw Error("The DateJS IETF language tag '"+a+"' could not be loaded by Node. It likely does not exist.");}else if(Date.Config&&Date.Config.i18n)d=!0,b(a).done(function(){f=a;Date.CultureStrings=Date.CultureStrings||{};Date.CultureStrings.lang=a;Date.CultureInfo=new g;h.Parsing.Normalizer.buildReplaceData();h.Grammar&&h.Grammar.buildGrammarFormats();c&&setTimeout(c,0)});else return Date.console.error("The DateJS IETF language tag '"+a+"' is not available and has not been loaded."),
!1;h.Parsing.Normalizer.buildReplaceData();h.Grammar&&h.Grammar.buildGrammarFormats();!d&&c&&setTimeout(c,0)},getLoggedKeys:function(){return d},updateCultureInfo:function(){Date.CultureInfo=new g}};h.i18n.updateCultureInfo()})();
(function(){var h=Date,f=h.prototype,d=function(a,b){b||(b=2);return("000"+a).slice(-1*b)};h.console="undefined"!==typeof window&&"undefined"!==typeof window.console&&"undefined"!==typeof window.console.log?console:{log:function(){},error:function(){}};h.Config=h.Config||{};h.initOverloads=function(){h.now?h._now||(h._now=h.now):h._now=function(){return(new Date).getTime()};h.now=function(a){return a?h.present():h._now()};f.toISOString||(f.toISOString=function(){return this.getUTCFullYear()+"-"+d(this.getUTCMonth()+
1)+"-"+d(this.getUTCDate())+"T"+d(this.getUTCHours())+":"+d(this.getUTCMinutes())+":"+d(this.getUTCSeconds())+"."+String((this.getUTCMilliseconds()/1E3).toFixed(3)).slice(2,5)+"Z"});void 0===f._toString&&(f._toString=f.toString)};h.initOverloads();h.today=function(){return(new Date).clearTime()};h.present=function(){return new Date};h.compare=function(a,b){if(isNaN(a)||isNaN(b))throw Error(a+" - "+b);if(a instanceof Date&&b instanceof Date)return a<b?-1:a>b?1:0;throw new TypeError(a+" - "+b);};h.equals=
function(a,b){return 0===a.compareTo(b)};h.getDayName=function(a){return Date.CultureInfo.dayNames[a]};h.getDayNumberFromName=function(a){var b=Date.CultureInfo.dayNames,e=Date.CultureInfo.abbreviatedDayNames,g=Date.CultureInfo.shortestDayNames;a=a.toLowerCase();for(var m=0;m<b.length;m++)if(b[m].toLowerCase()===a||e[m].toLowerCase()===a||g[m].toLowerCase()===a)return m;return-1};h.getMonthNumberFromName=function(a){var b=Date.CultureInfo.monthNames,e=Date.CultureInfo.abbreviatedMonthNames;a=a.toLowerCase();
for(var g=0;g<b.length;g++)if(b[g].toLowerCase()===a||e[g].toLowerCase()===a)return g;return-1};h.getMonthName=function(a){return Date.CultureInfo.monthNames[a]};h.isLeapYear=function(a){return 0===a%4&&0!==a%100||0===a%400};h.getDaysInMonth=function(a,b){!b&&h.validateMonth(a)&&(b=a,a=Date.today().getFullYear());return[31,h.isLeapYear(a)?29:28,31,30,31,30,31,31,30,31,30,31][b]};f.getDaysInMonth=function(){return h.getDaysInMonth(this.getFullYear(),this.getMonth())};h.getTimezoneAbbreviation=function(a,
b){var e,g=b?Date.CultureInfo.abbreviatedTimeZoneDST:Date.CultureInfo.abbreviatedTimeZoneStandard;for(e in g)if(g.hasOwnProperty(e)&&g[e]===a)return e;return null};h.getTimezoneOffset=function(a,b){var e,g=[],m=Date.CultureInfo.timezones;a||(a=(new Date).getTimezone());for(e=0;e<m.length;e++)m[e].name===a.toUpperCase()&&g.push(e);if(!m[g[0]])return null;if(1!==g.length&&b)for(e=0;e<g.length;e++){if(m[g[e]].dst)return m[g[e]].offset}else return m[g[0]].offset};h.getQuarter=function(a){a=a||new Date;
return[1,2,3,4][Math.floor(a.getMonth()/3)]};h.getDaysLeftInQuarter=function(a){a=a||new Date;var b=new Date(a);b.setMonth(b.getMonth()+3-b.getMonth()%3,0);return Math.floor((b-a)/864E5)};var c=function(a,b,e,g){if("undefined"===typeof a)return!1;if("number"!==typeof a)throw new TypeError(a+" is not a Number.");return a<b||a>e?!1:!0};h.validateMillisecond=function(a){return c(a,0,999,"millisecond")};h.validateSecond=function(a){return c(a,0,59,"second")};h.validateMinute=function(a){return c(a,0,
59,"minute")};h.validateHour=function(a){return c(a,0,23,"hour")};h.validateDay=function(a,b,e){return void 0===b||null===b||void 0===e||null===e?!1:c(a,1,h.getDaysInMonth(b,e),"day")};h.validateWeek=function(a){return c(a,0,53,"week")};h.validateMonth=function(a){return c(a,0,11,"month")};h.validateYear=function(a){return c(a,-271822,275760,"year")};h.validateTimezone=function(a){return 1==={ACDT:1,ACST:1,ACT:1,ADT:1,AEDT:1,AEST:1,AFT:1,AKDT:1,AKST:1,AMST:1,AMT:1,ART:1,AST:1,AWDT:1,AWST:1,AZOST:1,
AZT:1,BDT:1,BIOT:1,BIT:1,BOT:1,BRT:1,BST:1,BTT:1,CAT:1,CCT:1,CDT:1,CEDT:1,CEST:1,CET:1,CHADT:1,CHAST:1,CHOT:1,ChST:1,CHUT:1,CIST:1,CIT:1,CKT:1,CLST:1,CLT:1,COST:1,COT:1,CST:1,CT:1,CVT:1,CWST:1,CXT:1,DAVT:1,DDUT:1,DFT:1,EASST:1,EAST:1,EAT:1,ECT:1,EDT:1,EEDT:1,EEST:1,EET:1,EGST:1,EGT:1,EIT:1,EST:1,FET:1,FJT:1,FKST:1,FKT:1,FNT:1,GALT:1,GAMT:1,GET:1,GFT:1,GILT:1,GIT:1,GMT:1,GST:1,GYT:1,HADT:1,HAEC:1,HAST:1,HKT:1,HMT:1,HOVT:1,HST:1,ICT:1,IDT:1,IOT:1,IRDT:1,IRKT:1,IRST:1,IST:1,JST:1,KGT:1,KOST:1,KRAT:1,
KST:1,LHST:1,LINT:1,MAGT:1,MART:1,MAWT:1,MDT:1,MET:1,MEST:1,MHT:1,MIST:1,MIT:1,MMT:1,MSK:1,MST:1,MUT:1,MVT:1,MYT:1,NCT:1,NDT:1,NFT:1,NPT:1,NST:1,NT:1,NUT:1,NZDT:1,NZST:1,OMST:1,ORAT:1,PDT:1,PET:1,PETT:1,PGT:1,PHOT:1,PHT:1,PKT:1,PMDT:1,PMST:1,PONT:1,PST:1,PYST:1,PYT:1,RET:1,ROTT:1,SAKT:1,SAMT:1,SAST:1,SBT:1,SCT:1,SGT:1,SLST:1,SRT:1,SST:1,SYOT:1,TAHT:1,THA:1,TFT:1,TJT:1,TKT:1,TLT:1,TMT:1,TOT:1,TVT:1,UCT:1,ULAT:1,UTC:1,UYST:1,UYT:1,UZT:1,VET:1,VLAT:1,VOLT:1,VOST:1,VUT:1,WAKT:1,WAST:1,WAT:1,WEDT:1,WEST:1,
WET:1,WST:1,YAKT:1,YEKT:1,Z:1}[a]};h.validateTimezoneOffset=function(a){return-841<a&&721>a}})();
(function(){var h=Date,f=h.prototype,d=function(a,b){b||(b=2);return("000"+a).slice(-1*b)},c=function(a){var b={},e=this,g,c;c=function(b,g,c){if("day"===b){b=void 0!==a.month?a.month:e.getMonth();var d=void 0!==a.year?a.year:e.getFullYear();return h[g](c,d,b)}return h[g](c)};for(g in a)if(Object.prototype.hasOwnProperty.call(a,g)){var d="validate"+g.charAt(0).toUpperCase()+g.slice(1);h[d]&&null!==a[g]&&c(g,d,a[g])&&(b[g]=a[g])}return b};f.clearTime=function(){this.setHours(0);this.setMinutes(0);
this.setSeconds(0);this.setMilliseconds(0);return this};f.setTimeToNow=function(){var a=new Date;this.setHours(a.getHours());this.setMinutes(a.getMinutes());this.setSeconds(a.getSeconds());this.setMilliseconds(a.getMilliseconds());return this};f.clone=function(){return new Date(this.getTime())};f.compareTo=function(a){return Date.compare(this,a)};f.equals=function(a){return Date.equals(this,void 0!==a?a:new Date)};f.between=function(a,b){return this.getTime()>=a.getTime()&&this.getTime()<=b.getTime()};
f.isAfter=function(a){return 1===this.compareTo(a||new Date)};f.isBefore=function(a){return-1===this.compareTo(a||new Date)};f.isToday=f.isSameDay=function(a){return this.clone().clearTime().equals((a||new Date).clone().clearTime())};f.addMilliseconds=function(a){if(!a)return this;this.setTime(this.getTime()+1*a);return this};f.addSeconds=function(a){return a?this.addMilliseconds(1E3*a):this};f.addMinutes=function(a){return a?this.addMilliseconds(6E4*a):this};f.addHours=function(a){return a?this.addMilliseconds(36E5*
a):this};f.addDays=function(a){if(!a)return this;this.setDate(this.getDate()+1*a);return this};f.addWeekdays=function(a){if(!a)return this;var b=this.getDay(),e=Math.ceil(Math.abs(a)/7);(0===b||6===b)&&0<a&&(this.next().monday(),this.addDays(-1),b=this.getDay());if(0>a){for(;0>a;)this.addDays(-1),b=this.getDay(),0!==b&&6!==b&&a++;return this}if(5<a||6-b<=a)a+=2*e;return this.addDays(a)};f.addWeeks=function(a){return a?this.addDays(7*a):this};f.addMonths=function(a){if(!a)return this;var b=this.getDate();
this.setDate(1);this.setMonth(this.getMonth()+1*a);this.setDate(Math.min(b,h.getDaysInMonth(this.getFullYear(),this.getMonth())));return this};f.addQuarters=function(a){return a?this.addMonths(3*a):this};f.addYears=function(a){return a?this.addMonths(12*a):this};f.add=function(a){if("number"===typeof a)return this._orient=a,this;a.day&&0!==a.day-this.getDate()&&this.setDate(a.day);a.milliseconds&&this.addMilliseconds(a.milliseconds);a.seconds&&this.addSeconds(a.seconds);a.minutes&&this.addMinutes(a.minutes);
a.hours&&this.addHours(a.hours);a.weeks&&this.addWeeks(a.weeks);a.months&&this.addMonths(a.months);a.years&&this.addYears(a.years);a.days&&this.addDays(a.days);return this};f.getWeek=function(a){var b=new Date(this.valueOf());a?(b.addMinutes(b.getTimezoneOffset()),a=b.clone()):a=this;a=(a.getDay()+6)%7;b.setDate(b.getDate()-a+3);a=b.valueOf();b.setMonth(0,1);4!==b.getDay()&&b.setMonth(0,1+(4-b.getDay()+7)%7);return 1+Math.ceil((a-b)/6048E5)};f.getISOWeek=function(){return d(this.getWeek(!0))};f.setWeek=
function(a){return 0===a-this.getWeek()?1!==this.getDay()?this.moveToDayOfWeek(1,1<this.getDay()?-1:1):this:this.moveToDayOfWeek(1,1<this.getDay()?-1:1).addWeeks(a-this.getWeek())};f.setQuarter=function(a){a=Math.abs(3*(a-1)+1);return this.setMonth(a,1)};f.getQuarter=function(){return Date.getQuarter(this)};f.getDaysLeftInQuarter=function(){return Date.getDaysLeftInQuarter(this)};f.moveToNthOccurrence=function(a,b){if("Weekday"===a){if(0<b)this.moveToFirstDayOfMonth(),this.is().weekday()&&--b;else if(0>
b)this.moveToLastDayOfMonth(),this.is().weekday()&&(b+=1);else return this;return this.addWeekdays(b)}var e=0;if(0<b)e=b-1;else if(-1===b)return this.moveToLastDayOfMonth(),this.getDay()!==a&&this.moveToDayOfWeek(a,-1),this;return this.moveToFirstDayOfMonth().addDays(-1).moveToDayOfWeek(a,1).addWeeks(e)};var a=function(a,b,e){return function(g,c){var d=(g-this[a]()+e*(c||1))%e;return this[b](0===d?d+e*(c||1):d)}};f.moveToDayOfWeek=a("getDay","addDays",7);f.moveToMonth=a("getMonth","addMonths",12);
f.getOrdinate=function(){var a=this.getDate();return b(a)};f.getOrdinalNumber=function(){return Math.ceil((this.clone().clearTime()-new Date(this.getFullYear(),0,1))/864E5)+1};f.getTimezone=function(){return h.getTimezoneAbbreviation(this.getUTCOffset(),this.isDaylightSavingTime())};f.setTimezoneOffset=function(a){var b=this.getTimezoneOffset();return(a=-6*Number(a)/10)||0===a?this.addMinutes(a-b):this};f.setTimezone=function(a){return this.setTimezoneOffset(h.getTimezoneOffset(a))};f.hasDaylightSavingTime=
function(){return Date.today().set({month:0,day:1}).getTimezoneOffset()!==Date.today().set({month:6,day:1}).getTimezoneOffset()};f.isDaylightSavingTime=function(){return Date.today().set({month:0,day:1}).getTimezoneOffset()!==this.getTimezoneOffset()};f.getUTCOffset=function(a){a=-10*(a||this.getTimezoneOffset())/6;if(0>a)return a=(a-1E4).toString(),a.charAt(0)+a.substr(2);a=(a+1E4).toString();return"+"+a.substr(1)};f.getElapsed=function(a){return(a||new Date)-this};f.set=function(a){a=c.call(this,
a);for(var b in a)if(Object.prototype.hasOwnProperty.call(a,b)){var e=b.charAt(0).toUpperCase()+b.slice(1),g,d;"week"!==b&&"month"!==b&&"timezone"!==b&&"timezoneOffset"!==b&&(e+="s");g="add"+e;d="get"+e;"month"===b?g+="s":"year"===b&&(d="getFullYear");if("day"!==b&&"timezone"!==b&&"timezoneOffset"!==b&&"week"!==b&&"hour"!==b)this[g](a[b]-this[d]());else if("timezone"===b||"timezoneOffset"===b||"week"===b||"hour"===b)this["set"+e](a[b])}a.day&&this.addDays(a.day-this.getDate());return this};f.moveToFirstDayOfMonth=
function(){return this.set({day:1})};f.moveToLastDayOfMonth=function(){return this.set({day:h.getDaysInMonth(this.getFullYear(),this.getMonth())})};var b=function(a){switch(1*a){case 1:case 21:case 31:return"st";case 2:case 22:return"nd";case 3:case 23:return"rd";default:return"th"}},e=function(a){var b=Date.CultureInfo.formatPatterns;switch(a){case "d":return this.toString(b.shortDate);case "D":return this.toString(b.longDate);case "F":return this.toString(b.fullDateTime);case "m":return this.toString(b.monthDay);
case "r":case "R":return a=this.clone().addMinutes(this.getTimezoneOffset()),a.toString(b.rfc1123)+" GMT";case "s":return this.toString(b.sortableDateTime);case "t":return this.toString(b.shortTime);case "T":return this.toString(b.longTime);case "u":return a=this.clone().addMinutes(this.getTimezoneOffset()),a.toString(b.universalSortableDateTime);case "y":return this.toString(b.yearMonth);default:return!1}},g=function(a){return function(e){if("\\"===e.charAt(0))return e.replace("\\","");switch(e){case "hh":return d(13>
a.getHours()?0===a.getHours()?12:a.getHours():a.getHours()-12);case "h":return 13>a.getHours()?0===a.getHours()?12:a.getHours():a.getHours()-12;case "HH":return d(a.getHours());case "H":return a.getHours();case "mm":return d(a.getMinutes());case "m":return a.getMinutes();case "ss":return d(a.getSeconds());case "s":return a.getSeconds();case "yyyy":return d(a.getFullYear(),4);case "yy":return d(a.getFullYear());case "y":return a.getFullYear();case "E":case "dddd":return Date.CultureInfo.dayNames[a.getDay()];
case "ddd":return Date.CultureInfo.abbreviatedDayNames[a.getDay()];case "dd":return d(a.getDate());case "d":return a.getDate();case "MMMM":return Date.CultureInfo.monthNames[a.getMonth()];case "MMM":return Date.CultureInfo.abbreviatedMonthNames[a.getMonth()];case "MM":return d(a.getMonth()+1);case "M":return a.getMonth()+1;case "t":return 12>a.getHours()?Date.CultureInfo.amDesignator.substring(0,1):Date.CultureInfo.pmDesignator.substring(0,1);case "tt":return 12>a.getHours()?Date.CultureInfo.amDesignator:
Date.CultureInfo.pmDesignator;case "S":return b(a.getDate());case "W":return a.getWeek();case "WW":return a.getISOWeek();case "Q":return"Q"+a.getQuarter();case "q":return String(a.getQuarter());case "z":return a.getTimezone();case "Z":case "X":return Date.getTimezoneOffset(a.getTimezone());case "ZZ":return-60*a.getTimezoneOffset();case "u":return a.getDay();case "L":return h.isLeapYear(a.getFullYear())?1:0;case "B":return"@"+(a.getUTCSeconds()+60*a.getUTCMinutes()+3600*(a.getUTCHours()+1))/86.4;default:return e}}};
f.toString=function(a,b){if(!b&&a&&1===a.length&&(output=e.call(this,a)))return output;var c=g(this);return a?a.replace(/((\\)?(dd?d?d?|MM?M?M?|yy?y?y?|hh?|HH?|mm?|ss?|tt?|S|q|Q|WW?W?W?)(?![^\[]*\]))/g,c).replace(/\[|\]/g,""):this._toString()}})();
(function(){var h=Date,f=h.prototype,d=Number.prototype;f._orient=1;f._nth=null;f._is=!1;f._same=!1;f._isSecond=!1;d._dateElement="days";f.next=function(){this._move=!0;this._orient=1;return this};h.next=function(){return h.today().next()};f.last=f.prev=f.previous=function(){this._move=!0;this._orient=-1;return this};h.last=h.prev=h.previous=function(){return h.today().last()};f.is=function(){this._is=!0;return this};f.same=function(){this._same=!0;this._isSecond=!1;return this};f.today=function(){return this.same().day()};
f.weekday=function(){return this._nth?m("Weekday").call(this):this._move?this.addWeekdays(this._orient):this._is?(this._is=!1,!this.is().sat()&&!this.is().sun()):!1};f.weekend=function(){return this._is?(this._is=!1,this.is().sat()||this.is().sun()):!1};f.at=function(a){return"string"===typeof a?h.parse(this.toString("d")+" "+a):this.set(a)};d.fromNow=d.after=function(a){var b={};b[this._dateElement]=this;return(a?a.clone():new Date).add(b)};d.ago=d.before=function(a){var b={};b["s"!==this._dateElement[this._dateElement.length-
1]?this._dateElement+"s":this._dateElement]=-1*this;return(a?a.clone():new Date).add(b)};var c="sunday monday tuesday wednesday thursday friday saturday".split(/\s/),a="january february march april may june july august september october november december".split(/\s/),b="Millisecond Second Minute Hour Day Week Month Year Quarter Weekday".split(/\s/),e="Milliseconds Seconds Minutes Hours Date Week Month FullYear Quarter".split(/\s/),g="final first second third fourth fifth".split(/\s/);f.toObject=function(){for(var a=
{},g=0;g<b.length;g++)this["get"+e[g]]&&(a[b[g].toLowerCase()]=this["get"+e[g]]());return a};h.fromObject=function(a){a.week=null;return Date.today().set(a)};var m=function(a){return function(){if(this._is)return this._is=!1,this.getDay()===a;this._move&&(this._move=null);if(null!==this._nth){this._isSecond&&this.addSeconds(-1*this._orient);this._isSecond=!1;var b=this._nth;this._nth=null;var e=this.clone().moveToLastDayOfMonth();this.moveToNthOccurrence(a,b);if(this>e)throw new RangeError(h.getDayName(a)+
" does not occur "+b+" times in the month of "+h.getMonthName(e.getMonth())+" "+e.getFullYear()+".");return this}return this.moveToDayOfWeek(a,this._orient)}},k=function(a,b,e){for(var g=0;g<a.length;g++)h[a[g].toUpperCase()]=h[a[g].toUpperCase().substring(0,3)]=g,h[a[g]]=h[a[g].substring(0,3)]=b(g),f[a[g]]=f[a[g].substring(0,3)]=e(g)};k(c,function(a){return function(){var b=h.today(),e=a-b.getDay();0===a&&1===Date.CultureInfo.firstDayOfWeek&&0!==b.getDay()&&(e+=7);return b.addDays(e)}},m);k(a,function(a){return function(){return h.today().set({month:a,
day:1})}},function(a){return function(){return this._is?(this._is=!1,this.getMonth()===a):this.moveToMonth(a,this._orient)}});for(var a=function(a){return function(e){if(this._isSecond)return this._isSecond=!1,this;if(this._same){this._same=this._is=!1;var g=this.toObject();e=(e||new Date).toObject();for(var c="",d=a.toLowerCase(),d="s"===d[d.length-1]?d.substring(0,d.length-1):d,f=b.length-1;-1<f;f--){c=b[f].toLowerCase();if(g[c]!==e[c])return!1;if(d===c)break}return!0}"s"!==a.substring(a.length-
1)&&(a+="s");this._move&&(this._move=null);return this["add"+a](this._orient)}},k=function(a){return function(){this._dateElement=a;return this}},n=0;n<b.length;n++)c=b[n].toLowerCase(),"weekday"!==c&&(f[c]=f[c+"s"]=a(b[n]),d[c]=d[c+"s"]=k(c+"s"));f._ss=a("Second");d=function(a){return function(b){if(this._same)return this._ss(b);if(b||0===b)return this.moveToNthOccurrence(b,a);this._nth=a;return 2!==a||void 0!==b&&null!==b?this:(this._isSecond=!0,this.addSeconds(this._orient))}};for(c=0;c<g.length;c++)f[g[c]]=
0===c?d(-1):d(c)})();
(function(){Date.Parsing={Exception:function(a){this.message="Parse error at '"+a.substring(0,10)+" ...'"}};var h=Date.Parsing,f=[0,31,59,90,120,151,181,212,243,273,304,334],d=[0,31,60,91,121,152,182,213,244,274,305,335];h.isLeapYear=function(a){return 0===a%4&&0!==a%100||0===a%400};var c={multiReplace:function(a,b){for(var e in b)if(Object.prototype.hasOwnProperty.call(b,e)){var g;"function"!==typeof b[e]&&(g=b[e]instanceof RegExp?b[e]:new RegExp(b[e],"g"));a=a.replace(g,e)}return a},getDayOfYearFromWeek:function(a){var b;
a.weekDay=a.weekDay||0===a.weekDay?a.weekDay:1;b=new Date(a.year,0,4);b=(0===b.getDay()?7:b.getDay())+3;a.dayOfYear=7*a.week+(0===a.weekDay?7:a.weekDay)-b;return a},getDayOfYear:function(a,b){a.dayOfYear||(a=c.getDayOfYearFromWeek(a));for(var e=0;e<=b.length;e++)if(a.dayOfYear<b[e]||e===b.length){a.day=a.day?a.day:a.dayOfYear-b[e-1];break}else a.month=e;return a},adjustForTimeZone:function(a,b){var e;"Z"===a.zone.toUpperCase()||0===a.zone_hours&&0===a.zone_minutes?e=-b.getTimezoneOffset():(e=60*a.zone_hours+
(a.zone_minutes||0),"+"===a.zone_sign&&(e*=-1),e-=b.getTimezoneOffset());b.setMinutes(b.getMinutes()+e);return b},setDefaults:function(a){a.year=a.year||Date.today().getFullYear();a.hours=a.hours||0;a.minutes=a.minutes||0;a.seconds=a.seconds||0;a.milliseconds=a.milliseconds||0;if(a.month||!a.week&&!a.dayOfYear)a.month=a.month||0,a.day=a.day||1;return a},dataNum:function(a,b,e,g){var c=1*a;return b?g?a?1*b(a):a:a?b(c):a:e?a&&"undefined"!==typeof a?c:a:a?c:a},timeDataProcess:function(a){var b={},e;
for(e in a.data)a.data.hasOwnProperty(e)&&(b[e]=a.ignore[e]?a.data[e]:c.dataNum(a.data[e],a.mods[e],a.explict[e],a.postProcess[e]));a.data.secmins&&(a.data.secmins=60*a.data.secmins.replace(",","."),b.minutes?b.seconds||(b.seconds=a.data.secmins):b.minutes=a.data.secmins,delete a.secmins);return b},buildTimeObjectFromData:function(a){return c.timeDataProcess({data:{year:a[1],month:a[5],day:a[7],week:a[8],dayOfYear:a[10],hours:a[15],zone_hours:a[23],zone_minutes:a[24],zone:a[21],zone_sign:a[22],weekDay:a[9],
minutes:a[16],seconds:a[19],milliseconds:a[20],secmins:a[18]},mods:{month:function(a){return a-1},weekDay:function(a){a=Math.abs(a);return 7===a?0:a},minutes:function(a){return a.replace(":","")},seconds:function(a){return Math.floor(1*a.replace(":","").replace(",","."))},milliseconds:function(a){return 1E3*a.replace(",",".")}},postProcess:{minutes:!0,seconds:!0,milliseconds:!0},explict:{zone_hours:!0,zone_minutes:!0},ignore:{zone:!0,zone_sign:!0,secmins:!0}})},addToHash:function(a,b,e){for(var g=
b.length,c=0;c<g;c++)a[b[c]]=e[c];return a},combineRegex:function(a,b){return new RegExp("(("+a.source+")\\s("+b.source+"))")},getDateNthString:function(a,b,e){if(a)return Date.today().addDays(e).toString("d");if(b)return Date.today().last()[e]().toString("d")},buildRegexData:function(a){for(var b=[],e=a.length,g=0;g<e;g++)"[object Array]"===Object.prototype.toString.call(a[g])?b.push(this.combineRegex(a[g][0],a[g][1])):b.push(a[g]);return b}};h.processTimeObject=function(a){var b;c.setDefaults(a);
b=h.isLeapYear(a.year)?d:f;a.month||!a.week&&!a.dayOfYear?a.dayOfYear=b[a.month]+a.day:c.getDayOfYear(a,b);b=new Date(a.year,a.month,a.day,a.hours,a.minutes,a.seconds,a.milliseconds);a.zone&&c.adjustForTimeZone(a,b);return b};h.ISO={regex:/^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-3])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-4])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?\s?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/,
parse:function(a){a=a.match(this.regex);if(!a||!a.length)return null;a=c.buildTimeObjectFromData(a);return a.year&&(a.year||a.month||a.day||a.week||a.dayOfYear)?h.processTimeObject(a):null}};h.Numeric={isNumeric:function(a){return!isNaN(parseFloat(a))&&isFinite(a)},regex:/\b([0-1]?[0-9])([0-3]?[0-9])([0-2]?[0-9]?[0-9][0-9])\b/i,parse:function(a){var b,e={},g=Date.CultureInfo.dateElementOrder.split("");if(!this.isNumeric(a)||"+"===a[0]&&"-"===a[0])return null;if(5>a.length&&0>a.indexOf(".")&&0>a.indexOf("/"))return e.year=
a,h.processTimeObject(e);a=a.match(this.regex);if(!a||!a.length)return null;for(b=0;b<g.length;b++)switch(g[b]){case "d":e.day=a[b+1];break;case "m":e.month=a[b+1]-1;break;case "y":e.year=a[b+1]}return h.processTimeObject(e)}};h.Normalizer={regexData:function(){var a=Date.CultureInfo.regexPatterns;return c.buildRegexData([a.tomorrow,a.yesterday,[a.past,a.mon],[a.past,a.tue],[a.past,a.wed],[a.past,a.thu],[a.past,a.fri],[a.past,a.sat],[a.past,a.sun]])},basicReplaceHash:function(){var a=Date.CultureInfo.regexPatterns;
return{January:a.jan.source,February:a.feb,March:a.mar,April:a.apr,May:a.may,June:a.jun,July:a.jul,August:a.aug,September:a.sep,October:a.oct,November:a.nov,December:a.dec,"":/\bat\b/gi," ":/\s{2,}/,am:a.inTheMorning,"9am":a.thisMorning,pm:a.inTheEvening,"7pm":a.thisEvening}},keys:function(){return[c.getDateNthString(!0,!1,1),c.getDateNthString(!0,!1,-1),c.getDateNthString(!1,!0,"monday"),c.getDateNthString(!1,!0,"tuesday"),c.getDateNthString(!1,!0,"wednesday"),c.getDateNthString(!1,!0,"thursday"),
c.getDateNthString(!1,!0,"friday"),c.getDateNthString(!1,!0,"saturday"),c.getDateNthString(!1,!0,"sunday")]},buildRegexFunctions:function(){var a=Date.CultureInfo.regexPatterns,b=Date.i18n.__,b=new RegExp("(\\b\\d\\d?("+b("AM")+"|"+b("PM")+")? )("+a.tomorrow.source.slice(1)+")","i");this.replaceFuncs=[[new RegExp(a.today.source+"(?!\\s*([+-]))\\b"),function(a){return 1<a.length?Date.today().toString("d"):a}],[b,function(a,b){return Date.today().addDays(1).toString("d")+" "+b}],[a.amThisMorning,function(a,
b){return b}],[a.pmThisEvening,function(a,b){return b}]]},buildReplaceData:function(){this.buildRegexFunctions();this.replaceHash=c.addToHash(this.basicReplaceHash(),this.keys(),this.regexData())},stringReplaceFuncs:function(a){for(var b=0;b<this.replaceFuncs.length;b++)a=a.replace(this.replaceFuncs[b][0],this.replaceFuncs[b][1]);return a},parse:function(a){a=this.stringReplaceFuncs(a);a=c.multiReplace(a,this.replaceHash);try{var b=a.split(/([\s\-\.\,\/\x27]+)/);3===b.length&&h.Numeric.isNumeric(b[0])&&
h.Numeric.isNumeric(b[2])&&4<=b[2].length&&"d"===Date.CultureInfo.dateElementOrder[0]&&(a="1/"+b[0]+"/"+b[2])}catch(e){}return a}};h.Normalizer.buildReplaceData()})();
(function(){for(var h=Date.Parsing,f=h.Operators={rtoken:function(a){return function(e){var g=e.match(a);if(g)return[g[0],e.substring(g[0].length)];throw new h.Exception(e);}},token:function(){return function(a){return f.rtoken(new RegExp("^\\s*"+a+"\\s*"))(a)}},stoken:function(a){return f.rtoken(new RegExp("^"+a))},until:function(a){return function(e){for(var g=[],c=null;e.length;){try{c=a.call(this,e)}catch(d){g.push(c[0]);e=c[1];continue}break}return[g,e]}},many:function(a){return function(e){for(var g=
[],c=null;e.length;){try{c=a.call(this,e)}catch(d){break}g.push(c[0]);e=c[1]}return[g,e]}},optional:function(a){return function(e){var g=null;try{g=a.call(this,e)}catch(c){return[null,e]}return[g[0],g[1]]}},not:function(a){return function(e){try{a.call(this,e)}catch(g){return[null,e]}throw new h.Exception(e);}},ignore:function(a){return a?function(e){var g=null,g=a.call(this,e);return[null,g[1]]}:null},product:function(){for(var a=arguments[0],e=Array.prototype.slice.call(arguments,1),g=[],c=0;c<
a.length;c++)g.push(f.each(a[c],e));return g},cache:function(a){var e={},g=0,c=[],d=Date.Config.CACHE_MAX||1E5,f=null;return function(l){if(g===d)for(var p=0;10>p;p++){var q=c.shift();q&&(delete e[q],g--)}try{f=e[l]=e[l]||a.call(this,l)}catch(s){f=e[l]=s}g++;c.push(l);if(f instanceof h.Exception)throw f;return f}},any:function(){var a=arguments;return function(e){for(var g=null,c=0;c<a.length;c++)if(null!=a[c]){try{g=a[c].call(this,e)}catch(d){g=null}if(g)return g}throw new h.Exception(e);}},each:function(){var a=
arguments;return function(e){for(var c=[],d=null,f=0;f<a.length;f++)if(null!=a[f]){try{d=a[f].call(this,e)}catch(n){throw new h.Exception(e);}c.push(d[0]);e=d[1]}return[c,e]}},all:function(){var a=a;return a.each(a.optional(arguments))},sequence:function(a,e,c){e=e||f.rtoken(/^\s*/);c=c||null;return 1===a.length?a[0]:function(d){for(var f=null,n=null,l=[],p=0;p<a.length;p++){try{f=a[p].call(this,d)}catch(q){break}l.push(f[0]);try{n=e.call(this,f[1])}catch(s){n=null;break}d=n[1]}if(!f)throw new h.Exception(d);
if(n)throw new h.Exception(n[1]);if(c)try{f=c.call(this,f[1])}catch(u){throw new h.Exception(f[1]);}return[l,f?f[1]:d]}},between:function(a,e,c){c=c||a;var d=f.each(f.ignore(a),e,f.ignore(c));return function(a){a=d.call(this,a);return[[a[0][0],r[0][2]],a[1]]}},list:function(a,e,c){e=e||f.rtoken(/^\s*/);c=c||null;return a instanceof Array?f.each(f.product(a.slice(0,-1),f.ignore(e)),a.slice(-1),f.ignore(c)):f.each(f.many(f.each(a,f.ignore(e))),px,f.ignore(c))},set:function(a,e,c){e=e||f.rtoken(/^\s*/);
c=c||null;return function(d){for(var k=null,n=k=null,l=null,p=[[],d],q=!1,s=0;s<a.length;s++){k=n=null;q=1===a.length;try{k=a[s].call(this,d)}catch(u){continue}l=[[k[0]],k[1]];if(0<k[1].length&&!q)try{n=e.call(this,k[1])}catch(v){q=!0}else q=!0;q||0!==n[1].length||(q=!0);if(!q){k=[];for(q=0;q<a.length;q++)s!==q&&k.push(a[q]);k=f.set(k,e).call(this,n[1]);0<k[0].length&&(l[0]=l[0].concat(k[0]),l[1]=k[1])}l[1].length<p[1].length&&(p=l);if(0===p[1].length)break}if(0===p[0].length)return p;if(c){try{n=
c.call(this,p[1])}catch(w){throw new h.Exception(p[1]);}p[1]=n[1]}return p}},forward:function(a,e){return function(c){return a[e].call(this,c)}},replace:function(a,e){return function(c){c=a.call(this,c);return[e,c[1]]}},process:function(a,e){return function(c){c=a.call(this,c);return[e.call(this,c[0]),c[1]]}},min:function(a,e){return function(c){var d=e.call(this,c);if(d[0].length<a)throw new h.Exception(c);return d}}},d=function(a){return function(){var e=null,c=[],d;1<arguments.length?e=Array.prototype.slice.call(arguments):
arguments[0]instanceof Array&&(e=arguments[0]);if(e){if(d=e.shift(),0<d.length)return e.unshift(d[void 0]),c.push(a.apply(null,e)),e.shift(),c}else return a.apply(null,arguments)}},c="optional not ignore cache".split(/\s/),a=0;a<c.length;a++)f[c[a]]=d(f[c[a]]);d=function(a){return function(){return arguments[0]instanceof Array?a.apply(null,arguments[0]):a.apply(null,arguments)}};c="each any all".split(/\s/);for(a=0;a<c.length;a++)f[c[a]]=d(f[c[a]])})();
(function(){var h=Date,f=function(c){for(var a=[],b=0;b<c.length;b++)c[b]instanceof Array?a=a.concat(f(c[b])):c[b]&&a.push(c[b]);return a},d=function(){if(this.meridian&&(this.hour||0===this.hour)){if("a"===this.meridian&&11<this.hour&&Date.Config.strict24hr)throw"Invalid hour and meridian combination";if("p"===this.meridian&&12>this.hour&&Date.Config.strict24hr)throw"Invalid hour and meridian combination";"p"===this.meridian&&12>this.hour?this.hour+=12:"a"===this.meridian&&12===this.hour&&(this.hour=
0)}};h.Translator={hour:function(c){return function(){this.hour=Number(c)}},minute:function(c){return function(){this.minute=Number(c)}},second:function(c){return function(){this.second=Number(c)}},secondAndMillisecond:function(c){return function(){var a=c.match(/^([0-5][0-9])\.([0-9]{1,3})/);this.second=Number(a[1]);this.millisecond=Number(a[2])}},meridian:function(c){return function(){this.meridian=c.slice(0,1).toLowerCase()}},timezone:function(c){return function(){var a=c.replace(/[^\d\+\-]/g,
"");a.length?this.timezoneOffset=Number(a):this.timezone=c.toLowerCase()}},day:function(c){var a=c[0];return function(){this.day=Number(a.match(/\d+/)[0]);if(1>this.day)throw"invalid day";}},month:function(c){return function(){this.month=3===c.length?"jan feb mar apr may jun jul aug sep oct nov dec".indexOf(c)/4:Number(c)-1;if(0>this.month)throw"invalid month";}},year:function(c){return function(){var a=Number(c);this.year=2<c.length?a:a+(a+2E3<Date.CultureInfo.twoDigitYearMax?2E3:1900)}},rday:function(c){return function(){switch(c){case "yesterday":this.days=
-1;break;case "tomorrow":this.days=1;break;case "today":this.days=0;break;case "now":this.days=0,this.now=!0}}},finishExact:function(c){c=c instanceof Array?c:[c];for(var a=0;a<c.length;a++)c[a]&&c[a].call(this);c=new Date;!this.hour&&!this.minute||this.month||this.year||this.day||(this.day=c.getDate());this.year||(this.year=c.getFullYear());this.month||0===this.month||(this.month=c.getMonth());this.day||(this.day=1);this.hour||(this.hour=0);this.minute||(this.minute=0);this.second||(this.second=
0);this.millisecond||(this.millisecond=0);d.call(this);if(this.day>h.getDaysInMonth(this.year,this.month))throw new RangeError(this.day+" is not a valid value for days.");c=new Date(this.year,this.month,this.day,this.hour,this.minute,this.second,this.millisecond);100>this.year&&c.setFullYear(this.year);this.timezone?c.set({timezone:this.timezone}):this.timezoneOffset&&c.set({timezoneOffset:this.timezoneOffset});return c},finish:function(c){var a,b,e;c=c instanceof Array?f(c):[c];if(0===c.length)return null;
for(a=0;a<c.length;a++)"function"===typeof c[a]&&c[a].call(this);if(!this.now||this.unit||this.operator)c=this.now||-1!=="hour minute second".indexOf(this.unit)?new Date:h.today();else return new Date;a=!!(this.days&&null!==this.days||this.orient||this.operator);b="past"===this.orient||"subtract"===this.operator?-1:1;this.month&&"week"===this.unit&&(this.value=this.month+1,delete this.month,delete this.day);!this.month&&0!==this.month||-1==="year day hour minute second".indexOf(this.unit)||(this.value||
(this.value=this.month+1),this.month=null,a=!0);a||!this.weekday||this.day||this.days||(e=Date[this.weekday](),this.day=e.getDate(),this.month||(this.month=e.getMonth()),this.year=e.getFullYear());if(a&&this.weekday&&"month"!==this.unit&&"week"!==this.unit){var g=c;e=b||1;this.unit="day";this.days=(g=h.getDayNumberFromName(this.weekday)-g.getDay())?(g+7*e)%7:7*e}!this.weekday||"week"===this.unit||this.day||this.days||(e=Date[this.weekday](),this.day=e.getDate(),e.getMonth()!==c.getMonth()&&(this.month=
e.getMonth()));this.month&&"day"===this.unit&&this.operator&&(this.value||(this.value=this.month+1),this.month=null);null!=this.value&&null!=this.month&&null!=this.year&&(this.day=1*this.value);this.month&&!this.day&&this.value&&(c.set({day:1*this.value}),a||(this.day=1*this.value));this.month||!this.value||"month"!==this.unit||this.now||(this.month=this.value,a=!0);a&&(this.month||0===this.month)&&"year"!==this.unit&&(e=b||1,this.unit="month",this.months=(g=this.month-c.getMonth())?(g+12*e)%12:12*
e,this.month=null);this.unit||(this.unit="day");if(!this.value&&this.operator&&null!==this.operator&&this[this.unit+"s"]&&null!==this[this.unit+"s"])this[this.unit+"s"]=this[this.unit+"s"]+("add"===this.operator?1:-1)+(this.value||0)*b;else if(null==this[this.unit+"s"]||null!=this.operator)this.value||(this.value=1),this[this.unit+"s"]=this.value*b;d.call(this);!this.month&&0!==this.month||this.day||(this.day=1);if(!this.orient&&!this.operator&&"week"===this.unit&&this.value&&!this.day&&!this.month)return Date.today().setWeek(this.value);
if("week"===this.unit&&this.weeks&&!this.day&&!this.month)return c=Date[void 0!==this.weekday?this.weekday:"today"]().addWeeks(this.weeks),this.now&&c.setTimeToNow(),c;a&&this.timezone&&this.day&&this.days&&(this.day=this.days);a?c.add(this):c.set(this);this.timezone&&(this.timezone=this.timezone.toUpperCase(),a=h.getTimezoneOffset(this.timezone),c.hasDaylightSavingTime()&&(b=h.getTimezoneAbbreviation(a,c.isDaylightSavingTime()),b!==this.timezone&&(c.isDaylightSavingTime()?c.addHours(-1):c.addHours(1))),
c.setTimezoneOffset(a));return c}}})();
(function(){var h=Date;h.Grammar={};var f=h.Parsing.Operators,d=h.Grammar,c=h.Translator,a;a=function(){return f.each(f.any.apply(null,arguments),f.not(d.ctoken2("timeContext")))};d.datePartDelimiter=f.rtoken(/^([\s\-\.\,\/\x27]+)/);d.timePartDelimiter=f.stoken(":");d.whiteSpace=f.rtoken(/^\s*/);d.generalDelimiter=f.rtoken(/^(([\s\,]|at|@|on)+)/);var b={};d.ctoken=function(a){var c=b[a];if(!c){for(var c=Date.CultureInfo.regexPatterns,e=a.split(/\s+/),d=[],g=0;g<e.length;g++)d.push(f.replace(f.rtoken(c[e[g]]),
e[g]));c=b[a]=f.any.apply(null,d)}return c};d.ctoken2=function(a){return f.rtoken(Date.CultureInfo.regexPatterns[a])};var e=function(a,b,c,e){d[a]=e?f.cache(f.process(f.each(f.rtoken(b),f.optional(d.ctoken2(e))),c)):f.cache(f.process(f.rtoken(b),c))},g=function(a,b){return f.cache(f.process(d.ctoken2(a),b))},m={},k=function(a){m[a]=m[a]||d.format(a)[0];return m[a]};d.allformats=function(a){var b=[];if(a instanceof Array)for(var c=0;c<a.length;c++)b.push(k(a[c]));else b.push(k(a));return b};d.formats=
function(a){if(a instanceof Array){for(var b=[],c=0;c<a.length;c++)b.push(k(a[c]));return f.any.apply(null,b)}return k(a)};var n={timeFormats:function(){var a,b="h hh H HH m mm s ss ss.s z zz".split(" "),h=[/^(0[0-9]|1[0-2]|[1-9])/,/^(0[0-9]|1[0-2])/,/^([0-1][0-9]|2[0-3]|[0-9])/,/^([0-1][0-9]|2[0-3])/,/^([0-5][0-9]|[0-9])/,/^[0-5][0-9]/,/^([0-5][0-9]|[0-9])/,/^[0-5][0-9]/,/^[0-5][0-9]\.[0-9]{1,3}/,/^((\+|\-)\s*\d\d\d\d)|((\+|\-)\d\d\:?\d\d)/,/^((\+|\-)\s*\d\d\d\d)|((\+|\-)\d\d\:?\d\d)/],m=[c.hour,
c.hour,c.hour,c.hour,c.minute,c.minute,c.second,c.second,c.secondAndMillisecond,c.timezone,c.timezone];for(a=0;a<b.length;a++)e(b[a],h[a],m[a]);d.hms=f.cache(f.sequence([d.H,d.m,d.s],d.timePartDelimiter));d.t=g("shortMeridian",c.meridian);d.tt=g("longMeridian",c.meridian);d.zzz=g("timezone",c.timezone);d.timeSuffix=f.each(f.ignore(d.whiteSpace),f.set([d.tt,d.zzz]));d.time=f.each(f.optional(f.ignore(f.stoken("T"))),d.hms,d.timeSuffix)},dateFormats:function(){var b=function(){return f.set(arguments,
d.datePartDelimiter)},g,h="d dd M MM y yy yyy yyyy".split(" "),m=[/^([0-2]\d|3[0-1]|\d)/,/^([0-2]\d|3[0-1])/,/^(1[0-2]|0\d|\d)/,/^(1[0-2]|0\d)/,/^(\d+)/,/^(\d\d)/,/^(\d\d?\d?\d?)/,/^(\d\d\d\d)/],n=[c.day,c.day,c.month,c.month,c.year,c.year,c.year,c.year],k=["ordinalSuffix","ordinalSuffix"];for(g=0;g<h.length;g++)e(h[g],m[g],n[g],k[g]);d.MMM=d.MMMM=f.cache(f.process(d.ctoken("jan feb mar apr may jun jul aug sep oct nov dec"),c.month));d.ddd=d.dddd=f.cache(f.process(d.ctoken("sun mon tue wed thu fri sat"),
function(a){return function(){this.weekday=a}}));d.day=a(d.d,d.dd);d.month=a(d.M,d.MMM);d.year=a(d.yyyy,d.yy);d.mdy=b(d.ddd,d.month,d.day,d.year);d.ymd=b(d.ddd,d.year,d.month,d.day);d.dmy=b(d.ddd,d.day,d.month,d.year);d.date=function(a){return(d[Date.CultureInfo.dateElementOrder]||d.mdy).call(this,a)}},relative:function(){d.orientation=f.process(d.ctoken("past future"),function(a){return function(){this.orient=a}});d.operator=f.process(d.ctoken("add subtract"),function(a){return function(){this.operator=
a}});d.rday=f.process(d.ctoken("yesterday tomorrow today now"),c.rday);d.unit=f.process(d.ctoken("second minute hour day week month year"),function(a){return function(){this.unit=a}})}};d.buildGrammarFormats=function(){b={};n.timeFormats();n.dateFormats();n.relative();d.value=f.process(f.rtoken(/^([-+]?\d+)?(st|nd|rd|th)?/),function(a){return function(){this.value=a.replace(/\D/g,"")}});d.expression=f.set([d.rday,d.operator,d.value,d.unit,d.orientation,d.ddd,d.MMM]);d.format=f.process(f.many(f.any(f.process(f.rtoken(/^(dd?d?d?(?!e)|MM?M?M?|yy?y?y?|hh?|HH?|mm?|ss?|tt?|zz?z?)/),
function(a){if(d[a])return d[a];throw h.Parsing.Exception(a);}),f.process(f.rtoken(/^[^dMyhHmstz]+/),function(a){return f.ignore(f.stoken(a))}))),function(a){return f.process(f.each.apply(null,a),c.finishExact)});d._start=f.process(f.set([d.date,d.time,d.expression],d.generalDelimiter,d.whiteSpace),c.finish)};d.buildGrammarFormats();d._formats=d.formats('"yyyy-MM-ddTHH:mm:ssZ";yyyy-MM-ddTHH:mm:ss.sz;yyyy-MM-ddTHH:mm:ssZ;yyyy-MM-ddTHH:mm:ssz;yyyy-MM-ddTHH:mm:ss;yyyy-MM-ddTHH:mmZ;yyyy-MM-ddTHH:mmz;yyyy-MM-ddTHH:mm;ddd, MMM dd, yyyy H:mm:ss tt;ddd MMM d yyyy HH:mm:ss zzz;MMddyyyy;ddMMyyyy;Mddyyyy;ddMyyyy;Mdyyyy;dMyyyy;yyyy;Mdyy;dMyy;d'.split(";"));
d.start=function(a){try{var b=d._formats.call({},a);if(0===b[1].length)return b}catch(c){}return d._start.call({},a)}})();
(function(){var h=Date,f={removeOrds:function(d){return d=(ords=d.match(/\b(\d+)(?:st|nd|rd|th)\b/))&&2===ords.length?d.replace(ords[0],ords[1]):d},grammarParser:function(d){var c=null;try{c=h.Grammar.start.call({},d.replace(/^\s*(\S*(\s+\S+)*)\s*$/,"$1"))}catch(a){return null}return 0===c[1].length?c[0]:null},nativeFallback:function(d){var c;try{return(c=Date._parse(d))||0===c?new Date(c):null}catch(a){return null}}};h._parse||(h._parse=h.parse);h.parse=function(d){var c;if(!d)return null;if(d instanceof
Date)return d.clone();4<=d.length&&"0"!==d.charAt(0)&&"+"!==d.charAt(0)&&"-"!==d.charAt(0)&&(c=h.Parsing.ISO.parse(d)||h.Parsing.Numeric.parse(d));if(c instanceof Date&&!isNaN(c.getTime()))return c;d=h.Parsing.Normalizer.parse(f.removeOrds(d));c=f.grammarParser(d);return null!==c?c:f.nativeFallback(d)};Date.getParseFunction=function(d){var c=Date.Grammar.allformats(d);return function(a){for(var b=null,e=0;e<c.length;e++){try{b=c[e].call({},a)}catch(d){continue}if(0===b[1].length)return b[0]}return null}};
h.parseExact=function(d,c){return h.getParseFunction(c)(d)}})();
(function(){var h=Date,f=h.prototype,d=function(a,b){b||(b=2);return("000"+a).slice(-1*b)},c={d:"dd","%d":"dd",D:"ddd","%a":"ddd",j:"dddd",l:"dddd","%A":"dddd",S:"S",F:"MMMM","%B":"MMMM",m:"MM","%m":"MM",M:"MMM","%b":"MMM","%h":"MMM",n:"M",Y:"yyyy","%Y":"yyyy",y:"yy","%y":"yy",g:"h","%I":"h",G:"H",h:"hh",H:"HH","%H":"HH",i:"mm","%M":"mm",s:"ss","%S":"ss","%r":"hh:mm tt","%R":"H:mm","%T":"H:mm:ss","%X":"t","%x":"d","%e":"d","%D":"MM/dd/yy","%n":"\\n","%t":"\\t",e:"z",T:"z","%z":"z","%Z":"z",Z:"ZZ",
N:"u",w:"u","%w":"u",W:"W","%V":"W"},a={substitutes:function(a){return c[a]},interpreted:function(a,b){var c;switch(a){case "%u":return b.getDay()+1;case "z":return b.getOrdinalNumber();case "%j":return d(b.getOrdinalNumber(),3);case "%U":c=b.clone().set({month:0,day:1}).addDays(-1).moveToDayOfWeek(0);var f=b.clone().addDays(1).moveToDayOfWeek(0,-1);return f<c?"00":d((f.getOrdinalNumber()-c.getOrdinalNumber())/7+1);case "%W":return d(b.getWeek());case "t":return h.getDaysInMonth(b.getFullYear(),b.getMonth());
case "o":case "%G":return b.setWeek(b.getISOWeek()).toString("yyyy");case "%g":return b._format("%G").slice(-2);case "a":case "%p":return t("tt").toLowerCase();case "A":return t("tt").toUpperCase();case "u":return d(b.getMilliseconds(),3);case "I":return b.isDaylightSavingTime()?1:0;case "O":return b.getUTCOffset();case "P":return c=b.getUTCOffset(),c.substring(0,c.length-2)+":"+c.substring(c.length-2);case "B":return c=new Date,Math.floor((3600*c.getHours()+60*c.getMinutes()+c.getSeconds()+60*(c.getTimezoneOffset()+
60))/86.4);case "c":return b.toISOString().replace(/\"/g,"");case "U":return h.strtotime("now");case "%c":return t("d")+" "+t("t");case "%C":return Math.floor(b.getFullYear()/100+1)}},shouldOverrideDefaults:function(a){switch(a){case "%e":return!0;default:return!1}},parse:function(b,c){var d,f=c||new Date;return(d=a.substitutes(b))?d:(d=a.interpreted(b,f))?d:b}};h.normalizeFormat=function(b,c){return b.replace(/(%|\\)?.|%%/g,function(b){return a.parse(b,c)})};h.strftime=function(a,b){return Date.parse(b)._format(a)};
h.strtotime=function(a){a=h.parse(a);return Math.round(h.UTC(a.getUTCFullYear(),a.getUTCMonth(),a.getUTCDate(),a.getUTCHours(),a.getUTCMinutes(),a.getUTCSeconds(),a.getUTCMilliseconds())/1E3)};var b=function(b){return function(c){var d=!1;if("\\"===c.charAt(0)||"%%"===c.substring(0,2))return c.replace("\\","").replace("%%","%");d=a.shouldOverrideDefaults(c);if(c=h.normalizeFormat(c,b))return b.toString(c,d)}};f._format=function(a){var c=b(this);return a?a.replace(/(%|\\)?.|%%/g,c):this._toString()};
f.format||(f.format=f._format)})();
(function(){var h=function(c){return function(){return this[c]}},f=function(c){return function(a){this[c]=a;return this}},d=function(c,a,b,e,f){if(1===arguments.length&&"number"===typeof c){var h=0>c?-1:1,k=Math.abs(c);this.setDays(Math.floor(k/864E5)*h);k%=864E5;this.setHours(Math.floor(k/36E5)*h);k%=36E5;this.setMinutes(Math.floor(k/6E4)*h);k%=6E4;this.setSeconds(Math.floor(k/1E3)*h);this.setMilliseconds(k%1E3*h)}else this.set(c,a,b,e,f);this.getTotalMilliseconds=function(){return 864E5*this.getDays()+
36E5*this.getHours()+6E4*this.getMinutes()+1E3*this.getSeconds()};this.compareTo=function(a){var b=new Date(1970,1,1,this.getHours(),this.getMinutes(),this.getSeconds());a=null===a?new Date(1970,1,1,0,0,0):new Date(1970,1,1,a.getHours(),a.getMinutes(),a.getSeconds());return b<a?-1:b>a?1:0};this.equals=function(a){return 0===this.compareTo(a)};this.add=function(a){return null===a?this:this.addSeconds(a.getTotalMilliseconds()/1E3)};this.subtract=function(a){return null===a?this:this.addSeconds(-a.getTotalMilliseconds()/
1E3)};this.addDays=function(a){return new d(this.getTotalMilliseconds()+864E5*a)};this.addHours=function(a){return new d(this.getTotalMilliseconds()+36E5*a)};this.addMinutes=function(a){return new d(this.getTotalMilliseconds()+6E4*a)};this.addSeconds=function(a){return new d(this.getTotalMilliseconds()+1E3*a)};this.addMilliseconds=function(a){return new d(this.getTotalMilliseconds()+a)};this.get12HourHour=function(){return 12<this.getHours()?this.getHours()-12:0===this.getHours()?12:this.getHours()};
this.getDesignator=function(){return 12>this.getHours()?Date.CultureInfo.amDesignator:Date.CultureInfo.pmDesignator};this.toString=function(a){this._toString=function(){return null!==this.getDays()&&0<this.getDays()?this.getDays()+"."+this.getHours()+":"+this.p(this.getMinutes())+":"+this.p(this.getSeconds()):this.getHours()+":"+this.p(this.getMinutes())+":"+this.p(this.getSeconds())};this.p=function(a){return 2>a.toString().length?"0"+a:a};var b=this;return a?a.replace(/dd?|HH?|hh?|mm?|ss?|tt?/g,
function(a){switch(a){case "d":return b.getDays();case "dd":return b.p(b.getDays());case "H":return b.getHours();case "HH":return b.p(b.getHours());case "h":return b.get12HourHour();case "hh":return b.p(b.get12HourHour());case "m":return b.getMinutes();case "mm":return b.p(b.getMinutes());case "s":return b.getSeconds();case "ss":return b.p(b.getSeconds());case "t":return(12>b.getHours()?Date.CultureInfo.amDesignator:Date.CultureInfo.pmDesignator).substring(0,1);case "tt":return 12>b.getHours()?Date.CultureInfo.amDesignator:
Date.CultureInfo.pmDesignator}}):this._toString()};return this};(function(c,a){for(var b=0;b<a.length;b++){var e=a[b],d=e.slice(0,1).toUpperCase()+e.slice(1);c.prototype[e]=0;c.prototype["get"+d]=h(e);c.prototype["set"+d]=f(e)}})(d,"years months days hours minutes seconds milliseconds".split(" ").slice(2));d.prototype.set=function(c,a,b,e,d){this.setDays(c||this.getDays());this.setHours(a||this.getHours());this.setMinutes(b||this.getMinutes());this.setSeconds(e||this.getSeconds());this.setMilliseconds(d||
this.getMilliseconds())};Date.prototype.getTimeOfDay=function(){return new d(0,this.getHours(),this.getMinutes(),this.getSeconds(),this.getMilliseconds())};Date.TimeSpan=d;"undefined"!==typeof window&&(window.TimeSpan=d)})();
(function(){var h=function(a){return function(){return this[a]}},f=function(a){return function(b){this[a]=b;return this}},d=function(a,b,c,d){function f(){b.addMonths(-a);d.months++;12===d.months&&(d.years++,d.months=0)}if(1===a)for(;b>c;)f();else for(;b<c;)f();d.months--;d.months*=a;d.years*=a},c=function(a,b,c,f,h,k,n){if(7===arguments.length)this.set(a,b,c,f,h,k,n);else if(2===arguments.length&&arguments[0]instanceof Date&&arguments[1]instanceof Date){var l=arguments[0].clone(),p=arguments[1].clone(),
q=l>p?1:-1;this.dates={start:arguments[0].clone(),end:arguments[1].clone()};d(q,l,p,this);var s=!1===(l.isDaylightSavingTime()===p.isDaylightSavingTime());s&&1===q?l.addHours(-1):s&&l.addHours(1);l=p-l;0!==l&&(l=new TimeSpan(l),this.set(this.years,this.months,l.getDays(),l.getHours(),l.getMinutes(),l.getSeconds(),l.getMilliseconds()))}return this};(function(a,b){for(var c=0;c<b.length;c++){var d=b[c],m=d.slice(0,1).toUpperCase()+d.slice(1);a.prototype[d]=0;a.prototype["get"+m]=h(d);a.prototype["set"+
m]=f(d)}})(c,"years months days hours minutes seconds milliseconds".split(" "));c.prototype.set=function(a,b,c,d,f,h,n){this.setYears(a||this.getYears());this.setMonths(b||this.getMonths());this.setDays(c||this.getDays());this.setHours(d||this.getHours());this.setMinutes(f||this.getMinutes());this.setSeconds(h||this.getSeconds());this.setMilliseconds(n||this.getMilliseconds())};Date.TimePeriod=c;"undefined"!==typeof window&&(window.TimePeriod=c)})();
/* 
  * To Title Case 2.1 – http://individed.com/code/to-title-case/
  * Copyright © 2008–2013 David Gouch. Licensed under the MIT License.
 */


String.prototype.toTitleCase = function(){
  var smallWords = /^(a|an|and|as|at|but|by|en|for|if|in|nor|of|on|or|per|the|to|vs?\.?|via)$/i;

  return this.replace(/[A-Za-z0-9\u00C0-\u00FF]+[^\s-]*/g, function(match, index, title){
    if (index > 0 && index + match.length !== title.length &&
      match.search(smallWords) > -1 && title.charAt(index - 2) !== ":" &&
      (title.charAt(index + match.length) !== '-' || title.charAt(index - 1) === '-') &&
      title.charAt(index - 1).search(/[^\s-]/) < 0) {
      return match.toLowerCase();
    }

    if (match.substr(1).search(/[A-Z]|\../) > -1) {
      return match;
    }

    return match.charAt(0).toUpperCase() + match.substr(1);
  });
};
(function() {
  window.ds || (window.ds = {});

  ds.models = {};

  ds.views = {};

  ds.controllers = {};

  ds.collections = {};

  ds.init = function() {
    ds.cssHelper.init();
    if (navigator.standalone) {
      document.body.classList.add("standalone");
    }
    ds.controllers.sessions = new ds.SessionsController;
    ds.controllers.notifications = new ds.NotificationsController;
    ds.user = new ds.UserCollection;
    ds.router = new ds.Router;
    ds.views.app = new ds.AppView;
    if (ds.user.current() != null) {
      return ds.run();
    } else {
      return Backbone.trigger("sessions:do", "new");
    }
  };

  ds.run = function() {
    ds.controllers.people = new ds.PeopleController;
    ds.collections.engagements = new ds.EngagementsCollection;
    ds.collections.schools = new ds.SchoolsCollection;
    return Backbone.history.start({
      pushState: true
    });
  };

}).call(this);
(function() {
  ds.animationHelper = {
    endEvent: function() {
      if (this.end) {
        return this.end;
      } else {
        return this.setEnd();
      }
    },
    setEnd: function() {
      var animations, el, evt, key, val;
      console.log('setting end!');
      el = document.createElement("div");
      animations = {
        "animation": "animationend",
        "OAnimation": "oAnimationEnd",
        "MozAnimation": "animationend",
        "WebkitAnimation": "webkitAnimationEnd"
      };
      evt = null;
      for (key in animations) {
        val = animations[key];
        if ((typeof el.style[key]) === "string") {
          evt = animations[key];
        }
      }
      this.end = evt;
      return this.end;
    }
  };

}).call(this);
(function() {
  ds.apiHelper = {
    urls: {
      assets: function() {
        return "/api/v2/assets";
      },
      asset: function(id) {
        return "/api/v2/assets/" + id;
      },
      assets_s3_path: function() {
        return "/api/v2/assets/signed_s3_path";
      },
      engagements: function() {
        return "/api/insecure/engagements";
      },
      engagement: function(id) {
        return "/api/insecure/engagements/" + id;
      },
      people: function() {
        return "/api/insecure/people";
      },
      person: function(id) {
        return "/api/insecure/people/" + id;
      },
      projects: function() {
        return "/api/insecure/projects";
      },
      project: function(id) {
        return "/api/insecure/projects/" + id;
      },
      schools: function() {
        return "/api/insecure/schools";
      },
      sessions: function() {
        return "/api/insecure/sessions/new";
      },
      sites: function() {
        return "/api/insecure/sites";
      }
    },
    urlFor: function(path, args) {
      var base;
      return typeof (base = this.urls)[path] === "function" ? base[path](args) : void 0;
    }
  };

}).call(this);
(function() {
  Backbone.Collection.prototype.bootstrap = function() {
    return this.fetch({
      remote: false,
      reset: true,
      success: (function(_this) {
        return function() {
          var c, newest, now, params, ref, sorted;
          _this.syncDirtyAndDestroyed();
          c = _this.fullCollection || _this;
          sorted = c.sortBy('id');
          newest = (ref = _.last(sorted)) != null ? ref.get('created_at') : void 0;
          now = new Date();
          if (newest) {
            params = {
              t_start: Date.parse(newest).toJSON(),
              t_end: now.toJSON()
            };
            return $.ajax({
              url: (_this.url()) + "/sync",
              data: params,
              complete: function(response) {
                if (response.status === 302) {
                  _this.trigger("sync:started");
                  return _this.fetch({
                    remote: true,
                    reset: true,
                    complete: function() {
                      return _this.trigger("sync:ended");
                    }
                  });
                }
              }
            });
          } else {
            _this.trigger("sync:started");
            return _this.fetch({
              reset: true,
              remote: true,
              complete: function() {
                return _this.trigger("sync:ended");
              }
            });
          }
        };
      })(this)
    });
  };

}).call(this);
(function() {
  ds.cssHelper = {
    init: function() {
      var testElem;
      if (navigator.standalone) {
        document.quertSelector('body').classList.add("standalone");
      }
      if (window.devicePixelRatio && devicePixelRatio >= 2) {
        testElem = document.createElement('div');
        testElem.style.border = '.5px solid transparent';
        document.body.appendChild(testElem);
        if (testElem.offsetHeight === 1) {
          document.querySelector('html').classList.add('hairlines');
        }
        return document.body.removeChild(testElem);
      }
    }
  };

}).call(this);
(function() {
  window.ds || (window.ds = {});

  ds.urlsHelper = {
    urlFor: function(model) {
      var id;
      id = model.cid;
      return "/phonebook/" + model.namespace + "/" + id;
    }
  };

}).call(this);
(function() {
  Backbone.View.prototype.renderTo = function(target, args) {
    args || (args = {});
    if (args.replace) {
      $(target).empty().append(this.el);
    } else {
      $(target).append(this.el);
    }
    return this.render();
  };

  Backbone.View.prototype.hide = function() {
    var endEvent;
    endEvent = ds.animationHelper.endEvent();
    this.$el.removeClass(function(index, css) {
      var ref;
      return (ref = css.match(/(^|\s)animation-\S+/g || [])) != null ? ref.join(' ') : void 0;
    });
    return this.$el.one(endEvent, (function(_this) {
      return function() {
        _.each(_this.views, function(view) {
          return view.remove();
        });
        return _this.remove();
      };
    })(this)).addClass('animation-fallout');
  };

}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/engagements/form"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="field kind-field">\n  <select id="kind" name="kind">\n    <option value="Coaching Session">Coaching Session</option>\n    <option value="Event">Event</option>\n    <option value="Course">Course</option>\n    <option value="Meeting">Meeting</option>\n  </select>\n  <label for="kind">Kind</label>\n</div>\n<div class="field school-field">\n  <select id="school_id" name="school_id">\n  </select>\n  <label for="school_id">School</label>\n</div>\n<div class="field name-field">\n  <input id="name" name="name" type="text">\n  <label for="name">Engagement Name</label>\n</div>\n<div class="field date-field">\n  <input name=\'date\' type=\'text\'>\n  <label for="date">Date</label>\n</div>\n<div class="field duration-field">\n  <select id="engagement_duration" name="duration">\n    <option value="0.1">5 Minutes</option>\n    <option value="0.25">15 Minutes</option>\n    <option value="0.5">30 Minutes</option>\n    <option value="0.75">45 Minutes</option>\n    <option selected value="1">1 Hour</option>\n    <option value="1.5">1.5 Hours</option>\n    <option value="2">2 Hours</option>\n    <option value="3">3 Hours</option>\n    <option value="4">4 Hours</option>\n    <option value="5">5 Hours</option>\n    <option value="6">6 Hours</option>\n    <option value="7">7 Hours</option>\n    <option value="8">8 Hours</option>\n  </select>\n  <label for="duration">Duration</label>\n</div>\n<div class="field description-field">\n  <textarea name=\'description\'></textarea>\n  <label for="description">Description</label>\n</div>\n<div class="field headcount-field">\n  <input id="headcount" name="headcount" type="number" min="0">\n  <label for="headcount">How many people were there?</label>\n</div>\n<div class="field selectize-field">\n  <select id="attendee_ids" name="attendee_ids" multiple></select>\n  <label for="attendee_ids" class="primary-label">Who was there?</label>\n  <label for="attendee_ids" class="alternate-label">Anyone in particular?</label>\n</div>\n<div class="field dual-action actions-field">\n  <input type="reset" value="Cancel" class="warning" />\n  <input type="submit" value="Log It" />\n</div>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/engagements/new"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="titlebar">\n  New Engagement\n</div>\n<div class="section">\n  <div id="engagement-form"></div>\n</div>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/_engagements"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h2>',  person.engagements.length ,' Engagements</h2>\n<div class="btn add">\n  Add Engagement\n</div>\n<ul id="engagements-list" class="borderless-list"></ul>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/_facts"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<ul class="facts">\n  <li>\n    <h1>',  person.first_name ,' ',  person.last_name ,'</h1>\n  </li>\n  <li class="fact">\n    <label>Role</label>\n    ',  person.role ,'\n  </li>\n  <li class="fact">\n    <label>Grade</label>\n    ',  person.grade ,'\n  </li>\n  <li class="fact">\n    <label>Dream Team</label>\n    ',  person.dream_team ,'\n  </li>\n  <li class="fact">\n    <label>School</label>\n    ',  person.school_name ,'\n  </li>\n  <li class="fact">\n    <label>DD</label>\n    ',  person.dd ,'\n  </li>\n</ul>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/_projects"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<h2 class=\'toggle\'>\n  ',  person.projects.length ,' Projects\n  <span class=\'icon-keyboard_arrow_down\'></span>\n</h2>\n<ul id="projects-list" class="borderless-list"></ul>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/add_engagement"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="titlebar">\n  <div class=\'l-menu\'>\n    <div class=\'button cancel\'>Cancel</div>\n  </div>\n  <div class=\'r-menu\'>\n    <div class=\'button done\'>Done</div>\n  </div>\n  New Engagement\n</div>\n<form class="panel">\n  <div class="field">\n    <h2>Engagement w/',  person.first_name ,' ',  person.last_name ,'</h2>\n  </div>\n  <div class="field kind-field">\n    <select id="kind" name="kind">\n      <option value="Coaching Session">Coaching Session</option>\n      <option value="Event">Event</option>\n      <option value="Course">Course</option>\n      <option value="Meeting">Meeting</option>\n    </select>\n    <label for="kind">Kind</label>\n  </div>\n  <div class="field date-field">\n    <input name=\'date\' type=\'date\'>\n    <label for="date">Date</label>\n  </div>\n  <div class="field duration-field">\n    <select id="engagement_duration" name="duration">\n      <option value="0.1">5 Minutes</option>\n      <option value="0.25">15 Minutes</option>\n      <option value="0.5">30 Minutes</option>\n      <option value="0.75">45 Minutes</option>\n      <option selected value="1">1 Hour</option>\n      <option value="1.5">1.5 Hours</option>\n      <option value="2">2 Hours</option>\n      <option value="3">3 Hours</option>\n      <option value="4">4 Hours</option>\n      <option value="5">5 Hours</option>\n      <option value="6">6 Hours</option>\n      <option value="7">7 Hours</option>\n      <option value="8">8 Hours</option>\n    </select>\n    <label for="duration">Duration</label>\n  </div>\n  <div class="field description-field">\n    <textarea name=\'description\'></textarea>\n    <label for="description">Description</label>\n  </div>\n  <input type=\'hidden\' name=\'school_id\' />\n  <div class="field actions-field">\n    <input type="submit" value="Done" />\n  </div>\n</form>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/index"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="titlebar">People</div>\n<div id="people-search" class="search">\n</div>\n<div id="people-list">\n  <div class="lb-loading"></div>\n</div>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/people/show"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<div class="titlebar">\n  <div class=\'l-menu\'>\n    <div class=\'button back\'>Back</div>\n  </div>\n  <div class=\'r-menu\'>\n    <div class=\'button edit\'>Edit</div>\n  </div>\n  Person Profile\n</div>\n<div id="person-facts" class="panel"></div>\n<div id="person-projects" class="panel"></div>\n<div id="person-engagements" class="panel"></div>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/sessions/new"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<header>\n  <strong>Hi there.</strong> What\'s your email?\n</header>\n<form>\n  <div class="field">\n    <input type="email" id="email" name="email" required autofocus placeholder="you@here.com"/>\n  </div>\n  <div class="field actions-field">\n    <input type="submit" value="Next" class="button" />\n  </div>\n\n</form>\n');}return __p.join('');};
}).call(this);
(function() { this.JST || (this.JST = {}); this.JST["phonebook/templates/sessions/registration"] = function(obj){var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('<header class="form-description">\n  <p>Welcome, <strong>',  person.email.split('@')[0] ,'</strong>.</p>\n  <p>We don\'t have your email on file yet, so please fill out the following fields. You\'ll only have to do this once.</p>\n</header>\n<form>\n  <div class="field name-field">\n    <input type="text" name="first_name" />\n    <label for="role">First Name</label>\n  </div>\n  <div class="field name-field">\n    <input type="text" name="last_name" />\n    <label for="role">Last Name</label>\n  </div>\n  <div class="field role-field">\n    <select id="role" name="role">\n      <option value="volunteer">volunteer</option>\n      <option value="student">student</option>\n      <option value="teacher">teacher</option>\n    </select>\n    <label for="role">Role</label>\n  </div>\n  <div class="field site-field">\n    <select id="site_id" name="site_id">\n    </select>\n    <label for="role">City</label>\n  </div>\n  <div class="field school-field">\n    <select id="school_id" name="school_id">\n    </select>\n    <label for="role">School</label>\n  </div>\n  <input type="hidden" name="grade" value="" />\n  <input type="hidden" name="email" />\n  <div class="field dual-action actions-field">\n    <input type="reset" value="Cancel" class="warning" />\n    <input type="submit" value="Go" />\n  </div>\n</form>\n');}return __p.join('');};
}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.Engagement = (function(superClass) {
    extend(Engagement, superClass);

    function Engagement() {
      return Engagement.__super__.constructor.apply(this, arguments);
    }

    Engagement.prototype.namespace = 'engagements';

    Engagement.prototype.urlRoot = ds.apiHelper.urlFor('engagements');

    Engagement.prototype.defaults = function() {
      var ref;
      return {
        kind: 'Coaching Session',
        school_id: (ref = ds.user.current()) != null ? ref.get('school_id') : void 0,
        duration: 0.1,
        date: new Date().toString('yyyy-MM-dd'),
        notes: [],
        attendees: []
      };
    };

    Engagement.prototype.toJSON = function() {
      return _.omit(_.clone(this.attributes), ['attendees', 'notes']);
    };

    Engagement.prototype.tplAttrs = function() {
      var attrs;
      attrs = _.extend(_.clone(this.attributes), {
        class_name: 'Engagement'
      });
      return {
        engagement: attrs
      };
    };

    Engagement.prototype.save = function(key, val, options) {
      this.set('date', Date.parse(this.get('date')).toString('yyyy-MM-dd'));
      if (this.get('attendee_ids') == null) {
        this.set('attendee_ids', ['']);
      }
      return Engagement.__super__.save.apply(this, arguments);
    };

    return Engagement;

  })(Backbone.Model);

  ds.EngagementsCollection = (function(superClass) {
    extend(EngagementsCollection, superClass);

    function EngagementsCollection() {
      return EngagementsCollection.__super__.constructor.apply(this, arguments);
    }

    EngagementsCollection.prototype.model = ds.Engagement;

    EngagementsCollection.prototype.namespace = 'engagements';

    EngagementsCollection.prototype.url = function() {
      return ds.apiHelper.urlFor(this.namespace);
    };

    EngagementsCollection.prototype.mode = 'client';

    return EngagementsCollection;

  })(Backbone.PageableCollection);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.Person = (function(superClass) {
    extend(Person, superClass);

    function Person() {
      return Person.__super__.constructor.apply(this, arguments);
    }

    Person.prototype.namespace = 'people';

    Person.prototype.urlRoot = ds.apiHelper.urlFor('people');

    Person.prototype.defaults = function() {
      var ref;
      return {
        role: 'student',
        grade: null,
        school_id: (ref = ds.user.current()) != null ? ref.get('school_id') : void 0,
        projects: [],
        engagements: [],
        notes: []
      };
    };

    Person.prototype.toJSON = function() {
      return _.omit(_.clone(this.attributes), ['engagements', 'projects', 'notes']);
    };

    Person.prototype.tplAttrs = function() {
      var attrs;
      attrs = _.extend(_.clone(this.attributes), {
        class_name: 'Person'
      });
      return {
        person: attrs
      };
    };

    Person.prototype.validate = function(attrs, options) {
      if (!attrs.first_name) {
        return "This person needs a first name.";
      } else if (!attrs.last_name) {
        return "This person needs a last name.";
      }
    };

    return Person;

  })(Backbone.Model);

  ds.PeopleCollection = (function(superClass) {
    extend(PeopleCollection, superClass);

    function PeopleCollection() {
      return PeopleCollection.__super__.constructor.apply(this, arguments);
    }

    PeopleCollection.prototype.model = ds.Person;

    PeopleCollection.prototype.namespace = 'people';

    PeopleCollection.prototype.url = function() {
      return ds.apiHelper.urlFor(this.namespace);
    };

    PeopleCollection.prototype.mode = 'client';

    PeopleCollection.prototype.state = {
      pageSize: 50
    };

    PeopleCollection.prototype.initialize = function() {
      this.on("add", function() {
        return console.log("added");
      });
      this.on("remove", function() {
        return console.log("removed");
      });
      return this.on("reset", (function(_this) {
        return function() {
          return console.log("reset to " + _this.length);
        };
      })(this));
    };

    return PeopleCollection;

  })(Backbone.PageableCollection);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.School = (function(superClass) {
    extend(School, superClass);

    function School() {
      return School.__super__.constructor.apply(this, arguments);
    }

    School.prototype.namespace = 'schools';

    School.prototype.urlRoot = ds.apiHelper.urlFor('school');

    School.prototype.tplAttrs = function() {
      var attrs;
      attrs = _.extend(this.toJSON(), {
        class_name: 'School'
      });
      return attrs;
    };

    return School;

  })(Backbone.Model);

  ds.SchoolsCollection = (function(superClass) {
    extend(SchoolsCollection, superClass);

    function SchoolsCollection() {
      return SchoolsCollection.__super__.constructor.apply(this, arguments);
    }

    SchoolsCollection.prototype.model = ds.School;

    SchoolsCollection.prototype.namespace = 'schools';

    SchoolsCollection.prototype.url = function() {
      return ds.apiHelper.urlFor(this.namespace);
    };

    SchoolsCollection.prototype.initialize = function() {
      return this.fetch({
        remote: false,
        reset: true,
        success: (function(_this) {
          return function() {
            return _this.fetch({
              remote: true,
              reset: true
            });
          };
        })(this)
      });
    };

    return SchoolsCollection;

  })(Backbone.Collection);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.User = (function(superClass) {
    extend(User, superClass);

    function User() {
      return User.__super__.constructor.apply(this, arguments);
    }

    return User;

  })(Backbone.Model);

  ds.UserCollection = (function(superClass) {
    extend(UserCollection, superClass);

    function UserCollection() {
      return UserCollection.__super__.constructor.apply(this, arguments);
    }

    UserCollection.prototype.url = 'sessions';

    UserCollection.prototype.local = true;

    UserCollection.prototype.current = function() {
      return this.last();
    };

    UserCollection.prototype.initialize = function() {
      return this.fetch();
    };

    return UserCollection;

  })(Backbone.Collection);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.AppView = (function(superClass) {
    extend(AppView, superClass);

    function AppView() {
      return AppView.__super__.constructor.apply(this, arguments);
    }

    AppView.prototype.initialize = function() {
      $(document).on('ajaxSend', function(event, xhr, options) {
        var user;
        console.log("AJAX request to " + options.url);
        user = ds.user.current();
        if (!user) {
          return;
        }
        return xhr.setRequestHeader("X-DS-USER", user.get('email'));
      });
      return this.listenTo(Backbone, 'scroll:reset', this.resetScrollPosition);
    };

    AppView.prototype.resetScrollPosition = function(pos) {
      pos || (pos = 0);
      return $('body').scrollTop(pos);
    };

    return AppView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.EngagementsFormView = (function(superClass) {
    extend(EngagementsFormView, superClass);

    function EngagementsFormView() {
      return EngagementsFormView.__super__.constructor.apply(this, arguments);
    }

    EngagementsFormView.prototype.initialize = function() {
      this.views = {};
      this.listenTo(this.model, 'change', this.render);
      return this.listenTo(ds.collections.schools, 'reset', this.postRender);
    };

    EngagementsFormView.prototype.tagName = 'form';

    EngagementsFormView.prototype.className = function() {
      return "panel " + this.model.get('kind').toLowerCase();
    };

    EngagementsFormView.prototype.events = {
      'submit': 'onsubmit',
      'change #kind': 'setCssClassFromKind'
    };

    EngagementsFormView.prototype.setCssClassFromKind = function(event) {
      return this.$el.attr('class', $(event.currentTarget).val().toLowerCase());
    };

    EngagementsFormView.prototype.template = JST['phonebook/templates/engagements/form'];

    EngagementsFormView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.delegateEvents();
      this.postRender();
      return this;
    };

    EngagementsFormView.prototype.postRender = function() {
      this.setSchoolOptions();
      return Backbone.Syphon.deserialize(this, this.model.toJSON());
    };

    EngagementsFormView.prototype.onsubmit = function(event) {
      var data;
      event.preventDefault();
      data = Backbone.Syphon.serialize(this);
      if (this.model.save(data)) {
        ds.collections.engagements.add(this.model, {
          merge: true
        });
        return ds.router.navigate(ds.urlsHelper.urlFor(this.model), {
          trigger: true
        });
      } else {
        return alert(this.model.validationError);
      }
    };

    EngagementsFormView.prototype.setSchoolOptions = function() {
      var $f, fragment;
      fragment = document.createDocumentFragment();
      $f = $(fragment);
      $f.append("<option value></option>");
      ds.collections.schools.each(function(s) {
        return $f.append("<option value='" + (s.get('id')) + "'>" + (s.get('name')) + "</option>");
      });
      return this.$el.find('#school_id').html($f);
    };

    return EngagementsFormView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.EngagementsNewView = (function(superClass) {
    extend(EngagementsNewView, superClass);

    function EngagementsNewView() {
      return EngagementsNewView.__super__.constructor.apply(this, arguments);
    }

    EngagementsNewView.prototype.initialize = function() {
      this.model || (this.model = new ds.Engagement);
      return this.views = {
        form: new ds.EngagementsFormView({
          model: this.model
        })
      };
    };

    EngagementsNewView.prototype.template = JST['phonebook/templates/engagements/new'];

    EngagementsNewView.prototype.className = 'engagement new';

    EngagementsNewView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.postRender();
      return this;
    };

    EngagementsNewView.prototype.postRender = function() {
      return this.views.form.renderTo("#engagement-form");
    };

    return EngagementsNewView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.ModelView = (function(superClass) {
    extend(ModelView, superClass);

    function ModelView() {
      return ModelView.__super__.constructor.apply(this, arguments);
    }

    ModelView.prototype.initialize = function(args) {
      this.template = args.template;
      return this.listenTo(this.model, 'change', this.render);
    };

    ModelView.prototype.render = function() {
      return this.$el.html(this.template(this.model.tplAttrs()));
    };

    return ModelView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.People_EngagementsView = (function(superClass) {
    extend(People_EngagementsView, superClass);

    function People_EngagementsView() {
      return People_EngagementsView.__super__.constructor.apply(this, arguments);
    }

    People_EngagementsView.prototype.initialize = function() {
      this.listenTo(this.model, 'change:engagements', this.render);
      return this.views = [];
    };

    People_EngagementsView.prototype.template = JST["phonebook/templates/people/_engagements"];

    People_EngagementsView.prototype.events = {
      'click .add': 'goToAdd'
    };

    People_EngagementsView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.postRender();
      return this;
    };

    People_EngagementsView.prototype.postRender = function() {
      var e, fragment, i, len, ref, view;
      fragment = document.createDocumentFragment();
      ref = this.model.get('engagements');
      for (i = 0, len = ref.length; i < len; i++) {
        e = ref[i];
        view = new ds.EngagementView({
          model: new ds.Engagement(e)
        });
        fragment.appendChild(view.render().el);
        this.views.push(view);
      }
      return this.$el.find('#engagements-list').html(fragment);
    };

    People_EngagementsView.prototype.goToAdd = function() {
      return Backbone.trigger("people:do", "add_engagement", this.model.get('id'));
    };

    return People_EngagementsView;

  })(Backbone.View);

  ds.EngagementView = (function(superClass) {
    extend(EngagementView, superClass);

    function EngagementView() {
      return EngagementView.__super__.constructor.apply(this, arguments);
    }

    EngagementView.prototype.events = {
      'click': 'toggleDelete'
    };

    EngagementView.prototype.tagName = 'li';

    EngagementView.prototype.template = _.template("<h2><%= Date.parse(engagement.date).toString('MM/dd/yy') %> - <%= engagement.kind %></h2> <pre class='engagement-description'><%= engagement.description %></pre>");

    EngagementView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      return this;
    };

    EngagementView.prototype.toggleDelete = function(event) {
      if (this.$el.hasClass('deletable')) {
        this["delete"]();
      }
      return this.$el.toggleClass('deletable');
    };

    EngagementView.prototype["delete"] = function() {
      var e;
      e = ds.collections.engagements.get(this.model.id);
      if (e && confirm("Are you sure you want to delete this engagement?")) {
        e.destroy();
        return this.$el.animate({
          height: 0,
          left: -window.innerWidth
        }, 'fast', function() {
          return $(this).remove();
        });
      } else {
        return Backbone.trigger("notify", "You can only delete engagements you've created this session.");
      }
    };

    return EngagementView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.People_ProjectsView = (function(superClass) {
    extend(People_ProjectsView, superClass);

    function People_ProjectsView() {
      return People_ProjectsView.__super__.constructor.apply(this, arguments);
    }

    People_ProjectsView.prototype.initialize = function() {
      return this.listenTo(this.model, 'change:projects', this.render);
    };

    People_ProjectsView.prototype.events = {
      'click .toggle': 'toggle'
    };

    People_ProjectsView.prototype.template = JST["phonebook/templates/people/_projects"];

    People_ProjectsView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.postRender();
      return this;
    };

    People_ProjectsView.prototype.item_template = _.template("<li class='project'> <h2><%= name %></h2> <pre class='project-description'><%= description %></pre> </li>");

    People_ProjectsView.prototype.postRender = function() {
      var e, fragment, i, len, ref;
      fragment = $(document.createDocumentFragment());
      ref = this.model.get('projects');
      for (i = 0, len = ref.length; i < len; i++) {
        e = ref[i];
        fragment.append(this.item_template(e));
      }
      return this.$el.find('#projects-list').html(fragment.get(0));
    };

    People_ProjectsView.prototype.toggle = function() {
      return this.$el.toggleClass('expanded');
    };

    return People_ProjectsView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleAddEngagementView = (function(superClass) {
    extend(PeopleAddEngagementView, superClass);

    function PeopleAddEngagementView() {
      return PeopleAddEngagementView.__super__.constructor.apply(this, arguments);
    }

    PeopleAddEngagementView.prototype.className = 'screen animation-fallin';

    PeopleAddEngagementView.prototype.template = JST["phonebook/templates/people/add_engagement"];

    PeopleAddEngagementView.prototype.initialize = function(options) {
      var option;
      if (options == null) {
        options = {};
      }
      for (option in options) {
        this[option] = options[option];
      }
      return this.listen();
    };

    PeopleAddEngagementView.prototype.events = {
      'submit': 'onsubmit',
      'click .cancel': 'cancel',
      'click .done': function(e) {
        return this.$el.find('form').submit();
      }
    };

    PeopleAddEngagementView.prototype.listen = function() {
      return this.listenTo(this.person, 'change', this.render);
    };

    PeopleAddEngagementView.prototype.tplAttrs = function() {
      return _.extend(this.person.tplAttrs(), this.model.tplAttrs());
    };

    PeopleAddEngagementView.prototype.render = function() {
      this.$el.html(this.template(this.tplAttrs()));
      this.postRender();
      return this;
    };

    PeopleAddEngagementView.prototype.postRender = function() {
      return Backbone.Syphon.deserialize(this, this.model.toJSON());
    };

    PeopleAddEngagementView.prototype.onsubmit = function(event) {
      var data;
      event.preventDefault();
      data = Backbone.Syphon.serialize(this);
      if (this.model.save(data)) {
        ds.collections.engagements.add(this.model);
        Backbone.trigger("people:do", "show", this.person.id);
        return Backbone.trigger("notify", "Engagement Added!");
      } else {
        return alert(this.model.validationError);
      }
    };

    PeopleAddEngagementView.prototype.cancel = function() {
      return Backbone.trigger("people:do", "show", this.person.id);
    };

    return PeopleAddEngagementView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleIndexView = (function(superClass) {
    extend(PeopleIndexView, superClass);

    function PeopleIndexView() {
      return PeopleIndexView.__super__.constructor.apply(this, arguments);
    }

    PeopleIndexView.prototype.className = 'index people-index screen animation-fallin';

    PeopleIndexView.prototype.template = JST["phonebook/templates/people/index"];

    PeopleIndexView.prototype.initialize = function(options) {
      var option;
      if (options == null) {
        options = {};
      }
      for (option in options) {
        this[option] = options[option];
      }
      this.views = {
        list: new ds.PeopleListView({
          collection: this.collection
        }),
        search: new ds.PeopleSearchView({
          collection: this.collection
        })
      };
      return this.listen();
    };

    PeopleIndexView.prototype.render = function() {
      this.$el.html(this.template());
      this.postRender();
      return this;
    };

    PeopleIndexView.prototype.postRender = function() {
      Backbone.trigger('scroll:reset', 0);
      if (this.collection.length < this.collection.state.pageSize) {
        this.collection.bootstrap();
      }
      this.views.list.renderTo("#people-list", {
        replace: true
      });
      return this.views.search.renderTo("#people-search", {
        replace: true
      });
    };

    PeopleIndexView.prototype.listen = function() {
      this.listenTo(Backbone, 'people:search:in', (function(_this) {
        return function() {
          return _this.$el.find('.titlebar').animate({
            height: 0
          }, 'fast').addClass('hidden');
        };
      })(this));
      this.listenTo(Backbone, 'people:search:out', (function(_this) {
        return function() {
          return _this.$el.find('.titlebar').animate({
            height: 45
          }, 'fast').removeClass('hidden');
        };
      })(this));
      this.listenTo(this.collection, "sync:started", this.spin);
      return this.listenTo(this.collection, "sync:ended", this.despin);
    };

    PeopleIndexView.prototype.spin = function() {
      this.spinner = new ds.SpinnerView;
      return this.$el.find('.search').after(this.spinner.render().el);
    };

    PeopleIndexView.prototype.despin = function() {
      var ref;
      return (ref = this.spinner) != null ? ref.remove() : void 0;
    };

    return PeopleIndexView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleListView = (function(superClass) {
    extend(PeopleListView, superClass);

    function PeopleListView() {
      return PeopleListView.__super__.constructor.apply(this, arguments);
    }

    PeopleListView.prototype.className = 'list people-list';

    PeopleListView.prototype.events = {
      'touchstart .list-item': 'ontouchstart',
      'click .person': 'itemClick',
      'click .createable': 'addPerson'
    };

    PeopleListView.prototype.initialize = function(options) {
      var option;
      if (options == null) {
        options = {};
      }
      for (option in options) {
        this[option] = options[option];
      }
      return this.listen();
    };

    PeopleListView.prototype.render = function(collection) {
      var fragment, i, item, len, person, ref;
      collection || (collection = this.collection);
      console.log("rendered list with " + collection.length + " people");
      fragment = document.createDocumentFragment();
      ref = collection.models;
      for (i = 0, len = ref.length; i < len; i++) {
        person = ref[i];
        item = document.createElement("div");
        item.className = "list-item person";
        item.setAttribute("data-id", person.get("id"));
        item.innerHTML = (person.get('first_name')) + " " + (person.get('last_name'));
        fragment.appendChild(item);
      }
      this.$el.html(fragment);
      return this;
    };

    PeopleListView.prototype.listen = function() {
      this.listenTo(Backbone, "people:search:results", this.onSearch);
      this.listenTo(Backbone, "people:search:cancelled", this.render);
      return this.listenTo(this.collection, "reset", this.render);
    };

    PeopleListView.prototype.itemClick = function(event) {
      var el, id;
      el = event.currentTarget;
      id = el.getAttribute('data-id');
      $(el).addClass('active').siblings().removeClass('active');
      return Backbone.trigger("people:do", "show", id);
    };

    PeopleListView.prototype.onSearch = function(query, results) {
      var first_name, last_name, q, validPerson;
      this.render({
        models: results,
        length: results.length
      });
      q = query.split(" ");
      last_name = q.pop();
      first_name = q.join(' ');
      validPerson = (first_name != null ? first_name.length : void 0) > 0 && (last_name != null ? last_name.length : void 0) > 0;
      if (validPerson) {
        return this.$el.append("<div class='list-item createable' data-first='" + first_name + "' data-last='" + last_name + "'> Add &ldquo;" + query + "&rdquo; </div>");
      }
    };

    PeopleListView.prototype.addPerson = function(event) {
      var first, last, person;
      first = event.currentTarget.getAttribute('data-first');
      last = event.currentTarget.getAttribute('data-last');
      if (first.match(/\b[a-z]/)) {
        first = first.toTitleCase();
      }
      if (last.match(/\b[a-z]/)) {
        last = last.toTitleCase();
      }
      person = new ds.Person({
        first_name: first,
        last_name: last
      });
      this.collection.create(person);
      return Backbone.trigger("people:do", "show", person.cid);
    };

    PeopleListView.prototype.ontouchstart = function() {};

    return PeopleListView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleSearchView = (function(superClass) {
    extend(PeopleSearchView, superClass);

    function PeopleSearchView() {
      return PeopleSearchView.__super__.constructor.apply(this, arguments);
    }

    PeopleSearchView.prototype.initialize = function(options) {
      var option;
      if (options == null) {
        options = {};
      }
      for (option in options) {
        this[option] = options[option];
      }
      this.$input = $("<input type='text' placeholder='Find or add person' autocomplete='off' autocorrect='off' autocapitalize='off' name='q'>");
      this.$canceller = $("<div class='cancel'>Cancel</div>");
      return this.$resetter = $("<div class='reset icon-cancel' />");
    };

    PeopleSearchView.prototype.events = {
      'click .cancel': 'cancel',
      'click .reset': 'reset',
      'click': 'focus',
      'keyup': 'throttledSearch',
      'focus input': 'onfocus',
      'blur input': 'onblur'
    };

    PeopleSearchView.prototype.render = function() {
      var fragment;
      fragment = document.createDocumentFragment();
      $(fragment).append(this.$input).append(this.$canceller).append(this.$resetter);
      this.$el.html(fragment);
      return this;
    };

    PeopleSearchView.prototype.focus = function() {
      if (this.$input.is(":focus")) {
        return;
      }
      return this.$input.focus();
    };

    PeopleSearchView.prototype.throttledSearch = _.debounce(function(e) {
      if ((e.keyCode != null) && e.keyCode === 13) {
        return;
      }
      return this.search(this.$input.val());
    }, 200);

    PeopleSearchView.prototype.search = function(query) {
      var q, results;
      if (!(query.length > 1)) {
        return;
      }
      q = query.toLowerCase();
      results = this.collection.fullCollection.clone().filter(function(person) {
        var first, last, searchString;
        first = person.get('first_name');
        last = person.get('last_name');
        searchString = (first + " " + last).toLowerCase().trim();
        return searchString.match(q);
      });
      return Backbone.trigger("people:search:results", query, results);
    };

    PeopleSearchView.prototype.onfocus = function(event) {
      this.$el.addClass('focused');
      return Backbone.trigger('people:search:in');
    };

    PeopleSearchView.prototype.onblur = function(event) {
      this.$el.removeClass('focused');
      Backbone.trigger('people:search:out');
      return this.$input.val('');
    };

    PeopleSearchView.prototype.cancel = function(event) {
      event.stopPropagation();
      return Backbone.trigger("people:search:cancelled");
    };

    PeopleSearchView.prototype.reset = function(event) {
      event.stopPropagation();
      event.preventDefault();
      return this.$input.val('').focus();
    };

    return PeopleSearchView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleShowView = (function(superClass) {
    extend(PeopleShowView, superClass);

    function PeopleShowView() {
      return PeopleShowView.__super__.constructor.apply(this, arguments);
    }

    PeopleShowView.prototype.className = 'screen animation-fallin';

    PeopleShowView.prototype.initialize = function() {
      return this.views = {
        facts: new ds.ModelView({
          model: this.model,
          template: JST["phonebook/templates/people/_facts"]
        }),
        projects: new ds.People_ProjectsView({
          model: this.model
        }),
        engagements: new ds.People_EngagementsView({
          model: this.model
        })
      };
    };

    PeopleShowView.prototype.template = JST["phonebook/templates/people/show"];

    PeopleShowView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.postRender();
      return this;
    };

    PeopleShowView.prototype.postRender = function() {
      Backbone.trigger('scroll:reset', 0);
      this.views.facts.renderTo("#person-facts");
      this.views.projects.renderTo("#person-projects");
      return this.views.engagements.renderTo("#person-engagements");
    };

    PeopleShowView.prototype.events = {
      'click .back': 'back'
    };

    PeopleShowView.prototype.back = function() {
      return Backbone.trigger("people:do", "index");
    };

    return PeopleShowView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.SessionsNewView = (function(superClass) {
    extend(SessionsNewView, superClass);

    function SessionsNewView() {
      return SessionsNewView.__super__.constructor.apply(this, arguments);
    }

    SessionsNewView.prototype.template = JST["phonebook/templates/sessions/new"];

    SessionsNewView.prototype.className = "panel";

    SessionsNewView.prototype.initialize = function() {
      this.views = {
        spinner: new ds.SpinnerView
      };
      return this.model = new ds.User;
    };

    SessionsNewView.prototype.events = {
      'submit': 'processForm'
    };

    SessionsNewView.prototype.render = function() {
      this.$el.html(this.template());
      return this;
    };

    SessionsNewView.prototype.processForm = function(event) {
      var data, email_filter;
      event.preventDefault();
      email_filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      data = Backbone.Syphon.serialize(this);
      if (!email_filter.test(data.email)) {
        return this.$el.find("header").html("<strong>Please enter a valid email address.</strong>");
      } else {
        $('input').attr('disabled', 'disabled');
        this.$el.append(this.views.spinner.el);
        return $.ajax({
          method: "GET",
          data: data,
          url: ds.apiHelper.urlFor('sessions'),
          success: (function(_this) {
            return function(response) {
              ds.user.create(response);
              return ds.run();
            };
          })(this),
          error: (function(_this) {
            return function(response) {
              if (response.status === 404) {
                return Backbone.trigger("sessions:do", "register", {
                  email: data.email
                });
              } else {
                return alert("Error " + response.status + ": " + response.statusText);
              }
            };
          })(this),
          complete: (function(_this) {
            return function() {
              $('input').removeAttr('disabled');
              return _this.views.spinner.remove();
            };
          })(this)
        });
      }
    };

    return SessionsNewView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.SessionsRegistrationView = (function(superClass) {
    extend(SessionsRegistrationView, superClass);

    function SessionsRegistrationView() {
      return SessionsRegistrationView.__super__.constructor.apply(this, arguments);
    }

    SessionsRegistrationView.prototype.template = JST["phonebook/templates/sessions/registration"];

    SessionsRegistrationView.prototype.className = "panel";

    SessionsRegistrationView.prototype.events = {
      'change #site_id': 'loadSchoolOptions',
      'submit': 'processRegistration',
      'reset': 'onReset'
    };

    SessionsRegistrationView.prototype.initialize = function() {
      return this.views = {
        spinner: new ds.SpinnerView
      };
    };

    SessionsRegistrationView.prototype.render = function() {
      this.$el.html(this.template(this.model.tplAttrs()));
      this.postRender();
      return this;
    };

    SessionsRegistrationView.prototype.postRender = function() {
      this.loadSiteOptions();
      return Backbone.Syphon.deserialize(this, this.model.toJSON());
    };

    SessionsRegistrationView.prototype.loadSiteOptions = function() {
      return $.getJSON(ds.apiHelper.urlFor('sites'), (function(_this) {
        return function(response) {
          var $f, fragment;
          fragment = document.createDocumentFragment();
          $f = $(fragment);
          $f.append("<option value></option>");
          _.each(response, function(s) {
            return $f.append("<option value='" + s.id + "'>" + s.name + "</option>");
          });
          return _this.$el.find('#site_id').html($f);
        };
      })(this));
    };

    SessionsRegistrationView.prototype.loadSchoolOptions = function(event) {
      var site_id;
      site_id = $(event.currentTarget).val();
      return $.getJSON((ds.apiHelper.urlFor('schools')) + "?scope_type=Site&scope_id=" + site_id, (function(_this) {
        return function(response) {
          var $f, fragment;
          fragment = document.createDocumentFragment();
          $f = $(fragment);
          $f.append("<option value></option>");
          _.each(response, function(s) {
            return $f.append("<option value='" + s.id + "'>" + s.name + "</option>");
          });
          return _this.$el.find('#school_id').html($f);
        };
      })(this));
    };

    SessionsRegistrationView.prototype.processRegistration = function(event) {
      var data, person, valid;
      event.preventDefault();
      data = Backbone.Syphon.serialize(this);
      valid = !!data.first_name && !!data.last_name && !!data.site_id;
      if (valid) {
        person = new ds.Person(data);
        return person.save(data, {
          success: function(res) {
            var msg;
            msg = "All set, " + (person.get('first_name')) + ". Tap a person's name to log an engagement with them.";
            Backbone.trigger("notify", msg);
            ds.user.create(person.toJSON());
            return ds.run();
          },
          error: function(error) {
            return console.log(error);
          }
        });
      } else {
        return alert("Actually, all fields except school are required.");
      }
    };

    SessionsRegistrationView.prototype.onReset = function(event) {
      event.preventDefault();
      return Backbone.trigger("sessions:do", "new");
    };

    return SessionsRegistrationView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.SpinnerView = (function(superClass) {
    extend(SpinnerView, superClass);

    function SpinnerView() {
      return SpinnerView.__super__.constructor.apply(this, arguments);
    }

    SpinnerView.prototype.className = 'lb-loading';

    return SpinnerView;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.EngagementsController = (function(superClass) {
    extend(EngagementsController, superClass);

    function EngagementsController() {
      return EngagementsController.__super__.constructor.apply(this, arguments);
    }

    EngagementsController.prototype.el = "#phonebook";

    EngagementsController.prototype.initialize = function() {
      this.views = {};
      this.collection = new ds.EngagementsCollection;
      this.listenTo(Backbone, "engagements:do", this["do"]);
      return this.listenTo(Backbone, "people:do", this.hideAll);
    };

    EngagementsController.prototype["do"] = function(fn, args) {
      _.each(this.views, (function(_this) {
        return function(view) {
          if (view !== _this.views[fn]) {
            return view.hide();
          }
        };
      })(this));
      return typeof this[fn] === "function" ? this[fn](args) : void 0;
    };

    EngagementsController.prototype["new"] = function(id) {
      var engagement, ids, ref;
      ds.router.navigate("phonebook/engagements/new/" + id);
      ids = [id];
      if ((ref = ds.user.current()) != null ? ref.get('role').match(/volunteer|student|APR/i) : void 0) {
        ids.push(ds.user.current().id);
      }
      engagement = new ds.Engagement({
        attendee_ids: [ids]
      });
      this.views["new"] = new ds.EngagementsNewView({
        model: engagement
      });
      return this.views["new"].renderTo(this.el);
    };

    EngagementsController.prototype.hideAll = function() {
      return _.each(this.views, function(view) {
        return view.hide();
      });
    };

    return EngagementsController;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.NotificationsController = (function(superClass) {
    extend(NotificationsController, superClass);

    function NotificationsController() {
      return NotificationsController.__super__.constructor.apply(this, arguments);
    }

    NotificationsController.prototype.initialize = function() {
      return this.listenTo(Backbone, "notify", this.notify);
    };

    NotificationsController.prototype.notify = function(message) {
      return console.log(message);
    };

    return NotificationsController;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.PeopleController = (function(superClass) {
    extend(PeopleController, superClass);

    function PeopleController() {
      return PeopleController.__super__.constructor.apply(this, arguments);
    }

    PeopleController.prototype.el = "#phonebook";

    PeopleController.prototype.initialize = function() {
      this.views = {};
      this.collection = new ds.PeopleCollection;
      return this.listenTo(Backbone, "people:do", this["do"]);
    };

    PeopleController.prototype["do"] = function(fn, args) {
      _.each(this.views, (function(_this) {
        return function(view) {
          if (view !== _this.views[fn]) {
            return view.hide();
          }
        };
      })(this));
      return typeof this[fn] === "function" ? this[fn](args) : void 0;
    };

    PeopleController.prototype.index = function() {
      ds.router.navigate("phonebook/people");
      this.views.index = new ds.PeopleIndexView({
        collection: this.collection
      });
      return this.views.index.renderTo(this.el);
    };

    PeopleController.prototype.show = function(id) {
      var person;
      ds.router.navigate("phonebook/people/" + id);
      person = this.getModelFromId(id);
      this.views.show = new ds.PeopleShowView({
        model: person
      });
      return this.views.show.renderTo(this.el);
    };

    PeopleController.prototype.add_engagement = function(id) {
      var engagement, person;
      ds.router.navigate("phonebook/people/" + id + "/add/engagement");
      person = this.getModelFromId(id);
      engagement = new ds.Engagement({
        attendee_ids: this.getAttendeeIdsFromRole(id, ds.user.current()),
        school_id: person.get('school_id')
      });
      this.views.add_engagement = new ds.PeopleAddEngagementView({
        model: engagement,
        person: person
      });
      return this.views.add_engagement.renderTo(this.el);
    };

    PeopleController.prototype.getModelFromId = function(id) {
      var collection, person;
      collection = this.collection.fullCollection || this.collection;
      if (parseInt(id)) {
        person = collection.get(id) || new ds.Person({
          id: id
        });
        person.fetch({
          success: function() {
            return collection.add(person);
          }
        });
      } else {
        person = collection.get({
          cid: id
        }) || new ds.Person({
          cid: id
        });
      }
      return person;
    };

    PeopleController.prototype.getAttendeeIdsFromRole = function(person_id, user) {
      if (user.get('role').match(/volunteer|student|APR/i)) {
        return [person_id, user.id];
      } else {
        return [person_id];
      }
    };

    PeopleController.prototype.hideAll = function() {
      return _.each(this.views, function(view) {
        return view.hide();
      });
    };

    return PeopleController;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.SessionsController = (function(superClass) {
    extend(SessionsController, superClass);

    function SessionsController() {
      return SessionsController.__super__.constructor.apply(this, arguments);
    }

    SessionsController.prototype.initialize = function() {
      this.views = {};
      this.listenTo(Backbone, "sessions:do", this["do"]);
      return this.listenTo(Backbone, "people:do", this["do"]);
    };

    SessionsController.prototype["do"] = function(fn, args) {
      _.each(this.views, function(view) {
        return view.hide();
      });
      return typeof this[fn] === "function" ? this[fn](args) : void 0;
    };

    SessionsController.prototype["new"] = function() {
      this.views["new"] = new ds.SessionsNewView;
      return this.views["new"].renderTo("#phonebook");
    };

    SessionsController.prototype.register = function(attrs) {
      this.views.registration = new ds.SessionsRegistrationView({
        model: new ds.Person(_.extend(attrs, {
          role: 'volunteer'
        }))
      });
      return this.views.registration.renderTo("#phonebook");
    };

    return SessionsController;

  })(Backbone.View);

}).call(this);
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ds.Router = (function(superClass) {
    extend(Router, superClass);

    function Router() {
      return Router.__super__.constructor.apply(this, arguments);
    }

    Router.prototype.initialize = function() {
      return this.on('route', function(route) {
        return Backbone.trigger('routed', route);
      });
    };

    Router.prototype.routes = {
      "phonebook": "people_index",
      "mobile": "people_index",
      "logbookapp": "people_index",
      "phonebook/people": "people_index",
      "phonebook/people/:id": "people_show",
      "phonebook/people/:id/edit": "people_edit",
      "phonebook/people/:id/add/engagement": "people_add_engagement",
      "phonebook/engagements/new": "engagements_new",
      "phonebook/engagements/new/:person_id": "engagements_new"
    };

    Router.prototype.people_index = function() {
      return Backbone.trigger("people:do", "index");
    };

    Router.prototype.people_show = function(id) {
      return Backbone.trigger("people:do", "show", id);
    };

    Router.prototype.people_edit = function(id) {
      return Backbone.trigger("people:do", "edit", id);
    };

    Router.prototype.people_add_engagement = function(id) {
      return Backbone.trigger("people:do", "add_engagement", id);
    };

    Router.prototype.engagements_new = function(person_id) {
      return Backbone.trigger("engagements:do", "new", person_id);
    };

    Router.prototype.engagements_edit = function(id) {
      return Backbone.trigger("engagements:do", "edit", id);
    };

    Router.prototype.projects_index = function() {
      return Backbone.trigger("projects:index");
    };

    Router.prototype.projects_show = function(id) {
      return Backbone.trigger("projects:show", id);
    };

    Router.prototype.projects_new = function(model) {
      return Backbone.trigger("projects:new", model);
    };

    Router.prototype.projects_edit = function(id) {
      return Backbone.trigger("projects:edit", id);
    };

    Router.prototype.report_submissions_index = function() {
      return Backbone.trigger("report_submissions:index");
    };

    Router.prototype.report_submissions_show = function(id) {
      return Backbone.trigger("report_submissions:show", id);
    };

    Router.prototype.notes_new = function(type, obj_id) {
      return Backbone.trigger("notes:new", type, obj_id);
    };

    return Router;

  })(Backbone.Router);

}).call(this);
