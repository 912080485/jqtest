<%
'=============================================================
''��ʾ��Ϣ
'=============================================================
Function msg(str)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(str) then  Response.Write "alert(""" & str & """);" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function

Function msgno(str)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(str) then  Response.Write "alert(""" & str & """);" & vbCrLf
Response.Write "</script>" & vbCrLf
'Response.End
End Function

Function msgrd(msg,msgurls)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "top.location.href='"&msgurls&"';" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function


'=============================================================
''��ʾ��Ϣ,����ԭҳ��-����ҳ��ˢ��
'=============================================================
Function msgsx(msg)
fromurl=request.servervariables("HTTP_REFERER")
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then     Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "location.href='"&fromurl&"';" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function

'=============================================================
''��ʾ��Ϣ,����ԭҳ�治ˢ��
'=============================================================
Function msgurl(msg,msgurls)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "location.href='"&msgurls&"';" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function

'=============================================================
''��ʾ��Ϣ,����ԭҳ�治ˢ��
'=============================================================
Function msgbsx(msg)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then     Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "window.history.go(-1);" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function


'��ҳ���� �����б�
'sql ��ѯ���м�¼������SQL���  
'page ��ǰҳ  
'pagelistnumÿҳ��ʾ��¼�� 
'link��ҳ���ӳ�PAGE������
'ʾ����fy (sql,page,pagelistnum,link)
function fy(sql,page,pagelistnum,link)
  dim rs,znum,zpage
  page=cint(page)'��PAGEת��Ϊ����
  set rs=server.CreateObject("adodb.recordset")
  'sql="select count(*) as num from "+sql
  rs.open sql,conn,1,1
  znum=rs("num")
  '�õ���ҳ��
  zpage=znum\pagelistnum
  if znum mod pagelistnum>0 then zpage=zpage+1
  '�õ���һҳ����һҳ���� 
  if page=1 then
    response.Write "<a href='#'>&laquo; �� ҳ</a> <a href='#'>&laquo; ��һҳ</a> "
  else
    response.Write "<a href=" & link & "&page=1>&laquo; �� ҳ</a> <a href=" & link & "&page=" & (page-1) & ">&laquo; ��һҳ</a> "
  end if
  response.Write "<a href='#' class='number' title="&"�ܹ�"&znum&"����¼"&">"&zpage&"/"&znum&"</a>"
  if page>zpage and zpage>1 then 
  response.write msgsx("�޴�ҳ��")
  response.end()
  end if
if zpage<5 then
for x=1 to zpage
  if x=page then
  response.Write "<a href=" & link & "&page="&x&" class='number current'>"&x&"</a>"
  else
  response.Write "<a href=" & link & "&page="&x&" class='number'>"&x&"</a>"
  end if
next
else
  if page=1 then
  response.Write "<a href=" & link & "&page=1 class='number current' title='1'>1</a>"
  response.Write "<a href=" & link & "&page=2 class='number' title='2'>2</a>"
  response.Write "<a href=" & link & "&page=3 class='number' title='3'>3</a>"
  response.Write "<a href=" & link & "&page=4 class='number' title='4'>4</a>"
  response.Write "<a href=" & link & "&page=5 class='number' title='5'>5</a>"
  elseif page=2 then
  response.Write "<a href=" & link & "&page=1 class='number' title='1'>1</a>"
  response.Write "<a href=" & link & "&page=2 class='number current' title='2'>2</a>"
  response.Write "<a href=" & link & "&page=3 class='number' title='3'>3</a>"
  response.Write "<a href=" & link & "&page=4 class='number' title='4'>4</a>"
  response.Write "<a href=" & link & "&page=5 class='number' title='5'>5</a>"
  else
  response.Write "<a href=" & link & "&page=" & (page-2) & " class='number' title="&page-2&">"&page-2&"</a>"
  response.Write "<a href=" & link & "&page=" & (page-1) & " class='number' title="&page-1&">"&page-1&"</a>"
  response.Write "<a href=" & link & "&page=" & (page) & " class='number current' title="&page&">"&page&"</a>"
  response.Write "<a href=" & link & "&page=" & (page+1) & " class='number' title="&page+1&">"&page+1&"</a>"
  response.Write "<a href=" & link & "&page=" & (page+2) & " class='number' title="&page+2&">"&page+2&"</a>"
  end if
end if
  '�õ���һҳ�����ҳ����
  if page<zpage then
    response.Write "<a href=" & link & "&page=" & (page+1) & ">��һҳ &raquo;</a> <a href=" & link & "&page=" & zpage & ">���ҳ&raquo;</a>"
  else
    response.Write "<a href='#' title='��һҳ'>��һҳ &raquo;</a><a href='#' title='β ҳ'>β ҳ &raquo;</a> "
  end if
  rs.close
  set rs=nothing
end function

'Request.querystring���˺�����  
'ʾ����sub_to=safe(Trim(Request.querystring("name")))
function safe(fString)
if not isnull(fString) then
    fString = Lcase(fString)
    fString = replace(fString, " ", "")
    fString = replace(fString, "'", "")
    fString = replace(fString, "*", "")
    fString = replace(fString, "(", "")
    fString = replace(fString, "<", "")
    fString = replace(fString, ">", "")
    fString = replace(fString, "union", "")
    fString = replace(fString, "%", "")
    fString = replace(fString, ";", "")
    fString = replace(fString, "@", "")
    fString = replace(fString, "=", "")
    fString = replace(fString, "char", "")
    fString = replace(fString, "select", "")
    fString = replace(fString, "from", "")
    safe = fString
end if
end function

'�ύ���ݹ��˺�����  
'ʾ����sub_to=dvHTMLEncode(Trim(Request.Form("name")))
function dvHTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString,">", "&gt;")
    fString = replace(fString,"<", "&lt;")
    fString = replace(fString,"'","""")
    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    dvHTMLEncode = fString
