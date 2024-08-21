<%-- 
    Document   : logind2
    Created on : Aug 21, 2024, 1:50:34 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
    </head>
    <body>
        <h2>LOGIN PAGE</h2>
        <form action="tampild2.jsp" method="post">
            <label for="nama">Username:</label><br>
            <input type="text" id="username" name="username" maxlength="100" required><br><br>

            <label for="id">Password:</label><br>
            <input type="password" id="password" name="password" maxlength="50" required><br><br>

            <input type="submit" value="LOG IN">
        </form>
    </body>
</html>
