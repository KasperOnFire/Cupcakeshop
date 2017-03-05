<%-- 
    Document   : basket
    Created on : 02-03-2017, 14:57:19
    Author     : brein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <th>Bottom</th>
                    <th>Topping</th>
                    <th>Amount</th>
                    <th>Price</th>
                </tr>
                <!-- foreach here -->
                <c:forEach items="${basket}" var="cupcake">
                    <tr>
                        <td>${cupcake.getBottom}</td>
                        <td>${cupcake.getTopping}</td>
                        <td>${cupcake.getAmount}</td>
                        <td>${cupcake.getPrice}</td>
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
