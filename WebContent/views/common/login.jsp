<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.movinial.member.model.vo.Member" %>
    
<%

	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : manubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음

	//String alertMsg = (String)session.getAttribute("alertMsg"); // : Object
	String errorMsg = (String)request.getAttribute("errorMsg"); // : Object
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지문구
	
%>    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>

    <style>
    

     #loginId, #loginPwd{
     	width: 250px;
     	border-left:none;
     	border-right:none;
     	border-top:none;
     	line-height:25px;
     	margin-left:10px;
     	font-style:i;
     	input:focus{outline:none;}

     }
     
  	 input:focus{
   		outline:none;
   	}
     
     #login_btn{
     	width:250px;
     	background-color:black;
     	color:white;
     	margin-left:10px;
    </style>


</head>

<body>
	 <%@ include file="../common/header.jsp" %>

   		 <div class="modal-dialog modal-sm">
      	 <div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOVINIAL[:near]</h4>
	          <br><br>
            </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	 <form action="<%= contextPath %>/login.me" method="post" >
          	 	<table>
          	 		<tr>
          				<td><B>아이디&nbsp;&nbsp;&nbsp;&nbsp;</B><input type="text" name="userId" id="loginId" required></td>
          			</tr>
								<tr>  					
          				<td><B>비밀번호&nbsp;</B><input type="password" name="userPwd" id="loginPwd" required></td>
          			</tr>          			
          		</table>
          		<br> 
         	 <button type="submit" class="btn btn-secondary" id="login_btn">로그인</button> 
         	 <button type="button" class="btn btn-secondary" id="login_btn" onclick="location.href='<%= contextPath %>/id_find.me'">아이디 찾기</button> 
         	 <button type="button" class="btn btn-secondary" id="login_btn" onclick="location.href='<%= contextPath %>/pwd_find.me'">비밀번호 찾기</button> 
        	</form>
        </div>

      </div>
    </div>


 	
        <%@ include file="../common/footer.jsp" %>
          </div>
        
    </div>

<script>
		
		// script태그 내에서도 스크립틀릿과 같은 jsp요소를 쓸 수 있다.
	
		var msg = "<%= errorMsg %>"; 
		// "메시지 문구" / "null"
		
		if(msg != "null"){ // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
			alert(msg);
		
			// menubar.jsp가 로딩 될때마다 매 번 alert가 떠버림
			// session에 들어있는 alertMsg키값에 대한 밸류를 지워주면됨
			// => XX.removeAttribute("키값")
			<% request.removeAttribute("alertMsg"); %>
			
		}
	</script>

</body>
</html>