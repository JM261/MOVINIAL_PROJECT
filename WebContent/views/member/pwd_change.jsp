<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Member m = (Member)request.getAttribute("memberInfo"); // : Object
	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : manubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[MOVINIAL]비밀번호 찾기</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>
<body>
	 <%@ include file="../common/header.jsp" %>
	<form name="pwfindscreen" id="updatePwd"  action="<%=contextPath %>/updateNewPwd.me" method="post">
		<table width="1330px"  border="0"  height="430px" align="center"   >
   			<tr>
    		 <td>
     			<table width="450px" align="center"  border="0" style="color:black; background-color: #F6F6F6; font-size:20px; ">
    				<tr>
    				 <td>
     					<table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      						<tr>
       						  <td>비밀번호 찾기</td>
       						  <td><div id="sub-title"> |  회원정보가 확인되었습니다</td>
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
        		  </td>
        		  <td><div id="middle-title">&nbsp;변경할 비밀번호를 입력하세요.</div>
        		  </td>
       			</tr>
      			</table>
     		  </td>
    		</tr>

    		<tr>
     		<td>
      			<table width="380px" align="center" border="0" style="font-size:19px">
       			 <tr>
        		  <td>수정할 비밀번호</td>
        		  <td><input type="password" name="newPwd" id="newPwd" required>
        		      <input type="hidden" name="memberId"   value="<%= m.getMemberId() %>" >
        		  	  <input type="hidden" name="memberNo"  value="<%= m.getMemberNo() %>">
       			</td>
       			</tr>
       			
			     </table>
			    
			</td>
			
			<td>
			
			</td>
   			</tr>
   
    			<tr>
    			<td>
      				<table width="150px"  align="center" border="0" style="margin-top:1%">
       				 <tr>
        				<td><input type="submit" name="enter2" value="  새로운 비밀번호 설정하기  " align="center" style="cursor:pointer; border-color:black; background:white; color:black;" >
         				</td>
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
	
</body>
</html>