var marquee = new Array(
    "<p><span>[���¹���]��</span>��**��130****3260����1����ǰ�����ɹ�  <font color='#FF0000'>��</font></p>",
    "<p><span>[���¹���]��</span>��**��136****7163����3����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
    "<p><span>[���¹���]��</span>��**��139****1955����5����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
    "<p><span>[���¹���]��</span>��**��180****6999����2����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
    "<p><span>[���¹���]��</span>��**��151****2588����4����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
    "<p><span>[���¹���]��</span>��**��133****4663����6����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
	"<p><span>[���¹���]��</span>��**��139****2464����8����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
	"<p><span>[���¹���]��</span>��**��137****4323����10����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
	"<p><span>[���¹���]��</span>��**��136****3495����12����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
	"<p><span>[���¹���]��</span>��**��135****4345����15����ǰ�����ɹ� <font color='#FF0000'>��</font></p>",
	"<p><span>[���¹���]��</span>л**��135****2687����20����ǰ�����ɹ� <font color='#FF0000'>��</font></p>"
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