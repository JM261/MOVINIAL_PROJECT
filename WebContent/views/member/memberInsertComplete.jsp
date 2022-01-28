<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[MOVINIAL]회원가입 완료</title>
</head>
<body>

	 <%@ include file="../common/header.jsp" %>


    <form action = "<%= contextPath %>/login.me">
        
        <fieldset>
        <div>
         <legend>Movinial[:near] 회원이 되신 것을 환영합니다.</legend>
            <br>
            <br>
            회원가입 절차가 모두 완료되었습니다.<br>
            로그인 후 모든 기능을 이용할 수 있습니다.
            
           
            <input type="submit" value="로그인 페이지로 이동" id="loginPage">

            


        </div>


    </form>
    
    </fieldset>
        

	    <%@ include file="../common/footer.jsp" %>


</body>
</html>