<!-- #include file="adminhead.asp" -->
<table width="80%">
   <thead>
	<tr>
	<th>��    ��</th>
	<th>��    ��</th>
	<th>���ʱ��</th>
	<th>���  IP</th>
	<th>�ϴ�ʱ��</th>
	<th>�ϴ�  IP</th>
	<th>��    ��</th>
	</tr>
   </thead>
   <tbody>
	<%
         set rst=server.createobject("adodb.recordset")
         sql="select * from nanage order by id desc"
         rst.open sql,conn,1,1
         if rst.bof or rst.eof then
         response.write "<tr><td colspan=7 align=center>û�м�¼</td></tr>"
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
	<a href="fg_admin.asp?id=<%=rst("id")%>" title="�� ��">�༭</a>
	<a href="del.asp?action=admin&id=<%=rst("id")%>" title="ɾ ��" onClick="return window.confirm('��ȷ��Ҫɾ����?ɾ�����ָܻ�!  ');" >ɾ��</a> 
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
response.write msgsx("��ӳɹ�")
else
rst.close
set rst = nothing
response.write msgbsx("����Ա���ڡ����ʧ��")
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
response.write msgsx("�޸ĳɹ�")
response.end()
end if
%>
<%
if not errorString(request.querystring("id"),1) then
   set rst=server.createobject("adodb.recordset")
   sql="select * from  nanage  where id="&request.querystring("id")
   rst.open sql,conn,1,1
   if rst.eof then
   response.write "û�м�¼"
   else
   actionurl="?action=xiugai&id="&request.querystring("id")
   username=rst("username") 
   submitname="�޸�"
   end if 
   rst.close
   set rst=nothing
else
   actionurl="?action=addnew"
   submitname="���" 
end if   
%>
       <table width="80%" border="1">
	   <form action="<%=actionurl%>" method="post" name="form">
          <tr>
          <td width="15%" scope="col">����Ա�û�����</th>
          <td width="85%" scope="col"><input class="text-input small-input" type="text" id="small-input" name="username" value="<%=username%>" <%if username<>"" then%>readonly="readonly"<%end if%> /></th>
          </tr>
          <tr>
          <td width="15%" scope="col">����Ա���룺</th>
          <td width="85%" scope="col"><input class="text-input small-input" type="text" id="small-input" name="password" value="" /></th>
          </tr>
           <tr>
           <td></td>
           <td><input class="button" type="submit" name="submit" value="<%=submitname%>" /></td>
           </tr>
	     </form>
</table>
<!-- #include file="adminfoot.asp" -->