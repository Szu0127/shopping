package eduvideoproducts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import eduvideoproducts.model.User;

public class UserDao {
	private Connection conn;
	private String query;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			pstmt = this.conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				// 不讓使用者亂改密碼
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}
}
