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
import entity.Cart;
import entity.CartItem;
import entity.Product;

/**
 * Servlet implementation class AddtocartControl
 */
@WebServlet("/addtocart")
public class AddtocartControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtocartControl() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart;
        HttpSession s = request.getSession();
        cart = (Cart) s.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        s.setAttribute("cart", cart);
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        Cart cart = (Cart) s.getAttribute("cart");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String action = request.getParameter("action");
            switch (action) {
                case "get":
                    response.sendRedirect("views/web/ShoppingCart.jsp");
                    break; // Add return to prevent further processing
                case "delete":
                    doDelete(request, response);
                    break; // Add return to prevent further processing
                case "put":
                    doPut(request, response);
                    break; // Add return to prevent further processing
                case "post":
                	String id = request.getParameter("id");
                    ProductDAO dao = new ProductDAO();
                    Product p = dao.getProductbyID(Integer.parseInt(id));
                    CartItem cartitem = new CartItem(p, 1);
                    cart.add(cartitem);
                    s.setAttribute("cart", cart);
                    response.sendRedirect("home");
                     break;
                default:
                    break;
            }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: Implement delete logic
        HttpSession s = req.getSession();
        Cart cart = (Cart) s.getAttribute("cart");
        int id = Integer.parseInt(req.getParameter("id"));
        cart.remove(id);
        s.setAttribute("cart", cart);
        resp.sendRedirect("views/web/ShoppingCart.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO: Implement put logic
    	HttpSession s = req.getSession();
        Cart cart = (Cart) s.getAttribute("cart");
        int id = Integer.parseInt(req.getParameter("id"));
        int quanlity = Integer.parseInt(req.getParameter("quanlity"));
        String e="";
        if(quanlity > 0) {
        	cart.update(id, quanlity);
        }else{
        	e = "số lượng phải lớn hơn 0";
        }
        req.setAttribute("error", e);
        s.setAttribute("cart",cart);
        req.getRequestDispatcher("addtocart?action=get").forward(req, resp);;
        
    }
}
