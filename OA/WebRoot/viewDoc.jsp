<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>待批公文</title>
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
						<li><a  class="" href="manageShare.action">管理共享</a></li>
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
						<li><a class="current" href="viewDoc.action">待批申请</a></li>
						<li><a href="sendDoc.action">发送申请</a></li>
						<li><a href="allDoc.action">所有申请</a></li>
						<li><a href="myDoc.action">我的申请</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a class="current" href="viewDoc.action">待批申请</a></li>
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
			<div class="content-box">
			<table width="100%" align=center cellpadding="0" cellspacing="0">
				<tr style="background-color:#c1d9f3;height:23">
					<th style="border-bottom:2px solid #154ba0;">申请发送者</th>
					<th style="border-bottom:2px solid #154ba0;">所属部门</th>
					<th style="border-bottom:2px solid #154ba0;">主题</th>
					<th style="border-bottom:2px solid #154ba0;">发送时间</th>
					<th style="border-bottom:2px solid #154ba0;">进度</th>
					<th style="border-bottom:2px solid #154ba0;">^_^</th>
				</tr>
			
			<s:iterator value="docList" status="doc" >
			
			<tr id="doc<s:property value='#doc.index'/>" style="height:23px;" 
					onmouseover="mouseovercolor('doc<s:property value='#doc.index'/>')" 
					onmouseout="mouseoutcolor('doc<s:property value='#doc.index'/>')">
					<td style="border-bottom:1px solid #a8cde4"><s:property value="fromuser"/></td>
					<td style="border-bottom:1px solid #a8cde4"><s:property value="deptname"/></td>
					<td style="border-bottom:1px solid #a8cde4"><s:property value="title"/></td>
					<td style="border-bottom:1px solid #a8cde4"><s:property value="doctime"/></td>
					<td style="border-bottom:1px solid #a8cde4">
						<a href="docPro.action?docnum=<s:property value="docnum"/>">查看</a>
					</td>
					<td style="border-bottom:1px solid #a8cde4">
						<a href="readDoc.action?docnum=<s:property value="docnum"/>">审批</a>
					</td>
				
			</tr>
			</s:iterator>
			<tr style="background-color:#c1d9f3;height:23">
					<td colspan="8">
					<s:form action="viewDoc" theme="simple" method="post" >
					<table width="100%" >
					<tr style="height:23px;">
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4"></td>
						<td style="border-bottom:1px solid #a8cde4" align="right">
							<s:select onchange="this.form.submit();" name="pageSpan" 
							list="#{2:'2条/页',5:'5条/页',10:'10条/页',15:'15条/页',20:'20条/页',25:'25条/页'}"
							 listKey="key" listValue="value"/>
							<s:property value="currenPage"/>/<s:property value="maxPage"/>
							<s:if test="currenPage>1">
							<a href="viewDoc.action?currenPage=<s:property value="currenPage-1"/>" style="text-decoration:none;color:#0f4097">上一页</a>
							</s:if>
							<s:if test="currenPage<maxPage">
							<a href="viewDoc.action?currenPage=<s:property value="currenPage+1"/>" style="text-decoration:none;color:#0f4097">下一页</a>
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
