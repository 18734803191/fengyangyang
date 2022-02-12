<%@page import="user.*"%>
<%@ page language="java" import="java.sql.Date" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Date birthday = Date.valueOf(request.getParameter("birthday"));
   
    String address = request.getParameter("address");
    
    User user = new User(username,password,birthday,address,"1");
    UserDao ud = new UserDao();
    ud.insertUser(user);
    response.sendRedirect("login.jsp");
    %>
  </body>
</html>
