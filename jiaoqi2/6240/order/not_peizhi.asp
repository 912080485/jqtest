<%
'/**********************  ������Ϣ���޸�Ϊ�Լ��������˻����� ************************/

mailsubject="����ϵͳ��ʾ��--��һ����������"        '�������
FromName="��Ʒ����"   '��Ʒ����
Cls_Mailname="1111@163.com"        '�������˻���
Cls_Mailpass="2222"        '����������
Cls_Mailsmtp="smtp.163.com"        '�����������
MailBox="3333@qq.com"        '�ռ����˻�,����˻����� Ӣ��ģʽ�µ� , �Ÿ���
isemail=2     '1Ϊjmail,����ռ䲻֧��jmail���Ըĳ�2����
ipnum=0  '�����һ��ipһ�������ύ���ٸ�������0Ϊ������

'/**********************  ������Ϣ�ǶԽӶ�����ʽ�� ************************/
biaodan="������:notorderid|��Ʒ:wfproduct|����:wfname|�ֻ�����:wfmob|�̶��绰:wftel|��ַ:wfprovince:wfcity:wfarea:wfaddress|�ʱ�:wfpost|���ʽ:wfpay|����:wfguest"
nobiaodan="����:wfname|�ֻ�����:wfmob|��ַ:wfaddress"   '�������벻��Ϊ�յı�


'/**********************  ֧����������Ϣ����������Ա���Ĭ�� ************************/
alipay="***@163.com"  '֧�����˻�
aliname="wfpay"  '֧���������ύ��nameֵ
alivalue="alipay"   '֧���������ύ��valueֵ
aliprice=request.form("wfprice")  '֧���۸񣬿��������۸� 

%>