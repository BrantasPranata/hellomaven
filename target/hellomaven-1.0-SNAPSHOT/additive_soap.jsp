<%-- 
    Document   : additive_soap
    Created on : Aug 22, 2024, 11:01:34 AM
    Author     : Brantas
--%>

<%@ page import="jakarta.xml.soap.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Two Integers</title>
</head>
<body>
    <h1>Add Two Integers</h1>
    <form method="post">
        <label for="intA">Integer A:</label>
        <input type="text" id="intA" name="intA">
        <label for="intB">Integer B:</label>
        <input type="text" id="intB" name="intB">
        <input type="submit" value="Add">
    </form>

    <%
        String intA = request.getParameter("intA");
        String intB = request.getParameter("intB");
        if (intA != null && intB != null && !intA.isEmpty() && !intB.isEmpty()) {
            try {
                // Create a SOAP connection
                SOAPConnectionFactory soapConnFactory = SOAPConnectionFactory.newInstance();
                SOAPConnection soapConnection = soapConnFactory.createConnection();

                // Create the SOAP message
                MessageFactory messageFactory = MessageFactory.newInstance();
                SOAPMessage soapMessage = messageFactory.createMessage();
                SOAPPart soapPart = soapMessage.getSOAPPart();

                // Define the server URI
                String serverURI = "http://tempuri.org/";

                // Construct the SOAP envelope
                SOAPEnvelope envelope = soapPart.getEnvelope();
                envelope.addNamespaceDeclaration("tem", serverURI);

                // Construct the SOAP body
                SOAPBody soapBody = envelope.getBody();
                SOAPElement soapBodyElem = soapBody.addChildElement("Add", "tem");
                SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("intA", "tem");
                soapBodyElem1.addTextNode(intA);
                SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("intB", "tem");
                soapBodyElem2.addTextNode(intB);

                // Add SOAPAction header
                MimeHeaders headers = soapMessage.getMimeHeaders();
                headers.addHeader("SOAPAction", "http://tempuri.org/Add");

                soapMessage.saveChanges();

                // Send the SOAP message to the server and get the response
                SOAPMessage soapResponse = soapConnection.call(soapMessage, "http://www.dneonline.com/calculator.asmx");

                // Print the entire response for debugging
                ByteArrayOutputStream outx = new ByteArrayOutputStream();
                soapResponse.writeTo(outx);
                String responseString = new String(outx.toByteArray(), "UTF-8");
                outx.close();

                // Display the full SOAP response (for debugging)
                out.println("<h2>Full Response: </h2>");
                out.println("<pre>" + responseString + "</pre>");

                // Parse the response to extract the result
                SOAPBody responseBody = soapResponse.getSOAPBody();
                if (responseBody.hasFault()) {
                    SOAPFault fault = responseBody.getFault();
                    out.println("<h2>SOAP Fault: " + fault.getFaultString() + "</h2>");
                } else {
                    SOAPElement responseElement = (SOAPElement) responseBody.getFirstChild();
                    SOAPElement resultElement = (SOAPElement) responseElement.getFirstChild();
                    String result = resultElement.getTextContent();
                    out.println("<h2>Result: " + result + "</h2>");
                }

                // Close the SOAP connection
                soapConnection.close();

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h2>Error: " + e.getMessage() + "</h2>");
            }
        }
    %>
</body>
</html>



