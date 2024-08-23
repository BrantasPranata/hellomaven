<%-- 
    Document   : json_deleteKaryawan
    Created on : Aug 23, 2024, 11:30:12 AM
    Author     : Brantas
--%>

<%@ page contentType="application/json" pageEncoding="UTF-8" %>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

<%
    // Ensure that this service only handles DELETE requests
    if (!"DELETE".equalsIgnoreCase(request.getMethod())) {
        response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        String arr[] = {
            "pesan: ERROR - Only DELETE method is allowed"
        };
        String json = new Gson().toJson(arr);
        response.getWriter().write(json);
        return;
    }

    // Retrieve the ID of the karyawan to be deleted
    String idStr = request.getParameter("id");
    int id = 0;
    boolean validInput = true;

    try {
        id = Integer.parseInt(idStr);
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
        try {
            // Delete the record from the karyawan table
            String sql = "DELETE FROM karyawan WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                String arr[] = {
                    "pesan: SUKSES - Karyawan berhasil dihapus"
                };
                String json = new Gson().toJson(arr);
                response.getWriter().write(json);
            } else {
                String arr[] = {
                    "pesan: ERROR - Gagal menghapus karyawan atau ID tidak ditemukan"
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
