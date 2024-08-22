<%@ page contentType="text/xml;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    // Initialize variables
    int id = 1; // Change this value to the ID you want to search for
    if (request.getParameter("id") != null) {
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 1; // Default to 1 or handle as needed
        }
    }

    // Re-establish the connection since it was closed in koneksi.jsp
    conn = DriverManager.getConnection(url, user, password);

    // Prepare the query to fetch a single record based on ID
    String sql = "SELECT * FROM karyawan WHERE id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, id);
    ResultSet rs = pstmt.executeQuery();

    // Start XML document
    StringBuilder xmlResponse = new StringBuilder();
    xmlResponse.append("\n");
    xmlResponse.append("<karyawanData>\n");

    if (!rs.isBeforeFirst()) {
        xmlResponse.append("  <message>No data found for ID: ").append(id).append("</message>\n");
    } else {
        if (rs.next()) {
            String first = rs.getString("first");
            String last = rs.getString("last");
            String age = rs.getString("age");
            String alamat = rs.getString("alamat");
            String pekerjaan = rs.getString("pekerjaan");

            xmlResponse.append("  <karyawan>\n");
            xmlResponse.append("    <id>").append(id).append("</id>\n");
            xmlResponse.append("    <first>").append(first != null ? first : "N/A").append("</first>\n");
            xmlResponse.append("    <last>").append(last != null ? last : "N/A").append("</last>\n");
            xmlResponse.append("    <age>").append(age != null ? age : "N/A").append("</age>\n");
            xmlResponse.append("    <alamat>").append(alamat != null && !alamat.isEmpty() ? alamat : " - ").append("</alamat>\n");
            xmlResponse.append("    <pekerjaan>").append(pekerjaan != null && !pekerjaan.isEmpty() ? pekerjaan : " - ").append("</pekerjaan>\n");
            xmlResponse.append("  </karyawan>\n");
        }
    }

    xmlResponse.append("</karyawanData>");

    // Output the XML response
    out.print(xmlResponse.toString());

    // Close resources
    rs.close();
    pstmt.close();
    conn.close();
%>
