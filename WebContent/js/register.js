





$(function () {

	// 对员工号进行校验
	$("#userid").blur(function () {
		if ($(this).val() == "") {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（员工号不能为空！）</span>");
			return false;
		}
		if (!($(this).val().match(/[0-9]+/))) {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（员工号必须为数字！）</span>");
			return false;
		}
		$.post("useridAjax", {id:$("#userid").val()}, function (data) {
			$("#userid").parent().find("span").remove();
			$("#userid").parent().append(data);
		}, "text");
	});
	
	// 对用户名进行校验
	$("#username").blur(function () {
		if ($(this).val() == "") {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（用户名不能为空！）</span>");
			return false;
		}
		if (!($(this).val().match(/\w{4,9}/))) {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（用户名是4~9位字符！）</span>");
			return false;
		}
		$.post("usernameAjax", {username:$("#username").val()}, function (data) {
			$("#username").parent().find("span").remove();
			$("#username").parent().append(data);
		}, "text");
	});
	
	// 对密码进行校验
	$("#password").blur(function () {
		if ($(this).val() == "") {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（密码不能为空！）</span>");
			return false;
		}
		if (!($(this).val().match(/\w{6,9}/))) {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（密码必须是6-9个字符！）</span>");
			return false;
		}
		$(this).parent().find("span").remove();
		$(this).parent().append("<span class='infook'>√</span>");
	});

	// 对确认密码进行校验
	$("#password2").blur(function () {
		if ($(this).val()=="") {
			$(this).parent().find("span").remove();
			$(this).parent().append("<span class='info'>（确认密码不能为空！）</span>");
			return false;
		}
		if ($("#password").val() != $(this).val()) {
			$(this).parent().find("span").remove();
			$("#password2").parent().append("<span class='info'>（两次输入密码不一致）</span>");
			return false;
		}
		$(this).parent().find("span").remove();
		$(this).parent().append("<span class='infook'>√</span>");
	});
	
	

});


// 提交时对表单进行验证
function check() {
	
	// 员工号
	if ($("#userid").val() == "") {
		$("#userid").parent().find("span").remove();
		$("#userid").parent().append("<span class='info'>（员工号不能为空！）</span>");
		return false;
	}
	if (!($("#userid").val().match(/[0-9]+/))) {
		$("#userid").parent().find("span").remove();
		$("#userid").parent().append("<span class='info'>（员工号必须为数字！）</span>");
		return false;
	}
	$.post("useridAjax", {id:$("#userid").val()}, function (data) {
		if (data != "<span class='infook'>可以注册！</span>") {
			$("#userid").parent().find("span").remove();
			$("#userid").parent().append(data);
			return false;
		}
	}, "text");
	
	// 用户名
	if ($("#username").val() == "") {
		$("#username").parent().find("span").remove();
		$("#username").parent().append("<span class='info'>（用户名不能为空！）</span>");
		return false;
	}
	if (!($("#username").val().match(/\w{4,9}/))) {
		$("#username").parent().find("span").remove();
		$("#username").parent().append("<span class='info'>（用户名是4~9位字符！）</span>");
		return false;
	}
	$.post("usernameAjax", {username:$("#username").val()}, function (data) {
		if (data != "<span class='infook'>可以注册！</span>") {
			$("#username").parent().find("span").remove();
			$("#username").parent().append(data);
			return false;
		}
	}, "text");
	
	// 密码
	if ($("#password").val() == "") {
		$("#password").parent().find("span").remove();
		$("#password").parent().append("<span class='info'>（密码不能为空！）</span>");
		return false;
	}
	if (!($("#password").val().match(/\w{6,9}/))) {
		$("#password").parent().find("span").remove();
		$("#password").parent().append("<span class='info'>（密码必须是6-9个字符！）</span>");
		return false;
	}
	
	// 确认密码
	if ($("#password2").val() == "") {
		$("#password2").parent().find("span").remove();
		$("#password2").parent().append("<span class='info'>（确认密码不能为空！）</span>");
		return false;
	}
	if ($("#password").val() != $("#password2").val()) {
		$("#password2").parent().find("span").remove();
		$("#password2").parent().append("<span class='info'>（两次输入密码不一致）</span>");
		return false;
	}
	
	return true;
	
}





















