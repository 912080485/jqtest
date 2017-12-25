<%
  On   Error   Resume   Next  
  Dim   JMail  
  Set   JMail=Server.CreateObject("JMail.Message")  
  If   JMail   Is   Nothing     Then    
  Response.Write   "不好意思,你的空间不支持JMail邮箱发信"  
  Else  
  Response.Write   "你的空间支持JMail邮箱发信"  
  End   If
%>