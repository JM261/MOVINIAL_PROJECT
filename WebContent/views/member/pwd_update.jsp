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
       					<td><button onclick="<%=contextPath%>/views/common/login.jsp"> 로그인페이지로 돌아가기 </button></td>
       				</tr>
       				
       				<tr align=center>
        			<td style="font-size: 20px"><%=memberId%></td>
       				</tr>
      			</table> 
      		  <% } else {%>
      			<table width="550px" align=center border="0" style="color: black; font-size: 30px;">
		       		<tr align=center>
		        		<td style="height: 170px">* 잘못된 회원정보를 입력하셨습니다. *</td>
		       		</tr>
		       		
		       		<tr align=center>
		        		<td><input type="button" value="돌아가기" onClick="history.back()"></td>
		       		</tr>
      			</table> 
      
				<% } %>

 	</form>
 
 	       <%@ include file="../common/footer.jsp" %>
 
	 

</body>
</html>