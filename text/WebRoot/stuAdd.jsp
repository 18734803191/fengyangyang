
<%@ page import="student1.StudentDb" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<html>

<head>

    <title>填加学生信息</title>

</head>

<body>

<%
    String sid =request.getParameter("sid");

    String sname = new String(request.getParameter("sname").getBytes("iso-8859-1"),"utf-8");

    String sage = request.getParameter("sage");

    String ssex = new String(request.getParameter("ssex").getBytes("iso-8859-1"),"utf-8");

    String snativeplace = new String(request.getParameter("snativeplace").getBytes("iso-8859-1"),"utf-8");

    String smajor = new String(request.getParameter("smajor").getBytes("iso-8859-1"),"utf-8");

    String sclass = new String(request.getParameter("sclass").getBytes("iso-8859-1"),"utf-8");

    String snative = new String(request.getParameter("snative").getBytes("iso-8859-1"),"utf-8");

    StudentDb sdb = new StudentDb();
    String sql = "insert into student(sid,sname,sage,ssex,snativeplace,smajor,sclass,snative) values("+sid+",'"+sname+"',"+sage+",'"+ssex+"','"+snativeplace+"','"+smajor+"','"+sclass+"','"+snative+"')";

  
     if (sdb.studentUpdate(sql)){

        System.out.println("insert 语句为:"+sql);

        System.out.println(sid+"号学生信息增加成功");

        response.sendRedirect("student.jsp");

    }else {

        //request.getRequestDispatcher("student.jsp").forward(request,response);

    } 

%>

</body>

</html>
