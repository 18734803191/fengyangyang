<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	 .content {

          
            margin-top:-10px;
            margin-right:240px;
	}
	  body{
        background: url(image/1.jpg);
     }
	</style>
	 
  </head>
  
  <body>
   <div class="content">
    	<form name="f1" action="register.jsp" method="get" >
    	<table border="1" align="right" background="image/8.jpg">
    		<caption><h2>用户注册</h2></caption>
    		<tr>
    			<td>用户名：</td>
    			<td>
    				<input type="text" name="username" required>
    			</td>
    		</tr>
    		
    		<tr>
    			<td>密码：</td>
    			<td>
    				<input type="password" name="password" required>
    			</td>
    		</tr>
    		<tr>
    			<td>确认密码：</td>
    			<td>
    				<input type="password" name="reps" required>
    			</td>
    		</tr>
    		<tr>
    			<td>生日：</td>
    			<td>
    				<input type="Date" name="birthday" required>
    			</td>
    		</tr>
    		<tr>
    			<td>职业：</td>
    			<td>
    				<input type="text" name="type" required>
    			</td>
    			</tr>
    		<tr>
    			<td>地址：</td>
    			<td>
    				<input type="text" name="address" required>
    			</td>
    		</tr>
    		
    		<tr>
    		<td colspan="2">
    		<input type="submit" value="注册">
    		<input type="reset"  value="重置">
    		 <input type="submit" value="返回" onclick="window.location.href='login.jsp'">
    		</td>
    		</tr>
    	</table>
    	</form>
    </div> 
  </body>
</html>
