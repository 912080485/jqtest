<%
on error resume next
dim conn,dbpath
set conn=Server.CreateObject("adodb.connection")
dbpath="data/"
connstr="provider=microsoft.jet.oledb.4.0;data source="&Server.MapPath(dbpath & "db1.zzfhw")
'conn.open "DRIVER=Driver do Microsoft Access (*.mdb);DBQ="&Server.MapPath(dbpath & "db1.zzfhw")
conn.open connstr
%>
<!-- #include file="config.asp" -->
<%
if request.querystring("id")<>"" and not isnumeric(request.querystring("id")) then
response.write(msgsx("²ÎÊý³ö´í"))
response.end()
end if
%>