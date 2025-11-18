<%@ page import="service.AuctionService" %>
<%@ page import="model.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chi tiết mặt hàng</title>
    <style>
        .top-bar { text-align: right; background-color: #E0FFFF; padding: 5px; }
        .item-header { background-color: #00FFFF; padding: 8px; font-weight: bold; margin-top: 10px; }
        .info-panel { display: flex; margin-top: 10px; }
        .left-panel { width: 60%; padding-right: 20px; }
        .right-panel { width: 40%; background-color: #f9f9f9; padding: 10px; border: 1px solid #ddd; }
        .error { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <%
        User user = (User) session.getAttribute("currentUser");
        if(user == null) { response.sendRedirect("login.jsp"); return; }

        String idStr = request.getParameter("id");
        if(idStr == null) { response.sendRedirect("ListItemsServlet"); return; }

        AuctionService service = new AuctionService();
        AuctionItem item = service.getAuctionItem(Long.parseLong(idStr));
        DecimalFormat df = new DecimalFormat("###,###");
        
        // Tính giá đề nghị tối thiểu
        double minBid = item.getCurrentPrice() + item.getPriceStep();
    %>

    <div class="top-bar">
        Chào <b><%= user.getUsername() %></b> | <a href="LogoutServlet">Thoát</a>
    </div>

    <div class="item-header"><%= item.getDescription() %></div>

    <div class="info-panel">
        <div class="left-panel">
            <p>Giá hiện tại: <b style="color:red; font-size:18px;"><%= df.format(item.getCurrentPrice()) %> VNĐ</b></p>
            <p>Người đặt mới nhất: 
                <%= (item.getBids().isEmpty()) ? "Chưa có" : item.getBids().get(item.getBids().size()-1).getBidder().getUsername() %> 
                (<%= item.getBids().size() %> lượt đặt giá)
            </p>
            <p>Giá khởi điểm: <%= df.format(item.getInitialPrice()) %> VNĐ</p>
            <p>Bước giá: <%= df.format(item.getPriceStep()) %> VNĐ</p>
            <p>Thời gian còn: <b><%= item.getDuration() %></b></p>

            <hr>
            
            <% if(request.getParameter("error") != null) { %>
                <p class="error">Giá đặt không hợp lệ! Phải lớn hơn hoặc bằng <%= df.format(minBid) %> VNĐ</p>
            <% } %>

            <form action="BidServlet" method="post">
                <input type="hidden" name="itemId" value="<%= item.getId() %>">
                Giá đặt: <input type="number" name="amount" value="<%= (long)minBid %>"> 
                <span style="color:gray;">(>= <%= df.format(minBid) %>)</span>
                <br><br>
                <input type="submit" value="Đặt giá">
            </form>

            <br>
            <a href="ListItemsServlet">Danh sách đấu giá</a>
        </div>

        <div class="right-panel">
            <b>Thông tin người bán</b><br>
            <ul>
                <li>Tên tài khoản: mrHuy</li>
                <li>Cửa hàng: Đồ Cao Huy</li>
                <li>Email: trai@yahoo.com</li>
                <li>Địa chỉ: Q. Tân Bình, TP.HCM</li>
            </ul>
        </div>
    </div>
</body>
</html>S