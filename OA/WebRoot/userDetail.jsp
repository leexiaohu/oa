<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>Ա����ϸ</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
		<style>
		 .jd{
		         position:absolute;
		         visibility:hidden;
	        }
	     
	     .Blur {
	     	filter: Alpha(opacity=20);
				  -moz-opacity:0.2;
				  opacity:0.2;
		 
	      }	
	     .NoBlur{}
     </style>
		<script language="JavaScript" src="javascript/position.js"></script>
		<script language="JavaScript">
			function showtable()
			{
				var tab=document.getElementById("dcdetail");
				pos=getElementPos("maincontent");
				tab.style.top=pos.y+15;
                tab.style.left=pos.x+15;
				tab.style.visibility="visible";
				document.getElementById("maincontent").className="Blur";
			}
			function closetable()
			{
				var tab=document.getElementById("dcdetail");
				tab.style.visibility="hidden";
				document.getElementById("maincontent").className="NoBlur";
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
					<a href="#" class="nav-top-item current">
						������Դ
					</a>
					<ul>
						<li><a href="addUser.action">���Ա��</a></li>
						<li><a class="current" href="viewUser.action">Ա������</a></li>
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
		<div id="content-box">
		  <table align="center" border="0" cellpadding="0" cellspacing="0" style="font-size:14px;color:#154ba0;background-color:#eff5fb;">
		  	<caption style="text-align:center;margin:0 auto;font-size:20px;background-color:#eff5fb;border-bottom:1px solid #154ba0;">
		  		<s:property value="user.realName"/>�ĸ��˻�����Ϣ
		  	</caption>
			<tr style="height:40px;">
				<td style="width:80px;border-bottom:1px solid #154ba0;">�û�����</td>
				<td style="width:200px;border-bottom:1px solid #154ba0;"><s:property value="user.userName"/></td>
				<td style="width:80px;border-bottom:1px solid #154ba0;">��ʵ������</td>
				<td style="width:200px;border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.realName"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">�Ա�</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.gender"/></td>
				<td style="border-bottom:1px solid #154ba0;">���գ�</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.birth"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">�������ţ�</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.deptName"/></td>
				<td style="border-bottom:1px solid #154ba0;">�����飺</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.groupName"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">ְλ��</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.roleName"/></td>
				<td style="border-bottom:1px solid #154ba0;">�������䣺</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.email"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:2px solid #154ba0;">�绰��</td>
				<td style="border-bottom:2px solid #154ba0;"><s:property value="user.phone"/></td>
				<td style="border-bottom:2px solid #154ba0;">����н�ʣ�</td>
				<td style="border-bottom:2px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.salary"/></td>
			</tr>
			<tr style="height:200px;">
				<td style="border-bottom:1px solid #154ba0;">���˼�����</td>
				<td style="border-bottom:1px solid #154ba0;" ><s:property value="user.jianli"/></td>
				<td style="border-bottom:1px solid #154ba0;">����ͷ��</td>
				<td style="border-bottom:1px solid #154ba0;"><img id="pic" onload="changePic('pic');" src="<s:property value="user.imgpath"/>">
				</td>
			</tr>
		</table>
		</div>
	</div>
	</div>
	<script language="JavaScript">
			var result="<s:property value="result"/>";
			if(result!="")
			{
				alert(result);
			}
		</script>
	</body>
</html>
