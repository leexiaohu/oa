<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>管理首页</title>
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
				alert("旧密码不能为空！！");
				return false;
			}
			var newpwd1=document.getElementById("newpwd1").value.trim();
			if(newpwd1=="")
			{
				alert("新密码不能为空");
				return false;
			}
			var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
        	if(!pwdpat.exec(newpwd1))
        	{
        		alert("密码只能由10位以内的字母数字和下划线组成");
        		return false;
        	}
        	var newpwd2=document.getElementById("newpwd2").value.trim();
        	if(newpwd1!=newpwd2)
        	{
        		alert("两次输入的新密码不匹配");
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
					<a href="#" class="nav-top-item ">
						紧急事务
					</a>
					<ul>
						<li><a  href="sendAlarm1.action">紧急报警</a></li>
						<s:if test="right==3">
						<li><a href="viewAlarm.action">查看报警</a></li>
						</s:if>
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item current">
						系统管理
					</a>
					<ul>
						<li><a class="current" href="changePwd.jsp">修改密码</a></li>
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
		<s:form onsubmit="return changepwd();" theme="simple" method="post" action="changePwd">
			<table align="left" style="width:750px;">
				<caption style="text-align:center;margin:0 auto;font-size:21px;color:#154ba0;background-color:#a8cde4">修改密码</caption>
				<tr style="height:30px;">
					<td align="right">旧密码：</td>
					<td><s:password id="oldpwd" name="oldpwd"/></td>
					<td>请输入您的原始密码，以确认您的身份</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">新密码：</td>
					<td><s:password id="newpwd1" name="newpwd1"/></td>
					<td>新密码由10位以内的字母数字或下划线组成</td>
				</tr>
				<tr style="height:30px;">
					<td align="right">确认新密码：</td>
					<td><s:password id="newpwd2" name="newpwd2"/></td>
					<td>必须与上面填写的新密码一致</td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="确认"/>&nbsp&nbsp&nbsp&nbsp<s:reset value="取消"/></td>
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
