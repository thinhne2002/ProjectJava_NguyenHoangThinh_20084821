package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import entity.Account;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/signup")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmp = request.getParameter("confirm_password");
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		if(!password.equals(confirmp)) {
			System.out.println("Sai mật khẩu xác nhận");
			System.out.println("password:" + password);
			System.out.println("confirmp:" + confirmp);
			response.sendRedirect("views/web/Login.jsp");
		}else {
			AccountDAO dao = new AccountDAO();
			Account user = dao.checkAccountExist(username);
			Account emailuser = dao.checkAccountExist(email);
			Account phoneuser = dao.checkAccountExist(phone);
			if(user == null && emailuser == null && phoneuser == null) {
				dao.signup(username, password, phone, email, fullname);
				System.out.println("Đăng ký THành Công");
				response.sendRedirect("home");
			}else {
				System.out.println("Đăng ký Thất bại");
				response.sendRedirect("views/web/Login.jsp");
			}
		}		
	}

}
