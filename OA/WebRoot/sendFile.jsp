<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>发送文件</title>
		
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
		
			function getUserList()	{
				var deptnumber=document.getElementById("deptlist").value;//获得选择的部门编号
				if(deptnumber!=""){//如果部门编号不是空字符串
					var uri="userListAction.action?deptNumber="+escape(deptnumber);//组织uri
					
	              	if(window.XMLHttpRequest)//初始化XMLHttpRequest对象
	              	{//IE之外的浏览器
	              		req=new XMLHttpRequest();
	             	}else{//如果是IE浏览器
	                	try{req=new ActiveXObject("Msxml2.XMLHTTP");}
	                	catch(e){
	                  		try	{req=new ActiveXObject("Microsoft.XMLHTTP");}
	                  		catch(e){
	                     		alert("不能创建XMLHttpRequest对象！！！");
	                     		return;
	                  		}
	                	}
	              	}              
				  	req.open("post",uri,true);
				  	req.onreadystatechange=handleResponse;//设置状态处理函数
	             	req.send(null); //发送请求   
             	}
			}
			function handleResponse(){
	          if(req.readyState==4){
	             if(req.status==200){
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
	        	var area=document.getElementById("touser");
	        	
	        	touser=area.value.trim();
	        	var array=touser.split(";");
	        	for(var i=0;i< array.length;i++)
	        	{
	        		if(array[i].trim()==user.trim())
	        		return;
	        	}
	        	if(touser!="")
	        	{
	        		touser=touser+" ";
	        	}
	        	touser=touser+user.trim()+";";
	        	area.value=touser;

	        }
	        function checksend()
	        {

	        	
	        	var info=document.getElementById("info").value.trim();
	        	if(info=="")
	        	{
	        		alert("简要主题不能为空");
	        		return false;
	        	}
	        	var myFile=document.getElementById("myFile").value.trim();
	        	if(myFile=="")
	        	{
	        		alert("请选择要发送的文件");
	        		return false;
	        	}
	        	var touser=document.getElementById("touser").value.trim();
	        	
	        	if(touser=="")
	        	{
	        		alert("收件人不能为空");
	        		return false;
	        	}
	        	if(touser.length>350)
	        	{
	        		alert("收件人过多");
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
				欢迎你, <a href="#" title="Edit your profile">经理</a> | <a href="exitSys.action" title="Sign Out">退出</a><br />				
			</div>        			
			<ul id="main-nav"> 				
				<li>
					<a href="mainManage.action" class="nav-top-item">
						系统首页
					</a>       
				</li>				
				<li> 
					<a href="#" class="nav-top-item current"> <!-- Add the class "current" to current menu item -->
					文件管理
					</a>
					<ul>
						<li><a class="current" href="sendFile.action">发送文件</a></li>
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
						<li><a href="manageShare.action">管理共享</a></li>
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
						<li><a href="allDoc.action">所有申请</a></li>
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
		<div id="content-box">
			<table border="0" bgcolor="#eff5fb" width="100%">
			<tr>
				<td width="75%">
				<s:form onsubmit="return checksend();" theme="simple" action="sendFile2" method="post" enctype="multipart/form-data">
					<table style="width:70%;text-align:center;" border="0">
						<tr>
							<td style="width:80px;"></td>
							<td align="left">发送文件</td>
							<td align="right">发件人:<s:property value="fromuser"/></td>
						</tr>
						<tr>
							<td align="right">简要主题</td>
							<td colspan="2" align="left"><s:textfield id="info" name="info" cssStyle="width:420px;height:25px;"/></td>
						</tr>
						<tr>
							<td align="right">选择文件</td>
							<td colspan="2" align="left"><s:file id="myFile" name="myFile" onkeydown="return false;" size="49" cssStyle="width:420px;height:25px;"/></td>
						</tr>
						
						<tr>
							<td align="right">收件人列表</td>
							<td colspan="2" align="left"><s:textarea onfocus="this.blur();" name="touser" id="touser" cols="20" wrap="virtual" cssStyle="width:420px;height:100px;" theme="simple"/></td>
						</tr>
						<tr>
							<td></td>
							<td align="left"><s:submit value="发送" id="sub"/>&nbsp&nbsp&nbsp<s:reset value="取消"/></td>
							<td></td>
						</tr>
					</table>
				</s:form>
				</td>
				<td width="25%">
					<table align="cneter">
						<tr>
						<td align="center">部门:<s:select id="deptlist" list="deptList" listKey="deptNumber" listValue="deptName" theme="simple" cssStyle="width:150;height:25px;" onchange="getUserList();"/></td>
						</tr>
						<tr>
						<td align="center">
							<div id="userlist"></div>
						</td>
						</tr>
					
					</table>
				</td>
			</tr>
			</table>
		</div>
	
	<div id="tishi" style="width:300px;height:20px;position:absolute;display:none;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr bgcolor="#4b981d" style="height:20px;width:300px;">
				<td>&nbsp&nbsp&nbsp</td>
				<td><img src="images/ico_loading.gif"></td>
				<td>&nbsp&nbsp&nbsp&nbsp正在发送，请稍候.......</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	<script>
		var result="<s:property value="result"/>";
		if(result!="")
		{
			alert(result);
		}
	</script>
	</body>
</html>
