package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import entity.Account;

@WebServlet("/login")
public class LoginControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginControl() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        AccountDAO acc = new AccountDAO();
        Account a = acc.login(user, pass);

        if (a == null) {
            // Nếu không tìm thấy tài khoản, gửi lại trang login với thông báo lỗi
            request.setAttribute("mess", "Thông Tin Đăng Nhập Sai");
            request.getRequestDispatcher("views/web/Login.jsp").forward(request, response);
        } else {
            // Nếu đăng nhập thành công, chuyển hướng đến trang home
        	HttpSession session = request.getSession();
        	session.setAttribute("acc", a);
        	response.sendRedirect("home");
        }
    }
}
