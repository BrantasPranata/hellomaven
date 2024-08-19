<%-- 
    Document   : soalumur
    Created on : Aug 19, 2024, 3:22:51 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Age Difference Calculation</title>
</head>
<body>
    <h2>Age Difference Calculation</h2>
    <%
        // Given ages
        int budiAge = 10;
        int andiAge = 11;
        int indahAge = 20;
        int irwanAge = 25;

        // Calculate possible age for Ani
        // Ani is younger than Indah and older than Andi
        int aniMinAge = andiAge + 1;
        int aniMaxAge = indahAge - 1;

        // Print possible ages for Ani and their differences with Budi
        out.println("Possible ages for Ani: ");
        out.println("<br>");
        for (int aniAge = aniMinAge; aniAge <= aniMaxAge; aniAge++) {
            int ageDifference = aniAge - budiAge;
            out.println("If Ani is " + aniAge + " years old, the age difference with Budi is: " + ageDifference + " years.");
            out.println("<br>");
        }
    %>
</body>
</html>

