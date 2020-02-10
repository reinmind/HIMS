<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
			+ ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
	<base href="<%= basePath %>">
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="style/use.css">
	<link rel="stylesheet" href="style/bootstrap.min.css">
	<style>
		#all {
			width: 500px;
			margin: 30px auto;
			padding: 30px 50px;
			border-radius: 20px;
			border: 1px solid #8DB2E3;
		}
		#all div.btns {
			text-align: center;
		}
		#all button.btn {
			width: 100px;
			margin: 0 20px;
			margin-top: 30px;
		}
		.btnp {
			padding-left: 10px;
			height: 27px;
			line-height: 27px;
			font-size: 12px;
			color: #1542B5;
			background: url("images/title_bg2.png");
		}
	</style>
</head>
<body>
	<p class="btnp">您当前的位置：<a href="html/welcome.jsp">首页</a> > 处方查询</p>
	<div id="all">
		<table class="table table-hover">
			<caption><h1>处方表</h1></caption>
			<tr>
				<td>处方单流水号：</td>
				<td>${requestScope.registerDrug.id}</td>
			</tr>
			<tr>
				<td>病人姓名：</td>
				<td>${requestScope.registerDrug.register.patient.name}</td>
			</tr>
			<tr>
				<td>药品名称：</td>
				<td>${requestScope.registerDrug.drug.name}</td>
			</tr>
			<tr>
				<td>药品数量：</td>
				<td>${requestScope.registerDrug.amount}</td>
			</tr>
			<tr>
				<td>药品单价：</td>
				<td>${requestScope.registerDrug.drug.price}</td>
			</tr>
			<tr>
				<td>药品总价：</td>
				<td>${requestScope.registerDrug.drug.price * requestScope.registerDrug.amount}</td>
			</tr>
			<tr>
				<td>开处方日期：</td>
				<td>${requestScope.registerDrug._date}</td>
			</tr>
		</table>
	</div>
</body>
</html>