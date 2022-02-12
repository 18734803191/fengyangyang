
<%@ page import="student1.StudentDb" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>删除学生信息</title>

</head>

<body>

<%

    String sid = request.getParameter("sid");

    String sql = "delete from student where sid = "+sid;

    StudentDb sdb = new StudentDb();

    if (sdb.studentUpdate(sql)){

        System.out.println("删除语句为:"+sql);

        System.out.println(sid+"号学生已成功删除");

        response.sendRedirect("student.jsp");

    }else {

        out.println(sql);

        out.println(sid+"号学生删除失败");

    }

%>

</body>

</html>
