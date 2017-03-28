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
		  <!-- 个人信息 -->
		  <div class="person_info">
		  	<h3>个人信息：</h3>
		  	<table class="table table-bordered table-striped">
		  	<tr>
                <th>属性：</th>
                <td>具体信息：</td>
            </tr>
            <tr>
            <tr>
                <th>UserID</th>
                <td><s:property value="#session.userInfo.userId"/></td>
            </tr>
            <tr>
                <th>UserName</th>
                <td><s:property value="#session.userInfo.userName"/></td>
            </tr>
            <tr>
                <th>UserWork</th>
                <td><s:property value="#session.userInfo.work"/></td>
            </tr>
            <tr>
                <th>RealName</th>
                <td><s:property value="#session.userInfo.realName"/></td>
            </tr>
            <tr>
                <th>UserPhone</th>
                <td><s:property value="#session.userInfo.phone"/></td>
            </tr>
        	</table>
		  </div>
		</div>
		<div class="right_last">
		  <div align="center">
		  </div>
		</div>
	</div>
</div>
<!-- 左侧导航栏目 -->
<script type="text/javascript" src="${path }js/jquery.min.js"></script>
<script type="text/javascript" src="${path }js/admin.js"></script>
<script type="text/javascript" src="${path }js/bootstrap.min.js"></script>

</body>
</html>