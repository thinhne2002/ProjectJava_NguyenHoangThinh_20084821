package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Category;
import entity.Product;

/**
 * Servlet implementation class ManageControl
 */
@WebServlet("/manager")
public class ManageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();
	    Account a = (Account) session.getAttribute("acc");
	    int id = a.getId();
	    
	    ProductDAO dao = new ProductDAO();
//	    List<Product> list = dao.getallProductbySellid(id);
	    CategoryDAO catedao = new CategoryDAO();
		List<Category> listcate = catedao.getAllCategory();
		
		int count = dao.getTotalProductbyselid(id);
		int endPage = count/4;
		if(count % 4 != 0) {
			endPage++;
		}
		
		String indexPage = request.getParameter("index");
		if(indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		
	    List<Product> list = dao.getPagingManagerP(index,id);
		
		request.setAttribute("endp", endPage);
		request.setAttribute("listC", listcate);
	    request.setAttribute("listP", list);
	    request.setAttribute("tag", index);
	    request.getRequestDispatcher("views/web/ManageProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
