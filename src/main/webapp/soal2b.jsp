<%-- 
    Document   : soal2b
    Created on : Aug 19, 2024, 2:56:58 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Odd Numbers 1-99</title>
</head>
<body>
    <p>
        <%
            for (int number = 1; number < 100; number += 2) {
                if (number < 99) {
                    out.print(number + ", "); // Add a comma and space after each number except the last one
                } else {
                    out.print(number); // No comma after the last number
                }
            }
        %>
    </p>
</body>
</html>

