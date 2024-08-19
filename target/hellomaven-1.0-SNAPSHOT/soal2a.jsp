<%-- 
    Document   : soal2a
    Created on : Aug 19, 2024, 2:56:50 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Even Numbers 0-100</title>
</head>
<body>
    <p>
        <%
            for (int number = 0; number <= 100; number += 2) {
                if (number < 100) {
                    out.print(number + ", "); // Add a comma and space after each number except the last one
                } else {
                    out.print(number); // No comma after the last number
                }
            }
        %>
    </p>
</body>
</html>

