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
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
			function getreq(){
				if(window.XMLHttpRequest)
	              	{//IE之外的浏览器
	              		req=new XMLHttpRequest();
	              		return req;
	             	}
	              	else
	              	{
	                	try
	                	{
	                  		req=new ActiveXObject("Msxml2.XMLHTTP");
	                  		return req;
	                	}
	                	catch(e)
	                	{
	                  		try
	                  		{
	                     		req=new ActiveXObject("Microsoft.XMLHTTP");
	                     		return req;
	                  		}
	                  		catch(e)
	                  		{
	                     		alert("不能创建XMLHttpRequest对象！！！");
	                     		return "";
	                  		}
	                	}
	                
	              	}
			}
			function checkUnique()
			{
				var name=document.getElementById("name").value.trim();
				
				if(name!="")
				{
					var uri="userUnique.action?name="+escape(name);
					//初始化XMLHttpRequest对象
	              	req=getreq();
	              	if(req=="")
	              	{
	              		return "";
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
	                if(msg.trim()=="no")
	                {
	                	alert("该用户名已经被占用，请重新填写");
	                }
	             }
	          }
	        }
	        function updateGroup()
	        {
	        	var dept=document.getElementById("dept").value.trim();

	        	document.getElementById("roleL").innerHTML="\<select name=\"role\" id=\"role\" style=\"width:200px;\"\>\<option value=\"\"\>选择角色\</option>\</select>"
	 
        		var uri="groupList.action?dept="+escape(dept);
				//初始化XMLHttpRequest对象
              	req=getreq();
              	if(req=="")
              	{
              		return "";
              	}        
			  	req.open("post",uri,true);
			  	req.onreadystatechange=handleResponse1;
             	req.send(null);
	        }
	        function handleResponse1()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                document.getElementById("groupL").innerHTML=msg;
	             }
	          }
	        }
	        function updateRole()
	        {
	        	var group=document.getElementById("group").value.trim();
        		var uri="roleList.action?group="+escape(group);
				//初始化XMLHttpRequest对象
              	req=getreq();
              	if(req=="")
              	{
              		return "";
              	}        
			  	req.open("post",uri,true);
			  	req.onreadystatechange=handleResponse2;
             	req.send(null);
	        }
	        function handleResponse2()
	        {
	          if(req.readyState==4)
	          {
	             if(req.status==200)
	             {
	                var msg=req.responseText;
	                document.getElementById("roleL").innerHTML=msg;
	             }
	          }
	        }
	        function checkAddUser()
	        {
	        	var name=document.getElementById("name").value.trim();
	        	var namepat=/^[0-9a-zA-Z_]{1,10}$/;
	        	if(name=="")
	        	{
	        		alert("用户名不能为空");
	        		return false;
	        	}
	        	if(name.length>10)
	        	{
	        		alert("用户名太长");
	        		return false;
	        	}
	        	if(!namepat.exec(name))
	        	{
	        		alert("用户名只能由字母数字和下划线组成");
	        		return false;
	        	}
	        	var pwd1=document.getElementById("pwd1").value.trim();
	        	if(pwd1=="")
	        	{
	        		alert("密码不能为空");
	        		return false;
	        	}
	        	var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
	        	if(!pwdpat.exec(pwd1))
	        	{
	        		alert("密码只能由10位以内的字母数字和下划线组成");
	        		return false;
	        	}
	        	var pwd2=document.getElementById("pwd2").value.trim();
	        	if(pwd1!=pwd2)
	        	{
	        		alert("两次密码输入不一致");
	        		return false;
	        	}
	        	var realName=document.getElementById("realName").value.trim();
	        	if(realName=="")
	        	{
	        		alert("真实姓名不能为空");
	        		return false;
	        	}
	        	if(realName.length>10)
	        	{
	        		alert("真实姓名过长，请检查正确性");
	        		return false;
	        	}
	        	var birth=document.getElementById("birth").value.trim();
	        	var birthpat=/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
	        	if(!birthpat.exec(birth))
	        	{
	        		alert("出生日期格式不正确，请您确认");
	        		return false;
	        	}
	        	var role=document.getElementById("role").value.trim();
	        	if(role=="")
	        	{
	        		alert("请选择员工的工作职位");
	        		return false;
	        	}
	        	var email=document.getElementById("email").value.trim();
	        	var emailpat=/^[.-_a-zA-Z0-9]+@[-_a-zA-Z0-9]+\.[.a-zA-Z0-9]+$/;
	        	if(!emailpat.exec(email))
	        	{
	        		alert("邮箱格式不正确，请检查");
	        		return false;
	        	}
	        	var tel=document.getElementById("tel").value.trim();
	        	var telpat=/^[0-9]{7,20}$/;
	        	if(!telpat.exec(tel))
	        	{
	        		alert("联系电话格式不正确，请检查");
	        		return false;
	        	}
	        	var salary=document.getElementById("salary").value.trim();
	        	var salarypat=/^[0-9]{1,5}[\.]?[0-9]{0,2}$/;
	        	if(!salarypat.exec(salary))
	        	{
	        		alert("基本薪资填写错误，请检查");
	        		return false;
	        	}
	        	if(salary>99999.99||salary<0)
	        	{
	        		alert("基本薪资超出范围");
	        		return false;
	        	}
	        	var jianli=document.getElementById("jianli").value.trim();
	        	if(jianli=="")
	        	{
	        		alert("个人简历不能为空");
	        		return false;
	        	}
	        	if(jianli.length>2000)
	        	{
	        		alert("个人简历太长");
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
					<a href="#" class="nav-top-item current">
						人力资源
					</a>
					<ul>
						<li><a class="current" href="addUser.action">添加员工</a></li>
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
		<s:form action="addUser2" theme="simple" onsubmit="return checkAddUser();" method="post" enctype="multipart/form-data">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr style="height:40px;">
					<td align="right" style="width:120px;border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">用户名：</td>
					<td style="width:230px;border-bottom:#a8cde4 solid 1px;"><s:textfield name="name" id="name" cssStyle="width:200px;" onblur="checkUnique();"/></td>
					<td style="width:400px;border-bottom:#a8cde4 solid 1px;">由字母、数字或下划线组成，且不能超出10位，必填</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">密码：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd1" id="pwd1" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;width:450px;">由字母、数字或下划线组成，且不能超出10位，必填</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">再次输入密码：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd2" id="pwd2"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">由字母、数字或下划线组成，且不能超出10位，必填</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">真实姓名：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="realName" name="realName" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">填写您的真实姓名，必填</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">性别：</td>
					<td style="border-bottom:#a8cde4 solid 1px;">
						<s:select id="gender" cssStyle="width:50px;" name="gender" list="#{'男':'男','女':'女'}" listKey="key" listValue="value"/>
				
					</td>
					<td style="border-bottom:#a8cde4 solid 1px;">选择性别，必填</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">出生日期：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="birth" name="birth" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">格式为YYYY-MM-DD,如2009-01-17表示2009年1月17日</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">所属部门：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:select name="dept" id="dept" onchange="updateGroup();" cssStyle="width:200px;" list="deptList" listKey="deptNumber" listValue="deptName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">必选项</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">所属组：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"  id="groupL"><s:select id="group" name="group" onchange="updateRole();" cssStyle="width:200px;" list="groupList" listKey="groupNumber" listValue="groupName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">必选项</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">职位角色：</td>
					<td id="roleL" style="border-bottom:#a8cde4 solid 1px;"><s:select name="role" id="role" cssStyle="width:200px;" list="roleList" listKey="roleNumber" listValue="roleName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">必选项</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">电子邮箱：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="email" id="email" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">格式必须正确</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">电话：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="tel" name="tel"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">请填写您最常用的联系西电话</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">基本工资：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="salary" id="salary" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">必填项</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">上传头像：</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:file name="pic" id="pic" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">可选项</td>
				</tr>
				<tr>
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">个人简历：</td>
					<td colspan="2" style="border-bottom:#a8cde4 solid 1px;"><s:textarea name="jianli" id="jianli" cssStyle="width:610px;height:100px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><s:submit value="提交"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="取消"/></td>
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
