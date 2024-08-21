<%-- 
    Document   : input
    Created on : Aug 21, 2024, 10:08:01?AM
    Author     : Brantas
--%>

<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    // Check if the form has been submitted
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form data
        String id = request.getParameter("id");
        String nama = request.getParameter("nama");
        String age = request.getParameter("age");
        String alamat = request.getParameter("alamat");
        String pekerjaan = request.getParameter("pekerjaan");

        // Split nama into first and last
        String first = "";
        String last = "";

        String[] namaParts = nama.trim().split("\\s+");

        if (namaParts.length > 1) {
            first = namaParts[0];
            last = String.join(" ", java.util.Arrays.copyOfRange(namaParts, 1, namaParts.length));
        } else {
            first = namaParts[0];
            last = "";
        }

        try {
            // Insert into the karyawan table
            String sql = "INSERT INTO karyawan (id, age, first, last, alamat, pekerjaan) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            pstmt.setInt(2, Integer.parseInt(age));
            pstmt.setString(3, first);
            pstmt.setString(4, last);
            pstmt.setString(5, alamat);
            pstmt.setString(6, pekerjaan);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                session.setAttribute("userName", nama);
                out.println("<p>Data berhasil disimpan! Lihat Rekap Data <a href='view.jsp'>Disini</a></p>");
            } else {
                out.println("<p>Gagal menyimpan data.</p>");
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

<form action="input.jsp" method="post">
    ID: <input type="number" name="id" required><br><br>
    Nama: <input type="text" name="nama" required><br><br>
    Age: <input type="number" name="age" required><br><br>
    Alamat: <input type="text" name="alamat" required><br><br>
    Pekerjaan: <input type="text" name="pekerjaan" required><br><br>
    <input type="submit" value="Save"><br>
    <a href="ceksesi.jsp"><button type="button" name="cek">Cek Sesi</button></a>
</form>
