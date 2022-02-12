
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="student1.StudentDb" %>

<%@ page import="java.util.List" %>

<%@ page import="student1.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"  %>

<html>

<head>

    <title>学生信息显示</title>

    <style type="text/css">

        td, th {

            /* white-space: nowrap; 文本不换行显示 */

            white-space: nowrap;

            width: 70px;

            height: 35px;


            text-align: center;

        }

 


        .content {

            width: 550px;

            height: 350px;

          

            /* overflow: auto;当内容溢出时添加滚动条 */

            overflow: auto; 
            


            margin: auto;

        }
        body{
        background: url(image/3.jpg);
        background-size:cover;
     }
         
         

    </style>

</head>

<body>
 <h1 align="center">学生信息显示</h1>
<div class="content">

    
    <form action="student.jsp" style="text-align: center;margin-top: 200px;" method="post">
    

        <input id="sname" name="sname" placeholder=" 按 姓 名 查 询  " size="20">

        <input type="submit" value=" 查 询  ">

        <input type="button" value="增 加 学 生 信 息" onclick="window.location.href='stuAddForm.jsp'">
        
        <input type="button" value=" 返 回  " onclick="window.location.href='login.jsp'" >

    </form>

    <table>

        <tr>

            <th>学号</th>

            <th>姓名</th>

            <th>年龄</th>

            <th>性别</th>

            <th>地区</th>

            <th>专业</th>

            <th>班级</th>

            <th>民族</th>


            <th colspan="2">操作</th>

        </tr>

 

        <%

            StudentDb sdb = new StudentDb();
           
            
			request.setCharacterEncoding("utf-8");
            String sname = request.getParameter("sname");
           
            String sql = null;

            if (sname == null) {

                sql = "select * from student";

            } else {

                sql = "select * from student where sname like '%" + sname + "%'";

            }

            List<Student> lst = sdb.getStudent(sql);

            request.setAttribute("stuLst", lst);

        %>

        <c:forEach items="${stuLst}" var="stu">

            <tr id="${stu.sid}">

                <td>${stu.sid}</td>

                <td>${stu.sname}</td>

                <td>${stu.sage}</td>

                <td>${stu.ssex}</td>

                <td>${stu.snativeplace}</td>

                <td>${stu.smajor}</td>

                <td>${stu.sclass}</td>

                <td>${stu.snative}</td>

                <td><a href="studel.jsp?sid=${stu.sid}" style="text-decoration: none">删除</a></td>

                <td>

                    <a href="stuModForm.jsp?sid=${stu.sid}&sname=${stu.sname}&sage=${stu.sage}&ssex=${stu.ssex}&snativeplace=${stu.snativeplace}&smajor=${stu.smajor}&sclass=${stu.sclass}&snative=${stu.snative}"

                       style="text-decoration: none">修改</a></td>

            </tr>

        </c:forEach>

    </table>

</div>

</body>

</html>
