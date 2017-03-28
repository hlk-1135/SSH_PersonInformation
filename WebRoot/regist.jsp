<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${path}css/register.css"/>
		<title>注册页面</title>
	</head>
	<body>
		<div class="register">
			<div class="introduce"><h1 align="center">欢迎注册</h1></div>
			<div class="continer">
				<div class="continer_left">
					<div class="left_main">
						<div class="continer_main">
							<form id="fieldset">
								<label for=name><span class="txt-impt">*</span>用户名:</label>
								<input type="text" id="name" onchange="checkName()" />
								<div id="nameTips" class="tips">
									<p class="txt-tips" id="errorName">2-12位以内的中英文字符和数字</p>
								</div>
								
								<label for=name><span class="txt-impt">*</span>手机号:</label>
								<input type="text" id="phoneNumber" onchange="checkPhone()"/>
								<div id="phoneTips" class="tips">
									<p class="txt-tips" id="errorPhone">11位手机号</p>
								</div>
								
								<label for=password><span class="txt-impt">*</span>密码:</label>
								<input type="password" id="password" onchange="checkPassword()"/>
								<br>
								<div id="nameTips" class="tips">
									<p class="txt-tips" id="errorword">4~12个字符，区分大小写</p>
								</div>
								
								<label for=password><span class="txt-impt">*</span>确认密码:</label>
								<input  type="password" class="textfield" id="password_2" onchange="checkPassword_2()"/>
								<br/>
								<div id="nameTips" class="tips">
									<p class="txt-tips" id="errorword_2">请再次确认密码</p>
								</div>			
								<label for=apart><span class="txt-impt">*</span>职业:</label>
								<input type="text" id="apart" onchange="checkApart()"/>
								<br />
								<div id="nameTips" class="tips">
									<p class="txt-tips" id="errorApart">请输入职业</p>
								</div>
								<label for=realname><span class="txt-impt">*</span>真实姓名:</label>
								<input class="textfield" id="realname" onchange="checkRealName()"/>
								<br>
								<div id="nameTips" class="tips">
									<p class="txt-tips" id="errorRealName">请输入真实姓名</p>
								</div>
								
								<input id="last" type="button" value="立即注册" onclick="submitbox()" />
								<input id="last" type="reset" value="重写" />
							</form>
						</div>
    				</div>
				</div>
			</div>
		</div>
	</body>
	<script src="${path }js/index.js" type="text/javascript" charset="utf-8"></script>
</html>
