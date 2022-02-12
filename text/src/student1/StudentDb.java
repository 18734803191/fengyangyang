package student1;

import student1.Student;

import java.sql.*;

import java.util.ArrayList;

import java.util.List;

 



public class StudentDb {


   
    public List<Student> getStudent(String sql) throws SQLException {

        List<Student> list = new ArrayList<Student>();

        //获取连接对象

        Connection conn = ConnectionFactory.getConnection();

        try {

            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery(sql);

            //遍历结果集对象

            while(rs.next()){

                Student stu = new Student();

                stu.setSid(rs.getInt("sid"));

                stu.setSname(rs.getString("sname"));

                stu.setSage(rs.getInt("sage"));

                stu.setSsex(rs.getString("ssex"));

                stu.setSnativeplace(rs.getString("snativeplace"));

                stu.setSmajor(rs.getString("smajor"));

                stu.setSclass(rs.getString("sclass"));

                stu.setSnative(rs.getString("snative"));

                list.add(stu);

            }

        }catch (Exception e){

            System.out.println(e.getMessage());

        }finally {

            if (conn!=null){

                conn.close();

            }

        }

        return list;

    }

 


    public boolean studentUpdate(String sql) throws SQLException {

        //获取数据库连接对象

        Connection conn = ConnectionFactory.getConnection();

        try {

            Statement st = conn.createStatement();

            int t = st.executeUpdate(sql);

            return t>0; 

        }catch (Exception e){

            System.out.println(e.getMessage());

            return false;

        }finally {

            if (conn!=null)

                conn.close();

        }

    }
   
    

}
