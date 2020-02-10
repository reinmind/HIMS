<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String info = request.getParameter("information");
%>
<TITLE>XX医院信息管理系统</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="style/mycss.css" rel="stylesheet" type="text/css" />
<link href="style/text.css" rel="stylesheet" type="text/css" />
<link href="style/btn.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		 function check(){
			var user = document.getElementById("username");
			if(user.value==""){
				alert("用户名不能为空!");
		        user.focus();
		        return false;
			}
			var pass = document.getElementById("password");
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

<table width="748" border="0" align="center" cellpadding="0" cellspacing="0" height="641">
  <tr>
    <td colspan="5"><img src="images/top.jpg" width="815" height="200"></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/middle1.jpg" width="821" height="68"></td>
  </tr>
  <tr>
    <td width="38" background="images/middle2.jpg">&nbsp;</td>
    <td width="172">
	<table align="center" width="68" height="67">
		<tr>
		  <td><font color="#0000ff"><a href="welcome.jsp">返回首页</a></font></td>
		</tr>
		<tr>
		  <td><div align="center"><font color="#0000a0"><a href="register.jsp">用户注册</a></font></div></td>
		</tr>
	</table>
	</td>
    <td width="35" background="images/layout_24.gif">&nbsp;</td>
    <td width="495">
	<form action="login" method="post" name="myform">
		<table align="center" width="358" height="237">
			<tr>
				<td colspan="2" align="center">
								
				</td>
			</tr>
			<tr>
				<td>用户登陆：</td>
				<td>&nbsp;<b style="color:red;"><%if("fail".equals(info)) out.print("用户名或者密码错误！"); %></b></td>
				
				<%
					System.out.println(info);
				%>
			</tr>
			
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td>用户名：</td>
				<td><input  size="25" type="text" name="username" id="username"/></td>
				
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" size="25" id="password"/></td>
			</tr>
			<tr>
				<td>
				<input type="submit"  value="登录" onClick="return check()"/>
				</td>
				<td><input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
	</td>
    <td width="40" background="images/middle4.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/bottom.jpg" width="821" height="137"></td>
  </tr>
</table>
<P align="center">&copy; 《医院信息管理系统》 版权所有</P>
<br/>
</BODY>
</HTML>