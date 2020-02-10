<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.briup.dao.impl.*,com.briup.bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	StaffDaoImpl staffdao = new StaffDaoImpl();
	DeptDaoImpl deptdao = new DeptDaoImpl();
	int arg1 = 0;
	int arg2 = 5;

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				/* 关于职工的修改项 */
				var id = "";       /*职工编号 */
				var name = "";     /*姓　　名 */
				var deptId = "";   /*所在部门编号 */
				var gender = "";   /*性　　别 */
				var role = "";     /*角　　色 */
				var phone = "";    /*电话号码 */
				var birthday = ""; /*出生日期 */
				var id_card = "";  /*身份证号 */
				var education = "";/*学　　历 */
				var title = "";    /*职　　称 */
				var position = ""; /*职　　位 */
				var address = "";  /*家庭地址 */
				for (var i = 1; i < $(".table").find(":input").size(); i ++) {
					if ($($(".table").find(":input").get(i)).attr("checked")) {
						role = $($(".table").find(":input").get(i)).parent().parent().children(".role").val();
						deptId = $($(".table").find(":input").get(i)).parent().parent().children(".deptId").val();
						id = $($(".table").find(":input").get(i)).parent().parent().children(".id").text().trim();
						name = $($(".table").find(":input").get(i)).parent().parent().children(".name").text().trim();
						gender = $($(".table").find(":input").get(i)).parent().parent().children(".gender").text().trim();
						phone = $($(".table").find(":input").get(i)).parent().parent().children(".phone").text().trim();
						birthday = $($(".table").find(":input").get(i)).parent().parent().children(".birthday").text().trim();
						id_card = $($(".table").find(":input").get(i)).parent().parent().children(".id_card").text().trim();
						education = $($(".table").find(":input").get(i)).parent().parent().children(".education").text().trim();
						title = $($(".table").find(":input").get(i)).parent().parent().children(".title").text().trim();
						position = $($(".table").find(":input").get(i)).parent().parent().children(".position").text().trim();
						address = $($(".table").find(":input").get(i)).parent().parent().children(".address").text().trim();
						count ++;
					}
				}
				if (count == 0) {
					alert("请勾选要修改的项");
				} else if (count == 1) {
					$("#updateId").val(id);
					$("#updateName").val(name);
					$("#updateDeptId").attr("value",deptId);
					if (gender == "男") {
						$("#updateMen").attr("checked", "true");
					} else {
						$("#updateWomen").attr("checked", "false");
					}
					$("#updateRole").attr("value",role);
					$("#updatePhone").val(phone);
					$("#updateBirthday").val(birthday);
					$("#updateId_card").val(id_card);
					$("#updateEducation").attr("value",education);
					$("#updateTitle").val(title);
					$("#updatePosition").val(position);
					$("#updateAddress").val(address);
					
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
							$.post("../staffDelAjax", {ids:list}, function (data) {
								alert(data + "");
							}, "text");
							location.href = "../showStaff?currentPage=1";
						}
					}
				} else {
					alert("您没有选中任何项！");
				}
			});
			
			// 刷新
			$('.refresh').click(function(){
				location.href = "../showStaff?currentPage=1";
			})
			
		});
	</script>
