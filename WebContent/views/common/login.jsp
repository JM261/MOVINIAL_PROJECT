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



        * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}




h2 {
  color: tomato;
  font-size: 2em;
  text-align: center;
}

.login_form{
    width: 100%;

}

.login_window{
    width: 100%;
}

.login_id {
  margin-top: 20px;
  margin-left: 10%;
  width: 60%;   
}

.login_id input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_pw {
  margin-top: 20px;
  margin-left: 10%;
  width: 60%;
}

.login_pw input {
  width: 100%;
  height: 50px;
  border-radius: 30px;
  margin-top: 10px;
  padding: 0px 20px;
  border: 1px solid lightgray;
  outline: none;
}

.login_etc {
  padding: 10px;
  width: 60%;
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-weight: bold;
}

.submit {
  margin-top: 50px;
  width: 80%;
}
.submit input {
  width: 75%;
  height: 50px;
  border: 0;
  outline: none;
  border-radius: 40px;
  background: linear-gradient(to left, rgb(255, 77, 46), rgb(255, 155, 47));
  color: white;
  font-size: 1.2em;
  letter-spacing: 2px;
}
    </style>


</head>

<body>
	 <%@ include file="../common/header.jsp" %>


<!--  로그인페이지 매피 views/common/login.jsp -->
	<form action="<%= contextPath %>/login.me" method="post" >
    <div class="wrap">
    	<div class="login_window">
    	    <div class="loginInput">
                <h2>로그인</h2>
	            <div class="login_form">
	            	<div class="login_id">
		            <h4>ID</h4>
		            <input type="text" name="userId"  placeholder="아이디">
	            </div>
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="userPwd"  placeholder="비밀번호">
	            </div>
	            </div>
	            <div class="submit">
	                <input type="submit" value="로그인">
	            </div>
                <div>
                    <input type="checkbox">  로그인 상태 유지하기
                </div>
               <div class="login_etc">
	               <div class="forgot_id">
	                    <a href="<%= contextPath %>/id_find.me">아이디찾기</a>	               		
	               </div>
	               <div class="forgot_pw">
	                	<a href="<%= contextPath %>/pwd_find.me">비밀번호찾기</a>
	               </div>
               </div>
            </div>
        </div>
    </div>
    </form>
    
    
        <%@ include file="../common/footer.jsp" %>
    

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