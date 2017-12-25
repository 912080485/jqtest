<!-- #include file="not_peizhi.asp" -->
<!-- #include file="inc/conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>您的订单正在提交中，请耐心等待……</title>
<meta name="Author" Content="订单系统精简版"> 
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
'将数据写入iislog  以免数据被删或者提交不正常
response.write "<script src=goingta.asp?str="&vbsEscape(request.form)&"></script>"
   
   '如果要限制某些表单不能为空
   response.write isformnull(nobiaodan)

   If DateDiff("s", Session("RefreshTime"), Now()) < 10 Then
   response.write "<script language='javascript'>"
   response.write "alert('请不要重复提交!');"
   response.write "self.location='"&request.form("weburl")&"';"
   response.write "</script>"
   Response.End
   end if

   '检查是否有订单编号
   if instr(request.form("notorderid"),"no.")=0 then
   response.write "<div style='padding:20px;line-height:200%;'>错误信息：<br>1.配置错误,请在提交页面加入images/notorder.js调用代码 <br>2.来路不正确<br>3.请联系在线客服处理</div>"
   response.end
   end if

   goingtaorder=getform(biaodan)
   goingtaorders=goingtaorder&"【IP地址】---- "&getip()&"<br>"
   goingtaorders=goingtaorders&"【提交时间】---- "&now&"<br>"
   goingtaorders=goingtaorders&"【下单页面】---- "&dvHTMLEncode(Trim(Request.ServerVariables("HTTP_REFERER")))&"<br>"
   goingtaorders=goingtaorders&"【下单网站】---- "&dvHTMLEncode(Trim(request.form("notnowurl")))&"<br>"
   goingtaorders=goingtaorders&"【来源网站】---- "&dvHTMLEncode(Trim(request.form("notfromurl")))&"<br>"
   goingtaorders=replace(goingtaorders,"http://","")
   
   if ipnum<>0 then
        set rsts = server.CreateObject("Adodb.Recordset")
	sqls="select count(*) as recnums from fg_order where  datevalue([addtime])=date() and ip='"&getip()&"' "
        rsts.open sqls,conn,1,1
	if rsts("recnums")>ipnum then
	response.write msgbsx("你的ip提交的次数太多，请直接提交给在线客服，谢谢。")
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
   rst("beizhu") =  "无"
   rst.update
   rst.close
   set rst = nothing
   conn.close
   set conn=nothing
   Session("RefreshTime")=now()
  
%>
      <div class="top">
         <div class="chenggong">
           <div class="t1">订单提交成功！</div>
           <div class="t2">有任何疑问，请联系我们客服贴心帮您解决！</div>
         </div>
      </div>
      <div class="content">
      <h3><b>请仔细核对以下信息，如果有误，请刷新网站重新提交。</b></h3>
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
           <div class="t1">订单提交失败！</div>
           <div class="t2">有任何疑问，请联系我们客服贴心帮您解决！</div>
         </div>
      </div>
      <div class="content">
      你的订单提交失败，请重新打开网站刷新再测试，如果还是不行，请与我们在线客服联系。谢谢你的支持！
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
<input name="title" id="title" value="购买商品" type="hidden" />
<input name="memo" type="hidden" value="订单编号：<%=request.form("notorderid")%>" />
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

<!--百度跟踪代码-->

<!--百度跟踪代码-->
</body>
</html>