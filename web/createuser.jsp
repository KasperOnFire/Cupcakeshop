<%-- 
    Document   : createuser
    Created on : 02-03-2017, 12:49:24
    Author     : Pensam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </head>
    <body>
        <div>
            <br>
            <form action="createuser" method="post">
                <input type="text" placeholder="username" name="username">
                <br>
                <br>
                <input type="password" placeholder="password" name="password">
                <br>
                <br>
                <input type="submit">
            </form>
        </div>
    </body>
</html>
