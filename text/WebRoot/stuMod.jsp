
<%@ page import="student1.StudentDb"  %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

    <title>学生信息修改</title>

</head>

<body>

<%

    String sid = request.getParameter("sid");

    String sname = new String(request.getParameter("sname").getBytes("iso-8859-1"),"utf-8");

    String sage = request.getParameter("sage");

    String ssex =  new String(request.getParameter("ssex").getBytes("iso-8859-1"),"utf-8");

    String snativeplace = new String(request.getParameter("snativeplace").getBytes("iso-8859-1"),"utf-8");

    String smajor = new String(request.getParameter("smajor").getBytes("iso-8859-1"),"utf-8");

    String sclass =  new String(request.getParameter("sclass").getBytes("iso-8859-1"),"utf-8");

    String snative = new String(request.getParameter("snative").getBytes("iso-8859-1"),"utf-8");

    StudentDb sdb = new StudentDb();

    String sql = "update student set sname='"+sname+"',sage="+sage+",ssex='"+ssex+"',snativeplace='"+snativeplace+"',smajor='"+smajor+"',sclass='"+sclass+"',snative='"+snative+"'  where sid="+sid;



    if (sdb.studentUpdate(sql)){

        response.sendRedirect("student.jsp");

    }else {

        request.getRequestDispatcher("stuModForm.jsp").forward(request,response);

    }

%>

</body>

</html>
