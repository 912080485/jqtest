!function(){function e(e){return"[object Function]"===Object.prototype.toString.call(e)}function a(a,t,n){if(o[a])throw new Error("Module "+a+" has been defined already.");e(t)&&(n=t),o[a]={factory:n,inited:!1,exports:null}}function t(a){var t,i,r,s;if(t=o[a],i={},r={exports:{}},!e(t.factory))throw new Error("Module "+a+" has no factory.");if(s=t.factory.call(void 0,n,i,r),void 0!==s)t.exports=s;else if(r.hasOwnProperty("exports")&&"object"==typeof r.exports&&r.exports instanceof Object==!0){var m,c=!1;for(m in r.exports)r.exports.hasOwnProperty(m)&&(c=!0);c===!1?t.exports=i:t.exports=r.exports}else t.exports=r.exports;t.inited=!0}function n(e){var a;if(a=o[e],!a)throw new Error("Module "+e+" is not defined.");return a.inited===!1&&t(e),a.exports}var o={};a("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/mobile-cmt-barrage.js",function(e,a,t){window.changyan.api.ready(function(a){function t(e){o.ajax({url:a.getConfig("protocol")+"changyan.sohu.com/api/2/topic/comments",dataType:"jsonp",jsonp:"callback",scriptCharset:"utf-8",cache:!1,data:{client_id:a.getFeConfig("appid"),page_size:30,topic_id:a.getTopicId(),page_no:1},success:function(t){t.error_code?console.log(t.error_msg):3===t.mode||0===t.comments.length?(s=[],e(s)):(t=a.util.UrlSwitchHttps(t),s=l.concat(t.comments),s.length<4&&(s=[]),i.each(s,function(e,t){var n=e.content;e.content=a.util.formatContent(n)}),e(s))}})}function n(){var e=o(window);e.on("scroll",function(){var a=o("#SOHUCS #SOHU_MAIN .module-mobile-cmt-list");if(a.length){var t=a.offset().top,n=a.offset().top+a.height();t-e.height()-100<e.scrollTop()&&e.scrollTop()<n+100?c.barrageSwitch("close"):c.barrageSwitch("open")}})}var o=a.util.jquery,i=a.util._,r=(a.util.velocityjs,"true"===a.getBeConfig("mobile_allow_barrage")||"true"===a.getBeConfig("barrageSwitch"));if(r){var s,m=o("#SOHUCS #SOHU_MAIN"),c=e("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.js"),l=a.getHotCommentList();t(function(e){c.init(m,e),"false"===window.localStorage.getItem("changyan-barrage")&&c.closeBarrage()}),n(),a.event.register("mobile-cmt-barrage","open"),a.event.register("mobile-cmt-barrage","close"),a.event.register("mobile-cmt-barrage","refresh"),a.event.listen("changyan:mobile-cmt-barrage:open",function(){c.openBarrage()}),a.event.listen("changyan:mobile-cmt-barrage:close",function(){c.closeBarrage()}),a.event.listen("changyan:mobile-cmt-barrage:refresh",function(){t(function(e){c.stopBarrage(),c.init(m,e),"false"===window.localStorage.getItem("changyan-barrage")&&c.closeBarrage()})}),a.event.listen("changyan:on-topic-lod",function(){a.events&&a.events.onTopicLoad&&i.isFunction(a.events.onTopicLoad)===!0&&a.events.onTopicLoad()})}})}),a("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.js",function(e,a,t){window.changyan.api.ready(function(a){var n=a.util.jquery,o=(a.util._,a.util.velocityjs);!function(){for(var e=0,a=["webkit","moz"],t=0;t<a.length&&!window.requestAnimationFrame;++t)window.requestAnimationFrame=window[a[t]+"RequestAnimationFrame"],window.cancelAnimationFrame=window[a[t]+"CancelAnimationFrame"]||window[a[t]+"CancelRequestAnimationFrame"];window.requestAnimationFrame||(window.requestAnimationFrame=function(a,t){var n=(new Date).getTime(),o=Math.max(0,16.7-(n-e)),i=window.setTimeout(function(){a(n+o)},o);return e=n+o,i}),window.cancelAnimationFrame||(window.cancelAnimationFrame=function(e){clearTimeout(e)})}();var i,r,s,m="open",c=!1,l=!1,d=0,p=!1,g=function(e){i&&("open"!==e||c?"close"===e&&(i.css({visibility:"hidden"}),this.status="close"):(i.css({visibility:"visible"}),this.status="open"))},u=function(){c=!0,g("close")},h=function(){c=!1,g("open")},w=function(e){l=!0,r=e},b=function(e){w(function(){s=e,l=!1,d=0})},f=function(){p=!0},v=function(a,t,m){var c={barrageNum:3,interval:12,speed:1,disappearTime:40};if(arguments.length<2)return void console.log(new error("参数不够！"));if("[object Array]"!==Object.prototype.toString.call(t)||0===t.length)return n('div[node-type="mobile-cmt-barrage"]').remove(),void(p=!1);2===arguments.length&&(m=c),e("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.css");var g=e("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.html.js"),u=n('<div node-type="mobile-cmt-barrage" class="module-mobile-cmt-barrage" style="position: fixed;top: 0;right: 0;"></div>');a.append(u),i=u;var h=m.barrageNum||c.barrageNum,w=m.interval||c.interval,b=m.speed||c.speed,f=m.disappearTime||c.disappearTime,v=0,A=[],y=0,B=!1,C=1,x=t.length;l=!1,s=t;var S=function(){var e,a=function(){tempHtml=o.render(g,{data:s[d]}),u.append(tempHtml),$domList=u.children(),v=$domList.length,A.push(0),d++,d>=x&&(d-=x)};for(0>=v&&a(),e=0;v>e;e++)A[e]+=1,$domList.eq(e).css({y:-A[e]*b});B&&(C-=1/f,$domList.eq(0).css({opacity:C}),0>=C&&(B=!1,C=1,$domList.eq(0).remove(),A.shift(),v--,$domList=u.children(),$domList.length<=0&&r()));var t=A[v-1];t===w&&(y=Number($domList.eq(v-1).css("height").slice(0,-2))),(v>=h||l)&&t>=y/b+w-f-5&&(B=!0),t>y/b+w&&!l&&a(),p!==!0?requestAnimationFrame(S):(u.remove(),p=!1)};window.requestAnimationFrame(S)},A={barrageSwitch:g,init:v,status:m,closeBarrage:u,openBarrage:h,refreshBarrage:b,stopBarrage:f};t.exports=A})}),a("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.css",function(e,a,t){var n=decodeURIComponent("%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-barrage%7Bz-index%3A1%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-barrage%20.danmu-wrap%7Bheight%3Aauto%3Bposition%3Afixed%3Btop%3A16.666666667em%3Bright%3A1em%3Bmax-height%3A7.333333333em%3Bborder-radius%3A1.166666667em%3Bbackground-color%3Argba(0%2C0%2C0%2C.5)%3Btransform%3AtranslateZ(0)%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-barrage%20.danmu-wrap%20.portrait%7Bheight%3A2.25em%3Bwidth%3A2.25em%3Bdisplay%3Ablock%3Bmargin%3A.166666667em%20.5em%201px%20.166666667em%3Bborder-radius%3A2.25em%3Bfloat%3Aleft%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-barrage%20.danmu-wrap%20.danmu-cmt%7Bwhite-space%3Anormal%3Bmax-width%3A16em%3Bmax-height%3A4.538461538em%3Bline-height%3A1.538461538em%3Bdisplay%3Ablock%3Bfont-size%3A1.0833333333333333em%3Boverflow%3Ahidden%3Bcolor%3A%23fff%3Bpadding-right%3A.384615385em%3Bmargin%3A.461538462em%201px%7D"),o=window.document,i=o.createElement("style");i.id="seaJs-css",i.setAttribute("type","text/css");var r=o.getElementById("seaJs-css");r?o.all?r.styleSheet.cssText+=n:r.textContent+=n:o.all?(i.styleSheet.cssText=n,o.getElementsByTagName("head").item(0).appendChild(i)):(i.innerHTML=n,o.getElementsByTagName("head").item(0).appendChild(i))}),a("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/barrage-animation.html.js",function(e,a,t){"use strict";var n;return n=[],n.push('<div class="danmu-wrap">'),n.push('    <img class="portrait" src="$!{data.passport.img_url}"></img>'),n.push('    <span class="danmu-cmt">$!{data.content}</span>'),n.push("</div>"),n.join("\n")}),t("C:/Users/haoyan/AppData/Roaming/npm/node_modules/mdevp/cache/www/mobile-cmt-barrage/mobile-cmt-barrage.js")}();