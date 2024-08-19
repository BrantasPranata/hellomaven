<%-- 
    Document   : login
    Created on : Aug 19, 2024, 2:06:52 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Input Your Details</h2>
    <form action="tampil.jsp" method="post">
        <label for="nama">Nama:</label><br>
        <input type="text" id="nama" name="nama" maxlength="100" required><br><br>

        <label for="id">ID:</label><br>
        <input type="text" id="id" name="id" maxlength="50" required><br><br>

        <label for="alamat">Alamat:</label><br>
        <textarea id="alamat" name="alamat" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="Tampil">
    </form>
</body>
</html>

