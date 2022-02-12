<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="">
	<style type="text/css"> 
	 .content {

            width: 850px;

            height: 400px;

            margin-top:10px;
            margin-left: 360px;

            /* overflow: auto;当内容溢出时添加滚动条 */

        }
        .tu{
        background: url("image/7.jpg");
        }
         .tu1{
        background: url("image/8.jpg");
        }
        body{
        background: url(image/1.jpg);
     }
        
        </style>
	 
  </head>
  
  <body >
   <a href="zhuye.jsp" ><h2 align="left">返回上一级</h2></a>
    
    <div class="content">
    <form action="servlet/CheckCode" method="post" >
    <table align="center" width="500" border="1" background="image/8.jpg" >
       <tr>
         <caption><h1>用户登录</h1></caption>
       </tr>
    
       <tr>
         <td><p align="center">用户:</p>
         </td>
         <td><p align="center"><input type="text" value="" name="username" size="60" required></p>
         </td>
       </tr>
       <tr>
         <td><p align="center">密码:</p>
         </td>
         <td><p align="center"><input type="password" value="" name="password" size="60" required></p>
         </td>
       </tr>
        <tr>
         <td colspan="2">
         <p align="center">输入验证码：<input type="text" name="txt_checkcode"/>
    <span class="tu" onclick="location.href='servlet/CheckCode'" style="border:1px solid hidden;" >
    <%=session.getAttribute("checkcode")  %>
    <input type="button" value="看不清，换一个" class="stu1" />
    </span>

    <%=request.getAttribute("message")==null?"":request.getAttribute("message")
 %>
   </p>
         </td>
       </tr>
       <tr>
         <td colspan="2">
         <p align="center"><input  type="submit" value=" 登  录 " size="30"></p>
         </td>
       </tr>
       <tr>
         <td colspan="2">
         <p align="center">还没有账号;赶快去<a href="register1.jsp">注册</a></p>
         </td>
       </tr>
    </table>
    </form>
    </div>
  </body>
</html>
