<%@page import="java.time.Instant"%>
<%@ page import="java.util.Calendar" %>
<%
    // Determine the current hour of the day
    Calendar calendar = Calendar.getInstance();
    int hour = calendar.get(Calendar.HOUR_OF_DAY);
    var timestamp = Instant.now();
    // Set the appropriate greeting message
    String greeting;
    if (hour >= 1 && hour <= 10) {
        greeting = "Selamat Pagi, Waktu Anda saat ini adalah:" + timestamp;
    } else if (hour >= 10 && hour <= 17) {
        greeting = "Selamat Siang, Waktu Anda saat ini adalah:" + timestamp;
    } else {
        greeting = "Selamat Malam, Waktu Anda saat ini adalah:" + timestamp;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Greeting Page</title>
</head>
<body>
    <h1>HALLO!</h1>
    <form method="post">
        <input type="submit" value="Submit" />
    </form>

    <% if (request.getMethod().equalsIgnoreCase("POST")) { %>
        <h1><%= greeting %></h1>
    <% } %>
</body>
</html>
