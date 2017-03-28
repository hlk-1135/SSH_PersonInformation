<%@page import="javax.persistence.Id"%>
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
	<link rel="stylesheet" type="text/css" href="${path}css/admin.css">
	<link rel="stylesheet" type="text/css" href="${path}css/mood.css">
	<link rel="stylesheet" type="text/css" href="${path}css/bootstrap.min.css">
	<title>后台管理</title>
</head>
<body id="bg">

<div class="conta">
	<div class="leftsidebar_box">
		<div class="line">
			<div class="avtor">
				<a href="#"><span>Hi,<s:property value="#session.userInfo.userName"/></span></a>
			</div>
		</div>
        <!--描述：左侧管理栏目导航-->
		<dl class="system_log">
			<a href="index.jsp"><dt id="person_info">个人信息设置<img src="${path }images/left/select_xl01.png"></img></dt></a>
		</dl>
		<dl class="custom">
			<a href="fri_list"><dt id="jtitle">联系人管理<img src="${path }images/left/select_xl01.png"></img></dt></a>
		</dl>
		<dl class="channel">
			<dt>日程管理<img src="${path }images/left/select_xl01.png"></img></dt>
		</dl>
		<dl class="app">
			<dt>留言板管理<img src="${path }images/left/select_xl01.png"></img></dt>
		</dl>
		<dl class="cloud">
			<dt>书籍管理<img src="${path }images/left/select_xl01.png"></img></dt>
		</dl>
		<dl class="source">
			<dt>资料管理<img src="${path }images/left/select_xl01.png"></img></dt>
		</dl>
		<dl class="statistics">
			<dt>统计分析<img src="${path }images/left/select_xl01.png"></img></dt>
		</dl>
	</div>
	<!--描述：右侧session部分-->
	<div class="rightsidebar_box">
		<div class="right_top">
			<h3>欢迎使用个人信息管理系统！</h3>
		</div>
		<div class="right_section">
		  <!-- 联系人列表 -->
		  <div class="jtitle">
		  <h3>添加联系人：</h3>
			<s:form action="/fri_save" method="post" theme="simple">
			  	<div class="form-group">
	                <label for="friendName">姓名:</label>
	                <input type="text" class="form-control" id="friendName" name="friendName" placeholder="请输入姓名"/>
	            </div>
	            <div class="form-group">
	                <label for="friendPhone">手机号码:</label>
	                <input type="text" class="form-control" id="friendPhone" name="friendPhone" placeholder="请输入手机号码"/>
	            </div>
	            <div class="form-group">
	                <label for="friendCompany">就职公司:</label>
	                <input type="text" class="form-control" id="friendCompany" name="friendCompany" placeholder="请输入就职公司"/>
	            </div>
	            <div class="form-group">
	                <label for="friendQq">腾讯QQ:</label>
	                <input type="text" class="form-control" id="friendQq" name="friendQq" placeholder="请输入QQ" />
	            </div>
	            <input type="hidden" id="userId" name="userId" value="<s:property value="#session.userInfo.userId"/>"/>
	            <div class="form-group">
	                <button type="submit" class="btn btn-sm btn-success">提交</button>
	            </div>
		  	 </s:form>
		  </div>
		  
		</div><br/>
	   </div>
	  </div>
<script type="text/javascript" src="${path }js/jquery.min.js"></script>
<script type="text/javascript" src="${path }js/admin.js"></script>
<script type="text/javascript" src="${path }js/bootstrap.min.js"></script>

</body>
</html>