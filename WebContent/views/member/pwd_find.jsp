<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[MOVINIAL]비밀번호 찾기</title>

<%
	String errorMsg = (String)request.getAttribute("errorMsg"); // : Object

%>   

</head>
<body>
	 <%@ include file="../common/header.jsp" %>
	<form name="pwfindscreen" action="<%=contextPath%>/pwd_change.me" method="post">
		<table width="1330px"  border="0"  height="430px" align="center">
   			<tr>
    		 <td>
     			<table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    				<tr>
    				 <td>
     					<table width="750px" align="center" border="0" style="background-color:white; margin-top:3%" >
      						<tr>
       						 <td align="center"><img src="../img/miki_icon.png" height="30px"></td>
       						  <td>비밀번호 찾기</td>
       						  <td><div id="sub-title"> |  회원정보에 등록한 정보로 인증.</td>
       						  <td style="width:300px"></td>
      						</tr>
     					</table>
    				</td> 
    			   </tr>       
   			    <tr> 
    		 <td>
   		<table width="600px"  height="300px" align="center" border="0"  style=" background-color:none; border:dotted 5px none;">
    		<tr>
     		 <td>
      		 	<table width="400px"  border="0" style="margin-top:3%">
       			 <tr>
        		  <td>&nbsp;&nbsp;<img src="../img/check.png" height="30px" >
        		  </td>
        		  <td><div id="middle-title">&nbsp;아이디와 핸드폰번호를 입력해주세요.</div>
        		  </td>
       			</tr>
      			</table>
     		  </td>
    		</tr>

    		<tr>
     		<td>
      			<table width="380px" align="center" border="0" style="font-size:19px">
       			 <tr>
        		  <td>아이디</td>
        		  <td><input type="text" name="memberId" required></td>
       			</tr>
       			
       			 <tr>
        		  <td>이름</td>
        		  <td><input type="text" name="memberName" required></td>
       			</tr>
       			
       			<tr>
        		<td>휴대폰</td>
        		<td><select name="phone1">
			        <option value ="010" selected="selected">010</option>
			        <option value ="011">011</option>
			        <option value ="016">016</option>
			        <option value ="017">017</option>
			        </select> -
			        <input type="text" name="phone2" style="width:70px"> -
			        <input type="text" name="phone3" style="width:70px"></td>
			       </tr>
			     </table>
			    </td>
   				</tr>
   
    			<tr>
    			 <td>
      				<table width="150px"  align="center" border="0" style="margin-top:1%">
       				 <tr>
        				<td><input type="submit" id="find" name="enter2" value="찾기" align="center" style="cursor:pointer; border-color:black; background:white; color:black;" onClick="enter()"></td>
       				</tr>
      				</table>
     			</td>
    			</tr>

	  		</table>
	 			  </td>
				    </tr>
			</table>
			</td>
		</table>


	</form>
	
	       <%@ include file="../common/footer.jsp" %>
	


 	<script>
		
 		var msg = "<%= errorMsg %>"; 
				
			if(msg != "null"){ // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
					alert(msg);
			
					<% request.removeAttribute("alertMsg"); %>
					
				}		
 	</script>
</body>
</html>