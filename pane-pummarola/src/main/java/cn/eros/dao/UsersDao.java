package cn.eros.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cn.eros.model.Users;

public class UsersDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UsersDao(Connection con) {
	
		this.con = con;
	}
	
	
	public Users userLogin(String email, String password) {
		Users users = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				users = new Users();
				users.setId(rs.getInt("id"));
				users.setName(rs.getString("name"));
				users.setEmail(rs.getString("email"));
			}
			
		}catch (Exception e) {
		
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return users;
	}
	
}
