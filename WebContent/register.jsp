<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>XX医院信息管理系统</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="style/mycss.css" rel="stylesheet" type="text/css" />
<link href="style/text.css" rel="stylesheet" type="text/css" />
<link href="style/btn.css" rel="stylesheet" type="text/css" />
<style>
	.info {
		margin-left: 10px;
		color: #D66350;
	}
	.infook{
		margin-left: 10px;
		color: #91BD47;
	}
</style>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/register.js"></script>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5"><img src="images/top.jpg" width="816" height="200" ></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/middle1.jpg" width="821" height="67"></td>
  </tr>
  <tr>
    <td width="38" background="images/middle2.jpg">&nbsp;</td>
    <td width="172">
	<table align="center" width="86" height="69" style="width: 86px; height: 69px;">
		<tr>
		  <td><a href="welcome.jsp">返回首页</a></td>
		</tr>
		<tr>
		  <td><a href="login.jsp">用户登录</a></td>
		</tr>
	</table>
	</td>
    <td width="35" background="images/layout_24.gif">&nbsp;</td>
    <td width="495">
	<form action="register" method="post" name="myform">
		<table align="center" width="473" height="217">
			<tr ><td width="100">用户注册：</td></tr>
			<tr><td colspan="2"><hr width="100%"/></td></tr>
			<tr>
				<td>员工号：</td>
				<td><input width="30" type="text" name="id" id="userid"/></td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" id="username"></td>
			</tr>
			
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>重复密码：</td>
				<td><input type="password" name="password2" id="password2"></td>
			</tr>
			<tr>
				<td><input type="submit" value="注册" onClick="return check()">&nbsp;</td>
				<td><input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
	</td>
    <td width="40" background="images/middle4.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/bottom.jpg" width="821" height="140"></td>
  </tr>
</table>
<P align="center">&copy; 《医院信息管理系统》 版权所有</P>
<br/>
</BODY>
</HTML>