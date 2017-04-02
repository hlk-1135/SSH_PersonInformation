var flag_name=0;
var flag_apart=0;
var flag_realname=0;
var flag_phone=0;
var flag_password=0;
var flag_password_2=0;
function checkName(){   //检测用户名
	var s=document.getElementById("userName");
	var str=s.value;
	var reg=/^[a-zA-Z0-9\u4E00-\u9FA5]+$/;
	if(str.length>=2 && str.length<=12 && reg.test(str)){
		document.getElementById("errorName").innerHTML="Success";
		document.getElementById("errorName").style.color="green";
		flag_name=1;
	}
	else{
		document.getElementById("errorName").innerHTML="Error!请重新输入!";
		document.getElementById("errorName").style.color="red";
		flag_name=0;
	}	
}
function checkPhone(){   //检验手机号是否符合规定
	var p=document.getElementById("phone");
	var pho=p.value;
	var reg_1=/^[0-9]+$/;
	if(pho.length==11 && reg_1.test(pho)){
		document.getElementById("errorPhone").innerText="Success";
		document.getElementById("errorPhone").style.color="green";
		flag_phone=1;
	}
	else{
		document.getElementById("errorPhone").innerText="Error!请重新输入!";
		document.getElementById("errorPhone").style.color="red";
		flag_phone=0;
	}
}
function checkPassword(){  //验证密码是否符合规定
	var s=document.getElementById("password");
	var str=s.value;
	if(str.length<4 || str.length>12){
		document.getElementById("errorword").innerHTML="Error!请重新输入!";
		document.getElementById("errorword").style.color="red";
		flag_password=0;
	}
	else{
		document.getElementById("errorword").innerHTML="Success";
		document.getElementById("errorword").style.color="green";
		flag_password=1;
	}
}
function checkPassword_2(){  //验证确认密码是否和密码相同
	var p1=document.getElementById("password").value;
	var p2=document.getElementById("password_2").value;
	if(p1!=p2){
		document.getElementById("errorword_2").innerHTML="Error!两次输入密码不一致!";
		document.getElementById("errorword_2").style.color="red";
		flag_password_2=0;
	}
	else{
		document.getElementById("errorword_2").innerHTML="Success";
		document.getElementById("errorword_2").style.color="green";
		flag_password_2=1;
	}
}
function checkApart(){   //检测职业
	var s=document.getElementById("work");
	var str=s.value;
	if(str.length>0){
		document.getElementById("errorApart").innerHTML="Success";
		document.getElementById("errorApart").style.color="green";
		flag_apart=1;
	}
	else{
		document.getElementById("errorApart").innerHTML="Error!不允许为空!";
		document.getElementById("errorApart").style.color="red";
		flag_apart=0;
	}	
}
function checkRealName(){   //检测真实姓名
	var s=document.getElementById("realName");
	var str=s.value;
	if(str.length>0){
		document.getElementById("errorRealName").innerHTML="Success";
		document.getElementById("errorRealName").style.color="green";
		flag_realname=1;
	}
	else{
		document.getElementById("errorRealName").innerHTML="Error!不允许为空!";
		document.getElementById("errorRealName").style.color="red";
		flag_realname=0;
	}	
}
function submitbox(){   //注册
	if(flag_apart==1 && flag_realname==1 && flag_name==1 && flag_phone==1 && flag_password==1 && flag_password_2==1){
		
	}
	else
		alert("注册失败！");
}