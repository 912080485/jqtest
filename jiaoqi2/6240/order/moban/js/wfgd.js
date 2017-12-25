
var speeds=80;
var wffahuo=document.getElementById('wffahuo');
var wffahuo1=document.getElementById('wffahuo1');
var wffahuo2=document.getElementById('wffahuo2');
wffahuo2.innerHTML=wffahuo1.innerHTML
function Marquee1(){
	if(wffahuo2.offsetHeight-wffahuo.scrollTop<=0)
	wffahuo.scrollTop-=wffahuo1.offsetHeight
	else{
		wffahuo.scrollTop++
	}
}
var MyMar1=setInterval(Marquee1,speeds)
wffahuo.onmouseover=function(){
	clearInterval(MyMar1)
}
wffahuo.onmouseout=function(){
	MyMar1=setInterval(Marquee1,speeds)
}
/*///////////////////////////////////////// WFORDERJSEND /////////////////////////////////////////*/