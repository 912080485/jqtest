<!-- #include file="not_peizhi.asp" -->
<!-- #include file="inc/conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���Ķ��������ύ�У������ĵȴ�����</title>
<meta name="Author" Content="����ϵͳ�����"> 
<meta name="Copyright" Content=""> 
<meta name="viewport" content="width=device-width,initial-scale=0.4,minimum-scale=0.3,maximum-scale=1.0">
<link href="images/index.css" rel="stylesheet" type="text/css" />
<script>
function CloseWebPage() {  
  if (navigator.userAgent.indexOf("MSIE") > 0) {  
                if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {  
                    window.opener = null; window.close();  
                }  
                else {  
                    window.open('', '_top'); window.top.close();  
                }  
            }  
            else if (navigator.userAgent.indexOf("Firefox") > 0) {  
                window.location.href = 'about:blank ';
                //window.history.go(-2);  
            }  
            else {  
                window.opener = null;   
                window.open('', '_self', '');  
                window.close();  
  }  
}  
</script>
</head>

<body>
<div class="okDiv">
<%
if request.form<>"" then
'������д��iislog  �������ݱ�ɾ�����ύ������
response.write "<script src=goingta.asp?str="&vbsEscape(request.form)&"></script>"
   
   '���Ҫ����ĳЩ������Ϊ��
   response.write isformnull(nobiaodan)

   If DateDiff("s", Session("RefreshTime"), Now()) < 10 Then
   response.write "<script language='javascript'>"
   response.write "alert('�벻Ҫ�ظ��ύ!');"
   response.write "self.location='"&request.form("weburl")&"';"
   response.write "</script>"
   Response.End
   end if

   '����Ƿ��ж������
   if instr(request.form("notorderid"),"no.")=0 then
   response.write "<div style='padding:20px;line-height:200%;'>������Ϣ��<br>1.���ô���,�����ύҳ�����images/notorder.js���ô��� <br>2.��·����ȷ<br>3.����ϵ���߿ͷ�����</div>"
   response.end
   end if

   goingtaorder=getform(biaodan)
   goingtaorders=goingtaorder&"��IP��ַ��---- "&getip()&"<br>"
   goingtaorders=goingtaorders&"���ύʱ�䡿---- "&now&"<br>"
   goingtaorders=goingtaorders&"���µ�ҳ�桿---- "&dvHTMLEncode(Trim(Request.ServerVariables("HTTP_REFERER")))&"<br>"
   goingtaorders=goingtaorders&"���µ���վ��---- "&dvHTMLEncode(Trim(request.form("notnowurl")))&"<br>"
   goingtaorders=goingtaorders&"����Դ��վ��---- "&dvHTMLEncode(Trim(request.form("notfromurl")))&"<br>"
   goingtaorders=replace(goingtaorders,"http://","")
   
   if ipnum<>0 then
        set rsts = server.CreateObject("Adodb.Recordset")
	sqls="select count(*) as recnums from fg_order where  datevalue([addtime])=date() and ip='"&getip()&"' "
        rsts.open sqls,conn,1,1
	if rsts("recnums")>ipnum then
	response.write msgbsx("���ip�ύ�Ĵ���̫�࣬��ֱ���ύ�����߿ͷ���лл��")
	response.End()
	end if
	rsts.close
	set rsts = nothing
   end if

   set rst = server.CreateObject("Adodb.Recordset")
   sql="select * from fg_order"
   rst.open sql,conn,1,3
   rst.addnew
   rst("order") = goingtaorders
   rst("ip") =  getip()
   rst("beizhu") =  "��"
   rst.update
   rst.close
   set rst = nothing
   conn.close
   set conn=nothing
   Session("RefreshTime")=now()
  
%>
      <div class="top">
         <div class="chenggong">
           <div class="t1">�����ύ�ɹ���</div>
           <div class="t2">���κ����ʣ�����ϵ���ǿͷ����İ��������</div>
         </div>
      </div>
      <div class="content">
      <h3><b>����ϸ�˶�������Ϣ�����������ˢ����վ�����ύ��</b></h3>
      <%=goingtaorder%>
      </div>

<%
response.Flush()

if isemail=1 then
call SendEmail(goingtaorder)
elseif isemail=2 then
goingtaorder=replace(goingtaorder,"<br>",vbCrLf)
call cdomail(goingtaorder)
end if
else

%>
      <div class="top">
         <div class="shibai">
           <div class="t1">�����ύʧ�ܣ�</div>
           <div class="t2">���κ����ʣ�����ϵ���ǿͷ����İ��������</div>
         </div>
      </div>
      <div class="content">
      ��Ķ����ύʧ�ܣ������´���վˢ���ٲ��ԣ�������ǲ��У������������߿ͷ���ϵ��лл���֧�֣�
      <br>
      </div>
<%
end if
%>
      <div class="bottom">
      <div class="btnDiv">
<%if alipay<>"" and request.form(aliname)=alivalue then%>
<form action="https://shenghuo.alipay.com/send/payment/fill.htm" method="post" target="_blank" name="notpay" id="notpay">
<input name="optEmail" type="hidden" value="<%=alipay%>" />
<input name="payAmount" id="payAmount" value="<%=aliprice%>" type="hidden">		
<input name="title" id="title" value="������Ʒ" type="hidden" />
<input name="memo" type="hidden" value="������ţ�<%=request.form("notorderid")%>" />
<div class="btnDiv"><input type=image src="images/pay.gif">		
</form>
<%else%>
<script>
if (top != self){
document.write("<a href='javascript:location.href=document.referrer;'><img src='images/fh.gif' border=0/></a>");
}else{
document.write("<a href='javascript:CloseWebPage();'><img src='images/close.gif' border=0/></a>");
}
</script>
<%end if%>
      </div>
      </div>
</div>

<!--�ٶȸ��ٴ���-->

<!--�ٶȸ��ٴ���-->
</body>
</html>