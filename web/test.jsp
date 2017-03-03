<%-- 
    Document   : test
    Created on : 02-03-2017, 12:50:38
    Author     : Pensam
--%>
<%@page import="User.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>${errorCode}</p>
        <p> ${user.getUname()}</p>
        <p> ${user.getBalance()}
        <h1>Hello World!</h1>
    </body>
</html>
