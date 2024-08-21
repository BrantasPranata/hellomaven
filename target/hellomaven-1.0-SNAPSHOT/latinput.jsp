<%-- 
    Document   : latinput
    Created on : Aug 21, 2024, 9:20:49 AM
    Author     : Brantas
--%>
<% session.invalidate(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Input Nama Pengguna</title>
    </head>
    <body>
        <h1>Silahkan Masukkan Nama Anda:</h1>
        <form action="welcome.jsp" method="POST">
            <label for="nama">Nama:</label>
            <input type="text" name="nama" required><br><br>
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
