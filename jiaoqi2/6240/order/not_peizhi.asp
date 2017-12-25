<%
'/**********************  以下信息请修改为自己的邮箱账户密码 ************************/

mailsubject="订单系统提示你--有一个订单到了"        '邮箱标题
FromName="产品来了"   '产品名称
Cls_Mailname="1111@163.com"        '发件箱账户名
Cls_Mailpass="2222"        '发件箱密码
Cls_Mailsmtp="smtp.163.com"        '发件箱服务器
MailBox="3333@qq.com"        '收件箱账户,多个账户请用 英文模式下的 , 号隔开
isemail=2     '1为jmail,如果空间不支持jmail可以改成2试试
ipnum=0  '这里改一个ip一天限制提交多少个订单，0为不限制

'/**********************  以下信息是对接订单样式的 ************************/
biaodan="订单号:notorderid|产品:wfproduct|姓名:wfname|手机号码:wfmob|固定电话:wftel|地址:wfprovince:wfcity:wfarea:wfaddress|邮编:wfpost|付款方式:wfpay|留言:wfguest"
nobiaodan="姓名:wfname|手机号码:wfmob|地址:wfaddress"   '这里输入不能为空的表单


'/**********************  支付宝付款信息，不想配可以保持默认 ************************/
alipay="***@163.com"  '支付宝账户
aliname="wfpay"  '支付宝付款提交的name值
alivalue="alipay"   '支付宝付款提交的value值
aliprice=request.form("wfprice")  '支付价格，可以填具体价格 

%>