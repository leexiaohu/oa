<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>�ϴ�����</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		  
		<script language="JavaScript">
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
	        function checkUpload()
	        {
	        	var title=document.getElementById("title").value;
	        	if(title.trim()=="")
	        	{
	        		alert("�ļ����ⲻ��Ϊ��");
	        		return false;
	        	}
	        	if(title.trim().length>25)
	        	{
	        		alert("�ļ����ⲻ�ܹ���!!!");
	        		return false;
	        	}
	        	var shareFile=document.getElementById("shareFile").value;
	        	if(shareFile.trim()=="")
	        	{
	        		alert("��ѡ���ļ�");
	        		return false;
	        	}
	        	var info=document.getElementById("info").value;
	        	if(info.trim()=="")
	        	{
	        		alert("����д�ļ�����");
	        		return false;
	        	}
	        	if(info.trim().length>100)
	        	{
	        		alert("�ļ����鲻�ܹ���!!!");
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
					<a href="#" class="nav-top-item current">
						�ļ�����
					</a>
					<ul>
						<li><a href="viewShare.action">�鿴����</a></li>
						<li><a class="current" href="uploadShare.action">�ϴ�����</a></li>
						<s:if test="right==3">
						<li><a href="manageShare.action">������</a></li>
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
						<li><a href="allDoc.action">��������</a></li>
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
					<a href="#" class="nav-top-item">
						�����ʼ�
					</a>
					<ul>
						<li><a href="sendEmail.jsp">�����ʼ�</a></li>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item">
						��������
					</a>
					<ul>
						<li><a href="sendAlarm1.action">��������</a></li>
						<s:if test="right==3">
						<li><a href="viewAlarm.action">�鿴����</a></li>
						</s:if>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item">
						ϵͳ����
					</a>
					<ul>
						<li><a href="changePwd.jsp">�޸�����</a></li>
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
			<s:form onsubmit="return checkUpload();" theme="simple" action="uploadShare2" method="post" enctype="multipart/form-data">
		
			<table width="100%">				
				<tr>
					<td align="right">�ļ����</td>
					<td ><s:select name="type" list="typeList" listKey="typeNumber" listValue="typeName"/></td>
				</tr>
				<tr>
					<td align="right">�ļ����⣺</td>
					<td ><s:textfield id="title" name="title" cssStyle="line-height:25px;width:425px;height:25px;"/></td>
				</tr>
				<tr>
					<td align="right">ѡ���ļ���</td>
					<td ><s:file id="shareFile" name="shareFile" size="50" onkeydown="return false;"  cssStyle="line-height:25px;width:425px;height:25px;"/></td>
				</tr>
				<tr>
					<td align="right">�ļ����飺</td>
					<td ><s:textarea id="info" name="info" cssStyle="width:425px;height:200px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="�ϴ�"/>&nbsp&nbsp<s:reset value="ȡ��"/></td>
				</tr>
			</table>
		</s:form>
		</div>
		</div>
	</div>
	</body>
</html>
