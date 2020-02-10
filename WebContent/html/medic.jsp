<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.briup.bean.*" %>
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
	<p class="btnp">您当前的位置：<a href="html/welcome.jsp">首页</a> > 病例档案查询</p>
	<div id="all">
		<table class="table table-hover">
			<caption><h1>病例档案表</h1></caption>
			<tr>
				<td>病人姓名：</td>
				<td>${requestScope.medicalrecord.reg.patient.name}</td>
			</tr>
			<tr>
				<td>医　　生：</td>
				<td>${requestScope.medicalrecord.staff.name}</td>
			</tr>
			<tr>
				<td>病人主诉：</td>
				<td>${requestScope.medicalrecord.chiefComplaint}</td>
			</tr>
			<tr>
				<td>现病史：</td>
				<td>${requestScope.medicalrecord.historyOfPresentIllness}</td>
			</tr>
			<tr>
				<td>既往史：</td>
				<td>${requestScope.medicalrecord.pastMedicalHistory}</td>
			</tr>
			<tr>
				<td>体验结果：</td>
				<td>${requestScope.medicalrecord.medicalTestResults}</td>
			</tr>
			<tr>
				<td>辅助检查结果：</td>
				<td>${requestScope.medicalrecord.diagnosticExaminationResults}</td>
			</tr>
			<tr>
				<td>初步诊断：</td>
				<td>${requestScope.medicalrecord.preliminaryDiagnosis}</td>
			</tr>
			<tr>
				<td>治疗意见：</td>
				<td>${requestScope.medicalrecord.therapyAdvice}</td>
			</tr>
		</table>
	</div>
</body>
</html>