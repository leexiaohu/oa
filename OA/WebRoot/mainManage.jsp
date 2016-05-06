<%@ page contentType="text/html; charset=GBK" %>
<%@taglib prefix="s" uri="/struts-tags"%>
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

	 <script type="text/javascript">
		 //处理实时消息的类
		 function msgProcessorType()
	     {
	        this.processHQ=processHQ;
	     }  
	     
	     //处理行情实时消息的方法
	     function processHQ(msg)
	     {       
	          if(msg.data.deptNumber=="10000")
	          {
	          	changepic("zongjingli");
	          }
	          else if(msg.data.deptNumber=="10001")
	          {
	          	changepic("shichang");
	          }
	          else if(msg.data.deptNumber=="10002")
	          {
	          	changepic("jishu");
	          }
	          else if(msg.data.deptNumber=="10003")
	          {
	          	changepic("gongguan");
	          }
	          else if(msg.data.deptNumber=="10004")
	          {
	          	changepic("caiwu");
	          }
	          else if(msg.data.deptNumber=="10005")
	          {
	          	changepic("houqin");
	          }
	     }
	     //创建处理实时消息的对象
	     currentProcessor=new msgProcessorType();
	 </script>
		<link href="css/style.css" rel="stylesheet" type="text/css"/>
		<link href="css/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="css/dashboard.css" type="text/css" rel="stylesheet"/>
		<script language="JavaScript">
			String.prototype.trim = function()
			{
			  return this.replace(/(^\s*)|(\s*$)/g, "");
			}
			function changepic(picid)
			{
				var obj=document.getElementById(picid);
				var strArray=new Array();
				var picsrc=obj.src;
				strArray=picsrc.split("/");
				var size=strArray.length;
				if(strArray[size-1]=="light.png")
				{
					obj.src="images/dashboard/weight.png";
				}
				else
				{
					obj.src="images/dashboard/light.png";
				}
					setTimeout("changepic('"+picid+"')",500);
			}
		</script>	
	</head>
	<body>
	<div id="body-wrapper">	  		 
		<div>
			<s:action name="leftTree" executeResult="true"/>
		</div> 
		<div id="main-content">		
		<s:action name="top" executeResult="true"/>		
		<div class="clear"></div>
		<div class="content-box">
		<s:if test="right==3">
			<table cellpadding="0" width="100%" align="center" style="text-align:center;margin:55px auto;">
		
				<tr>
					<td align="left" style="background:url(images/dashboard/zongjingli.png) no-repeat center;width:100px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10000"><img style="width:20px;height:30px;" id="zongjingli" src="images/dashboard/ok.png">总经理</a></td>
					<td align="left" style="background:url(images/dashboard/caiwubu.png) no-repeat center;width:128px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10004"><img style="width:20px;height:30px;" id="caiwu" src="images/dashboard/ok.png">财务部</a></td>
					
					<td align="left" style="background:url(images/dashboard/gongguan.png) no-repeat center;width:128px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10003"><img style="width:20px;height:30px;" id="gongguan" src="images/dashboard/ok.png">公关部</a></td>
				</tr>
				<tr style="height:20px;">
					<td colspan="3" bgcolor="#f7f7f7"></td>
				</tr>
				<tr>
					<td align="left" style="background:url(images/dashboard/jishu.png) no-repeat center;width:128px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10002"><img style="width:20px;height:30px;" id="jishu" src="images/dashboard/ok.png">技术部</a></td>
					<td align="left" style="background:url(images/dashboard/shichangbu.png) no-repeat center;width:128px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10001"><img style="width:20px;height:30px;" id="shichang" src="images/dashboard/ok.png">市场部</a></td>
					
					<td align="left" style="background:url(images/dashboard/houqin.png) no-repeat center;width:128px;height:150px;background-color:#f7f7f7;"><a href="viewAlarm.action?deptNumber=10005"><img style="width:20px;height:30px;" id="houqin" src="images/dashboard/ok.png">后勤部</td>
				</tr>
			</table>
		</s:if>
		<s:else>
			<table width="99%" style="margin:20px auto;" align="center">
				<tr>
					<td style="width:33%">
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:15px;height:30px;">总经理室</td>
								<td rowspan="2"><img src="images/dashboard/zongjingli.png"></td>
								
							</tr>
							
						</table>
					</td>
					<td style="width:33%">
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:14px;height:30px;">财务部</td>
								<td rowspan="2"><img src="images/dashboard/caiwubu.png"></td>
								
							</tr>
							
						</table>
					</td>
					<td style="width:34%">
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:14px;height:30px;">公关部</td>
								<td rowspan="2"><img src="images/dashboard/gongguan.png"></td>
								
							</tr>
							
						</table>
					</td>
				</tr>
				<tr style="height:20px;">
					<td colspan="3" bgcolor="#f7f7f7"></td>
				</tr>
				<tr>
					<td>
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:14px;height:30px;">技术部</td>
								<td rowspan="2"><img src="images/dashboard/jishu.png"></td>
								
							</tr>
							
						</table>
					</td>
					<td>
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:14px;height:30px;">市场部</td>
								<td rowspan="2"><img src="images/dashboard/shichangbu.png"></td>
								
							</tr>
							
						</table>
					</td>
					<td>
						<table bgcolor="#f7f7f7" style="color:#333;">
							<tr>
							<td style="color:#154ba0;font-size:14px;height:30px;">后勤部</td>
								<td rowspan="2"><img src="images/dashboard/houqin.png"></td>
								
							</tr>
							
						</table>
					</td>
				</tr>
			</table>
		</s:else>
		</div>
		</div>
	</div>
	<script language="JavaScript">
		var zongjingli=<s:property value="zongjingli"/>;
		if(zongjingli!=0){
			changepic("zongjingli");
		}
		var shichang=<s:property value="shichang"/>;
		if(shichang!=0){
			changepic("shichang");
		}
		
		var jishu=<s:property value="jishu"/>;
		if(jishu!=0){
			changepic("jishu");
		}
		var gongguan="<s:property value="gongguan"/>";
		if(gongguan!=0){
			changepic("gongguan");
		}
		var caiwu=<s:property value="caiwu"/>;
		if(caiwu!=0){
			changepic("caiwu");
		}
		var houqin=<s:property value="houqin"/>;
		if(houqin!=0){
			changepic("houqin");
		}
	</script>
	<script type="text/javascript">
	    dojo.require("dojox.cometd");
	    //连接comet服务
	    r=dojox.cometd.init("cometd");
      //注册信道
	    dojox.cometd.subscribe("/Alarm",currentProcessor,"processHQ");
	 </script>
	</body>
</html>