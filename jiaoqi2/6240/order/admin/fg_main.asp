<!-- #include file="adminhead.asp" -->
<table width="50%" border="1">
 <tr>
  <th>&nbsp;</th>
 </tr>
 <tr>
  <td>欢迎使用 飞鸽订单管理系统</td>
 </tr>	
 
 <tr>
  <td>最近五次登陆记录</td>
 </tr>
<%
set rst=server.createobject("adodb.recordset")
sql="select top 5 * from fg_log order by 1 desc"
rst.open sql,conn,1,1
if rst.eof then
response.write "<tr><td>没有登陆记录</td></tr>"
else
do while not rst.eof
%>
 <tr>
  <td>登陆用户:<font color="red"><%=rst("username")%></font>-----登陆时间:<font color="red"><%=rst("time")%></font>-----登陆IP:<font color="red"><%=rst("ip")%></font>-----登陆地点:<font color="red">  <script>document.write("<scr"+"ipt src='http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=<%=rst("ip")%>'></sc"+"ript>");</script>
  <script> 
  var province = remote_ip_info.province;
  var ipcity = remote_ip_info.city;
  document.write(province+ipcity);
  </script></font></td>
 </tr>
<%
rst.movenext
loop   
end if 
rst.close
set rst=nothing
conn.close
set conn=nothing%>	
</table>
<!-- #include file="adminfoot.asp" -->
	

