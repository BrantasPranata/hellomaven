<%@ page contentType="text/xml;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
    // Re-establish the connection since it was closed in koneksi.jsp
    conn = DriverManager.getConnection(url, user, password);

    String sql = "SELECT * FROM karyawan";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    // Start XML document
    StringBuilder xmlResponse = new StringBuilder();
    xmlResponse.append("\n");
    xmlResponse.append("<karyawanData>\n");

    if (!rs.isBeforeFirst()) {
        xmlResponse.append("  <message>No data found in the karyawan table.</message>\n");
    } else {
        while (rs.next()) {
            String id = rs.getString("id");
            String first = rs.getString("first");
            String last = rs.getString("last");
            String age = rs.getString("age");
            String alamat = rs.getString("alamat");
            String pekerjaan = rs.getString("pekerjaan");

            xmlResponse.append("  <karyawan>\n");
            xmlResponse.append("    <id>").append(id != null ? id : "N/A").append("</id>\n");
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
