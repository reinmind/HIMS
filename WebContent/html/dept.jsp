<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.briup.dao.impl.DeptDaoImpl,com.briup.bean.Department,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../style/use.css">
	<link rel="stylesheet" href="../style/bootstrap.min.css">
	<link rel="stylesheet" href="../style/table.css">
 	<link rel="stylesheet" href="../style/common.css">
	<script src="../js/jquery-1.8.3.min.js"></script>
	<script src="../js/table.js"></script>
	<script src="../js/btn.js"></script>
	<script>
		$(function () {
			
			// 显示修改弹框
			$('.rollIn').click(function(){
				var count = 0;
				/* 关于部门的修改项 */
				var id = "";
				var name = "";
				var flag = "";
				var dept = "";
				for (var i = 1; i < $(".table").find(":input").size(); i ++) {
					if ($($(".table").find(":input").get(i)).attr("checked")) {
						id = $($(".table").find(":input").get(i)).parent().parent().children(".id").text();
						name = $($(".table").find(":input").get(i)).parent().parent().children(".name").text();
						flag = $($(".table").find(":input").get(i)).parent().parent().children(".flag").text().trim();
						dept = $($(".table").find(":input").get(i)).parent().parent().children(".dept").text();
						count ++;
					}
				}
				if (count == 0) {
					alert("请勾选要修改的项");
				} else if (count == 1) {
					/* 关于部门的修改项 */
//					alert(name + "-----" + flag + "------" + dept);
					$("#updateId").val(id);
					$("#updateName").val(name);
					if (flag == "是") {
						$("#updateIs").attr("checked", "true");
					} else {
						$("#updateNot").attr("checked", "false");
					}
					$("#updateDept").val(dept);
					
					
//					$.post("updateDeptAjax", {id: value});
					className = $(this).attr('class');
					$('#dialogBgUpdate').fadeIn(300);
					$('#dialogUpdate').removeAttr('class').addClass('animated '+className+'').fadeIn();
				} else {
					alert("一次只能修改一行，不能修改多行！");
				}
			});
			
			
			// 删除
			$('.delete').click(function () {
				var list = "";
				var count = 0;
				for (var i = 1; i < $(".table").find(":input").size(); i ++) {
					if ($($(".table").find(":input").get(i)).attr("checked")) {
						list += $($(".table").find(":input").get(i)).val() + ",";
						count ++;
					}
				}
				if (count != 0) {
					if (confirm("你确定要删除这" + count + "项吗？")) {
						if (list != "") {
						}
					}
				} else {
					alert("您没有选中任何项！");
				}
			});
			
		});
	</script>
<%
	DeptDaoImpl deptdao = new DeptDaoImpl();
	Vector<Department> depts = deptdao.depts();
%>
<%
	session.setAttribute("deptId", depts.size()+1);

%>
</head>
<body>
	<p class="btnp">您当前的位置：<a href="../html/welcome.html">首页</a> > 部门管理</p>
	<div class="btn_bg">
		<button type="button" class="btn btn-default add bounceInDown">添加部门</button>
		<button type="button" class="btn btn-default update rollIn">修改部门</button>
		<button type="button" class="btn btn-default delete">删除部门</button>
		<button type="button" class="btn btn-default refresh">刷新</button>
	</div>
	
	<!-- 添加部门表单 -->
	<div id="dialogBgAdd"></div>
	<div id="dialogAdd" class="animated" style="cursor:default; height: 400px; margin-top:-200px;">
		<img class="dialogIco" width="50" height="50" src="../images/ico.png" alt="" />
		<div class="dialogTop">
			<a href="javascript:;" class="claseDialogBtn">关闭</a>
		</div>
		<form action="../deptAdd" method="post" id="editFormAdd">
			<table align="center" class="tandept">
				<tr>
					<td align="right"><font color="#ff0000">* </font>部门名称：</td>
					<td align="left"><input type="text" name="name" required value="" placeholder="请输入部门的名称" class="ipt"></td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">* </font>是否挂号：</td>
					<td align="left">
						<label for="is" style="font-size:14px; margin: 0 10px;">
							<input type="radio" checked name="flag" value="1" id="is" class="rad">是
						</label>
						<label for="not" style="font-size:14px; margin: 0 10px;">
							<input type="radio" name="flag" value="0" id="not" class="rad">否
						</label>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>部门描述：</td>
					<td align="left"><textarea class="ipt" maxlength="80" name="description" placeholder="请输入不超过80个字符"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="确定" class="submitBtn" style="margin: 0 5px;">
					<input type="reset" value="重置" class="submitBtn" style="margin: 0 5px;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 修改部门表单 -->
	<div id="dialogBgUpdate"></div>
	<div id="dialogUpdate" class="animated" style="cursor:default; height: 400px; margin-top:-200px;">
		<img class="dialogIco" width="50" height="50" src="../images/ico.png" alt="" />
		<div class="dialogTop">
			<a href="javascript:;" class="claseDialogBtn">关闭</a>
		</div>
		<form action="../deptUpdate" method="post" id="editFormUpdate">
			<input type="hidden" name="id" id="updateId">
			<table align="center" class="tandept">
				<tr>
					<td align="right"><font color="#ff0000">* </font>部门名称：</td>
					<td align="left"><input type="text" name="name" id="updateName" required placeholder="请输入部门的名称" class="ipt"></td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">* </font>是否挂号：</td>
					<td align="left">
						<label for="updateIs" style="font-size:14px; margin: 0 10px;">
							<input type="radio" id="updateIs" name="flag" value="1" class="rad">是
						</label>
						<label for="updateNot" style="font-size:14px; margin: 0 10px;">
							<input type="radio" id="updateNot" name="flag" value="0" class="rad">否
						</label>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>部门描述：</td>
					<td align="left"><textarea class="ipt" id="updateDept" name="description" maxlength="80" placeholder="请输入不超过80个字符">${sessionScope.dept.description}</textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="确定" class="submitBtn" style="margin: 0 5px;">
					<input type="reset" value="重置" class="submitBtn" style="margin: 0 5px;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 部门列表 -->
	<table class="table table-hover">
		<thead>
		<tr>
			<th class="bg"></th>
			<th class="bg"><input type="checkbox" name="" class="all" id=""></th>
			<th class="bg">部门名称</th>
			<th class="bg">可以挂号</th>
			<th class="bg">部门描述</th>
		</tr>
		</thead>
		<tbody>
			<%for(Department dept:depts){ %>
			<tr>
				<td class="id" align="center"><%=dept.getId() %></td>
				<td><input type="checkbox" name="id" value="<%=dept.getId() %>" class="ck" id=""></td>
				<td class="name"><%=dept.getName() %></td>
				<td class="flag"><%if(dept.isFlag() == 1){out.print("是");}else{out.print("否");} %></td>
				<td class="dept"><%=dept.getDescription() %></td>
			</tr>
			<%
			}%>
		</tbody>
		<!-- 分页处理 -->
		<tfoot>
			<tr>
				<td colspan="13">
					共10条记录 每页 10 条 第1页 
					<a href="#">首页</a>
					<a href="#">上一页</a>
					
					<a href="#">下一页</a>
					<a href="#">尾页</a>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>