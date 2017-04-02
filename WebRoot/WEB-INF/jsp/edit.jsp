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
			<a href="file_list"><dt>文件管理<img src="${path }images/left/select_xl01.png"></img></dt></a>
		</dl>
		<dl class="cloud">
			<dt>薪资管理<img src="${path }images/left/select_xl01.png"></img></dt>
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
		  <h3>修改信息：</h3>
			<s:form action="/fri_update" method="post" theme="simple">
			  	<div class="form-group">
	                <label for="friendName">姓名:</label>
	                <input type="text" class="form-control" id="friendName" name="friendName" placeholder="请输入姓名" value="<s:property value="#request.fri.friendName"/>"/>
	            </div>
	            <div class="form-group">
	                <label for="friendPhone">手机号码:</label>
	                <input type="text" class="form-control" id="friendPhone" name="friendPhone" placeholder="请输入手机号码" value="<s:property value="#request.fri.friendPhone"/>"/>
	            </div>
	            <div class="form-group">
	                <label for="friendCompany">就职公司:</label>
	                <input type="text" class="form-control" id="friendCompany" name="friendCompany" placeholder="请输入就职公司" value="<s:property value="#request.fri.friendCompany"/>">
	            </div>
	            <div class="form-group">
	                <label for="friendQq">腾讯QQ:</label>
	                <input type="text" class="form-control" id="friendQq" name="friendQq" placeholder="请输入QQ" value="<s:property value="#request.fri.friendQq"/>">
	            </div>
	            <!-- 修改时，注意自己的id不能修改，而且不能忘记与user表关联的外键userId -->
	            <input type="hidden" id="friendId" name="friendId" value="<s:property value="#request.fri.friendId"/>">
	            <input type="hidden" id="userId" name="userId" value="<s:property value="#session.userInfo.userId"/>">
	            <div class="form-group">
	                <button type="submit" class="btn btn-sm btn-success">提交修改</button>
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