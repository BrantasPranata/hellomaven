<%-- 
    Document   : json_insertKaryawan
    Created on : Aug 23, 2024, 10:08:12 AM
    Author     : Brantas
--%>

<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

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
    String firstName = request.getParameter("first");
    String lastName = request.getParameter("last");
    String ageStr = request.getParameter("age");
    String alamat = request.getParameter("alamat");
    String pekerjaan = request.getParameter("pekerjaan");

    int age = 0;
    boolean validInput = true;

    // Validate input
    if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty()) {
        validInput = false;
    }

    try {
        age = Integer.parseInt(ageStr);
    } catch (NumberFormatException e) {
        validInput = false;
    }

    if (alamat == null || alamat.isEmpty()) {
        alamat = " - ";
    }

    if (pekerjaan == null || pekerjaan.isEmpty()) {
        pekerjaan = " - ";
    }

    if (!validInput) {
        String arr[] = {
            "pesan: ERROR - Invalid input data"
        };
        String json = new Gson().toJson(arr);
        response.getWriter().write(json);
    } else {
        try {
            // Insert data into the karyawan table
            String sql = "INSERT INTO karyawan (first, last, age, alamat, pekerjaan) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setInt(3, age);
            pstmt.setString(4, alamat);
            pstmt.setString(5, pekerjaan);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                String arr[] = {
                    "pesan: SUKSES - Karyawan berhasil ditambahkan"
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            } else {
                String arr[] = {
                    "pesan: ERROR - Gagal menambahkan karyawan"
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            }

        } catch (SQLException e) {
            String arr[] = {
                "pesan: ERROR - Koneksi ke database gagal! Pesan Error: " + e.getMessage()
            };
            String json = new Gson().toJson(arr);
            response.getWriter().write(json);
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

