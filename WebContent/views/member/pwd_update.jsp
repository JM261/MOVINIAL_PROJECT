<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String memberId = (String)request.getAttribute("memberId");
%>

<html>

<head>
<meta charset="UTF-8">
<title>[MOVINIAL]아이디 찾기</title>

<style>

	#btn{
     	width:250px;
     	background-color:black;
     	color:white;
     	margin-left:10px;
</style>

</head>
<body>

	 <form name="pwdsearch" method="post">
	 
	 <%@ include file="../common/header.jsp" %>
	 
	  <table width="1330px" height="530px" align="center">
    	<tr>
     	<td>
		      <%
		       if (!(memberId == null || memberId == "")) {
		      %>
      			<table width="550px" align=center border="0" style="color: black; font-size: 30px;">
       				<tr align=center>
        				<td style="height: 170px">* 회원님의 비밀번호가 수정되었습니다! *</td>
       				</tr>
       				
       				<br>
       				
       				<tr>
            			<td><input type="submit" value="로그인 페이지로 이동" id="btn"></td>
       				</tr>
       				
       				<tr align=center>
        			<td style="font-size: 20px"><%=memberId%></td>
       				</tr>
      			</table> 
      		  <% } else {%>
      			<table width="550px" align=center border="0" style="color: black; font-size: 30px;">

		       		<tr align=center>
		       			<div name="loginPage" align=center>
		       				<a href="<%= contextPath %>/login.me">로그인페이지 돌아가기</a>
		       			</div>
		       		
		       		</tr>
		       		<tr align=center>
        				<td style="height: 170px">* 회원님의 비밀번호가 수정되었습니다! *</td>
		       		</tr>
      			</table> 
      
				<% } %>

 	</form>
 
 	       <%@ include file="../common/footer.jsp" %>
 
	 

</body>
</html>