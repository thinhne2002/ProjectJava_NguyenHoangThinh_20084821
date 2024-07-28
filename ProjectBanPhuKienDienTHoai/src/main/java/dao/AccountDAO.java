package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.connectDB;
import entity.Account;
import entity.Cart;

public class AccountDAO {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	public Account login(String user,String pass) {
		String query ="select * from Account where (username = ? "
				+ "or email = ? "
				+ "or phone = ? )"
				+ "and password = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, user);
			ps.setString(3, user);
			ps.setString(4, pass);
			rs = ps.executeQuery();
			while(rs.next()) {
				Account acc = new Account();
				acc.setId(rs.getInt("id"));
				acc.setUser(rs.getString("username"));
				acc.setPhone(rs.getString("phone"));
				acc.setEmail(rs.getString("email"));
				acc.setIsSell(rs.getInt("issell"));
				acc.setIsAdmin(rs.getInt("isadmin"));
				acc.setFullname(rs.getString("name"));
				return acc;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public Account checkAccountExist(String username) {
		String query ="select * from Account where username = ? "
				+ "or email = ? "
				+ "or phone = ? ";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, username);
			ps.setString(3, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				Account acc = new Account();
				acc.setId(rs.getInt("id"));
				acc.setUser(rs.getString("username"));
				acc.setPhone(rs.getString("phone"));
				acc.setEmail(rs.getString("email"));
				acc.setIsSell(rs.getInt("issell"));
				acc.setIsAdmin(rs.getInt("isadmin"));
				return acc;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public void signup(String username, String pass, String phone, String email,String name) {
		String query = "insert into account values(?,?,0,0,?,?,?)";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, pass);
			ps.setString(3, phone);
			ps.setString(4, email);
			ps.setString(5, name);
			ps.executeUpdate();
			System.out.println("Thêm thành công");
		} catch (Exception e) {
			System.out.println("thêm không thành công");
		}
	}
	public static void main(String[] args) {
		AccountDAO dao = new AccountDAO();
		dao.signup("hung", "123456789","56789","hung@gmail.com","Dương Minh Hưng");
	}
}
