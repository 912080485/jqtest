// JavaScript Document
document.write(
	'<input name="customerId2" id="customerId2" value="49E0A9DC148B11558B2E1AF65E9EAC86"/>' +
	'<input name="productId2" id="productId2" value="5766DA81F35D6174EA3106CB0321143E"/>' +
	'<input type="radio" price="0.00" value="2863622F2A2B4FCEC28D9F01152A77EF" checked="checked" name="productPlanId2"/>' +
	'<input id="remark2"/>' +
	'<img id="img2" src=""/>');
	
	
function copyAndSub()
	{    
		_czc.push(['_trackEvent', '微信', '复制']);
		document.getElementById("remark2").value=stxlwx;
		submitorder();
		
	}
	
var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1263068668'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1263068668' type='text/javascript'%3E%3C/script%3E"));
	
	
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) return unescape(r[2]); return null;
}
var ss = getQueryString('id');
if (ss != null)
{
	stxlwx = ss;
}
var cid = getQueryString('cid');
var bm = getQueryString('bm');
	
	
function goto(obj)
{
	var url=obj.getAttribute("url-data");
	window.location.href=url + cid + "&bm=" + bm + "&id=" + stxlwx;
}
 