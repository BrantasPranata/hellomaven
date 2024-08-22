<%@ page contentType="text/xml;charset=UTF-8" %>
<%@ include file="koneksi.jsp" %>

<%
    // Static SOAP XML response
    String responseXML = "\n" +
        "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n" +
        "  <soap:Body>\n" +
        "    <GetUserInfoResponse xmlns=\"http://example.com/\">\n" +
        "      <id>1</id>\n" +
        "      <age>30</age>\n" +
        "      <first>John</first>\n" +
        "      <last>Doe</last>\n" +
        "      <alamat>123 Main Street</alamat>\n" +
        "      <pekerjaan>Software Engineer</pekerjaan>\n" +
        "    </GetUserInfoResponse>\n" +
        "  </soap:Body>\n" +
        "</soap:Envelope>";

    // Output the SOAP response
    out.print(responseXML);
%>
