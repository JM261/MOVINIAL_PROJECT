<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[MOVINIAL]회원가입 완료</title>

<style>
	.content {
	
	width: auto
	height: 100px;
	text-align: center;
	
	}
	
	#btn{
     	width:250px;
     	background-color:black;
     	color:white;
     	margin-left:10px;

</style>


</head>
<body>

	 <%@ include file="../common/header.jsp" %>

     <br><br><br><br>


    <form action = "<%= contextPath %>/login.me">
        
        <fieldset>
        <div class="content">
         <h1>Movinial[:near] 회원이 되신 것을 환영합니다.</h1>
            <br>
            <br>
            	<h3>회원가입 절차가 모두 완료되었습니다.<br>
            		로그인 후 모든 기능을 이용할 수 있습니다.<br></h3>
            
           
            <input type="submit" value="로그인 페이지로 이동" id="btn">

            


        </div>


    </form>

    <br><br><br><br>
    
    </fieldset>
        

	    <%@ include file="../common/footer.jsp" %>


</body>
</html>