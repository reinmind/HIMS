


$(function () {
	
	// 刷新
	$('.refresh').click(function () {
		location.href = "drug?currentPage=1&model=2";
	});
	
	// 显示修改弹框
	$('.rollIn').click(function(){
		var count = 0;
		/* 关于药品的修改项 */
		var id = "";              /* 药品编号 */
		var name = "";            /* 药品名称 */
		var drugclassId = "";     /* 药品类别编号 */
		var barcode = "";         /* 药品条形 */
		var dosageform = "";      /* 药品剂型 */
		var specifications = "";  /* 药品规格 */
		var unit = "";            /* 药品单位 */
		var prime_cost = "";      /* 药品进货 */
		var price = "";           /* 药品售价 */
		var inventory = "";       /* 药品库存 */
		var minimum = "";         /* 数量下限 */
		var introduction = "";    /* 药品简介 */
		for (var i = 1; i < $(".table").find(":input").size(); i ++) {
			if ($($(".table").find(":input").get(i)).attr("checked")) {
				drugclassId = $($(".table").find(":input").get(i)).parent().parent().children(".drugclassId").val();
				id = $($(".table").find(":input").get(i)).parent().parent().children(".id").val();
				name = $($(".table").find(":input").get(i)).parent().parent().children(".name").text().trim();
				barcode = $($(".table").find(":input").get(i)).parent().parent().children(".barcode").text().trim();
				dosageform = $($(".table").find(":input").get(i)).parent().parent().children(".dosageform").text().trim();
				specifications = $($(".table").find(":input").get(i)).parent().parent().children(".specifications").text().trim();
				unit = $($(".table").find(":input").get(i)).parent().parent().children(".unit").text().trim();
				prime_cost = $($(".table").find(":input").get(i)).parent().parent().children(".prime_cost").text().trim();
				price = $($(".table").find(":input").get(i)).parent().parent().children(".price").text().trim();
				inventory = $($(".table").find(":input").get(i)).parent().parent().children(".inventory").text().trim();
				minimum = $($(".table").find(":input").get(i)).parent().parent().children(".minimum").text().trim();
				introduction = $($(".table").find(":input").get(i)).parent().parent().children(".introduction").text().trim();
				count ++; 
			}
		}
		if (count == 0) {
			alert("请勾选要修改的项");
		} else if (count == 1) {
			$("#updateId").val(id);
			$("#updateName").val(name);
			$("#updatedrugclassId").attr("value",drugclassId);
			$("#updateBarcode").val(barcode);
			$("#updateDosageform").val(dosageform);
			$("#updateSpecifications").val(specifications);
			$("#updateUnit").val(unit);
			$("#updatePrime_cost").val(prime_cost);
			$("#updatePrice").val(price);
			$("#updateInventory").val(inventory);
			$("#updateMinimum").val(minimum);
			$("#updateIntroduction").val(introduction); 
			
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
					$.post("drugDelAjax", {ids:list}, function (data) {
						alert(data);
					}, "text");
					location.href = "drug?model=2";
				}
			}
		} else {
			alert("您没有选中任何项！");
		}
	});
	
	
	// 显示取药弹框
	$('.flipInX').click(function(){
		var count = 0;
		/* 关于药品的修改项 */
		var id = "";              /* 药品编号 */
		var name = "";            /* 药品名称 */
		var num = "";       /* 取出药品的数量 */
		var price = "";    /* 药品的单价 */
		for (var i = 1; i < $(".table").find(":input").size(); i ++) {
			if ($($(".table").find(":input").get(i)).attr("checked")) {
				id = $($(".table").find(":input").get(i)).parent().parent().children(".id").val();
				name = $($(".table").find(":input").get(i)).parent().parent().children(".name").text().trim();
				num = $($(".table").find(":input").get(i)).parent().parent().children(".num").text().trim();
				price = $($(".table").find(":input").get(i)).parent().parent().children(".price").text().trim();
				count ++;
			}
		}
		if (count == 0) {
			alert("请勾选要修改的项");
		} else if (count == 1) {
			$("#getId").val(id);
			$("#getName").text(name);
			$("#getNum").val(num);
			$("#getPrice").val(price);
			
			className = $(this).attr('class');
			$('#dialogBgGet').fadeIn(300);
			$('#dialogGet').removeAttr('class').addClass('animated '+className+'').fadeIn();
		} else {
			alert("一次只能取一种药，不能一下取多个药！");
		}
	});
	// 计算取出药的总费用 
	$('#getNum').blur(function () {
		var num = parseInt($(this).val());
		var price = parseInt($('#getPrice').val())
		$("#getSum").text(num*price + '元');
	});
	
	
	
	// 显示入库弹框
	$('.bounceIn').click(function(){
		var count = 0;
		/* 关于药品的修改项 */
		var id = "";              /* 药品编号 */
		var name = "";            /* 药品名称 */
		var sumnum = "";       /* 入库的数量 */
		for (var i = 1; i < $(".table").find(":input").size(); i ++) {
			if ($($(".table").find(":input").get(i)).attr("checked")) {
				id = $($(".table").find(":input").get(i)).parent().parent().children(".id").val();
				name = $($(".table").find(":input").get(i)).parent().parent().children(".name").text().trim();
				sumnum = $($(".table").find(":input").get(i)).parent().parent().children(".sumnum").text().trim();
				count ++;
			}
		}
		if (count == 0) {
			alert("请勾选要修改的项");
		} else if (count == 1) {
			$("#intoId").val(id);
			$("#intoName").text(name);
			$("#intoSumnum").val(sumnum);
			
			className = $(this).attr('class');
			$('#dialogBgInto').fadeIn(300);
			$('#dialogInto').removeAttr('class').addClass('animated '+className+'').fadeIn();
		} else {
			alert("一次只能加入一种药，不能同时加入多个药！");
		}
	});
	
	
});








