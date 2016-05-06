<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>��������</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
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
					<a href="#" class="nav-top-item ">
						��Ϣ����
					</a>
					<ul>
						<li><a href="receiveMessage.action" class="">������Ϣ</a></li>
						<li><a href="sendMessage.action">������Ϣ</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item current">
						��������
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="allDoc.action">��������</a></li>
						<li><a href="myDoc.action" class="current">�ҵ�����</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action" class="current">�ҵ�����</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action" class="current">�ҵ�����</a></li>
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
			<table cellpadding="0" cellspacing="0" border="1"  style="margin:30 auto;border-color:#154ba0;" align="center">
				<tr style="height:30px;">
					<td align="center" style="width:150px;">����</td>
					<td align="center" style="width:200px;">һ������״̬</td>
					<s:if test="type==2">
					<td align="center" style="width:200px;">��������״̬</td>
					</s:if>
					<td align="center" style="width:150px;">����״̬</td>
				</tr>
				<tr>
					<td align="center">
						<s:property value="topic"/>
					</td>
					<td align="center">
						<table width="80%">
							<s:iterator value="firstList" status="docdept" >
								<tr style="height:30px;">
									<td>
										<s:property value="deptName"/>
									</td>
									<td>
										<s:if test="deptState==0">
											<img src="images/weishenpi.gif"><span style="color:#ffb637;">δ����</span>
										</s:if>
										<s:else>
											<s:if test="deptState==1">
												<img src="images/shenpichenggong.gif"><span style="color:#298a00;">����ͨ��</span>
											</s:if>
											<s:else>
												<img src="images/shenpishibai.gif"><span style="color:#f00;">����ʧ��</span>
											</s:else>
										</s:else>
									</td>
								</tr>
							</s:iterator>
						</table>
					</td>
					<s:if test="type==2">
					<td align="center">
						<table width="80%">
							<s:iterator value="secondList" status="docdept2" >
								<tr style="height:30px;">
									<td>
										<s:property value="deptName"/>
									</td>
									<td>
										<s:if test="deptState==0">
											<img src="images/weishenpi.gif"><span style="color:#ffb637;">δ����</span>
										</s:if>
										<s:else>
											<s:if test="deptState==1">
												<img src="images/shenpichenggong.gif"><span style="color:#298a00;">����ͨ��</span>
											</s:if>
											<s:else>
												<img src="images/shenpishibai.gif"><span style="color:#f00;">����ʧ��</span>
											</s:else>
										</s:else>
									</td>
								</tr>
							</s:iterator>
						</table>
					</td>
					</s:if>
					<td align="center">
						<s:if test="state==0">
							����������
						</s:if>
						<s:else>
							<s:if test="state==1">
								�����ɹ�
							</s:if>
							<s:else>
								����ʧ��
							</s:else>
						</s:else>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</div>
	</body>
</html>
