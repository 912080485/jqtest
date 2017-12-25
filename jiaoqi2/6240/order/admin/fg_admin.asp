<!-- #include file="adminhead.asp" -->
<table width="80%">
   <thead>
	<tr>
	<th>编    号</th>
	<th>账    户</th>
	<th>最近时间</th>
	<th>最近  IP</th>
	<th>上次时间</th>
	<th>上次  IP</th>
	<th>操    作</th>
	</tr>
   </thead>
   <tbody>
	<%
         set rst=server.createobject("adodb.recordset")
         sql="select * from nanage order by id desc"
         rst.open sql,conn,1,1
         if rst.bof or rst.eof then
         response.write "<tr><td colspan=7 align=center>没有记录</td></tr>"
         else
         do while not rst.eof
         %>
	<tr>
	<td><%=rst("id")%></td>
	<td><%=rst("username")%></td>
	<td><%=rst("logintime")%></td>
	<td><%=rst("loginip")%>--<script>document.write("<scr"+"ipt src='http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=<%=rst("loginip")%>'></sc"+"ript>");</script>
  <script> 
  var province = remote_ip_info.province;
  var ipcity = remote_ip_info.city;
  document.write(province+ipcity);
  </script></td>
	<td><%=rst("lasttime")%></td>
	<td><%=rst("lastip")%>--<script>document.write("<scr"+"ipt src='http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=<%=rst("lastip")%>'></sc"+"ript>");</script>
  <script> 
  var province = remote_ip_info.province;
  var ipcity = remote_ip_info.city;
  document.write(province+ipcity);
  </script></td>
	<td>
	<a href="fg_admin.asp?id=<%=rst("id")%>" title="编 辑">编辑</a>
	<a href="del.asp?action=admin&id=<%=rst("id")%>" title="删 除" onClick="return window.confirm('您确定要删除吗?删除后不能恢复!  ');" >删除</a> 
	</td>
	</tr>
	<%
         rst.movenext
         loop
        end if 
	rst.close
        set rst=nothing
	 %> 
	</tbody>
</table>				


<%
if request.querystring("action")="addnew" and request.form("username")<>"" then
set rst = server.CreateObject("Adodb.Recordset")
sql="select * from nanage where username='"&request.Form("username")&"'"
rst.open sql,conn,1,3
if rst.eof then
rst.addnew
rst("username") =  request.Form("username")
rst("password") =  md5(request.Form("password"))
rst.update
rst.close
set rst = nothing
response.write msgsx("添加成功")
else
rst.close
set rst = nothing
response.write msgbsx("管理员存在。添加失败")
end if
response.end()
end if
%>
<%
if request.querystring("action")="xiugai" and request.querystring("id")<>"" and isnumeric(request.querystring("id")) then
set rst = server.CreateObject("Adodb.Recordset")
sql="select * from nanage where id="&request.querystring("id")
rst.open sql,conn,1,3
rst("username") =  request.Form("username")
rst("password") =  md5(request.Form("password"))
rst.update
rst.close
set rst = nothing
response.write msgsx("修改成功")
response.end()
end if
%>
<%
if not errorString(request.querystring("id"),1) then
   set rst=server.createobject("adodb.recordset")
   sql="select * from  nanage  where id="&request.querystring("id")
   rst.open sql,conn,1,1
   if rst.eof then
   response.write "没有记录"
   else
   actionurl="?action=xiugai&id="&request.querystring("id")
   username=rst("username") 
   submitname="修改"
   end if 
   rst.close
   set rst=nothing
else
   actionurl="?action=addnew"
   submitname="添加" 
end if   
%>
       <table width="80%" border="1">
	   <form action="<%=actionurl%>" method="post" name="form">
          <tr>
          <td width="15%" scope="col">管理员用户名：</th>
          <td width="85%" scope="col"><input class="text-input small-input" type="text" id="small-input" name="username" value="<%=username%>" <%if username<>"" then%>readonly="readonly"<%end if%> /></th>
          </tr>
          <tr>
          <td width="15%" scope="col">管理员密码：</th>
          <td width="85%" scope="col"><input class="text-input small-input" type="text" id="small-input" name="password" value="" /></th>
          </tr>
           <tr>
           <td></td>
           <td><input class="button" type="submit" name="submit" value="<%=submitname%>" /></td>
           </tr>
	     </form>
</table>
<!-- #include file="adminfoot.asp" -->