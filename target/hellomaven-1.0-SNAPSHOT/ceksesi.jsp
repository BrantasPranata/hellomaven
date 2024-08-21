<%-- 
    Document   : ceksesi
    Created on : Aug 21, 2024, 11:27:34 AM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="welcome.jsp"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEK</title>
    </head>
    <body>
        <%
            String nama = session.getAttribute("userName").toString();
            
            if(nama!= null && !nama.trim().isEmpty()){
                out.println("<h2>Ini Profil Anda: " + nama + "</h2>");
            } else {
                out.println("<h2>Ini Bukan Profil Anda. <a href='input.jsp'>Kembali</a></h2>");
            }
            
        %>
        <br>
        <a href="input.jsp">KEMBALI</a>
    </body>
        
</html>
