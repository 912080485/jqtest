<!-- #include file="adminhead.asp" -->
<%
if not errorString(request.querystring("id"),1) then
if request.form("submit")="修改" then
   set rst = server.CreateObject("Adodb.Recordset")
   sql="select * from fg_order where id="&request.querystring("id")
   rst.open sql,conn,1,3
   rst("beizhu") =  dvHTMLEncode(Trim(Request.Form("beizhu")))
   rst.update
   rst.close
   set rst = nothing
   conn.close
   set conn= nothing
   response.write msgurl("订单处理成功","fg_order.asp")
end if
%>
<%
set rst=server.createobject("adodb.recordset")
sql="select * from fg_order where id="&request.querystring("id")
rst.open sql,conn,1,1
if rst.eof then
response.write "没有记录"
else
%>
<table width="50%" border="1">
<form action="" method="post">
  <tr>
    <td colspan="2"><div align="center">订单处理</div></td>
  </tr>
  <tr>
    <td width="41%"><div align="right">订购信息</div></td>
    <td width="59%"><%=rst("order")%></td>
  </tr>
  <tr>
    <td><div align="right">订购IP</div></td>
    <td><%=rst("ip")%><br><script src="../inc/ip.asp?show=1&ip=<%=rst("ip")%>"></script></td>
  </tr>
  <tr>
    <td><div align="right">添加备注</div></td>
    <td><TEXTAREA name=beizhu rows=3 cols=36><%=rst("beizhu")%></TEXTAREA></td>
  </tr>
  <tr>
    <td><div align="right"></div></td>
    <td><input name="submit" type="submit" value="修改" /></td>
  </tr>
 </form>
</table>
<% 
end if 
rst.close
set rst=nothing%>
<%end if%>
<!-- #include file="adminfoot.asp" -->