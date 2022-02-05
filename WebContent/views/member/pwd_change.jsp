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
        		  <td><div id="middle-title">&nbsp;<b>변경할 비밀번호를 입력하세요.</b><br><br>
        		  비밀번호는 특수기호,영문,숫자를 포함한<br>
        		   최소 8자이상, 최대 16자까지 설정할 수 있습니다.
        		  
        		  </div>
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
        		  <td><input type="password" name="newPwd" id="newPwd" placeholder="기호,영자,숫자 8-16자" required>
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
         				<td><button type="submit" onclick="return validatePwd();" name="enter2" align="center">
         				**새 비밀번호 설정</button> </td>
         				
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
	
	
		
	var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		
		function validatePwd() {
			if ($("input[name='newPwd']").val() != $("input[name='newPwd']").val()) {
				alert("비밀번호가 일치하지 않습니다 \n다시 확인해주세요");
				return false;
			} else{
				if (!regPwd.test($("input[name='newPwd']").val())) {
					alert('형식에 맞지 않는 비밀번호입니다. \n다시 입력해 주세요.');
					return false;
				}
	
				$('#updatePwd').submit();
				return true;
			} 
		}
    
    
	</script>
	
</body>
</html>