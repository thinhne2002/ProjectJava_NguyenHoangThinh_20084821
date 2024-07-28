package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Category;
import entity.Product;

@WebServlet("/home")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lấy Danh Sách Sản Phẩm
		ProductDAO dao = new ProductDAO();
		List<Product> list = dao.getallProduct();
		//Lấy danh sách category
		CategoryDAO catedao = new CategoryDAO();
		List<Category> listcate = catedao.getAllCategory();
		
		request.setAttribute("listC", listcate);
		request.setAttribute("listP", list);
		request.getRequestDispatcher("views/web/Home.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
