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

@WebServlet("/category")
public class CategoryControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CategoryControl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl;charset=UTF-8");
		//Lấy Danh Sách Sản phẩm theo Cateid
		String cateID = request.getParameter("cid");
		ProductDAO dao = new ProductDAO();
		List<Product> list = dao.getallProductbyCateID(Integer.parseInt(cateID));
		//Lấy Danh Sách Category
		CategoryDAO catedao = new CategoryDAO();
		List<Category> listcate = catedao.getAllCategory();
		
		request.setAttribute("listP", list);
		request.setAttribute("listC", listcate);
		
		request.getRequestDispatcher("views/web/Home.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
