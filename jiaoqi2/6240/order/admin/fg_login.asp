<!-- #include file="conn.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
if request.querystring("action")="login" then

 if errorstring(request.form("username"),2) then response.write msg("�û���ֻ�ܰ������ֻ���ĸ"):response.end
  username=dvHTMLEncode(Trim(Request.Form("username")))
  password=md5(Request.Form("password"))
  set rs=server.createobject("adodb.recordset")
  sql="select * from nanage where username='"&username&"' and password='"&password&"'"
  rs.open sql,conn,1,3
  if rs.bof and rs.eof then 
  response.write msg("�û��������������,����������")
  response.end()
  else
  session("adminname")=username
  session("ip")=getip()
  rs("lastip")=rs("loginip")
  rs("loginip")=getip()
  rs("lasttime")=rs("logintime")
  rs("logintime")=now()
  rs.update
  rs.close
  set rs=nothing
  conn.execute("insert into [fg_log] (username,ip) VALUES ('"&username&"','"&getip()&"')")
  response.write msgrd("��¼�ɹ�","index.asp")
  response.end()
  end if
%>
<%else%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<meta http-equiv="Content-Language" content="zh-CN" />
	<link rel="stylesheet" rev="stylesheet" href="../images/login.css" type="text/css" media="screen" />
	<title>����ϵͳ�����-����Ա��¼</title>
<script language='javascript'>
if (top != self)top.location.href = "fg_login.asp"; 
</script>

</head>
<body>
<div style="display:none"><iframe id="msgloginasp" name="msgloginasp" width=0 height=0></iframe></div>
<div class="flash">

<embed pluginspage=http://www.macromedia.com/go/getflashplayer src="../images/mayi.swf" width="100%" height="100%" type=application/x-shockwave-flash wmode="transparent" quality="high">

</div>
<div class="bg">
<div id="wrapper">
  <div class="logo"><img src="../images/none.gif" title="�û���¼" alt="�û���¼"/></div>
  <div class="login">
    <form  method="post" action="?action=login" target="msgloginasp">
    <dl>
      <dd><label for="username">�û���:</label><input type="text" id="username" name="username" size="20" tabindex="1" /></dd>
      <dd><label for="password">����:</label><input type="password" id="password" name="password" size="20" tabindex="2" /></dd>
	  <dd><input id="btnPost" name="btnPost" type="submit" value="��¼" class="button" tabindex="4"/></dd>
    </dl>
    </form>
  </div>

</div>
</div>

</body>
</html>
<%end if%>
