<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader" %>
<%@ page import="java.net.HttpURLConnection, java.net.URL" %>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.Document, org.xml.sax.InputSource" %>
<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<html>
<head>
    <title>Input and View Data</title>
</head>
<body>
    <h2>Enter ID to Fetch Data</h2>
    <form action="" method="get">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required>
        <input type="submit" value="Submit">
    </form>

    <%
        // Check if the ID parameter is present
        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            // URL of the web service with ID parameter
            String webServiceURL = "http://localhost:8887/hellomaven/soap_service.jsp?id=" + id; // Replace with your actual web service URL

            // Send HTTP GET request to the web service
            StringBuilder responseBuilder = new StringBuilder();
            HttpURLConnection connection = null;

            try {
                //URL url = new URL(webServiceURL);
                URL urls = new URL(webServiceURL);
                connection = (HttpURLConnection) urls.openConnection();
                connection.setRequestMethod("GET");
                connection.setRequestProperty("Accept", "text/xml");

                // Read the response
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line;
                while ((line = in.readLine()) != null) {
                    responseBuilder.append(line);
                }
                in.close();

                // Convert the response to a string
                String responseXML = responseBuilder.toString();

                // Parse the XML response
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                InputSource is = new InputSource(new StringReader(responseXML));
                Document doc = builder.parse(is);

                // Extract data from the XML response
                String first = doc.getElementsByTagName("first").item(0).getTextContent();
                String last = doc.getElementsByTagName("last").item(0).getTextContent();
                String age = doc.getElementsByTagName("age").item(0).getTextContent();
                String alamat = doc.getElementsByTagName("alamat").item(0).getTextContent();
                String pekerjaan = doc.getElementsByTagName("pekerjaan").item(0).getTextContent();

    %>
                <!-- Display the results -->
                <h2>Web Service Response for ID: <%= id %></h2>
                <p>First Name: <%= first %></p>
                <p>Last Name: <%= last %></p>
                <p>Age: <%= age %></p>
                <p>Address: <%= alamat %></p>
                <p>Job: <%= pekerjaan %></p>
    <%
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (connection != null) {
                    connection.disconnect();
                }
            }
        }
    %>
</body>
</html>
