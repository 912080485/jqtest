<!-- #include file="adminhead.asp" -->
<%
if not isnumeric(request.querystring("id")) or isempty(request.querystring("id")) then
response.write("参数出错，请返回检查")
response.end()
end if

Dim Action
Action = LCase(Request("action"))
Select Case Trim(Action)
	Case "order"
	    conn.execute("delete from fg_order where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("删除订单成功","fg_order.asp")
	Case "delall"
	    conn.execute("delete from fg_order where id in "&"("&request.form("id")&")" )
            conn.close
            set conn= nothing
            response.write msgurl("订单批量删除成功","fg_order.asp")
	Case "user"
	    conn.execute("delete from fg_user where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("删除用户成功","fg_user.asp")
	Case "liuyan"
	    conn.execute("delete from fg_liuyan where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("删除留言成功","fg_liuyan.asp")
	Case "log"
	    conn.execute("delete from fg_log where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("删除日志成功","fg_log.asp")
	Case "admin"
	    conn.execute("delete from nanage where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("删除管理员成功","fg_admin.asp")
	Case Else
		Call show()
End Select
Sub show()
response.write("参数出错，请返回检查")
end sub
%>

