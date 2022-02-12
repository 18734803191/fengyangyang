
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8"%>

<html>

<head>

    <title>学生信息修改</title>

    <style>

        .content{

            width: 850px;

            height: 400px;
           margin-left: 850px;
           margin-top: 60px;
          


        }
         body{
        background: url(image/2.jpg);
        background-size:cover;
     }

    </style>

</head>

<body>
<h1 align="center">学生信息修改</h1>

<div class="content">

    <div style="height: 10px"></div>


    <form action="stuMod.jsp">

        <table >

            <tr>

                <td colspan="2" style="text-align: center">

                    <font style="color: red">修改学生信息</font>
                </td>

            </tr>

            <tr>

                <td>学号：</td>

                <%-- readonly属性规定字段只能读，不能编辑修改--%>

                <td><input id="sid" name="sid" value="<%=request.getParameter("sid")%>" required readonly></td>

            </tr>

            <tr>

                <td>姓名：</td>

                <%--  required 属性规定必需在提交表单之前填写输入字段  --%>

                <td><input id="sname" name="sname" value="<%=new String(request.getParameter("sname").getBytes("iso-8859-1"),"utf-8")%>" required><font

                        color="red">*</font></td>

            </tr>

            <tr>

                <td>年龄：</td>

                <td><input id="sage" name="sage" value="<%=request.getParameter("sage")%>"></td>

            </tr>

            <tr>

                <td>性别：</td>

                <td><input id="ssex" name="ssex" value="<%=new String(request.getParameter("ssex").getBytes("iso-8859-1"),"utf-8")%>"></td>

            </tr>

            <tr>

                <td>地区：</td>

                <td><input id="snativeplace" name="snativeplace" value="<%=new String(request.getParameter("snativeplace").getBytes("iso-8859-1"),"utf-8")%>"></td>

            </tr>

            <tr>

                <td>专业：</td>

                <td><input id="smajor" name="smajor" value="<%=new String(request.getParameter("smajor").getBytes("iso-8859-1"),"utf-8")%>"></td>

            </tr>

            <tr>

                <td>班级：</td>

                <td><input id="sclass" name="sclass" value="<%=new String(request.getParameter("sclass").getBytes("iso-8859-1"),"utf-8")%>"></td>

            </tr>

            <tr>

                <td>民族：</td>

                <td><input id="snative" name="snative" value="<%=new String(request.getParameter("snative").getBytes("iso-8859-1"),"utf-8")%>"></td>

            </tr>

        </table>

        <table >

            <tr style="text-align: center">

                <td>

                    <input type="submit" value="确认修改">

                </td>

                <td>

                    <input type="button" value="返回" onclick="window.location.href='student.jsp'">

                </td>

            </tr>

        </table>

    </form>

</div>


</body>

</html>
