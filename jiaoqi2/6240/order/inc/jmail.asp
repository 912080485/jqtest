<%
  On   Error   Resume   Next  
  Dim   JMail  
  Set   JMail=Server.CreateObject("JMail.Message")  
  If   JMail   Is   Nothing     Then    
  Response.Write   "������˼,��Ŀռ䲻֧��JMail���䷢��"  
  Else  
  Response.Write   "��Ŀռ�֧��JMail���䷢��"  
  End   If
%>