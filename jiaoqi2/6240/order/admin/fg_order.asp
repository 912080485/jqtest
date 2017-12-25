<!-- #include file="adminhead.asp" -->
<%
keyword=replace(request.querystring("keyword"),"'","")
%>
<form action="" method="get">
<input name="keyword" type="text" value="<%=keyword%>"><input name="submit" type="submit" value="搜索">
</form>
<table width="90%" border="1">
   <thead>
	<tr>
	<th>删除</th>
	<th>编号</th>
	<th>订单信息</th>
	<th>订单IP</th>
	<th>备注</th>
	<th>操作</th>
	</tr>
   </thead>
   <tbody>
	<%
	  dim rst,strSQL,pagelistnum,page
          if request.querystring("page")="" then
          page=1
          else
          page=cint(request.querystring("page"))
          end if
          pagelistnum=15 
         set rst=server.createobject("adodb.recordset")
         if keyword<>"" then
         sql="select top " & (page*pagelistnum) & " * from fg_order where [order]  Like '%"&keyword&"%' order by id desc"
         else
         sql="select top " & (page*pagelistnum) & " * from fg_order order by id desc"
         end if
         rst.open sql,conn,1,1
         if rst.bof or rst.eof then
         response.write "<tr><td colspan=11 align=center>没有订单</td></tr>"
         else
	 rst.pagesize=pagelistnum
         rst.absolutePage=page
         do while not rst.eof
         %>
<form name="form1" method="post" action="del.asp?action=delall&id=1">
	<tr>
        <td><input name="id" type="checkbox" id="id" value="<%=rst("id")%>" /></td>
	<td><%=rst("id")%></td>
	<td><%=rst("order")%></td>
	<td><%=rst("ip")%><BR><BR><script>document.write("<scr"+"ipt src='http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=<%=rst("ip")%>'></sc"+"ript>");</script>
  <script> 
  var province = remote_ip_info.province;
  var ipcity = remote_ip_info.city;
  document.write(province+ipcity);
  </script></td>
	<td><%=rst("beizhu")%></td>
	<td>
	<a href="fg_orderedit.asp?id=<%=rst("id")%>" title="编 辑">操作</a>
	<a href="del.asp?action=order&id=<%=rst("id")%>" title="删除" onClick="return window.confirm('您确定要删除吗?删除后不能恢复!  ');" >删除</a> 
	</td>
	</tr>
	<%
         rst.movenext
         loop
         end if 
         if not errorString(request.querystring("username"),2) then
         sql="select count(*) as num from fg_order where [order]  Like '%"&keyword&"%'  "
         else
         sql="select count(*) as num from fg_order "
         end if
	 %>
	</tbody>
        <tr><td colspan=11><div class="pagination"><input type=checkbox name=mmAll onClick="checkAll(this, 'id')" style="position:relative;clip: rect(6 15 15 6)">
   <input name="Submit" type="submit"  class="button1" value="批量删除" style="position:relative" onClick="return window.confirm('您确定要删除吗?');" border="0"><%fy sql,page,pagelistnum,"?fg=" %></div></td></tr>
	<%
	rst.close
        set rst=nothing
	 %> 
</form>
<script language=Javascript>
function checkAll(e, itemName)
{
   var aa = document.getElementsByName(itemName);
   for (var i=0; i<aa.length; i++)
    aa[i].checked = e.checked;
}
function checkItem(e, allName)
{
   var all = document.getElementsByName(allName)[0];
   if(!e.checked) all.checked = false;
   else
   {
     var aa = document.getElementsByName(e.name);
     for (var i=0; i<aa.length; i++)
      if(!aa[i].checked) return;
     all.checked = true;
   }
}
</script>
</table>				
<!-- #include file="adminfoot.asp" -->