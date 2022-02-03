<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVINIAL</title>
<style>
	#content1 {
		width: 1805px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
    }
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div id="content1">
		
		<br><br><br><br><br><br><br>
	
		<h1>페이지를 찾을 수 없습니다</h1>
		<h1>5초 후 메인 페이지로 돌아갑니다</h1>
		
	</div>
	
	<script>
		$(function() {
			window.setTimeout(function() {
				location.replace("<%= contextPath %>");
			}, 5000);
		})
	</script>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>