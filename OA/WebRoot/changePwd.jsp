<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>������ҳ</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
		<script language="JavaScript">
		function changepwd()
		{
			var oldpwd=document.getElementById("oldpwd").value.trim();
			if(oldpwd=="")
			{
				alert("�����벻��Ϊ�գ���");
				return false;
			}
			var newpwd1=document.getElementById("newpwd1").value.trim();
			if(newpwd1=="")
			{
				alert("�����벻��Ϊ��");
				return false;
			}
			var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
        	if(!pwdpat.exec(newpwd1))
        	{
        		alert("����ֻ����10λ���ڵ���ĸ���ֺ��»������");
        		return false;
        	}
        	var newpwd2=document.getElementById("newpwd2").value.trim();
        	if(newpwd1!=newpwd2)
        	{
        		alert("��������������벻ƥ��");
        		return false;
        	}
        	return true;
		}
		</script>
	</head>
	<body>
	<div id="body-wrapper">
		<div id="sidebar">
				<div id="sidebar-wrapper"> 
			
			<h1 id="sidebar-title"><a href="#">admin</a></h1>
		  
			<!-- Logo (221px wide) -->
			<a href="mainManage.action"><img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a>
		  
			<!-- Sidebar Profile links -->
			<div id="profile-links">
				��ӭ��, <a href="#" title="Edit your profile">����</a> | <a href="exitSys.action" title="Sign Out">�˳�</a><br />				
			</div>        			
			<ul id="main-nav"> 				
				<li>
					<a href="mainManage.action" class="nav-top-item">
						ϵͳ��ҳ
					</a>       
				</li>				
				<li> 
					<a href="#" class="nav-top-item"> <!-- Add the class "current" to current menu item -->
					�ļ�����
					</a>
					<ul>
						<li><a href="sendFile.action">�����ļ�</a></li>
						<li><a href="receiveFile.action">�����ļ�</a></li> 
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						�ļ�����
					</a>
					<ul>
						<li><a href="viewShare.action">�鿴����</a></li>
						<li><a href="uploadShare.action">�ϴ�����</a></li>
						<s:if test="right==3">
						<li><a  class="current" href="manageShare.action">������</a></li>
						</s:if>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						��Ϣ����
					</a>
					<ul>
						<li><a href="receiveMessage.action">������Ϣ</a></li>
						<li><a href="sendMessage.action">������Ϣ</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						��������
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a class="current" href="allDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:else>
				</s:else>
				</li>				
				<s:if test="right==3">
				<li>
					<a href="#" class="nav-top-item">
						������Դ
					</a>
					<ul>
						<li><a href="addUser.action">���Ա��</a></li>
						<li><a href="viewUser.action">Ա������</a></li>
					</ul>
				</li> 
				</s:if>   
				<li>
					<a href="#" class="nav-top-item ">
						�����ʼ�
					</a>
					<ul>
						<li><a class="" href="sendEmail.jsp">�����ʼ�</a></li>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item ">
						��������
					</a>
					<ul>
						<li><a  href="sendAlarm1.action">��������</a></li>
						<s:if test="right==3">
						<li><a href="viewAlarm.action">�鿴����</a></li>
						</s:if>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item current">
						ϵͳ����
					</a>
					<ul>
						<li><a class="current" href="changePwd.jsp">�޸�����</a></li>
					</ul>
				</li>           
				
			</ul> <!-- End #main-nav -->
						
		</div></div> <!-- End #sidebar -->
		<div id="main-content">
		<!-- Page Head -->			
			<p id="page-intro" align="left">What would you like to do?</p>			
			<ul class="shortcut-buttons-set">				
				<li><a class="shortcut-button" href="sendMessage.action"><span>
					<img src="resources/images/icons/comment_48.png" alt="icon" /><br />
					������Ϣ
				</span></a></li>				
								
				<li><a class="shortcut-button" href="uploadShare.action"><span>
					<img src="resources/images/icons/image_add_48.png" alt="icon" /><br />
					�ϴ��ĵ�
				</span></a></li>				
				<li><a class="shortcut-button" href="scanDoc.action"><span>
					<img src="resources/images/icons/scanner.png" alt="icon" /><br />
					�ĵ�ɨ��
				</span></a></li>
				
				<li><a class="shortcut-button" href="sendEmail.jsp"><span>
					<img src="resources/images/icons/email.png" alt="icon" /><br />
					�����ʼ�
				</span></a></li>
				
				<li><a class="shortcut-button" href="sendAlarm1.action"><span>
					<img src="resources/images/icons/alarm.png" alt="icon" /><br />
					��������
				</span></a></li>
				
			</ul><!-- End .shortcut-buttons-set -->
			<div class="clear"></div>
			<div class="content-box">
		<s:form onsubmit="return changepwd();" theme="simple" method="post" action="changePwd">
			<table align="left" style="width:750px;">
				<caption style="text-align:center;margin:0 auto;font-size:21px;color:#154ba0;background-color:#a8cde4">�޸�����</caption>
				<tr style="height:30px;">
					<td align="right">�����룺</td>
					<td><s:password id="oldpwd" name="oldpwd"/></td>
					<td>����������ԭʼ���룬��ȷ���������</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">�����룺</td>
					<td><s:password id="newpwd1" name="newpwd1"/></td>
					<td>��������10λ���ڵ���ĸ���ֻ��»������</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">ȷ�������룺</td>
					<td><s:password id="newpwd2" name="newpwd2"/></td>
					<td>������������д��������һ��</td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="ȷ��"/>&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
					<td></td>
				</tr>
			</table>
		</s:form>
		</div>
		</div>
		<script language="JavaScript">
		var result="<s:property value="result"/>";
		if(result!=""){
			alert(result);
		}
		</script>
	</div>
	</body>
</html>
