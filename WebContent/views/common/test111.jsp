<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject" %>
<%
	JSONObject json = (JSONObject)request.getAttribute("json");

	String overview = (String)json.get("overview");



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%= overview %>

</body>
</html>