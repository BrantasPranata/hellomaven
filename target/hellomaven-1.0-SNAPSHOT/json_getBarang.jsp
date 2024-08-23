<%-- 
    Document   : json_getBarang
    Created on : Aug 23, 2024, 9:19:46?AM
    Author     : Brantas
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.google.gson.Gson" %>
<%@ include file="koneksi.jsp" %>

<%  
        // Retrieve form data
        int id = 0; // Change this value to the ID you want to search for
        int global = 1;
            if (request.getParameter("id") != null) {
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                    global = 0;
                } catch (NumberFormatException e) {
                     // Default to 1 or handle as needed
                    global = 1;
                }
            }

        try {
            // Insert into the karyawan table
            ResultSet rs;
            if(global == 1) {
                String sql = "SELECT * FROM barang";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                 rs = pstmt.executeQuery();
            } else {
                String sql = "SELECT * FROM barang WHERE id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                rs = pstmt.executeQuery();
            }
              
            if (!rs.isBeforeFirst()) {
                String arr[] = {
                    "nama: - ",
                    "harga: - ",
                    "deskripsi: - ",
                    "pesan: ERROR 404 - BARANG TIDAK DITEMUKAN "
                };
                
                String json = new Gson().toJson(arr); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            } else {
                if(global == 1){
                        ArrayList<HashMap<String, String>> karyawanList = new ArrayList<>();

        while (rs.next()) {
                    HashMap<String, String> karyawan = new HashMap<>();

                    // Collecting data from the current row
                    String nama = rs.getString("nama");
                    String harga = rs.getString("harga");
                    String deskripsi = rs.getString("deskripsi");

                    // Adding data to the map
                    karyawan.put("nama", nama);
                    karyawan.put("harga", harga);
                    karyawan.put("deskripsi", deskripsi);
                    karyawan.put("pesan", "SUKSES 200 - DATA DITEMUKAN");

                    // Adding the map to the list
                    karyawanList.add(karyawan);
                    }

                    // Convert the list of maps to JSON
                    String json = new Gson().toJson(karyawanList);

                    // Set response content type to JSON
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Write JSON to response
                    response.getWriter().write(json);
                } else {
                    rs.first();
                    //out.println("<p>Login Berhasl Role dari Username " + post_username + " Adalah <strong>" + rs.getString("role") + "</strong> </p>");
                    //out.println("<br>");
                    //out.println("<p><a href='logind2.jsp'>Kembali ke Login</a></p>");
                   
                    String arr[] = {
                        "nama: " + rs.getString("nama"),
                        "harga: " + rs.getString("harga"),
                        "deskripsi: " + rs.getString("deskripsi"),
                        "pesan: SUKSES 200 - DATA DITEMUKAN "
                    };

                    String json = new Gson().toJson(arr); // anyObject = List<Bean>, Map<K, Bean>, Bean, String, etc..
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                
                }
                
                
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
