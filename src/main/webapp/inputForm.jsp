<%-- 
    Document   : inputForm
    Created on : Aug 20, 2024, 2:16:32 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<html>
<head>
    <title>Input Form</title>
</head>
<body>
    <h1>Pilih Nama dan Negara</h1>
    <form action="resultForm.jsp" method="POST">
        <label for="nama">Nama:</label>
        <select name="nama" id="nama">
            <option value="Andi">Andi</option>
            <option value="Budi">Budi</option>
            <option value="Ahmad">Ahmad</option>
        </select><br><br>
        
        <label for="negara">Negara:</label>
        <select name="negara" id="negara">
            <option value="Jepang">Jepang</option>
            <option value="Amerika">Amerika</option>
            <option value="Australia">Australia</option>
            <option value="Indonesia">Indonesia</option>
        </select><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>

