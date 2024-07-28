package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import entity.Account;
import entity.Category;
import entity.Product;

/**
 * Servlet implementation class AddPControl
 */
@WebServlet("/addp")
public class AddPControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    String name = request.getParameter("name");
	    String image = request.getParameter("image");
	    String price = request.getParameter("price");
	    String title = request.getParameter("title");
	    String description = request.getParameter("description");
	    String category = request.getParameter("category");
	    HttpSession session = request.getSession();
	    Account a = (Account) session.getAttribute("acc");
	    int sid = a.getId();
	    Product p = new Product(name, image, 
	    		Double.parseDouble(price), title, description, new Category(1), new Account(sid));
	    
	    ProductDAO dao = new ProductDAO();
	    dao.addProduct(p);
	    System.out.println(p);
	    response.sendRedirect("manager");
	}

}
