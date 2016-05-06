<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>������Ϣ</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		  
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
		
			function getUserList()
			{
				var deptnumber=document.getElementById("deptlist").value;
				
				if(deptnumber!="")
				{
					var uri="userListAction.action?deptNumber="+escape(deptnumber);
					//��ʼ��XMLHttpRequest����
	              	if(window.XMLHttpRequest)
	              	{//IE֮��������
	              		req=new XMLHttpRequest();
	             	}
	              	else
	              	{
	                	try
	                	{
	                  		req=new ActiveXObject("Msxml2.XMLHTTP");
	                	}
	                	catch(e)
	                	{
	                  		try
	                  		{
	                     		req=new ActiveXObject("Microsoft.XMLHTTP");
	                  		}
	                  		catch(e)
	                  		{
	                     		alert("���ܴ���XMLHttpRequest���󣡣���");
	                     		return;
	                  		}
	                	}
	                
	              	}              
				  	req.open("post",uri,true);
				  	req.onreadystatechange=handleResponse;
	             	req.send(null);    
             	}
			}
			function handleResponse()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                msg=unescape(msg);
	                document.getElementById("userlist").innerHTML=msg;
	             }
	          }
	        }
	        function mouseovercolor(id)
	        {
	        	document.getElementById(id).className="mouseover";
	        }
	        function mouseoutcolor(id)
	        {
	        	document.getElementById(id).className="mouseout";
	        }
	        function add(user)
	        {
	        	var area=document.getElementById("receiver");
	        	area.value=user;

	        }
	        function checksend()
	        {

	        	
	        	var receover=document.getElementById("receiver").value.trim();
	        	if(receover=="")
	        	{
	        		alert("��Ϣ�����˲���Ϊ��");
	        		return false;
	        	}
	        	var info=document.getElementById("info").value.trim();
	        	if(info=="")
	        	{
	        		alert("��Ϣ���ⲻ��Ϊ��");
	        		return false;
	        	}
	        	var content=document.getElementById("content").value.trim();
	        	alert(touser.length);
	        	if(content=="")
	        	{
	        		alert("��Ϣ���ݲ���Ϊ��");
	        		return false;
	        	}
	        	var pos=getElementPos("sub");
	        	var sub=document.getElementById("tishi");
	        	sub.style.left=pos.x-2;
	        	sub.style.top=pos.y-1;
	        	sub.style.display="block";
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
					<a href="#" class="nav-top-item current">
						��Ϣ����
					</a>
					<ul>
						<li><a href="receiveMessage.action">������Ϣ</a></li>
						<li><a href="sendMessage.action" class="current">������Ϣ</a></li>
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
			<table border="0" bgcolor="#eff5fb" width="100%">
			<tr>
				<td valign="top">
				<s:form onsubmit="return checksend();" theme="simple" action="sendMessage2" method="post">
					<table style="width:70%;text-align:center;">
						<tr>
							<td style="width:100px;"></td>
							<td align="left">������Ϣ</td>
							<td align="right">������:<s:property value="fromuser"/></td>
						</tr>
						<tr>
							<td align="right">������</td>
							<td colspan="2" align="left"><s:textfield id="receiver" name="receiver" onkeydown="return false;" size="49" cssStyle="width:420px;height:20px;"/></td>
						</tr>
						<tr>
							<td align="right">��Ϣ����</td>
							<td colspan="2" align="left"><s:textfield id="info" name="info" cssStyle="width:420px;height:20px;"/></td>
						</tr>
						
						
						<tr>
							<td align="right">��Ϣ����</td>
							<td colspan="2" align="left"><s:textarea name="content" id="content" cols="20" wrap="virtual" cssStyle="width:600px;height:200px;" theme="simple"/></td>
						</tr>
						<tr>
							<td></td>
							<td align="left"><s:submit value="����" id="sub"/>&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
							<td></td>
						</tr>
					</table>
				</s:form>
				</td>
				<td valign="top">
					<table width="30%" align="center" style="margin:0 auto">
						<tr>
						<td align="center">����:<s:select id="deptlist" list="deptList" listKey="deptNumber" listValue="deptName" theme="simple" cssStyle="width:150" onchange="getUserList();"/></td>
						</tr>
						<tr>
						<td align="center">
							<div id="userlist" ></div>
						</td>
						</tr>
					
					</table>
				</td>
			</tr>
			</table>
		</div>
		</div>
	</div>
	<div id="tishi" style="width:300px;height:20px;position:absolute;display:none;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr bgcolor="#4b981d" style="height:20px;width:300px;">
				<td>&nbsp&nbsp&nbsp</td>
				<td><img src="images/ico_loading.gif"></td>
				<td>&nbsp&nbsp&nbsp&nbsp���ڷ��ͣ����Ժ�.......</td>
			</tr>
		</table>
	</div>
	</body>
</html>
