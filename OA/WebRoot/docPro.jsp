<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>待批申请</title>
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
				欢迎你, <a href="#" title="Edit your profile">经理</a> | <a href="exitSys.action" title="Sign Out">退出</a><br />				
			</div>        			
			<ul id="main-nav"> 				
				<li>
					<a href="mainManage.action" class="nav-top-item">
						系统首页
					</a>       
				</li>				
				<li> 
					<a href="#" class="nav-top-item"> <!-- Add the class "current" to current menu item -->
					文件管理
					</a>
					<ul>
						<li><a href="sendFile.action">发送文件</a></li>
						<li><a href="receiveFile.action">接收文件</a></li> 
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						文件共享
					</a>
					<ul>
						<li><a href="viewShare.action">查看共享</a></li>
						<li><a href="uploadShare.action">上传共享</a></li>
						<s:if test="right==3">
						<li><a  class="current" href="manageShare.action">管理共享</a></li>
						</s:if>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item ">
						消息管理
					</a>
					<ul>
						<li><a href="receiveMessage.action" class="">接收消息</a></li>
						<li><a href="sendMessage.action">发送消息</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item current">
						审批申请
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="allDoc.action">所有申请</a></li>
						<li><a href="myDoc.action" class="current">我的申请</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="myDoc.action" class="current">我的申请</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="myDoc.action" class="current">我的申请</a></li>
					</ul>
					</s:else>
				</s:else>
				</li>				
				<s:if test="right==3">
				<li>
					<a href="#" class="nav-top-item">
						人力资源
					</a>
					<ul>
						<li><a href="addUser.action">添加员工</a></li>
						<li><a href="viewUser.action">员工管理</a></li>
					</ul>
				</li> 
				</s:if>   
				<li>
					<a href="#" class="nav-top-item">
						电子邮件
					</a>
					<ul>
						<li><a href="sendEmail.jsp">发送邮件</a></li>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item">
						紧急事务
					</a>
					<ul>
						<li><a href="sendAlarm1.action">紧急报警</a></li>
						<s:if test="right==3">
						<li><a href="viewAlarm.action">查看报警</a></li>
						</s:if>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item">
						系统管理
					</a>
					<ul>
						<li><a href="changePwd.jsp">修改密码</a></li>
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
					发送消息
				</span></a></li>				
								
				<li><a class="shortcut-button" href="uploadShare.action"><span>
					<img src="resources/images/icons/image_add_48.png" alt="icon" /><br />
					上传文档
				</span></a></li>				
				<li><a class="shortcut-button" href="scanDoc.action"><span>
					<img src="resources/images/icons/scanner.png" alt="icon" /><br />
					文档扫描
				</span></a></li>
				
				<li><a class="shortcut-button" href="sendEmail.jsp"><span>
					<img src="resources/images/icons/email.png" alt="icon" /><br />
					电子邮件
				</span></a></li>
				
				<li><a class="shortcut-button" href="sendAlarm1.action"><span>
					<img src="resources/images/icons/alarm.png" alt="icon" /><br />
					紧急警报
				</span></a></li>
				
			</ul><!-- End .shortcut-buttons-set -->
			<div class="clear"></div>
			<div class="content-box">
			<table cellpadding="0" cellspacing="0" border="1"  style="margin:30 auto;border-color:#154ba0;" align="center">
				<tr style="height:30px;">
					<td align="center" style="width:150px;">主题</td>
					<td align="center" style="width:200px;">一级审批状态</td>
					<s:if test="type==2">
					<td align="center" style="width:200px;">二级审批状态</td>
					</s:if>
					<td align="center" style="width:150px;">公文状态</td>
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
											<img src="images/weishenpi.gif"><span style="color:#ffb637;">未审批</span>
										</s:if>
										<s:else>
											<s:if test="deptState==1">
												<img src="images/shenpichenggong.gif"><span style="color:#298a00;">审批通过</span>
											</s:if>
											<s:else>
												<img src="images/shenpishibai.gif"><span style="color:#f00;">审批失败</span>
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
											<img src="images/weishenpi.gif"><span style="color:#ffb637;">未审批</span>
										</s:if>
										<s:else>
											<s:if test="deptState==1">
												<img src="images/shenpichenggong.gif"><span style="color:#298a00;">审批通过</span>
											</s:if>
											<s:else>
												<img src="images/shenpishibai.gif"><span style="color:#f00;">审批失败</span>
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
							正在审批中
						</s:if>
						<s:else>
							<s:if test="state==1">
								审批成功
							</s:if>
							<s:else>
								审批失败
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
