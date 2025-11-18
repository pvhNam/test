package controller;

import service.AuctionService;
import model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        
        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            Long itemId = Long.parseLong(request.getParameter("itemId"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            
            AuctionService service = new AuctionService();
            AuctionItem item = service.getAuctionItem(itemId);
            
            if (item != null) {
                double minPrice = item.getCurrentPrice() + item.getPriceStep();
                if (amount >= minPrice) {
                    service.bid(user, item, amount);
                    // Đấu giá thành công -> về trang danh sách
                    response.sendRedirect("ListItemsServlet");
                } else {
                    // Giá không hợp lệ -> quay lại trang chi tiết với thông báo lỗi (đơn giản)
                    response.sendRedirect("showTopic.jsp?id=" + itemId + "&error=invalid_price");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ListItemsServlet");
        }
    }
}