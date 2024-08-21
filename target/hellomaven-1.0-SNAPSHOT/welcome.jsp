<%-- 
    Document   : welcome
    Created on : Aug 21, 2024, 9:25:58 AM
    Author     : Brantas
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="welcome.jsp"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <%
            String nama = request.getParameter("nama");
            
            if(nama!= null && !nama.trim().isEmpty()){
                session.setAttribute("userName", nama);
                out.println("<h2>Selamat Datang," + session.getAttribute("userName") + "</h2>");
            } else {
                out.println("<h2>Nama tidak valid. <a href='latinput.jsp'>Kembali</a></h2>");
            }
            
        %>
        <br>
        <a href="">MY PROFILE</a>
        <br>
        <a href="latinput.jsp">LOGOUT</a>
    </body>
        
</html>
