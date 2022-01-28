<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movie test page</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<a href="<%= contextPath %>/detail.mo?movieNo=1">MORE</a>
	<a href="<%= contextPath %>/movie.test">MORE</a>
	

	
	
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>