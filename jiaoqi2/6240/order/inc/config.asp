<%
'=============================================================
''提示信息
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
''提示信息,返回原页面-让上页面刷新
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
''提示信息,返回原页面不刷新
'=============================================================
Function msgurl(msg,msgurls)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "location.href='"&msgurls&"';" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function

'=============================================================
''提示信息,返回原页面不刷新
'=============================================================
Function msgbsx(msg)
Response.Write "<script language=""javascript"">" & vbCrLf
If not isempty(msg) then     Response.Write "alert(""" & msg & """);" & vbCrLf
Response.Write "window.history.go(-1);" & vbCrLf
Response.Write "</script>" & vbCrLf
Response.End
End Function


'翻页函数 参数列表：
'sql 查询所有记录条数的SQL语句  
'page 当前页  
'pagelistnum每页显示记录数 
'link翻页链接除PAGE参数外
'示例：fy (sql,page,pagelistnum,link)
function fy(sql,page,pagelistnum,link)
  dim rs,znum,zpage
  page=cint(page)'将PAGE转换为整型
  set rs=server.CreateObject("adodb.recordset")
  'sql="select count(*) as num from "+sql
  rs.open sql,conn,1,1
  znum=rs("num")
  '得到总页数
  zpage=znum\pagelistnum
  if znum mod pagelistnum>0 then zpage=zpage+1
  '得到第一页、上一页链接 
  if page=1 then
    response.Write "<a href='#'>&laquo; 首 页</a> <a href='#'>&laquo; 上一页</a> "
  else
    response.Write "<a href=" & link & "&page=1>&laquo; 首 页</a> <a href=" & link & "&page=" & (page-1) & ">&laquo; 上一页</a> "
  end if
  response.Write "<a href='#' class='number' title="&"总共"&znum&"条记录"&">"&zpage&"/"&znum&"</a>"
  if page>zpage and zpage>1 then 
  response.write msgsx("无此页面")
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
  '得到上一页、最后页链接
  if page<zpage then
    response.Write "<a href=" & link & "&page=" & (page+1) & ">下一页 &raquo;</a> <a href=" & link & "&page=" & zpage & ">最后页&raquo;</a>"
  else
    response.Write "<a href='#' title='下一页'>下一页 &raquo;</a><a href='#' title='尾 页'>尾 页 &raquo;</a> "
  end if
  rs.close
  set rs=nothing
end function

'Request.querystring过滤函数：  
'示例：sub_to=safe(Trim(Request.querystring("name")))
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

'提交数据过滤函数：  
'示例：sub_to=dvHTMLEncode(Trim(Request.Form("name")))
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
'函数名：FormatDate
'作  用：时间转换
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
Case "11":strDateTime = y & "年" & m & "月" & d & "日" & h & ":" & mi 
Case "2":strDateTime = y & "-" & m & "-" & d
Case "3":strDateTime = y & "/" & m & "/" & d
Case "4":strDateTime = y & "年" & m & "月" & d & "日"
Case "5":strDateTime = m & "-" & d
Case "6":strDateTime = m & "/" & d
Case "7":strDateTime = m & "月" & d & "日"
Case "8":strDateTime = y & "年" & m & "月"
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

Function GetIP() '获取IP
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


'获取多少个订单
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

'刷单的信息重写功能
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
  fn.Writeline("时间:|||"&now)
  fn.Writeline("---------------处理原因:"&keyword&"---------------")
  fn.Close
  end if
end function

'检查表单是否为空
'isformnull("姓名:xingming|电话:dianhua")
function isformnull(string)
dim fg
ua=split(string,"|")
  for i=0 to ubound(ua)
   if instr(ua(i),":")>0 then
    fg=""
	fg=split(ua(i),":")
    if request.form(fg(1))="" then
       'msgbsx(fg(0)&"不能为空")
        response.write "      <div class='top'>"
        response.write "         <div class='shibai'>"
        response.write "           <div class='t1'>订单提交失败</div>"
        response.write "           <div class='t2'>有任何疑问，请联系我们客服贴心帮您解决！</div>"
        response.write "         </div>"
        response.write "      </div>"
        response.write "      <div class='content'>"
        response.write "      错误原因：【"&fg(0)&"】为必填资料未填写，请重新填写!<br>"
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

'POST表单的过滤
Function Pstr(str)
Pstr=dvHTMLEncode(Trim(request.Form(str)))
End Function

'获取表单信息
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
     getform=getform&"【"&biaodan0&"】"&biaodan2&"<br>"
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
    '第一个数值：解析DNS名字的超时时间10秒 
    '第二个数值：建立Winsock连接的超时时间10秒 
    '第三个数值：发送数据的超时时间15秒 
    '第四个数值：接收response的超时时间15秒
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


'获取当前网址
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
'函数名：GetBody
'作  用：截取字符串
'参  数：ConStr ------将要截取的字符串
'参  数：StartStr ------开始字符串
'参  数：OverStr ------结束字符串
'参  数：IncluL ------是否包含StartStr
'参  数：IncluR ------是否包含OverStr
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
'//网站邮箱参数
'On Error Resume Next
Set Jmail=server.createobject("Jmail.Message")
Jmail.Charset = "gb2312"
JMail.ContentType = "text/html"
Jmail.Silent = true
Jmail.Priority = 3
Jmail.MailServerUserName = Cls_Mailname '有效电子邮件帐号
Jmail.MailServerPassword = Cls_Mailpass '有效电子邮件密码
Jmail.From = Cls_Mailname    
Jmail.FromName = FromName             '发件人姓名
Jmail.Subject = mailsubject             '邮件标题
'Jmail.AddRecipient ""&MailBox&""        '收件人的邮件地址 
 array_Email = split(MailBox, ",") '多个收件人
 for i=0 to UBound(array_Email)
 JMail.AddRecipient Trim(array_Email(i))
 next
Jmail.Body = MailBody     '有订单了哦！       
Jmail.Send(Cls_Mailsmtp) 'smtp服务器地址
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
.Item(cdoSMTPServer) = Cls_Mailsmtp '改成可用的外部邮件服务器域名 
.Item(cdoSMTPServerPort) = 25 
.Item(cdoSMTPConnectionTimeout) = 10 
.Item(cdoSMTPAuthenticate) = cdoBasic 
.Item(cdoSendUserName) = Cls_Mailname '以上服务器的用户名 
.Item(cdoSendPassword) = Cls_Mailpass '密码 
.Update 
End With 

array_Email = split(MailBox, ",") '多个收件人
for i=0 to UBound(array_Email)
Set objMessage = Server.CreateObject("CDO.Message") 
Set objMessage.Configuration = objConfig 
With objMessage 
.To = Trim(array_Email(i))
.From = Cls_Mailname '改成发送人的邮件地址 
.Subject = mailsubject  '标题 
.TextBody = content '正文 
'.AddAttachment "C:\Scripts\Output.txt"'邮件附件 
.Send 
End With 
Set objMessage = Nothing
next

Set Fields = Nothing 
Set objConfig = Nothing 

if fanhui=1 then
  If err then
    response.write ("发送失败!我个人估计该服务器不支持此类方式发送邮件，或者你账户密码不对。")
  else
    response.write ("发送成功!赶快去你邮箱看看")
  end if 
end if 
end function
%>