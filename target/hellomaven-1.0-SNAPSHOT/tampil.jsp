<%-- 
    Document   : tampil
    Created on : Aug 19, 2024, 2:07:30 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Display Details</title>
</head>
<body>
    <h2>Your Inputted Details</h2>

    <%
        // Retrieve the form data
        String nama = request.getParameter("nama");
        String id = request.getParameter("id");
        String alamat = request.getParameter("alamat");
    %>

    <p><strong>Nama:</strong> <%= nama %></p>
    <p><strong>ID:</strong> <%= id %></p>
    <p><strong>Alamat:</strong></p>
    <p><%= alamat %></p>

    <br><a href="login.jsp">Kembali</a>
</body>
</html>

