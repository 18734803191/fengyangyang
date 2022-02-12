package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDao {
	//验证用户名密码是否正确
	public boolean checkPassword(String username,String password){
		Connection conn = ConnectionFactory.createConnection();
		String sql = "SELECT * FROM  user WHERE username = ? and password = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if(rs.next())
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionFactory.close(conn, stmt, rs);
		}
		return false;
	}
	
	//注册用户
	public void insertUser(User user){
		Connection conn = ConnectionFactory.createConnection();
		String sql = "insert into user (username,password,birthday,address,type) values(?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setDate(3, user.getBirthday());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getType());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionFactory.close(conn, pstmt, null);
		}
	}
}
