<%@ page language="java" import="java.util.*,user.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkjsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 
    1.获取前端用户输入的用户名和密码
    2.验证是否正确
    3.跳转
     --><br>
     <%
     String username=request.getParameter("uname");
     String password=request.getParameter("pswd");
     
     //验证用户名密码正确性
     UserDao ud = new UserDao();
     boolean yn = ud.checkPassword(username, password);
     if(yn)
    	 response.sendRedirect("student.jsp");
     else
    	 response.sendRedirect("fail.jsp");
     %>
  </body>
</html>