</head>
<body>
	<p class="btnp">您当前的位置：<a href="../html/welcome.html">首页</a> > 职工管理</p>
	<div class="btn_bg">
		<button type="button" class="btn btn-default add bounceInDown">添加员工</button>
		<button type="button" class="btn btn-default update rollIn">修改员工</button>
		<button type="button" class="btn btn-default delete">删除员工</button>
		<button type="button" class="btn btn-default refresh">刷新</button>
		<div class="search">
			<form action="../staffName" method="post">
				<input type="text" class="sea-text" name="name" id="" placeholder="请输入员工姓名">
				<button type="submit" class="btn btn-primary">搜索</button>
			</form>
		</div>
	</div>
	
	
	<!-- 添加职工表单 -->
	<div id="dialogBgAdd"></div>
	<div id="dialogAdd" class="animated" style="cursor:default; width: 600px; height: 410px; margin-top:-200px; margin-left: -300px">
		<img class="dialogIco" width="50" height="50" src="../images/ico.png" alt="" />
		<div class="dialogTop">
			<a href="javascript:;" class="claseDialogBtn">关闭</a>
		</div>
		<!-- name,deptId,gender,role,phone,birthday,id_card,education,title,position,address -->
		<form action="../staffAdd" method="post" id="editFormUpdate">
			<table align="center" class="tanstaff">
				<tr>
					<td align="right"><font color="#ff0000">* </font>   id： </td>
					<td align="left" class="left">
						<input type="text" name="id" class="ipt">
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">* </font>姓　　名：</td>
					<td align="left" class="left">
						<input type="text" name="name" required placeholder="请输入职工的姓名" class="ipt">
					</td>
					<td align="right" class="right"><font color="#ff0000">  </font>所在部门：</td>
					<td align="left">
						<select name="deptId" class="ipt">
						<%for(Department dept:deptdao.depts()){ %>
							<option value="<%= dept.getId() %>"><%=dept.getName() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>性　　别：</td>
					<td align="left">
						<label for="updateIs" style="font-size:14px; margin: 0 10px;">
							<input type="radio" name="gender" value="男" checked class="rad">男
						</label>
						<label for="updateNot" style="font-size:14px; margin: 0 10px;">
							<input type="radio" name="gender" value="女" class="rad">女
						</label>
					</td>
					<td align="right"><font color="#ff0000">  </font>角　　色：</td>
					<td align="left">
						<select name="role" class="ipt">
							<option value="1" selected>医生</option>
							<option value="2">医技人员</option>
							<option value="3">护士</option>
							<option value="4">导医</option>
							<option value="5">门诊收费员</option>
							<option value="6">药房管理员</option>
							<option value="7">字典维护人员</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>电话号码：</td>
					<td align="left">
						<input type="text" name="phone" placeholder="请输入电话号码" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>出生日期：</td>
					<td align="left">
						<input type="date" name="birthday" class="ipt">
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">* </font>身份证号：</td>
					<td align="left">
						<input type="text" name="id_card" required placeholder="请输入18位的身份证号" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>学　　历：</td>
					<td align="left">
						<select name="education" class="ipt">
							<option value="小学">小学</option>
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="专科">专科</option>
							<option value="本科" selected>本科</option>
							<option value="研究生">研究生</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>职　　称：</td>
					<td align="left">
						<input type="text" name="title" placeholder="请输入职称" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>职　　位：</td>
					<td align="left">
						<input type="text" name="position" placeholder="请输入职位" class="ipt">
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>家庭地址：</td>
					<td align="left" colspan="3">
						<textarea class="ipt" name="address" 
							maxlength="80" placeholder="请输入不超过80个字符">江苏省苏州市</textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
					<input type="submit" value="确定" class="submitBtn" style="margin: 0 5px;">
					<input type="reset" value="重置" class="submitBtn" style="margin: 0 5px;"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 修改职工表单 -->
	<div id="dialogBgUpdate"></div>
	<div id="dialogUpdate" class="animated" style="cursor:default; width: 600px; height: 410px; margin-top:-200px; margin-left: -300px">
		<img class="dialogIco" width="50" height="50" src="../images/ico.png" alt="" />
		<div class="dialogTop">
			<a href="javascript:;" class="claseDialogBtn">关闭</a>
		</div>
		<!--id,name,deptId,gender,role,phone,birthday,id_card,education,title,position,address  -->
		<form action="../staffUpdate" method="post" id="editFormUpdate">
			<input type="hidden" name="id" id="updateId">
			<table align="center" class="tanstaff">
				<tr>
					<td align="right"><font color="#ff0000">* </font>姓　　名：</td>
					<td align="left" class="left">
						<input type="text" name="name" id="updateName" required placeholder="请输入职工的姓名" class="ipt">
					</td>
					<td align="right" class="right"><font color="#ff0000">  </font>所在部门：</td>
					<td align="left">
						<select name="deptId" class="ipt" id="updateDeptId">
							<%for(Department dept:deptdao.depts()){ %>
							<option value="<%= dept.getId() %>"><%=dept.getName() %></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>性　　别：</td>
					<td align="left">
						<label for="updateIs" style="font-size:14px; margin: 0 10px;">
							<input type="radio" id="updateMen" name="gender" value="男" checked class="rad">男
						</label>
						<label for="updateNot" style="font-size:14px; margin: 0 10px;">
							<input type="radio" id="updateWomen" name="gender" value="女" class="rad">女
						</label>
					</td>
					<td align="right"><font color="#ff0000">  </font>角　　色：</td>
					<td align="left">
						<select name="role" class="ipt" id="updateRole">
							<option value="1" selected>医生</option>
							<option value="2">医技人员</option>
							<option value="3">护士</option>
							<option value="4">导医</option>
							<option value="5">门诊收费员</option>
							<option value="6">药房管理员</option>
							<option value="7">字典维护人员</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>电话号码：</td>
					<td align="left">
						<input type="text" name="phone" id="updatePhone" placeholder="请输入电话号码" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>出生日期：</td>
					<td align="left">
						<input type="date" name="birthday" id="updateBirthday" class="ipt">
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">* </font>身份证号：</td>
					<td align="left">
						<input type="text" name="id_card" id="updateId_card" required placeholder="请输入18位的身份证号" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>学　　历：</td>
					<td align="left">
						<select name="education" class="ipt" id="updateEducation">
							<option value="小学">小学</option>
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="专科">专科</option>
							<option value="本科" selected>本科</option>
							<option value="研究生">研究生</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>职　　称：</td>
					<td align="left">
						<input type="text" name="title" id="updateTitle" placeholder="请输入职称" class="ipt">
					</td>
					<td align="right"><font color="#ff0000">  </font>职　　位：</td>
					<td align="left">
						<input type="text" name="position" id="updatePosition" placeholder="请输入职位" class="ipt">
					</td>
				</tr>
				<tr>
					<td align="right"><font color="#ff0000">  </font>家庭地址：</td>
					<td align="left" colspan="3">
						<textarea class="ipt" name="address" id="updateAddress"
							maxlength="80" placeholder="请输入不超过80个字符"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
					<input type="submit" value="确定" class="submitBtn" style="margin: 0 5px;">
					<input type="reset" value="重置" class="submitBtn" style="margin: 0 5px;"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 职工列表 -->
	<table class="table table-hover">
		<thead>
		<tr>
			<th class="bg"></th>
			<th class="bg"><input type="checkbox" name="" class="all" id=""></th>
			<th class="bg">员工号</th>
			<th class="bg">姓名</th>
			<th class="bg">所在部门</th>
			<th class="bg">性别</th>
			<th class="bg">出生日期</th>
			<th class="bg">电话号码</th>
			<th class="bg">籍贯</th>
			<th class="bg">身份证号</th>
			<th class="bg">学历</th>
			<th class="bg">职称</th>
			<th class="bg">职位</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${staffs}" var="staff">
			<tr>
				<input type="hidden" name="role" class="role" value=${ staff.getRole()}>
				<input type="hidden" name="deptId" class="deptId" value=${ staff.getDeptId()}>
				<td align="center"></td>
				<td><input type="checkbox" name="ck" value=${ staff.getId() } class="ck" id=""></td>
				<td class="id">${staff.getId() }</td>
				<td class="name">${staff.getName() }</td>
				<td>${deptdao.getDeptById(staff.getDeptId()) }</td>
				<td class="gender">${ staff.getGender() }</td>
				<td class="birthday">${ staff.getBirthday() }</td>
				<td class="phone">${ staff.getPhone() }</td>
				<td class="address">${ staff.getAddress() }</td>
				<td class="id_card">${staff.getId_card() }</td>
				<td class="education">${ staff.getEducation() }</td>
				<td class="title">${ staff.getTitle() }</td>
				<td class="position">${ staff.getPosition() }</td>
			</tr>
			</c:forEach>
		</tbody>
		<!-- 分页处理 -->
		<tfoot>
			<tr>
				<td colspan="13">
					共${totalCount}条记录 每页 5 条 第${currentPage}页 
					<a href="../showStaff?currentPage=1">首页</a>
					<a href="../showStaff?currentPage=${ currentPage-1}">上一页</a>
					<a href="../showStaff?currentPage=${ currentPage+1}">下一页</a>
					<a href="../showStaff?currentPage=0">尾页</a>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>