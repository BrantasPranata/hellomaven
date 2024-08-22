<%-- 
    Document   : temperature_soap
    Created on : Aug 22, 2024, 9:36:08 AM
    Author     : Brantas
--%>

<%@ page import="jakarta.xml.soap.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Temperature Converter</title>
</head>
<body>
    <h1>Celsius to Fahrenheit Converter</h1>
    <form method="post">
        <label for="celsius">Celsius:</label>
        <input type="text" id="celsius" name="celsius">
        <input type="submit" value="Convert">
    </form>

    <%
        String celsius = request.getParameter("celsius");
        if (celsius != null && !celsius.isEmpty()) {
            try {
                SOAPConnectionFactory soapConnFactory = SOAPConnectionFactory.newInstance();
                SOAPConnection soapConnection = soapConnFactory.createConnection();

                MessageFactory messageFactory = MessageFactory.newInstance();
                SOAPMessage soapMessage = messageFactory.createMessage();
                SOAPPart soapPart = soapMessage.getSOAPPart();

                String serverURI = "https://www.w3schools.com/xml/";

                SOAPEnvelope envelope = soapPart.getEnvelope();
                envelope.addNamespaceDeclaration("temp", serverURI);

                SOAPBody soapBody = envelope.getBody();
                SOAPElement soapBodyElem = soapBody.addChildElement("CelsiusToFahrenheit", "temp");
                SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("Celsius", "temp");
                soapBodyElem1.addTextNode(celsius);

                MimeHeaders headers = soapMessage.getMimeHeaders();
                headers.addHeader("SOAPAction", serverURI + "CelsiusToFahrenheit");

                soapMessage.saveChanges();

                SOAPMessage soapResponse = soapConnection.call(soapMessage, serverURI + "tempconvert.asmx");

                SOAPBody responseBody = soapResponse.getSOAPBody();
                SOAPElement responseElement = (SOAPElement) responseBody.getFirstChild();
                String fahrenheit = responseElement.getTextContent();

                out.println("<h2>" + celsius + " Celsius = " + fahrenheit + " Fahrenheit</h2>");

                soapConnection.close();

            } catch (Exception e) {
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }
        }
    %>
</body>
</html>

