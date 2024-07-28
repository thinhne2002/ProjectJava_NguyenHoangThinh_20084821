package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.connectDB;
import entity.Category;

public class CategoryDAO {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	public List<Category> getAllCategory(){
		List<Category> list = new ArrayList();
		String query ="Select * from Category";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				Category cate = new Category();
				cate.setCateID(rs.getInt("cateID"));
				cate.setCateName(rs.getString("cateName"));
				list.add(cate);
			}
			System.out.println("ket noi thanh cong category");
		} catch (Exception e) {
			System.out.println("khong ket noi duoc");
		}
		return list;
	}
	public static void main(String[] args) {
		CategoryDAO dao = new CategoryDAO();
		List<Category> list =  dao.getAllCategory();
		for(Category o : list) {
			System.out.println(o);
		}
	}
}
