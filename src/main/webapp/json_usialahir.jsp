<%-- 
    Document   : json_usialahir
    Created on : Aug 23, 2024, 2:04:47 PM
    Author     : Brantas
--%>

<%@page import="java.time.LocalDate"%>
<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>

<%
    // Ensure that this service only handles POST requests
    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        String arr[] = {
            "pesan: ERROR - Only POST method is allowed"
        };
        String json = new Gson().toJson(arr);
        response.getWriter().write(json);
        return;
    }

    // Retrieve form data from the POST request
    String firstName = request.getParameter("nama");
    String yearStr = request.getParameter("tahun");
    int currentYear = LocalDate.now().getYear();
    int year = 0;
    int age = 0; 
    boolean validInput = true;

    // Validate input
    if (firstName == null || firstName.isEmpty()) {
        validInput = false;
    }

    try {
        year = Integer.parseInt(yearStr);
    } catch (NumberFormatException e) {
        validInput = false;
    }

    if (!validInput) {
        String arr[] = {
            "pesan: ERROR - Invalid input data"
        };
        String json = new Gson().toJson(arr);
        response.getWriter().write(json);
    } else {
       
            // Insert data into the karyawan table
            age = currentYear - year;

            if (year < currentYear) {
                String arr[] = {
                    "nama: "+ firstName,
                    "umur: "+ age
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            } else {
                String arr[] = {
                    "nama: "+ firstName,
                    "umur: Kurang dari 1 Tahun atau 0 Tahun (Mungkin minus)"
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            }

   }
%>


