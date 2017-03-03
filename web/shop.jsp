<%-- 
    Document   : shop
    Created on : 03-03-2017, 09:09:05
    Author     : brein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Navbar -->
        <div class="main-div">
            <h1>Hello World!</h1>
            <form action="shop" method="post">
                <input type="hidden" name="addToBasket" value="addToBasket">
                <select name="bottom">
                    <c:forEach items="${bottoms}" var="bottom">
                        <option value="${bottom.name}">${bottom.name} - ${bottom.price}</option>
                    </c:forEach>
                    <option value="getvaluefromelement">name price</option>
                </select>
                <select name="topping">
                    <c:forEach items="${toppings}" var="topping">
                        <option value="${topping.name}">${topping.name} - ${topping.price}</option>
                    </c:forEach>
                </select>
                <input type="submit" name="add" value="add">
            </form>
    </body>
</html>
