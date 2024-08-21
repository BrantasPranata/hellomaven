<%-- 
    Document   : viewKaryawan
    Created on : Aug 20, 2024, 11:55:57?AM
    Author     : Brantas
--%>

<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    // Re-establish the connection since it was closed in koneksi.jsp
    conn = DriverManager.getConnection(url, user, password);

    String sql = "SELECT id, first, last, age FROM karyawan";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    if (!rs.isBeforeFirst()) {
        out.println("<p>No data found in the karyawan table.</p>");
    } else {
%>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
            </tr>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("id") %></td>
                <td><%= rs.getString("first") %></td>
                <td><%= rs.getString("last") %></td>
                <td><%= rs.getInt("age") %></td>
            </tr>
<%
        }
%>
        <tr>
            <td colspan="4"> <a href="inputKaryawan.jsp">INPUT DATA</a> </td>
        </tr>
        
        </table>
<%
    }

    // Close resources
    rs.close();
    pstmt.close();
    conn.close();
%>

