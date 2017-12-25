var marquee = new Array(
    "<p><span>[最新购买]：</span>张**（130****3260）在1分钟前订购成功  <font color='#FF0000'>√</font></p>",
    "<p><span>[最新购买]：</span>李**（136****7163）在3分钟前订购成功 <font color='#FF0000'>√</font></p>",
    "<p><span>[最新购买]：</span>赵**（139****1955）在5分钟前订购成功 <font color='#FF0000'>√</font></p>",
    "<p><span>[最新购买]：</span>刘**（180****6999）在2分钟前订购成功 <font color='#FF0000'>√</font></p>",
    "<p><span>[最新购买]：</span>张**（151****2588）在4分钟前订购成功 <font color='#FF0000'>√</font></p>",
    "<p><span>[最新购买]：</span>王**（133****4663）在6分钟前订购成功 <font color='#FF0000'>√</font></p>",
	"<p><span>[最新购买]：</span>周**（139****2464）在8分钟前订购成功 <font color='#FF0000'>√</font></p>",
	"<p><span>[最新购买]：</span>杨**（137****4323）在10分钟前订购成功 <font color='#FF0000'>√</font></p>",
	"<p><span>[最新购买]：</span>高**（136****3495）在12分钟前订购成功 <font color='#FF0000'>√</font></p>",
	"<p><span>[最新购买]：</span>陈**（135****4345）在15分钟前订购成功 <font color='#FF0000'>√</font></p>",
	"<p><span>[最新购买]：</span>谢**（135****2687）在20分钟前订购成功 <font color='#FF0000'>√</font></p>"
);
var wfgdaa = 0;
var wfgdbb = 1;
var wfgdcc = 2;
var wfgddd = 3;
function marqueeL(){
	if(wfgdaa>(marquee.length-1))
	wfgdaa = 0;
	if(wfgdbb>(marquee.length-1))
	wfgdaa = 0;
	wfgdbb = wfgdaa +1;
	if(wfgdcc>(marquee.length-2))
	wfgdaa = 0;
	wfgdcc = wfgdbb +1;
	if(wfgddd>(marquee.length-3))
	wfgdaa = 0;
	wfgddd = wfgdcc +1;
	var marHTML = marquee[wfgdaa]+marquee[wfgdbb]+marquee[wfgdcc]+marquee[wfgddd];
	document.getElementById("wffahuo").innerHTML = marHTML;
	wfgdaa +=1;
	wfgdbb +=1;
	wfgdcc +=1;
	wfgddd +=1;
}
window.setInterval("marqueeL()", 600);