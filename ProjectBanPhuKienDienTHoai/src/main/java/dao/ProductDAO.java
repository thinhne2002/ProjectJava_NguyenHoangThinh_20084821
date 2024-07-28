package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import context.connectDB;
import entity.Account;
import entity.Category;
import entity.Product;

public class ProductDAO {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	public List<Product> getallProduct() {
		List<Product> list = new ArrayList<>();
		String query = "SELECT p.id, p.name, p.image, p.price, p.title, p.description, p.color, c.cateID, c.cateName "
				+ "FROM Product p " + "JOIN Category c ON p.cateID = c.cateID";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				cate.setCateID(rs.getInt("cateID"));
				cate.setCateName(rs.getString("cateName"));
				product.setCateID(cate);
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace(); // In lỗi ra console để dễ debug
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public List<Product> getProductsByName(String name) throws Exception {
		List<Product> list = new ArrayList<>();
		// Tách từ khóa thành các từ riêng lẻ
		String[] keywords = name.split("\\s+");

		// Xây dựng câu truy vấn động
		StringBuilder queryBuilder = new StringBuilder("SELECT * FROM product WHERE ");
		for (int i = 0; i < keywords.length; i++) {
			queryBuilder.append("name LIKE ?");
			if (i < keywords.length - 1) {
				queryBuilder.append(" AND ");
			}
		}

		// Sử dụng try-with-resources để tự động đóng tài nguyên
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(queryBuilder.toString());
			// Gán tham số cho câu truy vấn
			for (int i = 0; i < keywords.length; i++) {
				ps.setString(i + 1, "%" + keywords[i] + "%");
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				Category cate = new Category();

				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));

				cate.setCateID(rs.getInt("cateID"));

				product.setCateID(cate);

				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Không tìm thấy sản phẩm");
			throw e; // Ném lại lỗi để phương thức gọi có thể xử lý
		}

		return list;
	}

	public List<Product> getallProductbyCateID(int id) {
		List<Product> list = new ArrayList<>();
		String query = "Select * from product where cateID = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				cate.setCateID(rs.getInt("cateID"));
				product.setCateID(cate);
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace(); // In lỗi ra console để dễ debug
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<Product> getallProductbySellid(int id) {
		List<Product> list = new ArrayList<>();
		String query = "select * from Product where sellid = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				Account acc = new Account();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				cate.setCateID(rs.getInt("cateID"));
				product.setCateID(cate);
				acc.setId(rs.getInt("id"));
				product.setSellid(acc);
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace(); // In lỗi ra console để dễ debug
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public Product getProductbyID(int id) {
		String query = "Select * from product where id = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				cate.setCateID(rs.getInt("cateID"));
				product.setCateID(cate);
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace(); // In lỗi ra console để dễ debug
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void deleteProduct(int pid) {
		String query = "delete from product where id = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, pid);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void addProduct(Product p) {
		String query = "INSERT INTO product(name, image, price, title, description, cateID, sellid) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p.getName());
			ps.setString(2, p.getImage());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getTitle());
			ps.setString(5, p.getDescription());
			ps.setInt(6, p.getCateID().getCateID());
			ps.setInt(7, p.getSellid().getId());
			ps.executeUpdate();
			System.out.println("Thêm thành công");
		} catch (Exception e) {
			System.out.println("Thêm thất bại: " + e.getMessage());
		}
	}

	public void updateProduct(Product p) {
		String query = "update product set name = ?,image=?,price=?,title=?,description=?,cateID=?"
				+ " where id=?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, p.getName());
			ps.setString(2, p.getImage());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getTitle());
			ps.setString(5, p.getDescription());
			ps.setInt(6, p.getCateID().getCateID());
			ps.setInt(7, p.getId());
			ps.executeUpdate();
			System.out.println("Sửa Thành Công");
		} catch (Exception e) {
			System.out.println("Sửa thất bại: " + e.getMessage());
		}
	}
	public int getnumberpage(int sellid) {
		String query = "select count(*) from Product where sellid = ?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, sellid);
			rs = ps.executeQuery();
			while(rs.next()) {
				int total = rs.getInt(1);
				int countPage = total/3;
				if(total % 5!= 0) {
					countPage++;
				}
				return countPage;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	public List<Product> getPagingManagerP(int index,int sellid) {
		List<Product> list = new ArrayList();
		String query = "SELECT * FROM Product where sellid = ? ORDER BY ID OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1,sellid);
			ps.setInt(2,(index-1)*4 );
			rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setTitle(rs.getString("title"));
				product.setDescription(rs.getString("description"));
				product.setColor(rs.getString("color"));
				cate.setCateID(rs.getInt("cateID"));
				product.setCateID(cate);
				list.add(product);
			}
		} catch (Exception e) {

		}
		return list;
	}
	public int getTotalProductbyselid(int selid) {
		String query ="select count (*) from product where sellid=?";
		try {
			conn = new connectDB().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, selid);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	public static void main(String[] args) throws Exception {
		ProductDAO dao = new ProductDAO();
		//System.out.println(dao.getTotalProductbyselid(1));
		List<Product> list = dao.getPagingManagerP(2,1);
		for(Product o : list) {
			System.out.println(o);
		}
//		Product p = new Product(21,"Tai Nghe",
//				"https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-10.png",
//				8000000, "Tai Nghe", "Tai Nghe Sony", new Category(1));
//		dao.updateProduct(p);
		
	}
}
