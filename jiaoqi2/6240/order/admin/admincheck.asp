<%
if session("adminname")="" then response.redirect "fg_login.asp"
if errorstring(session("adminname"),2) then response.write msgurl("有点问题...","fg_login.asp"):response.end

sql="select username from nanage where username='" & session("adminname") & "' "
set rs=conn.execute(sql)
if rs.eof and rs.bof then
  rs.close
  response.Redirect("fg_login.asp")
  response.End()
end if
%>