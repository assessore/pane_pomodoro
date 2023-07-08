package cn.eros.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.eros.model.Order;
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
				users.setIndirizzo(rs.getString("indirizzo"));
			}
			
		}catch (Exception e) {
		
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return users;
	}

	
	public boolean registerUser(Users model) {
        boolean result = false;
        try {
            query = "insert into users (id, name, email, password, indirizzo, carta) values(?,?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setString(2, model.getName());
            pst.setString(3, model.getEmail());
            pst.setString(4, model.getPassword());
            pst.setString(5, model.getIndirizzo());
            pst.setString(6, model.getCarta());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
}
	
	public boolean changeUser(Users model) {
        boolean result = false;
        try {
            query = "update users set name=?, email=?, password=?, indirizzo=?, carta=? WHERE id = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, model.getName());
            pst.setString(2, model.getEmail());
            pst.setString(3, model.getPassword());
            pst.setString(4, model.getIndirizzo());
            pst.setString(5, model.getCarta());
            pst.setInt(6, model.getId());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
}
	
	
}
