<!-- #include file="conn.asp" -->
<!-- #include file="../inc/md5.asp" -->
<!-- #include file="admincheck.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����˵�</title>
<style type="text/css">
<!--
*{margin:0;padding:0;border:0;}
body {
 font-size:14px;
 BORDER-RIGHT: #cccccc 1px solid;
 BORDER-TOP: white 1px solid;
 FONT-SIZE: 14px;
 PADDING-BOTTOM: 2px;
 BORDER-LEFT: white 1px solid;
 CURSOR: hand;
 PADDING-TOP: 2px;
 BORDER-BOTTOM: #cccccc 1px solid;
 BACKGROUND-COLOR: #eeeeee; /*����Ŀ¼�ı���ɫ*/
}
#nav {
 width:170px;
 line-height: 18px;
 list-style-type: none;
 text-align:left;
}
#nav a {
 width: 170px;
 display: block;
 padding-left:20px;
 /*Width(һ��Ҫ)�����������Li�����*/
}
#nav li {
 background:#bbde79; /*һ��Ŀ¼�ı���ɫ*/
 width: 190px;
 float:left;
 BORDER-RIGHT: #8c8c8c 1px solid;
 BORDER-TOP: #dbfe99 1px solid;
 FONT-SIZE: 15px;
 PADDING-BOTTOM: 2px;
 BORDER-LEFT: #dbfe99 1px solid;
 CURSOR: hand;
 COLOR: black;
 PADDING-TOP: 4px;
 BORDER-BOTTOM: #8c8c8c 1px solid;
background: #BBDE78 url('') no-repeat left center;
 /*float��left,����Ӧ�����ã���������Firefox����������ʾ
 �̳�Nav��width,���ƿ�ȣ�li�Զ���������*/
}
#nav li a:hover{
 url('') no-repeat left center; /*һ��Ŀ¼onMouseOver��ʾ�ı���ɫ*/
}
#nav a:link  {
 color:#666; text-decoration:none;
}
#nav a:visited  {
 color:#666;text-decoration:none;
}
#nav a:hover  {
 color:#FFF;text-decoration:none;font-weight:bold;
}
/*=======����Ŀ¼=========*/
#nav li ul {
 list-style:none;
 text-align:left;
}
#nav li ul li{ 
 width:178px;
 BORDER-RIGHT: #cccccc 1px solid;
 BORDER-TOP: white 1px solid;
 FONT-SIZE: 14px;
 PADDING-BOTTOM: 2px;
 BORDER-LEFT: white 1px solid;
 CURSOR: hand;
 PADDING-TOP: 2px;
 PADDING-LEFT: 12px;
 BORDER-BOTTOM: #cccccc 1px solid;
 BACKGROUND-COLOR: #eeeeee; /*����Ŀ¼�ı���ɫ*/
}
#nav li ul a{
         padding-left:20px;
         width:150px;
 /* padding-left����Ŀ¼�����������ƶ�����Width������������=(�ܿ��-padding-left)*/
}
/*�����Ƕ���Ŀ¼��������ʽ*/
#nav li ul a:link  {
 color:#666; text-decoration:none;
}
#nav li ul a:visited  {
 color:#666;text-decoration:none;
}
#nav li ul li a:hover {
 background:#d5d5d5;
 text-decoration:none;
 font-weight:normal;
}

#nav li:hover ul {
 left: auto;
}
#nav li.sfhover ul {
 left: auto;
}
#content {
 clear: left;
}
#nav ul.collapsed {
 display: none;
}
-->
#PARENT{
 width:200px;
 padding-left:0px;
}
</style>
<script type=text/javascript><!--
var LastLeftID = "";
function menuFix() {
 var obj = document.getElementById("Nav").getElementsByTagName("li");
  
 for (var i=0; i<obj.length; i++) {
  obj[i].onmouseover=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseDown=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onMouseUp=function() {
   this.className+=(this.className.length>0? " ": "") + "sfhover";
  }
  obj[i].onmouseout=function() {
   this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"), "");
  }
 }
}
function DoMenu(emid)
{
 var obj = document.getElementById(emid); 
 obj.className = (obj.className.toLowerCase() == "expanded"?"collapsed":"expanded");
 if((LastLeftID!="")&&(emid!=LastLeftID)) //�ر���һ��Menu
 {
  document.getElementById(LastLeftID).className = "collapsed";
 }
 LastLeftID = emid;
}
function GetMenuID()
{
 var MenuID="";
 var _paramStr = new String(window.location.href);
 var _sharpPos = _paramStr.indexOf("#");
  
 if (_sharpPos >= 0 && _sharpPos < _paramStr.length - 1)
 {
  _paramStr = _paramStr.substring(_sharpPos + 1, _paramStr.length);
 }
 else
 {
  _paramStr = "";
 }
 
 if (_paramStr.length > 0)
 {
  var _paramArr = _paramStr.split("&");
  if (_paramArr.length>0)
  {
   var _paramKeyVal = _paramArr[0].split("=");
   if (_paramKeyVal.length>0)
   {
    MenuID = _paramKeyVal[1];
   }
  }
 }
 
 if(MenuID!="")
 {
  DoMenu(MenuID)
 }
}
GetMenuID(); //*function˳��Ҫע�⣬������Firefox��GetMenuID()����Ч����
menuFix();
-->
</script>
</head>
<body>
<div id="PARENT">
<ul id="nav">
<li></li>
<li></li>
<li><a href="fg_main.asp" target="mainFrame">��̨��ҳ</a></li>
<li><a href="#Menu=ChildMenu1"  onclick="DoMenu('ChildMenu1')">�����޸�</a>
<ul id="ChildMenu1" class="collapsed">
 <li><a href="fg_admin.asp" target="mainFrame">����Ա�����޸�</a></li>
 </ul>
</li>
<li><a href="#Menu=ChildMenu2" onclick="DoMenu('ChildMenu2')">��������</a>
 <ul id="ChildMenu2" class="collapsed">
 <li><a href="fg_order.asp" target="mainFrame">�����б�</a></li>
 </ul>
</li>
<li><a href="fg_loginout.asp" target="mainFrame">�˳���̨</a></li>
<li>
 <ul>
 <li></li>
 <li></li>
 <li></li>
 <li></li>
 <li></li>
 <li></li>
 <li></li>
 </ul>
</li>
</ul>

</ul>
</div>
</body>
</html>