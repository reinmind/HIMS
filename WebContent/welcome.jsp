<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
			+ ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
<TITLE>XX医院信息管理系统</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="style/mycss.css" rel="stylesheet" type="text/css" />
<link href="style/texts.css" rel="stylesheet" type="text/css" />
<link href="style/btn.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
		 function check(){
			var user = 

document.getElementById("username");
			if(user.value==""){
				alert("用户名不能为空!");
		        user.focus();
		        return false;
			}
			var pass = 

document.getElementById("password");
			if(pass.value==""){
				alert("密码不能为空！");
				pass.focus();
				return false;
			}
			myform.submit();
			}
		</script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<table width="824" border="0" align="center" cellpadding="0" cellspacing="0" height="588">
  <tr>
    <td colspan="5"><img src="images/top.jpg" width="815" height="200"></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/middle1.jpg" width="821" height="85"></td>
  </tr>
  <tr>
    <td width="38" background="images/middle2.jpg">&nbsp;</td>
    <td width="172">
	<table align="center" width="68" height="67">
		<tr>
		  <td><font color="#0000ff"><a href="login.jsp?information=null">用户登录</a></font></td>
		</tr>
		<tr>
		  <td><div align="center"><font color="#0000a0"><a href="register.jsp">用户注册</a></font></div></td>
		</tr>
	</table>
	</td>
    <td width="35" background="images/layout_24.gif">&nbsp;</td>
    <td width="495">
	<table align="center" width="485" height="164">
		<tr>
			<td colspan="2" align="center">
							
			</td>
		</tr>
		<tr>
			<td>系统介绍：</td>
		</tr>
		<tr>
			<td colspan="2"><hr/></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp; <br>&nbsp;&nbsp; 医院信息管理系统是现代化医院必不可少的基础设施，它利用信息化的手<br>段来处理医院日常办公及其他事务，为广大患者提供更高品质的服务，同时也可以提高自身的管理质量和经济效益。&nbsp;&nbsp; <br><br>&nbsp;&nbsp; 信息管理系统是医院信息管理系统中重要组成部分。为医院的工作提供了极大的帮助。信息管理系统能够实现划价收费，药房管理，单据及查询，药品信息维护，权限管理等多方面的功能。信息管理系统能够提高医院的工效率，为患者提供更好的医疗服务。 <br><br>&nbsp;&nbsp; 本系统旨在根据医院的业务特点，采用Struts2、Spring、Hibernate等Java EE技术，mysql数据库，设计并实现一个基于B/S结构的小型医院信息管理系统。该系统采用MVC结构和面向对象的技术，使得各个模块之间的耦合性较低，容易改进现有功能和扩充新功能。</td>
		</tr>
	</table>
	</td>
    <td width="40" background="images/middle4.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/bottom.jpg" width="821" height="137"></td>
  </tr>
</table>
<P align="center">&copy;《医院信息管理系统》 版权所有</P>
<br/>
</BODY>
</html>
