<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
	<head>
		<title>提交申请</title>
		
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />	  		
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>		
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>		
		<script type="text/javascript">
			function changeDoc()
			{
				var type=document.getElementById("type").value;
				if(type==1)
				{
					document.getElementById("second").style.visibility="hidden";
				}
				else
				{
					document.getElementById("second").style.visibility="visible";
				}
			}
			function checkdoc()
			{
				var type=document.getElementById("type").value;
				var first=false;
				var second=false;
				if(type==2)
				{
					for(var i = 1;i < 7;i++)
					{
						f=document.getElementById("firstList-"+i).checked;
						s=document.getElementById("secondList-"+i).checked;
						if(f==true)
						{
							first=true;
						}
						if(s==true)
						{
							second=true;
						}
						if(f==s && f==true)
						{
							alert("一级审批与二级审批中不可以有重复的部门");
							return false;
						}
					}
					if(first==false)
					{
						alert("一级审批部门不能为空");
						return false;
					}
					if(second==false)
					{
						alert("二级审批部门不能为空");
						return false;
					}
					var topic=document.getElementById("topic").value;
					if(topic=="")
					{
						alert("公文主题不能为空");
						return false;
					}
					var content=document.getElementById("content").value;
					if(content=="")
					{
						alert("公文主题不能为空");
						return false;
					}
					return true;
				}
				else
				{
					for(var i = 1;i < 7;i++)
					{
						f=document.getElementById("firstList-"+i).checked;
						if(f==true)
						{
							var topic=document.getElementById("topic").value;
							if(topic=="")
							{
								alert("公文主题不能为空");
								return false;
							}
							var content=document.getElementById("content").value;
							if(content=="")
							{
								alert("公文内容不能为空");
								return false;
							}
							return true;
						}
					}
				}
				alert("审批部门不能为空");
				return false;
				
			}
				
		</script>
	</head>
	<body onload="changeDoc()">
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
					<a href="#" class="nav-top-item current">
						审批申请
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action" class="current">发送申请</a></li>
						<li><a href="allDoc.action">所有申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action" class="current">发送申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action" class="current">发送申请</a></li>
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
			<s:form action="sendDoc2" onsubmit="return checkdoc();" theme="simple" method="post">
			<table>
				<tr>
					<td>申请类型：</td>
					<td ><s:select name="type" id="type" list="#{'1':'一级审批','2':'二级审批'}" listKey="key" 
					listValue="value" onchange="changeDoc();"/></td>
				</tr>
				<tr>
					<td>一级审批部门：</td>
					<td>
						<!-- 
						<s:checkboxlist cssClass="list-style:none;" id="firstList" name="firstList" list="deptList"
						theme=""  listKey="deptNumber" listValue="deptName"/>
						 -->
						<% int countNumber = 1; %>
						<table><tr>
						<c:forEach items ="${deptList}" var="dept">
						<td>
							<input style="float: left" type="checkbox" name="firstList" value="${dept.deptNumber }" id="firstList-<%=countNumber%>">
							<label style="float: left" for="firstList-<%=countNumber%>" class="checkboxLabel">${dept.deptName }</label>
						</td>
							<%countNumber++;%>							
						</c:forEach>
					  </tr></table>
					</td>
				</tr>
				 
				<tr id="second">
					<td>二级审批部门：</td>
					<td>
					<!-- 
						<s:checkboxlist id="secondList" name="secondList" list="deptList" 
						theme="" listKey="deptNumber" listValue="deptName"/>
					 -->
					 <table><tr>
					    <% int i = 1; %>
						<c:forEach items ="${deptList}" var="dept">
						<td>
							<input style="float: left" type="checkbox" name="secondList" value="${dept.deptNumber }" id="secondList-<%=i%>">
							<label style="float: left" for="secondList-<%=i%>" class="checkboxLabel">${dept.deptName }</label>
							<%i++;%>
							</td>
						</c:forEach>
						</tr>
						</table>
					</td>
				</tr>				
				<tr>
					<td>申请主题：</td>
					<td><s:textfield name="topic" id="topic" cssStyle="width:500px; height:25px"/></td>
				</tr>
				<tr>
					<td>申请内容：</td>
					<td><s:textarea name="content" id="content" cssStyle="width:600px;height:250px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="提  交" cssStyle="width:70px"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="取  消" cssStyle="width:70px"/></td>
				</tr>
			</table>
			
		</s:form>
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