<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

	<form id="toMainForm" action="<%=contextPath%>/mainpage.mp">
	
	</form>
	 <script>
		var msg = "<%= alertMsg %>"; 
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
			document.getElementById('toMainForm').submit();
		}else if(msg == "null"){
		
		}
   	 </script>
</body>
</html>