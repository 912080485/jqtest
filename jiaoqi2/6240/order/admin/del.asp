<!-- #include file="adminhead.asp" -->
<%
if not isnumeric(request.querystring("id")) or isempty(request.querystring("id")) then
response.write("���������뷵�ؼ��")
response.end()
end if

Dim Action
Action = LCase(Request("action"))
Select Case Trim(Action)
	Case "order"
	    conn.execute("delete from fg_order where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("ɾ�������ɹ�","fg_order.asp")
	Case "delall"
	    conn.execute("delete from fg_order where id in "&"("&request.form("id")&")" )
            conn.close
            set conn= nothing
            response.write msgurl("��������ɾ���ɹ�","fg_order.asp")
	Case "user"
	    conn.execute("delete from fg_user where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("ɾ���û��ɹ�","fg_user.asp")
	Case "liuyan"
	    conn.execute("delete from fg_liuyan where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("ɾ�����Գɹ�","fg_liuyan.asp")
	Case "log"
	    conn.execute("delete from fg_log where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("ɾ����־�ɹ�","fg_log.asp")
	Case "admin"
	    conn.execute("delete from nanage where id="&request.querystring("id") )
            conn.close
            set conn= nothing
            response.write msgurl("ɾ������Ա�ɹ�","fg_admin.asp")
	Case Else
		Call show()
End Select
Sub show()
response.write("���������뷵�ؼ��")
end sub
%>

