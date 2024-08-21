<%-- 
    Document   : profile
    Created on : Aug 21, 2024, 9:49:13 AM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <h1>User Profile</h1>
        <%
            if(session != null){
                String nama = session.getAttribute("userName").toString();
                
                if(nama != null){
                    out.println("<p>Nama Anda: " + nama + " </p>");
                } else {
                    out.println("<p>Nama tidak ditemukan dalam session</p>");
                }
                
            } else {
                out.println("<p>Session not found!</p>");
            }
        %>
        <a href="welcome.jsp">Back to Welcome Page</a>
    </body>
</html>
