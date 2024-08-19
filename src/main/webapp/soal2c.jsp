<%-- 
    Document   : soal3
    Created on : Aug 19, 2024, 2:55:48 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Even Numbers 0-100 (5x10 Format)</title>
</head>
<body>
    <table border="1" cellpadding="5" cellspacing="0">
        <%
             int count = 0; // Counter for columns
                for (int number = 0; number <= 100; number += 2) {
                    if (count % 5 == 0) {
                        // Start a new row every 5 numbers
                        if (count != 0) {
                            out.println("</tr>");
                        }
                        out.println("<tr>");
                    }
                    out.println("<td>" + number + "</td>");
                    count++;
                }
                // Close the last row if it was opened
                if (count % 5 != 0) {
                    out.println("</tr>");
                }
        %>
    </table>
</body>
</html>

