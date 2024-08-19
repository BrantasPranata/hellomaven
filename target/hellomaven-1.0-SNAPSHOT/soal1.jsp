<%-- 
    Document   : soal1
    Created on : Aug 19, 2024, 2:53:48 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>5x5 Asterisk Grid</title>
</head>
<body>
    
    <%
        // Loop for 5 rows
        for (int i = 0; i < 5; i++) {
            // Loop for 5 columns in each row
            for (int j = 0; j < 5; j++) {
                out.print("*");
            }
            // Move to the next line after each row
            out.println("<br>");
        }
    %>
    
</body>
</html>

