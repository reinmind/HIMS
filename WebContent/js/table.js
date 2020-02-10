




$(function () {
	// 点击当前行，选中当前行的复选框
	$(".table tbody tr").click(function () {
		if (!($(this).find(".ck").attr("checked"))) {
			$(this).find(".ck").attr("checked","true"); 
		} else {
			$(this).find(".ck").removeAttr("checked"); 
		}
	});
	$("input[type=checkbox]").click(function () {
		if (!($(this).attr("checked"))) {
			$(this).attr("checked","true"); 
		} else {
			$(this).removeAttr("checked"); 
		}
	});
	// 全选事件
	$("input.all").click(function () {  
		if (!($(this).attr("checked"))) {
			$(this).attr("checked","true"); 
		} else {
			$(this).removeAttr("checked"); 
		}
    	//alert(this.checked);  
   		if ($(this).is(':checked')){  
    		$('.ck').each(function () {  
        		//此处如果用attr，会出现第三次失效的情况  
        		$(this).prop("checked", true);  
        	});  
		} else { 
        	$('.ck').each(function () {  
                $(this).removeAttr("checked", false);  
            });  
        }  
    });  
});



