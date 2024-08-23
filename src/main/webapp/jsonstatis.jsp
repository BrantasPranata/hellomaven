<%-- 
    Document   : json_getKaryawan
    Created on : Aug 23, 2024, 9:19:46?AM
    Author     : Brantas
--%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>

<%
    String arr[][] = {
        {
            "nama: Ari Budiono",
            "umur: 17",
            "kota: Jakarta",
            "negara: Indonesia"
        },
        {
            "nama: Budi Santoso",
            "umur: 25",
            "kota: Bandung",
            "negara: Indonesia"
        },
        {
            "nama: Dave Grohl",
            "umur: 45",
            "kota: San Francisco",
            "negara: Amerika"
        },
        {
            "nama: Sunil Patel",
            "umur: 29",
            "kota: New Delhi",
            "negara: India"
        },
        {
            "nama: Zaheer Amani",
            "umur: 52",
            "kota: Dubai",
            "negara: Qatar"
        }
    };

    // Create a map to store the selected data
    HashMap<String, ArrayList<String>> selectedData = new HashMap<>();

    // Add a maximum of 3 "nama" to the list
    ArrayList<String> namaList = new ArrayList<>();
    for (int i = 0; i < arr.length && i < 3; i++) {
        namaList.add(arr[i][0]);
    }
    selectedData.put("nama", namaList);

    // Add the first "umur" to the list
    ArrayList<String> umurList = new ArrayList<>();
    umurList.add(arr[0][1]);
    selectedData.put("umur", umurList);

    // Add a maximum of 3 "kota" to the list
    ArrayList<String> kotaList = new ArrayList<>();
    for (int i = 0; i < arr.length && i < 3; i++) {
        kotaList.add(arr[i][2]);
    }
    selectedData.put("kota", kotaList);

    // Add the first "negara" to the list
    ArrayList<String> negaraList = new ArrayList<>();
    negaraList.add(arr[0][3]);
    selectedData.put("negara", negaraList);

    // Convert the selected data to JSON
    String json = new Gson().toJson(selectedData);

    // Set response content type to JSON
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // Write JSON to response
    response.getWriter().write(json);
%>

