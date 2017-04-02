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
		  <h3>添加文件：</h3>
		  <br/> 
			<s:form action="file_upload" method="post" enctype="multipart/form-data">
			  	<div class="form-group">
	                <label for="fileTitle">文件标题:</label>
	                <input type="text" class="form-control" id="fileTitle" name="fileTitle" placeholder="请输入文件标题"/>
	            </div>
	            <div class="form-group">
	                <label for="fileSelect">选择文件:</label>
	                <input type="file" class="form-control" id="fileSelect" name="upload"/>
	            </div>
	            <div class="form-group">
	                <label for="description">文件描述:</label>
	                <input type="text" class="form-control" id="description" name="description" placeholder="请描述文件"/>
	            </div>
	            <div class="form-group">
	                <label for="fileDate">上传日期:</label>
	                <input type="date" class="form-control" id="fileDate" name="fileDate"/>
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