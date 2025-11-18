<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập - AuctionApp</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .box { width: 350px; margin: 50px auto; border: 1px solid #ccc; padding: 20px; text-align: center; box-shadow: 2px 2px 10px #eee; }
        .header { background-color: #00FFFF; padding: 10px; font-weight: bold; margin-bottom: 20px; }
        .error { color: red; margin-bottom: 10px; font-size: 14px; }
    </style>
</head>
<body>
    <div class="box">
        <div class="header">Đăng nhập</div>
        <% 
            String err = (String) request.getAttribute("error");
            if(err != null) { out.print("<div class='error'>" + err + "</div>"); }
        %>
        <form action="LoginServlet" method="post">
            <table align="center">
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td><input type="text" name="username" value="hoangnv"></td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td><input type="password" name="password" value="hoangnv"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="padding-top:10px;">
                        <input type="submit" value="Đăng nhập">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>	