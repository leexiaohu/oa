<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>员工明细</title>
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
					<a href="#" class="nav-top-item current">
						人力资源
					</a>
					<ul>
						<li><a href="addUser.action">添加员工</a></li>
						<li><a class="current" href="viewUser.action">员工管理</a></li>
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
		<div id="content-box">
		  <table align="center" border="0" cellpadding="0" cellspacing="0" style="font-size:14px;color:#154ba0;background-color:#eff5fb;">
		  	<caption style="text-align:center;margin:0 auto;font-size:20px;background-color:#eff5fb;border-bottom:1px solid #154ba0;">
		  		<s:property value="user.realName"/>的个人基本信息
		  	</caption>
			<tr style="height:40px;">
				<td style="width:80px;border-bottom:1px solid #154ba0;">用户名：</td>
				<td style="width:200px;border-bottom:1px solid #154ba0;"><s:property value="user.userName"/></td>
				<td style="width:80px;border-bottom:1px solid #154ba0;">真实姓名：</td>
				<td style="width:200px;border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.realName"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">性别：</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.gender"/></td>
				<td style="border-bottom:1px solid #154ba0;">生日：</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.birth"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">所属部门：</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.deptName"/></td>
				<td style="border-bottom:1px solid #154ba0;">所属组：</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.groupName"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:1px solid #154ba0;">职位：</td>
				<td style="border-bottom:1px solid #154ba0;"><s:property value="user.roleName"/></td>
				<td style="border-bottom:1px solid #154ba0;">电子邮箱：</td>
				<td style="border-bottom:1px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.email"/></td>
			</tr>
			<tr style="height:40px;">
				<td style="border-bottom:2px solid #154ba0;">电话：</td>
				<td style="border-bottom:2px solid #154ba0;"><s:property value="user.phone"/></td>
				<td style="border-bottom:2px solid #154ba0;">基本薪资：</td>
				<td style="border-bottom:2px solid #154ba0;border-right:1px solid #154ba0;"><s:property value="user.salary"/></td>
			</tr>
			<tr style="height:200px;">
				<td style="border-bottom:1px solid #154ba0;">个人简历：</td>
				<td style="border-bottom:1px solid #154ba0;" ><s:property value="user.jianli"/></td>
				<td style="border-bottom:1px solid #154ba0;">个人头像：</td>
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
