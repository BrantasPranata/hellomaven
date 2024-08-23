<%-- 
    Document   : json_updateKaryawan
    Created on : Aug 23, 2024, 11:08:12 AM
    Author     : Brantas
--%>

<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

<%
    // Ensure that this service only handles PUT requests
    if (!"PUT".equalsIgnoreCase(request.getMethod())) {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        String arr[] = {
            "pesan: ERROR - Only PUT method is allowed"
        };
        String json = new Gson().toJson(arr);
        response.getWriter().write(json);
        return;
    }

    // Retrieve form data from the PUT request
    int id = 0;
    String idStr = request.getParameter("id");
    String firstName = request.getParameter("first");
    String lastName = request.getParameter("last");
    String ageStr = request.getParameter("age");
    String alamat = request.getParameter("alamat");
    String pekerjaan = request.getParameter("pekerjaan");

    int age = 0;
    boolean validInput = true;

    // Validate input
    try {
        id = Integer.parseInt(idStr);
    } catch (NumberFormatException e) {
        validInput = false;
    }

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
            // Update data in the karyawan table
            String sql = "UPDATE karyawan SET first = ?, last = ?, age = ?, alamat = ?, pekerjaan = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setInt(3, age);
            pstmt.setString(4, alamat);
            pstmt.setString(5, pekerjaan);
            pstmt.setInt(6, id);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                String arr[] = {
                    "pesan: SUKSES - Karyawan berhasil diperbarui"
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            } else {
                String arr[] = {
                    "pesan: ERROR - Gagal memperbarui karyawan atau ID tidak ditemukan"
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