end if
end function


'**************************************************
'��������FormatDate
'��  �ã�ʱ��ת��
'**************************************************
Function FormatDate(DateAndTime, para)
On Error Resume Next
Dim y, m, d, h, mi, s, strDateTime
FormatDate = DateAndTime
If Not IsNumeric(para) Then Exit Function
If Not IsDate(DateAndTime) Then Exit Function
y = right(CStr(Year(DateAndTime)),4)
m = CStr(Month(DateAndTime))
If Len(m) = 1 Then m = "0" & m
d = CStr(Day(DateAndTime))
If Len(d) = 1 Then d = "0" & d
h = CStr(Hour(DateAndTime))
If Len(h) = 1 Then h = "0" & h
mi = CStr(Minute(DateAndTime))
If Len(mi) = 1 Then mi = "0" & mi
s = CStr(Second(DateAndTime))
If Len(s) = 1 Then s = "0" & s
Select Case para
Case "1":strDateTime = y & m & d & " " & h & ":" & mi & ":" & s
Case "11":strDateTime = y & "��" & m & "��" & d & "��" & h & ":" & mi 
Case "2":strDateTime = y & "-" & m & "-" & d
Case "3":strDateTime = y & "/" & m & "/" & d
Case "4":strDateTime = y & "��" & m & "��" & d & "��"
Case "5":strDateTime = m & "-" & d
Case "6":strDateTime = m & "/" & d
Case "7":strDateTime = m & "��" & d & "��"
Case "8":strDateTime = y & "��" & m & "��"
Case "9":strDateTime = y & "-" & m
Case "10":strDateTime = y & "/" & m
Case Else
   strDateTime = DateAndTime
End Select
FormatDate = strDateTime
End Function


Function errorString(strng,num) 
errorString = true 
Dim regEx, Match 
Set regEx = New RegExp 
if num=1 then
regEx.Pattern = "^[0-9]+$" 
else
regEx.Pattern = "^[A-Za-z0-9]+$" 
end if
regEx.IgnoreCase = True 
Set Match = regEx.Execute(strng) 
if match.count then errorString = false 
End Function 

