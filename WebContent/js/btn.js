

var w,h,className;
function getSrceenAddWH(){
	w = $(window).width();
	h = $(window).height();
	$('#dialogBgAdd').width(w).height(h);
}
function getSrceenUpdateWH(){
	w = $(window).width();
	h = $(window).height();
	$('#dialogBgUpdate').width(w).height(h);
}

window.onresize = function(){  
	getSrceenAddWH();
	getSrceenUpdateWH();
};
$(window).resize();  

$(function(){
	getSrceenAddWH();
	getSrceenUpdateWH();
	
	// 显示添加弹框
	$('.bounceInDown').click(function(){
		className = $(this).attr('class');
		$('#dialogBgAdd').fadeIn(300);
		$('#dialogAdd').removeAttr('class').addClass('animated '+className+'').fadeIn();
	});
	
	// 关闭取药弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBgGet').fadeOut(300,function(){
			$('#dialogGet').addClass('bounceOutUp').fadeOut();
		});
	});
	
	// 关闭入库弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBgInto').fadeOut(300,function(){
			$('#dialogInto').addClass('bounceOutUp').fadeOut();
		});
	});
	
	// 关闭添加弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBgAdd').fadeOut(300,function(){
			$('#dialogAdd').addClass('bounceOutUp').fadeOut();
		});
	});
	

	
	// 关闭修改弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBgUpdate').fadeOut(300,function(){
			$('#dialogUpdate').addClass('bounceOutUp').fadeOut();
		});
	});
	
	

	

	
});




