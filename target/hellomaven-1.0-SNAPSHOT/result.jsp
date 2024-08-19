<%-- 
    Document   : result.jsp
    Created on : Aug 19, 2024, 1:29:33 PM
    Author     : Brantas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<!DOCTYPE html>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
    <title>Word Count Results</title>
</head>
<body>
    <h2>Word Count Results</h2>
    <%
        // Get the user input from the form
        String sentence = request.getParameter("sentence");

        // Convert the input to lower case to make it case-insensitive
        sentence = sentence.toLowerCase();

        // Remove special characters and symbols using regex, only keep words
        String cleanedSentence = sentence.replaceAll("[^a-zA-Z0-9\\s]", "");

        // Split the sentence into words
        String[] words = cleanedSentence.split("\\s+");

        // Create a HashMap to store the word counts
        Map<String, Integer> wordCountMap = new HashMap<>();

        // Iterate through each word and count the occurrences
        for (String word : words) {
            if (!word.isEmpty()) {
                wordCountMap.put(word, wordCountMap.getOrDefault(word, 0) + 1);
            }
        }

        // Convert the map to a list of entries and sort by the count in descending order
        List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(wordCountMap.entrySet());
        Collections.sort(sortedEntries, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> entry1, Map.Entry<String, Integer> entry2) {
                return entry2.getValue().compareTo(entry1.getValue());
            }
        });

        // Display the sorted word count results
        out.println("<table border='1'>");
        out.println("<tr><th>Word</th><th>Count</th></tr>");
        for (Map.Entry<String, Integer> entry : sortedEntries) {
            out.println("<tr><td>" + entry.getKey() + "</td><td>" + entry.getValue() + "</td></tr>");
        }
        out.println("</table>");
    %>
    <br><a href="index.jsp">Go Back</a>
</body>
</html>


