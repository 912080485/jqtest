!function(){function e(e){return"[object Function]"===Object.prototype.toString.call(e)}function t(t,a,n){if(i[t])throw new Error("Module "+t+" has been defined already.");e(a)&&(n=a),i[t]={factory:n,inited:!1,exports:null}}function a(t){var a,o,r,s;if(a=i[t],o={},r={exports:{}},!e(a.factory))throw new Error("Module "+t+" has no factory.");if(s=a.factory.call(void 0,n,o,r),void 0!==s)a.exports=s;else if(r.hasOwnProperty("exports")&&"object"==typeof r.exports&&r.exports instanceof Object==!0){var d,p=!1;for(d in r.exports)r.exports.hasOwnProperty(d)&&(p=!0);p===!1?a.exports=o:a.exports=r.exports}else a.exports=r.exports;a.inited=!0}function n(e){var t;if(t=i[e],!t)throw new Error("Module "+e+" is not defined.");return t.inited===!1&&a(e),t.exports}var i={};t("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/mobile-cy-av.js",function(e,t,a){window.changyan.api.ready(function(t){var a=t.util.jquery,n=t.util._,i=t.util.velocityjs;e("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/wap-av.css");var o=(t.getBeConfig(),t.getAppid()),r=t.getUUID()||0,s=t.getFeConfig("title"),d=t.getFeConfig("category_id")||0,p="//e.changyan.sohu.com/dataService/",c=function(e){var i="6107",p="6108",c="6103";t.getUserInfo(function(t){var f={appId:o,category:d,title:s,uid:t.user_id||0,uuid:r};if(n.indexOf(e,i)>=0){var u={position:i},v=n.extend(u,f);l(v,function(e){"JS"===e.advertType?w(e):"IFRAME"===e.advertType?b(e):(e.advertContent=a.parseJSON(e.advertContent),y(e))})}if(n.indexOf(e,p)>=0){var m={position:p},h=n.extend(m,f);l(h,function(e){"JS"===e.advertType?w(e):"IFRAME"===e.advertType?x(e):(e.advertContent=a.parseJSON(e.advertContent),g(e))})}if(n.indexOf(e,c)>=0){var A={position:c},B=n.extend(A,f);l(B,function(e){"JS"===e.advertType?w(e):"IFRAME"===e.advertType?S(e):(e.advertContent=a.parseJSON(e.advertContent),U(e))})}})},l=function(e,n){a.ajax({url:p+"v2/getData",dataType:"jsonp",cache:!1,scriptCharset:"utf-8",data:e,success:function(e){e=t.util.UrlSwitchHttps(e),0!==e.advertId&&(n(e),"IFRAME"!==e.advertType&&u(e))}})},f=function(e){var t=new Image,a="_img_"+Math.random();window[a]=t,t.onload=t.onerror=function(){window[a]=null},t.src=e},u=function(e){var a=p+"v2/pv?",n=["appId="+o,"advertId="+e.advertId,"agencyType="+e.agencyType,"pce="+e.pce,"tag="+e.tag,"ref="+e.ref,"uuid="+r];t.getUserInfo(function(e){var t=e.user_id||0;n.push("uid="+t),a+=n.join("&"),f(a)})},v=function(e,n,i){var s=p+"v2/visibility?",d=a(window),c={IMAGE:"0",FLASH:"1",JS:"3",IFRAME:"5"},l=["appId="+o,"advertId="+e.advertId,"agencyType="+e.agencyType,"pce="+e.pce,"tag="+e.tag,"ref="+e.ref,"uuid="+r,"showType="+c[e.advertType],"screenWidth="+d.width(),"screenHeight="+d.height()];if("banner"===n||"feed"===n){var u=!1;d.on("scroll",function(){var e=i.offset().top-d.height()+i.height()/2;d.scrollTop()>=e&&d.scrollTop()<=e+d.height()&&(u||(window.setTimeout(function(){d.scrollTop()>=e&&d.scrollTop()<=e+d.height()?t.getUserInfo(function(e){var t=e.user_id||0;l.push("uid="+t),l.push("Xcoordinate="+i.offset().left),l.push("Ycoordinate="+i.offset().top),s+=l.join("&"),f(s)}):u=!1},300),u=!0))}),d.trigger("scroll")}else"float"===n&&window.setTimeout(function(){a('img[node-type="ad-float-main"]:visible').length>0&&t.getUserInfo(function(e){var t=e.user_id||0;l.push("uid="+t),l.push("Xcoordinate="+i.offset().left),l.push("Ycoordinate="+i.offset().top),s+=l.join("&"),f(s)}),a("iframe.cy-wap-float-iframe:visible").length>0&&t.getUserInfo(function(e){var t=e.user_id||0;l.push("uid="+t),l.push("Xcoordinate="+i.offset().left),l.push("Ycoordinate="+i.offset().top),s+=l.join("&"),f(s)})},1e3)},m=function(e){var a=p+"v2/click?",n={IMAGE:"0",FLASH:"1",JS:"3",IFRAME:"5"},i=["appId="+o,"advertId="+e.advertId,"agencyType="+e.agencyType,"pce="+e.pce,"tag="+e.tag,"ref="+e.ref,"uuid="+r,"landingUrl="+e.advertContent.landingUrl,"category="+d,"type="+n[e.advertType]];t.getUserInfo(function(e){var t=e.user_id||0;i.push("uid="+t),a+=i.join("&"),f(a)})},h=function(e){var a=p+"v2/close?",n=["appId="+o,"advertId="+e.advertId,"tag="+e.tag,"uuid="+r];t.getUserInfo(function(e){var t=e.user_id||0;n.push("uid="+t),a+=n.join("&"),f(a)})},y=function(t){var n=e("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/banner.html.js"),o=i.render(n,t);a("#SOHUCS #SOHU_MAIN").prepend(a(o)),a("#SOHUCS #SOHU_MAIN").delegate('img[node-type="ad-banner-main"]',"tap",'img[node-type="ad-banner-main"]',function(){m(t)}),v(t,"banner",a("#SOHUCS").find('div[node-type="ad-wap-banner"]')),a("#SOHUCS").delegate('span[node-type="cy-ad-banner-close"]',"tap",function(e){e.preventDefault(),e.stopPropagation(),a('div[node-type="ad-wap-banner"]').remove(),h(t)})},g=function(t){var n=e("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/float.html.js"),o=i.render(n,t);a("#SOHUCS #SOHU_MAIN").append(a(o)),a("#SOHUCS #SOHU_MAIN").delegate('img[node-type="ad-float-main"]',"tap",'img[node-type="ad-float-main"]',function(){m(t)}),v(t,"float",a("#SOHUCS").find('div[node-type="ad-wap-float"]')),a("#SOHUCS").delegate('span[node-type="cy-ad-float-close"]',"tap",function(e){e.preventDefault(),e.stopPropagation(),a('div[node-type="ad-wap-float"]').remove(),h(t)})},w=function(e){a("body").append(e.advertContent)},A=function(e,t,n){var i=document.createElement("iframe");i.src=e.advertContent,i.width=e.advertWidth,i.height=e.advertHeight,i.className=t;var o=document.createElement("div");if(o.className=t+"-wrapper",a(o).css("width",e.advertWidth),a(o).css("height",e.advertHeight),n){var r=document.createElement("span");r.className="cy-iframe-close-btn",r.innerHTML='<span style="font-size:14px;position:relative;top:1px;">×</span>',o.appendChild(r)}return o.appendChild(i),u(e),o},b=function(e){if(!(e.advertWidth>screen.width)){var t=A(e,"cy-wap-banner-iframe",!1);a("#SOHUCS").prepend(t),a(t).on("tap",".cy-iframe-close-btn",function(){a(this).parent().remove(),h(e)}),v(e,"banner",a("#SOHUCS").find(".cy-wap-banner-iframe"))}},B=!1,S=function(e){e.advertWidth>a("#SOHUCS").outerWidth()||setTimeout(function(){if(!B){var t=a('div[node-type="cmt-list"]'),n=t.find('div[node-type="cmt-item"]');if(n.length>2){var i=A(e,"cy-wap-feed-iframe",!1);n.eq(0).after(i),a(i).on("tap",".cy-iframe-close-btn",function(){a(this).parent().remove(),h(e)}),v(e,"feed",a("#SOHUCS").find(".cy-wap-feed-iframe")),B=!0}}},1500)},x=function(e){if(!(e.advertWidth>screen.width)){var t=A(e,"cy-wap-float-iframe",!0);a("#SOHUCS").prepend(t),a(t).on("tap",".cy-iframe-close-btn",function(){a(this).parent().remove(),h(e)}),v(e,"float",a("#SOHUCS").find(".cy-wap-float-iframe"))}},U=function(t){setTimeout(function(){if(!B){var n=a('div[node-type="cmt-list"]'),o=n.find('div[node-type="cmt-item"]');if(o.length>2){var r=e("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/feed.html.js"),s=i.render(r,t);o.eq(0).after(s),n.delegate('img[node-type="feed-image"]',"tap",function(){m(t)}),n.delegate('a[node-type="feed-detail-link"]',"tap",function(){m(t)}),v(t,"feed",a("#SOHUCS").find('div[node-type="ad-wap-feed"]')),n.delegate('span[node-type="cy-ad-feed-close"]',"tap",function(e){e.preventDefault(),e.stopPropagation(),a('div[node-type="ad-wap-feed"]').remove(),h(t)}),B=!0}}},1500)};t.log("mobile-advert-load"),a.ajax({url:p+"getConfig",dataType:"jsonp",cache:!1,scriptCharset:"utf-8",data:{appId:o},success:function(e){e=t.util.UrlSwitchHttps(e),t.log("mobile-advert-config-success"),1===e.status&&(t.log("mobile-advert-status-on"),c(e.positions))}})})}),t("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/wap-av.css",function(e,t,a){var n=decodeURIComponent(".cy-ad-float-container%7Bposition%3Afixed%3Bbottom%3A0%3Bright%3A0%3Bz-index%3A2147483647%7D.cy-ad-float-close%7Bbackground-image%3Aurl(https%3A%2F%2Fchangyan.itc.cn%2Fmdevp%2Fextensions%2Fmobile-cy-av%2F025%2Fimage%2Fclose.png)%3Bbackground-size%3A100%25%3Bdisplay%3Ablock%3Bwidth%3A65px%3Bheight%3A17px%3Bposition%3Aabsolute%3Btop%3A0%3Bright%3A0%7D.cy-ad-float-main%7Bmax-width%3A640px%3Bmax-height%3A100px%3Bmin-width%3A320px%3Bmin-height%3A50px%3Bdisplay%3Ablock%3Bmargin%3A0%20auto%7D.cy-ad-banner-container%7Bwidth%3A100%25%3Btext-align%3Acenter%3Bposition%3Arelative%7D.cy-ad-banner-close%7Bbackground-image%3Aurl(https%3A%2F%2Fchangyan.itc.cn%2Fmdevp%2Fextensions%2Fmobile-cy-av%2F025%2Fimage%2Fclose.png)%3Bbackground-size%3A100%25%3Bdisplay%3Ablock%3Bwidth%3A65px%3Bheight%3A17px%3Bposition%3Aabsolute%3Btop%3A0%3Bright%3A0%7D.cy-ad-banner-main%7Bwidth%3A100%25%3Bmax-height%3A100px%3Bmin-height%3A50px%3Bdisplay%3Ablock%3Bmargin%3A0%20auto%7D.cy-ad-banner-container%20a%2C.cy-ad-float-container%20a%7Bdisplay%3Ablock%7D%23SOHUCS%20.cy-wap-banner-iframe%7Bborder%3A0%3Bdisplay%3Ablock%3Bmargin%3Aauto%7D%23SOHUCS%20.cy-wap-banner-iframe-wrapper%7Bborder%3A0%3Bmargin%3Aauto%3Bdisplay%3Ablock%3Boverflow%3Ahidden%3Bposition%3Arelative%3Bz-index%3A2147483647%7D%23SOHUCS%20.cy-wap-float-iframe%7Bbottom%3A0%3Bborder%3A0%3Bdisplay%3Ablock%3Bleft%3A0%3Bmargin%3Aauto%3Bposition%3Afixed%3Bright%3A0%7D%23SOHUCS%20.cy-wap-float-iframe-wrapper%7Bborder%3A0%3Bbottom%3A0%3Bmargin%3Aauto%3Bdisplay%3Ablock%3Bleft%3A0%3Boverflow%3Ahidden%3Bposition%3Afixed%3Bright%3A0%3Bz-index%3A2147483647%7D%23SOHUCS%20.cy-iframe-close-btn%7Bbackground%3Agrey%3Bcursor%3Apointer%3Bcolor%3A%23fff%3Bfont-size%3A10px%3Bheight%3A20px%3Bline-height%3A20px%3Bposition%3Aabsolute%3Bright%3A0%3Btext-align%3Acenter%3Btop%3A0%3Bwidth%3A20px%3Bz-index%3A1%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.list-ctrl-area-wap%20.ctrl-item-wrapper-wap%20a%7Bcolor%3A%23bfbfbf%3Bpadding-right%3A10px%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.cmt-list-image-container%7Bposition%3Arelative%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.cmt-list-image-container%20.feed-image%7Bmax-width%3A100%25%3Bdisplay%3Ablock%7D%23SOHUCS%20%23SOHU_MAIN.cy-black-skin%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.list-content-info%20.list-cmt-feed-wap%7Bdisplay%3Ainline-block%3Bborder%3A1px%20solid%20%239dceff%3Bpadding%3A0%202px%3Bcolor%3A%239dceff%3Bmargin-left%3A8px%3Bborder-radius%3A3px%7D%23SOHUCS%20%23SOHU_MAIN.cy-black-skin%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.list-content-info%20.list-cmt-feed-wap%20a%7Bcolor%3A%239dceff%7D%23SOHUCS%20%23SOHU_MAIN%20.module-mobile-cmt-list%20.list-wrapper-wap%20.list-container-wap%20.list-item-wap%20.list-content-wrapper-wap%20.cmt-list-image-container%20.cy-ad-feed-close%7Bbackground-image%3Aurl(https%3A%2F%2Fchangyan.itc.cn%2Fmdevp%2Fextensions%2Fmobile-cy-av%2F025%2Fimage%2Fclose.png)%3Bbackground-size%3A100%25%3Bdisplay%3Ablock%3Bwidth%3A65px%3Bheight%3A17px%3Bposition%3Aabsolute%3Btop%3A0%3Bright%3A14px%7D"),i=window.document,o=i.createElement("style");o.id="seaJs-css",o.setAttribute("type","text/css");var r=i.getElementById("seaJs-css");r?i.all?r.styleSheet.cssText+=n:r.textContent+=n:i.all?(o.styleSheet.cssText=n,i.getElementsByTagName("head").item(0).appendChild(o)):(o.innerHTML=n,i.getElementsByTagName("head").item(0).appendChild(o))}),t("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/banner.html.js",function(e,t,a){"use strict";var n;return n=[],n.push('<div node-type="ad-wap-banner" class="cy-ad-banner-container">'),n.push('    <span node-type="cy-ad-banner-close" class="cy-ad-banner-close"></span>'),n.push('    <a href="$!{advertContent.landingUrl}" data-id="$!{advertId}" target="_blank">'),n.push('        <img node-type="ad-banner-main" class="cy-ad-banner-main" src="$!{advertContent.mediaUrl}">'),n.push("    </a>"),n.push("</div>"),n.join("\n")}),t("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/float.html.js",function(e,t,a){"use strict";var n;return n=[],n.push('<div node-type="ad-wap-float" class="cy-ad-float-container">'),n.push('    <span node-type="cy-ad-float-close" class="cy-ad-float-close"></span>'),n.push('    <a href="$!{advertContent.landingUrl}" data-id="$!{advertId}" target="_blank">'),n.push('        <img node-type="ad-float-main" class="cy-ad-float-main" src="$!{advertContent.mediaUrl}">'),n.push("    </a>"),n.push("</div>"),n.join("\n")}),t("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/feed.html.js",function(e,t,a){"use strict";var n;return n=[],n.push('<div node-type="ad-wap-feed" data-id="$!{advertId}" class="list-item-wap cy-clearfix">'),n.push('    #if($advertContent.flowIcon == "")'),n.push('        #set($advertContent.flowIcon = "https://assets.changyan.sohu.com/upload/asset/scs/images/pic/pic42_null.gif")'),n.push("    #end"),n.push('    <img node-type="photo" class="list-avatar-wap" src="$!{advertContent.flowIcon}" title="$!{advertContent.flowNick}">'),n.push('    <div class="list-content-wrapper-wap cy-clearfix">'),n.push('        <div class="list-content-info">'),n.push('            <span node-type="nickname" class="list-nickname-wap">$!{advertContent.flowNick}</span>'),n.push('            <span class="list-cmt-feed-wap"><a target="_blank" href="https://e.changyan.sohu.com">畅盈推广</a></span>'),n.push("        </div>"),n.push('        <div node-type="list-content-wap" class="list-content-wap">'),n.push("            $!{advertContent.flowContent}"),n.push("        </div>"),n.push('        <div class="cmt-list-image-container">'),n.push('            <span node-type="cy-ad-feed-close" class="cy-ad-feed-close"></span>'),n.push('            <a href="$!{advertContent.landingUrl}" target="_blank">'),n.push('                <img node-type="feed-image" class="feed-image" src="$!{advertContent.mediaUrl}">'),n.push("            </a>"),n.push("        </div>"),n.push('        <div class="list-ctrl-area-wap cy-clearfix">'),n.push('            <div class="ctrl-item-wrapper-wap">'),n.push('                <span><a node-type="feed-detail-link" href="$!{advertContent.landingUrl}" target="_blank">查看详情</a></span>'),n.push("            </div>"),n.push("        </div>"),n.push("    </div>"),n.push("</div>"),n.join("\n")}),a("/Users/yanhao/.nvm/versions/node/v6.9.2/lib/node_modules/mdevp/cache/www/mobile-cy-av/mobile-cy-av.js")}();