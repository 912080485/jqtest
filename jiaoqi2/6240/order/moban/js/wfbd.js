
window.onerror = function(){return true;}
function $(id){return document.getElementById(id);}  
function getHeight(){$("wffahuo").style.height=$("wfforml").offsetHeight-85+"px";}  
window.onload = function(){getHeight();}  
/*///////////////////////////////////////// WFORDERJSFGX /////////////////////////////////////////*/
function postcheck(){
    try{
		if (document.wfform.wfname.value==""){
			alert('请填写姓名！');
			document.wfform.wfname.focus();
			return false;
		}
		var wfname = /^[\u4e00-\u9fa5]{2,6}$/;
		if (!wfname.test(document.wfform.wfname.value)){
			alert('姓名格式不正确，请重新填写！');
			document.wfform.wfname.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.wfform.wfmob.value==""){
			alert('请填写手机号码！');
			document.wfform.wfmob.focus();
			return false;
		}
		var wfform = /^1[3,4,5,7,8]\d{9}$/;
		if (!wfform.test(document.wfform.wfmob.value)){
			alert('手机号码格式不正确，请重新填写！');
			document.wfform.wfmob.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.wfform.wfprovince.value==""){
			alert('请选择所在地区！');
			document.wfform.wfprovince.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.wfform.wfaddress.value==""){
			alert('请填写详细地址！');
			document.wfform.wfaddress.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    try{
		if (document.wfform.wfemail.value==""){
			alert('请填写E-MAIL！');
			document.wfform.wfemail.focus();
			return false;
		}
		var wfemail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if (!wfemail.test(document.wfform.wfemail.value)){
			alert('E-MAIL格式不正确，请重新填写！');
			document.wfform.wfemail.focus();
			return false;
		}
    }
    catch(ex){
    } 	
    document.wfform.wfsubmit.disabled = true;
    document.wfform.wfsubmit.value="提交成功 >>";
    return true;
}
try{	
new PCAS("wfprovince","wfcity","wfarea");
}
catch(ex){
} 	
try{	
	var thissrc = document.getElementById("wfcode").src;
	function refreshCode(){
		document.getElementById("wfcode").src=thissrc+"?wfaction=codeimg&imgw=70&imgh=29&temp="+Math.random(); 
	}
}
catch(ex){
} 	
/*///////////////////////////////////////// WFORDERJSFGX /////////////////////////////////////////*/
function pricea(){
	var wfproduct = document.wfform.wfproduct.alt;
	for(var i=0;i<document.wfform.wfproduct.length;i++){
		if(document.wfform.wfproduct[i].checked==true){
			var wfproduct = document.wfform.wfproduct[i].alt;
			break;
		}
	}
    if(document.wfform.wfmun.value=="" || document.wfform.wfmun.value==0){	
		var wfmun=1;
	}
	else{
		var wfmun=document.wfform.wfmun.value;
	}	
	var wfprice=wfproduct*wfmun;
	document.wfform.wfprice.value=wfprice;
	document.getElementById("showprice").innerHTML=wfprice;
}
function priceb(){
    var wfcpxljg = document.getElementById("wfproduct");
    var wfproduct = wfcpxljg.options[document.getElementById("wfproduct").options.selectedIndex].title; 
    if(document.wfform.wfmun.value=="" || document.wfform.wfmun.value==0){	
		var wfmun=1;
	}
	else{
		var wfmun=document.wfform.wfmun.value;
	}	
	var wfprice=wfproduct*wfmun;
	document.wfform.wfprice.value=wfprice;
	document.getElementById("showprice").innerHTML=wfprice;
}
/*///////////////////////////////////////// WFORDERJSFGX /////////////////////////////////////////*/
function changeItem(i){
    var k = 3;
	for(var j = 0;j < k;j++){
	    if(j == i){
		    document.getElementById("paydiv" + j).style.display = "block";
		}
		else{		
		    document.getElementById("paydiv" + j).style.display = "none";
		}
	}
}
function opay(){
	document.getElementById("wfform").target="_parent";
}
function opay2(){
    document.getElementById("wfform").target="_blank";
}
/*///////////////////////////////////////// WFORDERJSFGX /////////////////////////////////////////*/
var wfllref = '';
if (document.referrer.length > 0){
	wfllref = document.referrer;
}
try{
	if (wfllref.length == 0 && opener.location.href.length > 0){
    wfllref = opener.location.href;
	}
}
catch (e){}
document.cookie="WFLLURL=" + wfllref + ";path=/";
document.getElementById("wfddll").value = window.top.document.referrer;
/*///////////////////////////////////////// WFORDERJSEND /////////////////////////////////////////*/