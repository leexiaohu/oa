<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>查看报警</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		
		<script language="JavaScript">
			function mouseovercolor(id)
	        {
	        	document.getElementById(id).className="mouseover";
	        }
	        function mouseoutcolor(id)
	        {
	        	document.getElementById(id).className="mouseout";
	        }
			function checkall(form)
	        {
	        	if(document.getElementById("all-1").checked==true)
	        	{
	        		for (var i=0;i<form.elements.length;i++){
						var e = form.elements[i];

						if (e.name=='delList' )
						{
							e.checked =true;
						}
						
					}

	        	}
	        	else
	        	{
	        		for (var i=0;i<form.elements.length;i++){
						var e = form.elements[i];

						if (e.name=='delList' )
						{
							e.checked =false;
						}
						}
	        	}
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
					<a href="#" class="nav-top-item">
						消息管理
					</a>
					<ul>
						<li><a href="receiveMessage.action">接收消息</a></li>
						<li><a href="sendMessage.action">发送消息</a></li>
					</ul>
				</li>
				
				<li>
					<a href="#" class="nav-top-item">
						审批申请
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a class="current" href="allDoc.action">所有申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
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
					<a href="#" class="nav-top-item ">
						电子邮件
					</a>
					<ul>
						<li><a class="" href="sendEmail.jsp">发送邮件</a></li>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item current">
						紧急事务
					</a>
					<ul>
						<li><a href="sendAlarm1.action">紧急报警</a></li>
						<s:if test="right==3">
						<li><a class="current" href="viewAlarm.action">查看报警</a></li>
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
			<table>
			<tr>
			<s:iterator value="deptList" status="dept" >
				<td><a href="viewAlarm.action?currenPage=1&deptNumber=<s:property value="deptNumber"/>"><s:property value="deptName"/></a></td>
			</s:iterator>
			</tr>
			</table>
			<table width="100%" align=center cellpadding="0" cellspacing="0">
			<s:form action="delAlarm" theme="simple" method="post" id="delform">
			<s:hidden name="currenPage"/>
				<tr style="background-color:#c1d9f3;height:23">
					<th style="border-bottom:2px solid #154ba0;">
						&nbsp&nbsp<s:checkboxlist id="all" name="all" list="#{'all':''}" listKey="key" listValue="value" onclick="checkall(this.form);"/>
						<img src="images/close.gif">
					</th>
					<th style="border-bottom:2px solid #154ba0;">发件人</th>
					<th style="border-bottom:2px solid #154ba0;">主题</th>
					<th style="border-bottom:2px solid #154ba0">时间</th>
					<th style="border-bottom:2px solid #154ba0">部门</th>
				</tr>
				
				<s:iterator value="alarmList" status="alarm" >
				
				<tr id="alarm<s:property value='#alarm.index'/>" style="height:23px;" 
					onmouseover="mouseovercolor('alarm<s:property value='#alarm.index'/>')" 
					onmouseout="mouseoutcolor('alarm<s:property value='#alarm.index'/>')">
					<td style="border-bottom:1px solid #a8cde4">
						&nbsp&nbsp<s:checkboxlist name="delList" list="#alarm" listKey="number" listValue="''"/>
						<s:if test='state=="0"'><img src="images/open.gif" title="未读"></s:if>
						<s:else><img src="images/hasRd.gif" title="已读"></s:else>
					</td>
					<td onClick="document.location.href='alarmDetail.action?currenPage=<s:property value="currenPage"/>&alarmNumber=<s:property value="number"/>';" style="border-bottom:1px solid #a8cde4"><s:property value="fromuserName"/></td>
					<td onClick="document.location.href='alarmDetail.action?currenPage=<s:property value="currenPage"/>&alarmNumber=<s:property value="number"/>';" style="border-bottom:1px solid #a8cde4"><s:property value="title"/></td>
					<td onClick="document.location.href='alarmDetail.action?currenPage=<s:property value="currenPage"/>&alarmNumber=<s:property value="number"/>';" style="border-bottom:1px solid #a8cde4"><s:property value="time"/></td>
					<td onClick="document.location.href='alarmDetail.action?currenPage=<s:property value="currenPage"/>&alarmNumber=<s:property value="number"/>';" style="border-bottom:1px solid #a8cde4"><s:property value="deptName"/></td>
					
				</tr>
				
				</s:iterator>
			</s:form>
				<tr style="background-color:#c1d9f3;height:23">
					<td colspan="5">
				<s:form action="viewAlarm" theme="simple" method="post" >
					<table width="100%" >
					<tr style="height:23px;">
						<td style="border-bottom:1px solid #a8cde4">&nbsp<s:submit onclick="document.getElementById('delform').submit();return false;" value="删除"/></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4" align="right">
							<s:select onchange="this.form.submit();" name="pageSpan" 
							list="#{2:'2条/页',5:'5条/页',10:'10条/页',15:'15条/页',20:'20条/页',25:'25条/页'}"
							 listKey="key" listValue="value"/>
							<s:property value="currenPage"/>/<s:property value="maxPage"/>
							<s:if test="currenPage>1">
							<a href="viewAlarm.action?currenPage=<s:property value="currenPage-1"/>" style="text-decoration:none;color:#0f4097">上一页</a>
							</s:if>
							<s:if test="currenPage<maxPage">
							<a href="viewAlarm.action?currenPage=<s:property value="currenPage+1"/>" style="text-decoration:none;color:#0f4097">下一页</a>
							</s:if>
						</td>
					</tr>
					</table>
				</s:form>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	</body>
</html>
