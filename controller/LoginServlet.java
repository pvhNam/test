package controller;

import service.AuctionService;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String u = request.getParameter("username");
        String p = request.getParameter("password");

        AuctionService service = new AuctionService();
        User user = service.authenticateUser(u, p);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            // Đăng nhập thành công -> Chuyển sang trang danh sách
            response.sendRedirect("ListItemsServlet");
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}