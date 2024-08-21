<%-- 
    Document   : tampild2
    Created on : Aug 21, 2024, 1:54:06?PM
    Author     : Brantas
--%>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

<%  
    // Check if the form has been submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form data
        String post_username = request.getParameter("username");
        String post_password = request.getParameter("password");

        try {
            // Insert into the karyawan table
            String sql = "SELECT * FROM username WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, post_username);
            pstmt.setString(2, post_password);
             ResultSet rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p>Username atau Password Salah!.</p>");
            } else {
                rs.first();
                //out.println("<p>Login Berhasl Role dari Username " + post_username + " Adalah <strong>" + rs.getString("role") + "</strong> </p>");
                //out.println("<br>");
                //out.println("<p><a href='logind2.jsp'>Kembali ke Login</a></p>");
                
                String arr[] = {
                    "username: " + rs.getString("username"),
                    "role: " + rs.getString("role"),
                    "pesan: Anda adalah " + rs.getString("role")
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
    }
%>
