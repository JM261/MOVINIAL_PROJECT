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

	 <form name="idsearch" method="post">
	 
	 <%@ include file="../common/header.jsp" %>
	 
	  <table width="1330px" height="530px" align="center">
    <tr>
     <td>
      <%
       if (!(memberId == null || memberId == "")) {
      %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
       </tr>
       <tr align=center>
        <td style="font-size: 20px"><%=memberId%> <br><br><br><br><br>
        
                <input type="submit" value="로그인 페이지로 이동" id="btn">
        </td>
       </tr>
      </table> <%
  } else {
 %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 아이디 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table> 
      
<% } %>

 </form>
	 

</body>
</html>