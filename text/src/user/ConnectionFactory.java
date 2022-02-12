package user;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;



public class ConnectionFactory {
	public  static ConnectionFactory cFactory=new ConnectionFactory();
	private  ConnectionFactory(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) { // TODO Auto-generated catch block
			System.out.print("驱动加载失败！");
		}
	}
	
	public static Connection  createConnection(){
		Connection connection = null;
		String url = "jdbc:mysql://localhost:3306/test";
		try {
			connection = DriverManager.getConnection(url,"root","123");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("数据库连接失败！");
		}
		return connection;
	}
	
	public static void close(Connection conn, java.sql.Statement stmt, ResultSet rs){
		if(conn !=null )
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
			}
		if(stmt !=null )
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print("关闭数据库连接失败！");
			}
		if(rs !=null )
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.print("关闭数据库连接失败！");
			}
	}
	 public static void main(String args[]){
	    	Connection c = ConnectionFactory.createConnection();
	    	System.out.println(c);
	    }
}
