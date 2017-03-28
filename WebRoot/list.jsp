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
	<link rel="stylesheet" type="text/css" href="${path}css/admin.css">
	<link rel="stylesheet" type="text/css" href="${path}css/mood.css">
	<link rel="stylesheet" type="text/css" href="${path}css/bootstrap.min.css">
	<title>个人信息管理系统</title>
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
		  <h3>所有联系人： <a href="fri_viewAdd" type="button" class="btn btn-primary btn-sm">添加</a></h3>
			<s:form action="fri_select" method="post" theme="simple">
				<table class="tab1">
					<tbody>
						<tr>
							<td width="90" align="right">姓名查询：</td>
							<td>
								<input type="text" class="allInput" name="friendName"/>
							</td>
							<td width="90" align="right">手机号码查询：</td>
							<td>
								<input type="text" class="allInput" name="friendPhone"/>
							</td>
	                        <td width="85" align="right">
	                        	<button type="submit" class="btn btn-sm btn-info">查询</button>
	                        </td>
	   					</tr>
					</tbody>
				</table>
			</s:form>
			<table class="table table-bordered table-striped" id="table">
				<tr>
				    <th><input type="checkbox" id="all" onclick=""/></th>
				    <th>序号：</th>
				    <th>联系人姓名：</th>
				    <th>手机号码：</th>
				    <th>就职公司：</th>
				    <th>腾讯Q Q：</th>
				    <th>所属用户：</th>
				    <th>操作：</th>
				</tr>
				<s:if test="#request.listFriends != null">
					<s:iterator var="friend" value="#request.listFriends" status="st">
	  	 				<tr>
	  	 				<th><input type="checkbox" id="all" onclick=""/></th>
	  	 				<td> <s:property value="#st.index+1"/> </td>
	  	 				<td> <s:property value="#friend.friendName"/> </td>
	  	 				<td> <s:property value="#friend.friendPhone"/> </td>
	  	 				<td> <s:property value="#friend.friendCompany"/> </td>
	  	 				<td> <s:property value="#friend.friendQq"/> </td>
	  	 				<td> <s:property value="#session.userInfo.userName"/> </td>
	  	 				<td> 
	  	 					<a id="<s:property value="#st.index+1"/>" onclick="editInfo(this)" type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#my_modal">详情</a>
                            <a href="fri_viewUpdate?id=<s:property value="#friend.friendId"/>" type="button" class="btn btn-sm btn-warning">修改</a>
                            <a href="fri_delete?id=<s:property value="#friend.friendId"/>" type="button" class="btn btn-sm btn-danger">删除</a>
	  	 				</td>
	  	 				</tr>
  	 				</s:iterator>
				</s:if>
				<s:else>
		  	 		<tr>
		  	 			<td colspan="5">对不起，没有你要找的数据！请先录入。</td>
		  	 		</tr>
	  	 		</s:else>
			</table>
		  </div>
		  
		</div><br/>
		<div class="right_last">
		  <div align="center">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
		<!-- 模态框 -->
		<div class="modal" id="my_modal" tabindex="-1" role="dialog" aria-labelleby="myModallabel">
		  <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button  type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModallabel">详细信息：</h4>
				</div>
				<div class="modal-body" id="b">
					序号：	<scan id="b_num"></scan><hr/>
					姓名：	<scan id="b_name"></scan><hr/>
					手机号码：	<scan id="b_phone"></scan><hr/>
					公司： 	<scan id="b_company"></scan><hr/>
					QQ： 	<scan id="b_qq"></scan>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	   </div>
	  </div>
	</div>
</div>
<script type="text/javascript">
	function editInfo(obj) {
		var id = $(obj).attr("id");
	    //获取表格中的一行数据  
	    var t = $('#table')[0];
	    var num = t.rows[id].cells[1].innerText;  
	    var name = t.rows[id].cells[2].innerText;  
	    var phone = t.rows[id].cells[3].innerText;  
	    var company = t.rows[id].cells[4].innerText;
	    var qq = t.rows[id].cells[5].innerText; 
	    //向模态框中传值  
	    $('#b_num').text(num);
	    $('#b_name').text(name);
	    $('#b_phone').text(phone);  
	    $('#b_company').text(company); 
	    $('#b_qq').text(qq);
	}
</script>
<script type="text/javascript" src="${path }js/jquery.min.js"></script>
<script type="text/javascript" src="${path }js/admin.js"></script>
<script type="text/javascript" src="${path }js/bootstrap.min.js"></script>

</body>
</html>