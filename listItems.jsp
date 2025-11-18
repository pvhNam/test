<%@ page import="model.*"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Danh sách đấu giá</title>
</head>
<body>
    <%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>

    <div style="text-align: right; background-color: #ccffff; padding: 5px;">
        Chào mừng <b><%=user.getUsername()%></b> | <a href="LogoutServlet">Thoát</a>
    </div>

    <h3>Danh mục các mặt hàng đấu giá</h3>

    <table border="1" width="100%" cellpadding="5">
        <tr style="background-color: #00FFFF">
            <th>Mặt hàng</th>
            <th>Giá</th>
        </tr>
        <%
        List<AuctionItem> list = (List<AuctionItem>) request.getAttribute("items");
        if (list != null) {
            for (AuctionItem item : list) {
        %>
        <tr>
            <td>
                <a href="showTopic.jsp?id=<%=item.getId()%>"> 
                    <%=item.getDescription()%>
                </a>
            </td>
            <td>
                Giá khởi điểm: <%=item.getInitialPrice()%> VNĐ<br> 
                <%
                if (!item.getBids().isEmpty()) {
                %>
                    Giá hiện tại: <%=item.getCurrentPrice()%> VNĐ <br> 
                    (<%=item.getBids().size()%> lần đặt giá) 
                <%
                }
                %>
            </td>
        </tr>
        <%
            }
        }
        %>
    </table>
</body>
</html>