Function GetIP() '��ȡIP
Dim Tmp,Tmp1,Tmp2
Tmp1 = Request.ServerVariables("REMOTE_ADDR") 
Tmp2 = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
if Tmp2="" then
Tmp=Tmp1
else
Tmp=Tmp2
end if
IF Len(Tmp) < 7 Then Response.End
IF Len(Tmp) > 15 Then Response.End
IF InStr(Tmp, "'") > 0 Then Response.End
IF InStr(Tmp, """") > 0 Then Response.End
IF InStr(Tmp, "<") > 0 Then Response.End
IF InStr(Tmp, ">") > 0 Then Response.End
GetIP = Server.HtmlEncode(Tmp)
End Function


'��ȡ���ٸ�����
Function Getordernum(username)
set rstg=server.createobject("adodb.recordset")
sqlg="select * from fg_order where tuijianren='"&username&"' "
rstg.open sqlg,conn,1,1
if rstg.eof then
Getordernum="0"
else
Getordernum=rstg.recordcount
end if 
rstg.close
set rstg=nothing
End Function


function TestCaptcha(byval valSession, byval valCaptcha)
	dim tmpSession
	valSession = Trim(valSession)
	valCaptcha = Trim(valCaptcha)
	if (valSession = vbNullString) or (valCaptcha = vbNullString) then
		TestCaptcha = false
	else
		tmpSession = valSession
		valSession = Trim(Session(valSession))
		Session(tmpSession) = vbNullString
		if valSession = vbNullString then
			TestCaptcha = false
		else
			valCaptcha = Replace(valCaptcha,"i","I")
			if StrComp(valSession,valCaptcha,1) = 0 then
				TestCaptcha = true
			else
				TestCaptcha = false
			end if
		end if		
	end if
end function

'ˢ������Ϣ��д����
Function getlaji(keyword)
  ip=Request.ServerVariables("REMOTE_ADDR")  
  if request.form<>"" then
  fo=Server.MapPath("data/laji.zzfhw")
  set fs=Server.CreateObject("Scripting.FileSystemObject")
  set fn=fs.OpenTextFile(fo,8,True)
  FOR EACH name IN Request.Form
  fn.Writeline(dvHTMLEncode(Trim(name))&":|||"&Pstr(name))
  next
  fn.Writeline("IP:|||"&ip)
  fn.Writeline("ʱ��:|||"&now)
  fn.Writeline("---------------����ԭ��:"&keyword&"---------------")
  fn.Close
  end if
end function

'�����Ƿ�Ϊ��
'isformnull("����:xingming|�绰:dianhua")
function isformnull(string)
dim fg
ua=split(string,"|")
  for i=0 to ubound(ua)
   if instr(ua(i),":")>0 then
    fg=""
	fg=split(ua(i),":")
    if request.form(fg(1))="" then
       'msgbsx(fg(0)&"����Ϊ��")
        response.write "      <div class='top'>"
        response.write "         <div class='shibai'>"
        response.write "           <div class='t1'>�����ύʧ��</div>"
        response.write "           <div class='t2'>���κ����ʣ�����ϵ���ǿͷ����İ��������</div>"
        response.write "         </div>"
        response.write "      </div>"
        response.write "      <div class='content'>"
        response.write "      ����ԭ�򣺡�"&fg(0)&"��Ϊ��������δ��д����������д!<br>"
        response.write "      <div class='bottom'>"
        response.write "      <div class='btnDiv'>"
        response.write "      <script>"
        response.write "      if (top != self){"
        response.write "      document.write(""<a href='javascript:location.href=document.referrer;'><img src='images/fh.gif' border=0/></a>"");"
        response.write "      }else{"
        response.write "      document.write(""<a href='javascript:CloseWebPage();'><img src='images/close.gif' border=0/></a>"");"
        response.write "      }"
        response.write "      </script>"
        response.write "      </div>"
        response.write "      </div>"
        response.write "</div>"
        response.write "</body>"
        response.write "</html>"
        response.end
    end if
   end if
  next  
end function

'POST���Ĺ���
Function Pstr(str)
Pstr=dvHTMLEncode(Trim(request.Form(str)))
End Function

'��ȡ����Ϣ
function getform(biaodan)
biaodans=split(biaodan,"|")
  for i=0 to ubound(biaodans)
  if instr(biaodans(i),":")>0 then
     biaodan0=left(biaodans(i),instr(biaodans(i),":"))
     biaodan1=replace(biaodans(i),biaodan0,"")
     if instr(biaodan1,":")>0 then
        biaodanxx=split(biaodan1,":")
        biaodan2=""
          for j=0 to ubound(biaodanxx)
            if biaodanxx(j)<>"" then
               biaodan2=biaodan2&Pstr(biaodanxx(j))
            end if
          next
     else
        biaodan2=Pstr(biaodan1)
     end if
     getform=getform&"��"&biaodan0&"��"&biaodan2&"<br>"
  end if
  next	
end function  

function GetRnd(min,max)
Randomize
GetRnd = Int((max - min + 1) * Rnd + min)
end function

function zzfhwsafecode()
session("zzfhwsafecode")=GetRnd(000000,999999)
end function

function getHTTPPage(url)
    dim Http
    on error resume next
    'set Http=server.createobject("MSXML2.XMLHTTP")
    set Http=Server.CreateObject("MSXML2.ServerXMLHTTP") 
    Http.SetTimeOuts 5000,5000,5000,10000
    '��һ����ֵ������DNS���ֵĳ�ʱʱ��10�� 
    '�ڶ�����ֵ������Winsock���ӵĳ�ʱʱ��10�� 
    '��������ֵ���������ݵĳ�ʱʱ��15�� 
    '���ĸ���ֵ������response�ĳ�ʱʱ��15��
    Http.open "GET",url,false
    Http.send()
    if Http.readystate<>4 then 
        exit function
    end if
    getHTTPPage=bytesToBSTR(Http.responseBody,"gbk")
    set http=nothing
    if err.number<>0 then err.Clear 
end function


Function BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject("adodb.stream")
        objstream.Type = 1
        objstream.Mode = 3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function


'��ȡ��ǰ��ַ
'1 www.goingta.com:52593
'2 http://www.goingta.com:52593/
'3 http://www.goingta.com:52593/inc/
'4 http://www.goingta.com:52593/inc/1.asp?id=123
function geturl(id)
if id=1 then
geturl=request.ServerVariables("HTTP_HOST")
elseif id=2 then
geturl="http://"&request.ServerVariables("HTTP_HOST")&"/"
elseif id=3 then
getpathfrist=split(right(request.ServerVariables("URL"),len(request.ServerVariables("URL"))-1),"/")     
for ii=lbound(getpathfrist) to ubound(getpathfrist)-1  
getpathfull=getpathfull&"/"&getpathfrist(ii)     
next   
geturl="http://"&request.ServerVariables("HTTP_HOST")&getpathfull&"/"
elseif id=4 then
  GetUrl = "http://" & Request.ServerVariables("SERVER_NAME")
  If Request.ServerVariables("SERVER_PORT") <> 80 Then GetUrl = GetUrl &":" & Request.ServerVariables("SERVER_PORT")
  GetUrl = GetUrl & Request.ServerVariables("URL")
  If Trim(Request.QueryString) <>"" Then GetUrl = GetUrl &"?" & Trim(Request.QueryString)
end if
End Function


Function vbsEscape(str) 
    dim i,s,c,a 
    s="" 
    For i=1 to Len(str) 
        c=Mid(str,i,1) 
        a=ASCW(c) 
        If (a>=48 and a<=57) or (a>=65 and a<=90) or (a>=97 and a<=122) Then 
            s = s & c 
        ElseIf InStr("@*_+-./",c)>0 Then 
            s = s & c 
        ElseIf a>0 and a<16 Then 
            s = s & "%0" & Hex(a) 
        ElseIf a>=16 and a<256 Then 
            s = s & "%" & Hex(a) 
        Else 
            s = s & "%u" & Hex(a) 
        End If 
    Next 
    vbsEscape = s 
End Function


'==================================================
'��������GetBody
'��  �ã���ȡ�ַ���
'��  ����ConStr ------��Ҫ��ȡ���ַ���
'��  ����StartStr ------��ʼ�ַ���
'��  ����OverStr ------�����ַ���
'��  ����IncluL ------�Ƿ����StartStr
'��  ����IncluR ------�Ƿ����OverStr
'==================================================
Function GetBody(ConStr,StartStr,OverStr,IncluL,IncluR)
   If ConStr="$False$" or ConStr="" or IsNull(ConStr)=True Or StartStr="" or IsNull(StartStr)=True Or OverStr="" or IsNull(OverStr)=True Then
      GetBody="$False$"
      Exit Function
   End If
   Dim ConStrTemp
   Dim Start,Over
   ConStrTemp=Lcase(ConStr)
   StartStr=Lcase(StartStr)
   OverStr=Lcase(OverStr)
   Start = InStrB(1, ConStrTemp, StartStr, vbBinaryCompare)
   'response.write Start&"<br>"&IncluL&"<br>"
   'response.end
   If Start<=0 then
      GetBody="$False$"
      Exit Function
   Else
      If IncluL=False Then
         Start=Start+LenB(StartStr)
      End If
   End If
   Over=InStrB(Start,ConStrTemp,OverStr,vbBinaryCompare)
   If Over<=0 Or Over<=Start then
      GetBody="$False$"
      Exit Function
   Else
      If IncluR=True Then
         Over=Over+LenB(OverStr)
      End If
   End If
   
   GetBody=MidB(ConStr,Start,Over-Start)
End Function


function getHTTPPage(url)
    dim Http
    set Http=server.createobject("MSXML2.XMLHTTP")
    Http.open "GET",url,false
    Http.send()
    if Http.readystate<>4 then 
        exit function
    end if
    getHTTPPage=bytesToBSTR(Http.responseBody,"gb2312")
    set http=nothing
    if err.number<>0 then err.Clear 
end function


Function BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject("adodb.stream")
        objstream.Type = 1
        objstream.Mode =3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function



function SendEmail(MailBody) 
'//��վ�������
'On Error Resume Next
Set Jmail=server.createobject("Jmail.Message")
Jmail.Charset = "gb2312"
JMail.ContentType = "text/html"
Jmail.Silent = true
Jmail.Priority = 3
Jmail.MailServerUserName = Cls_Mailname '��Ч�����ʼ��ʺ�
Jmail.MailServerPassword = Cls_Mailpass '��Ч�����ʼ�����
Jmail.From = Cls_Mailname    
Jmail.FromName = FromName             '����������
Jmail.Subject = mailsubject             '�ʼ�����
'Jmail.AddRecipient ""&MailBox&""        '�ռ��˵��ʼ���ַ 
 array_Email = split(MailBox, ",") '����ռ���
 for i=0 to UBound(array_Email)
 JMail.AddRecipient Trim(array_Email(i))
 next
Jmail.Body = MailBody     '�ж�����Ŷ��       
Jmail.Send(Cls_Mailsmtp) 'smtp��������ַ
JMail.Close 
Set Jmail=nothing
If err>0 Then   
SendEmail =1
End If
End function

function cdomail(content) 
'on error resume next
content=replace(content,"<br>",vbCrLf)
Const cdoSendUsingMethod="http://schemas.microsoft.com/cdo/configuration/sendusing" 
Const cdoSendUsingPort=2 
Const cdoSMTPServer="http://schemas.microsoft.com/cdo/configuration/smtpserver" 
Const cdoSMTPServerPort="http://schemas.microsoft.com/cdo/configuration/smtpserverport" 
Const cdoSMTPConnectionTimeout="http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout" 
Const cdoSMTPAuthenticate="http://schemas.microsoft.com/cdo/configuration/smtpauthenticate" 
Const cdoBasic=1 
Const cdoSendUserName="http://schemas.microsoft.com/cdo/configuration/sendusername" 
Const cdoSendPassword="http://schemas.microsoft.com/cdo/configuration/sendpassword" 

Dim objConfig ' As CDO.Configuration 
Dim objMessage ' As CDO.Message 
Dim Fields ' As ADODB.Fields 

Set objConfig = Server.CreateObject("CDO.Configuration") 
Set Fields = objConfig.Fields 

With Fields 
.Item(cdoSendUsingMethod) = cdoSendUsingPort 
.Item(cdoSMTPServer) = Cls_Mailsmtp '�ĳɿ��õ��ⲿ�ʼ����������� 
.Item(cdoSMTPServerPort) = 25 
.Item(cdoSMTPConnectionTimeout) = 10 
.Item(cdoSMTPAuthenticate) = cdoBasic 
.Item(cdoSendUserName) = Cls_Mailname '���Ϸ��������û��� 
.Item(cdoSendPassword) = Cls_Mailpass '���� 
.Update 
End With 

array_Email = split(MailBox, ",") '����ռ���
for i=0 to UBound(array_Email)
Set objMessage = Server.CreateObject("CDO.Message") 
Set objMessage.Configuration = objConfig 
With objMessage 
.To = Trim(array_Email(i))
.From = Cls_Mailname '�ĳɷ����˵��ʼ���ַ 
.Subject = mailsubject  '���� 
.TextBody = content '���� 
'.AddAttachment "C:\Scripts\Output.txt"'�ʼ����� 
.Send 
End With 
Set objMessage = Nothing
next

Set Fields = Nothing 
Set objConfig = Nothing 

if fanhui=1 then
  If err then
    response.write ("����ʧ��!�Ҹ��˹��Ƹ÷�������֧�ִ��෽ʽ�����ʼ����������˻����벻�ԡ�")
  else
    response.write ("���ͳɹ�!�Ͽ�ȥ�����俴��")
  end if 
end if 
end function
%>