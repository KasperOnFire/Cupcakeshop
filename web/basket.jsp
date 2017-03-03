<%-- 
    Document   : basket
    Created on : 02-03-2017, 14:57:19
    Author     : brein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Basket</title>
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <!--navbar here -->
        <div class="main-div">
            <h1>Cupcakeshop</h1>
            <h2>Your basket</h2>
            <table class="baskettable">
                <tr>
                    <th>
                    <td>Bottom</td>
                    <td>Topping</td>
                    <td>Amount</td>
                    <td>Price</td>
                    </th>
                </tr>
                <!-- foreach here -->
                <c:forEach items="${orders}" var="order">
                    <tr>
                    <td value="${order.bottom}">${order.bottom}</td>
                    <td value="${order.topping}">${order.topping}</td>
                    <td value="${order.amount}">${order.amount}</td>
                    <td value="${order.price}">${order.price}</td>
                    </tr>
                    </c:forEach>
                <!-- end foreach -->
            </table>
            <form action="order" method="post">
                <h3>Total price:</h3>
                <h3 id="totalPrice">##,-</h3>
            </form>
        </div>
    </body>
</html>
