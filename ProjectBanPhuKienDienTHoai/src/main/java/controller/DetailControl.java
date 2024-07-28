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

/**
 * Servlet implementation class DetailControl
 */
@WebServlet("/detail")
public class DetailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/hmtl;charset=UTF-8");
		//Lấy danh sách category
		CategoryDAO catedao = new CategoryDAO();
		List<Category> listcate = catedao.getAllCategory();
		//Lấy Sản phẩm theo ID
		String id = request.getParameter("pid");
		ProductDAO dao = new ProductDAO();
		Product p = dao.getProductbyID(Integer.parseInt(id));
		//Lấy Danh Sách Sản phẩm theo category (sản phẩm liên quan)
//		String cateID = request.getParameter("rid");
		ProductDAO relateddao = new ProductDAO();
		List<Product> list = dao.getallProductbyCateID(p.getCateID().getCateID());
		
		request.setAttribute("listC", listcate);
		request.setAttribute("detail", p);
		request.setAttribute("listR", list);
		request.getRequestDispatcher("views/web/Detail.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
