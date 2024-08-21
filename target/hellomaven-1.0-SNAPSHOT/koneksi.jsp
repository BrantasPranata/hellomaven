<%-- 
    Document   : koneksi
    Created on : Aug 20, 2024, 10:10:54?AM
    Author     : Brantas
--%>
<%@page import="java.sql.*"%>



<%
Connection conn = null;
String url = "jdbc:mariadb://localhost:3306/trainingjsp"; // URL Database
String user = "root"; // Username database
String password = ""; // Password database

try {
    // Memuat driver JDBC
    Class.forName("org.mariadb.jdbc.Driver");
    //Class.forName("com.mysql.cj.jdbc.Driver");

    // Membuat koneksi
    conn = DriverManager.getConnection(url, user, password);

   // out.println("Koneksi ke database berhasil!");

} catch (ClassNotFoundException e) {
    out.println("Driver JDBC tidak ditemukan!");
    e.printStackTrace();
} catch (SQLException e) {
    out.println("Koneksi ke database gagal!");
    e.printStackTrace();
} /*finally {
    // Tutup koneksi jika tidak null
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}*/
%>
