<%-- 
    Document   : json_getKaryawan
    Created on : Aug 23, 2024, 9:19:46?AM
    Author     : Brantas
--%>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

<%  
        // Retrieve form data
        int id = 1; // Change this value to the ID you want to search for
            if (request.getParameter("id") != null) {
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    id = 1; // Default to 1 or handle as needed
                }
            }

        try {
            // Insert into the karyawan table
            String sql = "SELECT * FROM karyawan WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
             ResultSet rs = pstmt.executeQuery();
            
             
             
            if (!rs.isBeforeFirst()) {
                String arr[] = {
                    "nama: - ",
                    "umur: - ",
                    "alamat: - ",
                    "kota : - ",
                    "pesan: ERROR - KARYAWAN TIDAK DITEMUKAN "
                };
                
                String json = new Gson().toJson(arr); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            } else {
                rs.first();
                //out.println("<p>Login Berhasl Role dari Username " + post_username + " Adalah <strong>" + rs.getString("role") + "</strong> </p>");
                //out.println("<br>");
                //out.println("<p><a href='logind2.jsp'>Kembali ke Login</a></p>");
                String alamat = rs.getString("alamat");
                 if (alamat == null || alamat.isEmpty()) {
                            alamat = " - ";
                        } else {
                            alamat = alamat;
                        }
                
                
                String arr[] = {
                    "nama: " + rs.getString("first") + " " + rs.getString("last"),
                    "umur: " + rs.getString("age"),
                    "alamat: " + alamat,
                    "kota: Jakarta ",
                    "pesan: SUKSES - DATA DITEMUKAN "
                };
                
                String json = new Gson().toJson(arr); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            }
                

        } catch (SQLException e) {
            out.println("Koneksi ke database gagal! Pesan Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close the connection if not null
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
%>
