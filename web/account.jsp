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
            <h2>Your orders</h2>
            <table class="baskettable">
                <tr>
                    <th>Order no.</th>
                    <th>Bottom</th>
                    <th>Topping</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Order Price</th>
                    </th>
                </tr>
                <!-- foreach here -->
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <td value="${order.ono}">${order.ono}</td>
                    <td value="${order.bottom}">${order.bottom}</td>
                    <td value="${order.topping}">${order.topping}</td>
                    <td value="${order.amount}">${order.amount}</td>
                    <td value="${order.price}">${order.price}</td>'
                    <td value="${order.totalPrice}"></td>
                    </tr>
                    </c:forEach>
                <!-- end foreach -->
            </table>
        </div>
    </body>
</html>
