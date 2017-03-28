/**
 * 后台管理页面的js操作
 */
$(function(){
	$(".leftsidebar_box dt").css({"background-color":"#3992d0"});

	//全选与取消全选操作
	$("#all").click(function(){   
	    if(this.checked){   
	        $(".list :checkbox").prop("checked", true);  
	    }else{   
		$(".list :checkbox").prop("checked", false);
	    }   
	});
});