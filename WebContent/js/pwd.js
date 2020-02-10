

// 密码必须6~9位
function isPwd(pwd) {
	var pattern = /(\w){6,9}/ig;
	return pattern.test(pwd);
}

$(function () {

	// 验证原密码是否正确
	$("#exampleInputPassword1").blur(function () {
		$.post("updatePwdAjax", {exampleInputPassword1:$("#exampleInputPassword1").val()}, function (data) {
			if (data == "1") {
				$("#exampleInputPassword1").parent().children("label").find("span").html("");
				$("#exampleInputPassword1").css("borderColor", "green");
			} else {
				$("#exampleInputPassword1").parent().children("label").find("span").html("（请输入正确的原密码！）");
				$("#exampleInputPassword1").parent().children("label").find("span").css("color","red");
				$("#exampleInputPassword1").css("borderColor", "red");
				return false;
			}
		}, "text");
	});
	// 当失去焦点时验证新密码格式是否正确
	$("#exampleInputPassword2").blur(function () {
		if ($(this).val() == $("#exampleInputPassword1").val()) {
			$(this).parent().children("label").find("span").html("（密码不能和原密码一样！！）");
			$(this).parent().children("label").find("span").css("color","red");
			$(this).css("borderColor", "red");
			return false;
		}
		if (isPwd($(this).val())) {
			$(this).parent().children("label").find("span").html("");
			$(this).css("borderColor", "green");
		} else {
			$(this).parent().children("label").find("span").html("（密码应该在6~9位之间）");
			$(this).parent().children("label").find("span").css("color","red");
			//（密码应该在6~9位之间）
			$(this).css("borderColor", "red");
			return false;
		}
	});
	// 确认密码是否与新密码一致
	$("#exampleInputPassword3").blur(function () {
		if (!($(this).val())) {
			$(this).parent().children("label").find("span").html("（应该和新密码一致）");
			$(this).parent().children("label").find("span").css("color","red");
			$(this).css("borderColor", "red");
			return false;
		}
		if ($(this).val() == $("#exampleInputPassword2").val()) {
			$(this).parent().children("label").find("span").html("");
			$(this).css("borderColor", "green");
		} else {
			$(this).parent().children("label").find("span").html("（应该和新密码一致）");
			$(this).parent().children("label").find("span").css("color","red");
			$(this).css("borderColor", "red");
			return false;
		}
	});

});


// 验证提交表单
function check() {
	
	// 验证原密码是否正确
	$.post("updatePwdAjax", {exampleInputPassword1:$("#exampleInputPassword1").val()}, function (data) {
		if (data != "1") {
			$("#exampleInputPassword1").parent().children("label").find("span").html("（请输入正确的原密码！）");
			$("#exampleInputPassword1").parent().children("label").find("span").css("color","red");
			$("#exampleInputPassword1").css("borderColor", "red");
			return false;
		}
	}, "text");
	
	// 当失去焦点时验证新密码格式是否正确
	if ($("#exampleInputPassword2").val() == $("#exampleInputPassword1").val()) {
		$("#exampleInputPassword2").parent().children("label").find("span").html("（密码不能和原密码一样！！）");
		$("#exampleInputPassword2").parent().children("label").find("span").css("color","red");
		$("#exampleInputPassword2").css("borderColor", "red");
		return false;
	}
	if (!isPwd($("#exampleInputPassword2").val())) {
		$("#exampleInputPassword2").parent().children("label").find("span").html("（密码应该在6~9位之间）");
		$("#exampleInputPassword2").parent().children("label").find("span").css("color","red");
		//（密码应该在6~9位之间）
		$("#exampleInputPassword2").css("borderColor", "red");
		return false;
	}
		
	// 确认密码是否与新密码一致
	if (!($("#exampleInputPassword3").val())) {
		$("#exampleInputPassword3").parent().children("label").find("span").html("（应该和新密码一致）");
		$("#exampleInputPassword3").parent().children("label").find("span").css("color","red");
		$("#exampleInputPassword3").css("borderColor", "red");
		return false;
	}
	if ($("#exampleInputPassword3").val() != $("#exampleInputPassword2").val()) {
		$("#exampleInputPassword3").parent().children("label").find("span").html("（应该和新密码一致）");
		$("#exampleInputPassword3").parent().children("label").find("span").css("color","red");
		$("#exampleInputPassword3").css("borderColor", "red");
		return false;
	}
	
}






