<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
  <head>
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  
  <body>	
  	<s:form action="/user_login" method="post" theme="simple">
  	 <table border="1" align="center" cellpadding="5" cellspacing="0">
  	 	<tr>
  	 		<td>账号</td>
  	 		<td>
  	 			<s:textfield name="userName" id="userName" value=""></s:textfield>
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<td>密码：</td>
  	 		<td>
  	 			<s:password name="password" id="password" value=""></s:password>
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<td colspan="2">
  	 			<s:submit value="登陆"></s:submit>
  	 		</td>
  	 	</tr>
  	 	
  	 </table>
  	 </s:form>
  </body>
</html>