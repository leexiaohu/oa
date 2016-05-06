<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
	<head>
		<title>�ύ����</title>
		
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
							alert("һ����������������в��������ظ��Ĳ���");
							return false;
						}
					}
					if(first==false)
					{
						alert("һ���������Ų���Ϊ��");
						return false;
					}
					if(second==false)
					{
						alert("�����������Ų���Ϊ��");
						return false;
					}
					var topic=document.getElementById("topic").value;
					if(topic=="")
					{
						alert("�������ⲻ��Ϊ��");
						return false;
					}
					var content=document.getElementById("content").value;
					if(content=="")
					{
						alert("�������ⲻ��Ϊ��");
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
								alert("�������ⲻ��Ϊ��");
								return false;
							}
							var content=document.getElementById("content").value;
							if(content=="")
							{
								alert("�������ݲ���Ϊ��");
								return false;
							}
							return true;
						}
					}
				}
				alert("�������Ų���Ϊ��");
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
					<a href="#" class="nav-top-item current">
						��������
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action" class="current">��������</a></li>
						<li><a href="allDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action" class="current">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action" class="current">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
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
			<s:form action="sendDoc2" onsubmit="return checkdoc();" theme="simple" method="post">
			<table>
				<tr>
					<td>�������ͣ�</td>
					<td ><s:select name="type" id="type" list="#{'1':'һ������','2':'��������'}" listKey="key" 
					listValue="value" onchange="changeDoc();"/></td>
				</tr>
				<tr>
					<td>һ���������ţ�</td>
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
					<td>�����������ţ�</td>
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
					<td>�������⣺</td>
					<td><s:textfield name="topic" id="topic" cssStyle="width:500px; height:25px"/></td>
				</tr>
				<tr>
					<td>�������ݣ�</td>
					<td><s:textarea name="content" id="content" cssStyle="width:600px;height:250px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td><s:submit value="��  ��" cssStyle="width:70px"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ  ��" cssStyle="width:70px"/></td>
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