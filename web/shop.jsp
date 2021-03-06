<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active"><a href="shop">Shop</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${loggedIn == true}">
                            <li><a href="basket">Basket <c:if test="${basket != null}">(${basket.size()})</c:if></a></li>
                            <li><a href="account">Account</a></li>
                            <li><a href="logout">Logut</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="createuser.jsp">Register</a></li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>
        </nav>

        <div class="main-div">
            <h1>Hello World!</h1>
            <form action="shop" method="post">
                <input type="hidden" name="basket" value="true">
                <table border="2" class="table">
                    <p>Bottom</p>
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>Flavor</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bottoms}" var="bottom">
                            <tr>
                                <td><input type="radio" name="bottomRad" value="${bottom.getName()};${bottom.getPrice()}" onChange="calculatePrice()"/></td>
                                <td>${bottom.getName()}</td>
                                <td>${bottom.getPrice()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <table border="2" class="table">
                    <p>Topping</p>
                    <thead>
                        <tr>
                            <th>Select</th>
                            <th>Flavor</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${toppings}" var="topping">
                            <tr>
                                <td><input type="radio" name="toppingRad" value="${topping.getName()};${topping.getPrice()}" onChange="calculatePrice()"/></td>
                                <td>${topping.getName()}</td>
                                <td>${topping.getPrice()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <p>Total price: </p> <label id="totalPriceLabel">#</label>
                <br>
                <input type="hidden" value="" name="bottomHid" id="bottom">
                <input type="hidden" value="" name="toppingHid" id="topping">
                <input class="btn btn-primary" type="submit" value="Add" id="submitID" onclick="calculatePrice()">
            </form>
        </div>
    </body>

    <script>
        function calculatePrice() {
            var checked1 = document.querySelector('input[name = "toppingRad"]:checked').value.split(';');
            var checked2 = document.querySelector('input[name = "bottomRad"]:checked').value.split(';');

            var totalPrice = +checked1[1] + +checked2[1];

            document.getElementById('totalPriceLabel').innerHTML = totalPrice;
            document.getElementById('bottom').value = checked2[0];
            document.getElementById('topping').value = checked1[0];           
        }
    </script>

</html>