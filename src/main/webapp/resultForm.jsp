<%-- 
    Document   : resultForm
    Created on : Aug 20, 2024, 2:17:14 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
    <title>Result</title>
</head>
<body>
<%
    String nama = request.getParameter("nama");
    String negara = request.getParameter("negara");

    // Define the static data
    Map<String, Map<String, String>> dataMap = new HashMap<>();

    List<String> names = Arrays.asList("Andi", "Budi", "Ahmad");
    List<String> countries = Arrays.asList("Jepang", "Amerika", "Australia", "Indonesia");

    // Initialize data for Andi
    Map<String, String> andiMap = new HashMap<>();
    andiMap.put("Jepang", "Andi pergi ke Jepang Maks 5x");
    andiMap.put("Amerika", "Andi pergi ke Amerika Maks 3x");
    andiMap.put("Australia", "Andi pergi ke Australia Maks 2x");
    andiMap.put("Indonesia", "Andi pergi ke Indonesia Maks 1x");
    dataMap.put("Andi", andiMap);

    // Initialize data for Budi
    Map<String, String> budiMap = new HashMap<>();
    budiMap.put("Jepang", "Budi pergi ke Jepang Maks 1x");
    budiMap.put("Amerika", "Budi pergi ke Amerika Maks 5x");
    budiMap.put("Australia", "Budi pergi ke Australia Maks 4x");
    budiMap.put("Indonesia", "Budi pergi ke Indonesia Maks 1x");
    dataMap.put("Budi", budiMap);

    // Initialize data for Ahmad
    Map<String, String> ahmadMap = new HashMap<>();
    ahmadMap.put("Jepang", "Ahmad pergi ke Jepang Maks 2x");
    ahmadMap.put("Amerika", "Ahmad pergi ke Amerika Maks 4x");
    ahmadMap.put("Australia", "Ahmad pergi ke Australia Maks 3x");
    ahmadMap.put("Indonesia", "Ahmad pergi ke Indonesia maks 2x");
    dataMap.put("Ahmad", ahmadMap);

    // Retrieve the result using forEach
    String result = "";
    for (Map.Entry<String, Map<String, String>> entry : dataMap.entrySet()) {
        String keyNama = entry.getKey();
        Map<String, String> countryMap = entry.getValue();

        if (keyNama.equals(nama)) {
            for (Map.Entry<String, String> countryEntry : countryMap.entrySet()) {
                String keyNegara = countryEntry.getKey();
                if (keyNegara.equals(negara)) {
                    result = countryEntry.getValue();
                    break;
                }
            }
        }
    }

    // Display the result
    out.println("<h2>Hasil:</h2>");
    out.println("<p>" + result + "</p>");
%>
</body>
</html>

