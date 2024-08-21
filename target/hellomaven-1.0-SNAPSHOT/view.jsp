<%-- 
    Document   : view
    Created on : Aug 21, 2024, 10:49:27?AM
    Author     : Brantas
--%>

<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    // Re-establish the connection since it was closed in koneksi.jsp
    conn = DriverManager.getConnection(url, user, password);

    String sql = "SELECT * FROM karyawan";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    if (!rs.isBeforeFirst()) {
        out.println("<p>No data found in the karyawan table.</p>");
    } else {
%>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nama Depan</th>
                <th>Nama Belakang</th>
                <th>Umur</th>
                <th>Alamat</th>
                <th>Pekerjaan</th>
            </tr>
<%
        while (rs.next()) {
        
            String alamat = rs.getString("alamat");
            String pekerjaan = rs.getString("pekerjaan");
%>
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("first") %></td>
                <td><%= rs.getString("last") %></td>
                <td><%= rs.getInt("age") %></td>
                <td><% 
                        if (alamat == null || alamat.isEmpty()) {
                            out.println(" - ");
                        } else {
                            out.println(alamat);
                        }
                         %></td>
                <td><% 
                        if (pekerjaan == null || pekerjaan.isEmpty()) {
                            out.println(" - ");
                        } else {
                            out.println(pekerjaan);
                        }
                         %></td>
            </tr>
<%
        }
%>
        <tr>
            <td colspan="4"> <a href="input.jsp">INPUT DATA</a> </td>
        </tr>
        
        </table>
<%
    }

    // Close resources
    rs.close();
    pstmt.close();
    conn.close();
%>


