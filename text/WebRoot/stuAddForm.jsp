
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>

<head>

    <title>填加学生信息</title>

    <style>


        .content {

            width: auto;

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
<h1 align="center">添加学生信息</h1>

<div class="content">

    <div style="height: 10px"></div>


    <form action="stuAdd.jsp" method="post">


        <table >

            <tr>

                <td colspan="2" style="text-align: center">

                    <font style="color: red">填加学生信息</font>

                </td>

            </tr>

            <tr>

                <td>学号：</td>

                <td>

                    <input id="sid" name="sid" placeholder="请输入学号" required >

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>姓名：</td>

                <td><input id="sname" name="sname" placeholder="请输入姓名" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>年龄：</td>

                <td><input id="sage" name="sage" placeholder="请输入年龄" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>性别：</td>

                <td><input id="ssex" name="ssex" placeholder="请输入性别" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>地区：</td>

                <td><input id="snativeplace" name="snativeplace" placeholder="请输入学生所在地区" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>专业：</td>

                <td><input id="smajor" name="smajor" placeholder="请输入学生所在专业" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>班级：</td>

                <td><input id="sclass" name="sclass" placeholder="请输入学生所在班级" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

            <tr>

                <td>民族：</td>

                <td><input id="snative" name="snative" placeholder="请输入学生所属民族" required>

                    <font style="color: red">*</font>

                </td>

            </tr>

        </table>

        <table >

            <tr style="text-align: center">

                <td>

                    <input type="submit" value="增加">

                </td>

                <td>

                    <input type="reset" value="重置">

                </td>

                <td>

                    <input type="submit" value="返回" onclick="window.location.href='student.jsp'">

                </td>

            </tr>

        </table>

    </form>

</div>

</body>

</html>
