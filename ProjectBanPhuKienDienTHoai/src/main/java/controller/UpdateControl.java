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
 * Servlet implementation class UpdateControl
 */
@WebServlet("/update")
public class UpdateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/hmtl;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    String id = request.getParameter("eid");
	    String name = request.getParameter("ename");
	    String image = request.getParameter("eimage");
	    String price = request.getParameter("eprice");
	    String title = request.getParameter("etitle");
	    String description = request.getParameter("edescription");
	    String category = request.getParameter("ecategory");
	    String imageold = request.getParameter("eimage-old");
	    if(!image.isEmpty()) {
	    	Product p = new Product(Integer.parseInt(id),name, image, 
		    		Double.parseDouble(price), title, description, new Category(1));
	    	ProductDAO dao = new ProductDAO();
		    dao.updateProduct(p);
		    System.out.println(p);
		    response.sendRedirect("manager");
	    }else {
	    	Product p = new Product(Integer.parseInt(id),name, imageold, 
		    		Double.parseDouble(price), title, description, new Category(1));
	    	ProductDAO dao = new ProductDAO();
		    dao.updateProduct(p);
		    System.out.println(p);
		    response.sendRedirect("manager");
	    }
	}

}
