<%@ page contentType="text/html;charset=gbk" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
	<head>
		<title>������ҳ</title>
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
	              	{//IE֮��������
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
	                     		alert("���ܴ���XMLHttpRequest���󣡣���");
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
					//��ʼ��XMLHttpRequest����
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
	                	alert("���û����Ѿ���ռ�ã���������д");
	                }
	             }
	          }
	        }
	        function updateGroup()
	        {
	        	var dept=document.getElementById("dept").value.trim();

	        	document.getElementById("roleL").innerHTML="\<select name=\"role\" id=\"role\" style=\"width:200px;\"\>\<option value=\"\"\>ѡ���ɫ\</option>\</select>"
	 
        		var uri="groupList.action?dept="+escape(dept);
				//��ʼ��XMLHttpRequest����
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
				//��ʼ��XMLHttpRequest����
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
	        		alert("�û�������Ϊ��");
	        		return false;
	        	}
	        	if(name.length>10)
	        	{
	        		alert("�û���̫��");
	        		return false;
	        	}
	        	if(!namepat.exec(name))
	        	{
	        		alert("�û���ֻ������ĸ���ֺ��»������");
	        		return false;
	        	}
	        	var pwd1=document.getElementById("pwd1").value.trim();
	        	if(pwd1=="")
	        	{
	        		alert("���벻��Ϊ��");
	        		return false;
	        	}
	        	var pwdpat=/^[0-9a-zA-Z_]{1,10}$/;
	        	if(!pwdpat.exec(pwd1))
	        	{
	        		alert("����ֻ����10λ���ڵ���ĸ���ֺ��»������");
	        		return false;
	        	}
	        	var pwd2=document.getElementById("pwd2").value.trim();
	        	if(pwd1!=pwd2)
	        	{
	        		alert("�����������벻һ��");
	        		return false;
	        	}
	        	var realName=document.getElementById("realName").value.trim();
	        	if(realName=="")
	        	{
	        		alert("��ʵ��������Ϊ��");
	        		return false;
	        	}
	        	if(realName.length>10)
	        	{
	        		alert("��ʵ����������������ȷ��");
	        		return false;
	        	}
	        	var birth=document.getElementById("birth").value.trim();
	        	var birthpat=/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
	        	if(!birthpat.exec(birth))
	        	{
	        		alert("�������ڸ�ʽ����ȷ������ȷ��");
	        		return false;
	        	}
	        	var role=document.getElementById("role").value.trim();
	        	if(role=="")
	        	{
	        		alert("��ѡ��Ա���Ĺ���ְλ");
	        		return false;
	        	}
	        	var email=document.getElementById("email").value.trim();
	        	var emailpat=/^[.-_a-zA-Z0-9]+@[-_a-zA-Z0-9]+\.[.a-zA-Z0-9]+$/;
	        	if(!emailpat.exec(email))
	        	{
	        		alert("�����ʽ����ȷ������");
	        		return false;
	        	}
	        	var tel=document.getElementById("tel").value.trim();
	        	var telpat=/^[0-9]{7,20}$/;
	        	if(!telpat.exec(tel))
	        	{
	        		alert("��ϵ�绰��ʽ����ȷ������");
	        		return false;
	        	}
	        	var salary=document.getElementById("salary").value.trim();
	        	var salarypat=/^[0-9]{1,5}[\.]?[0-9]{0,2}$/;
	        	if(!salarypat.exec(salary))
	        	{
	        		alert("����н����д��������");
	        		return false;
	        	}
	        	if(salary>99999.99||salary<0)
	        	{
	        		alert("����н�ʳ�����Χ");
	        		return false;
	        	}
	        	var jianli=document.getElementById("jianli").value.trim();
	        	if(jianli=="")
	        	{
	        		alert("���˼�������Ϊ��");
	        		return false;
	        	}
	        	if(jianli.length>2000)
	        	{
	        		alert("���˼���̫��");
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
					<a href="#" class="nav-top-item">
						��������
					</a>
					<s:if test="right==3">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a class="current" href="allDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
				<s:else>
					<s:if test="right==2">
					<ul>
						<li><a href="viewDoc.action">��������</a></li>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:if>
					<s:else>
					<ul>
						<li><a href="sendDoc.action">��������</a></li>
						<li><a href="myDoc.action">�ҵ�����</a></li>
					</ul>
					</s:else>
				</s:else>
				</li>				
				<s:if test="right==3">
				<li>
					<a href="#" class="nav-top-item current">
						������Դ
					</a>
					<ul>
						<li><a class="current" href="addUser.action">���Ա��</a></li>
						<li><a href="viewUser.action">Ա������</a></li>
					</ul>
				</li> 
				</s:if>   
				<li>
					<a href="#" class="nav-top-item ">
						�����ʼ�
					</a>
					<ul>
						<li><a class="" href="sendEmail.jsp">�����ʼ�</a></li>
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
		<s:form action="addUser2" theme="simple" onsubmit="return checkAddUser();" method="post" enctype="multipart/form-data">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr style="height:40px;">
					<td align="right" style="width:120px;border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�û�����</td>
					<td style="width:230px;border-bottom:#a8cde4 solid 1px;"><s:textfield name="name" id="name" cssStyle="width:200px;" onblur="checkUnique();"/></td>
					<td style="width:400px;border-bottom:#a8cde4 solid 1px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">���룺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd1" id="pwd1" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;width:450px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�ٴ��������룺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:password name="pwd2" id="pwd2"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">����ĸ�����ֻ��»�����ɣ��Ҳ��ܳ���10λ������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">��ʵ������</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="realName" name="realName" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��д������ʵ����������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�Ա�</td>
					<td style="border-bottom:#a8cde4 solid 1px;">
						<s:select id="gender" cssStyle="width:50px;" name="gender" list="#{'��':'��','Ů':'Ů'}" listKey="key" listValue="value"/>
				
					</td>
					<td style="border-bottom:#a8cde4 solid 1px;">ѡ���Ա𣬱���</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ڣ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="birth" name="birth" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ʽΪYYYY-MM-DD,��2009-01-17��ʾ2009��1��17��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ţ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:select name="dept" id="dept" onchange="updateGroup();" cssStyle="width:200px;" list="deptList" listKey="deptNumber" listValue="deptName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�����飺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"  id="groupL"><s:select id="group" name="group" onchange="updateRole();" cssStyle="width:200px;" list="groupList" listKey="groupNumber" listValue="groupName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">ְλ��ɫ��</td>
					<td id="roleL" style="border-bottom:#a8cde4 solid 1px;"><s:select name="role" id="role" cssStyle="width:200px;" list="roleList" listKey="roleNumber" listValue="roleName"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������䣺</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="email" id="email" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ʽ������ȷ</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�绰��</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield id="tel" name="tel"  cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">����д����õ���ϵ���绰</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�������ʣ�</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:textfield name="salary" id="salary" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">������</td>
				</tr>
				<tr style="height:40px;">
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">�ϴ�ͷ��</td>
					<td style="border-bottom:#a8cde4 solid 1px;"><s:file name="pic" id="pic" cssStyle="width:200px;"/></td>
					<td style="border-bottom:#a8cde4 solid 1px;">��ѡ��</td>
				</tr>
				<tr>
					<td align="right" style="border-bottom:#a8cde4 solid 1px;border-right:#a8cde4 solid 1px;">���˼�����</td>
					<td colspan="2" style="border-bottom:#a8cde4 solid 1px;"><s:textarea name="jianli" id="jianli" cssStyle="width:610px;height:100px;"/></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2"><s:submit value="�ύ"/>&nbsp&nbsp&nbsp&nbsp&nbsp<s:reset value="ȡ��"/></td>
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
