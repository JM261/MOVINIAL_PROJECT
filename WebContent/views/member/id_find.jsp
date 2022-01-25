<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>[MOVINIAL]아이디 찾기</title>
</head>
<body>
	 <%@ include file="../common/header.jsp" %>
	<table width="1330px" height="430px" align="center">
		<tr>
			<td>
			<table width="600px" align="center" border="0" style="color: black; background-color: #F6F6F6; font-size: 20px;">
				<tr>
        			<td>
         				<table width="750px" align="center" border=0; style="background-color: white; margin-top: 3%">
							<tr>
								<td align="center"></td>
								<td>아이디 찾기</td>
								<td><div id="sub-title">| 회원정보에 등록한 정보로 인증.</td>
								<td width="300px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="800px" height="300px" align="center" style="border: dotted 5px none; margin-top: 4%">
							<tr>
								<td>
									<form action="<%=contextPath %>/Fine_id_Phone.me" method="post">
									<table width="300px" height="30px" border="0" style="margin-top: 5%; color: black; font-size: 18px;">
										<tr>
											<td>&nbsp;&nbsp; <img src="../img/check.png" height="30px"></td>
											<td>&nbsp;이름,핸드폰번호로 찾기</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table width="380px" height="70px" align="center" border="0" style="font-size: 16px;">
										<tr>
											<td>이름</td>
											<td><input type="text" name="memberName"></td>
										</tr>
										<tr>
											<td>휴대폰</td>
											<td><select name="phone1">
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
												</select> - <input type="text" name="phone2" style="width: 70px">
														- <input type="text" name="phone3" style="width: 70px"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table width="140px" height="10px" border="0" style="margin-top: 2%;" align="center">
										<tr>
											<td><input type="submit" id="find" name="find" value="찾기" align="center"  style="cursor: pointer; background: white; color: black; border-color: black;"></td>
											<td><input type="button" name="cancle1" value="  취소  " align="center" style="cursor: pointer; background: white; color: black; border-color: black;"></td>
										</tr>
									</table>
									</form>
								</td>
							</tr>

          <tr>
           <td>
            <table width="300px" height="20px" border="0"
             style="margin-top: 3%; font-size: 18px;">
             <br>
             <br>
             <tr>
              <td>&nbsp;&nbsp; <img src="../img/check.png"
               height="30px">
              </td>
              <td>&nbsp;이름,이메일로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>

          <td>
          <form action="" method="post">
           <table width="380px" height="70px" align="center" border="0" style="font-size: 16px;">
            <tr>
             <td>이름</td>
             <td><input type="text" name="memberName"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="email"
              style="width: 80px" onblur="checkid()"> @ <input
              type="text" name="e_domain" style="width: 80px"> <select
              name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
           </table>
          </td>
          </tr>

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" id="find_email" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search2()"></td>
              <td><input type="button" name="cancle2"
               value="  취소  " align="center"
               style="cursor: pointer; background: white; color: black; border-color: black"
               onClick="cancle()"></td>
             </tr>
            </table>
            </form>
            <br>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
   
       <%@ include file="../common/footer.jsp" %>
   
 <script>
	$(function(){
		
		
		<%-- $('#find').click(function(){
			id_search1();
		})
		
		
		
		
		
		
		function gohome() {
			 var frm = document.idfindscreen;
			 frm.method = "post";
			 frm.action = "../mainPage.jsp"; //넘어간화면
			 frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
			}
			

			function gojoin() {
			 var frm = document.idfindscreen;
			  frm.method = "post";
			  frm.action = "../memberEnrollForm.jsp"; //넘어간화면
			  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
			 }
			

			 function gologin() {
			  var frm = document.idfindscreen;
			  frm.method = "post";
			  frm.action = "./login.jsp";
			  frm.submit();
			 }
			 

			 function goidfind() {
			  var frm = document.idfindscreen;
			  frm.method = "post";
			  frm.action = "<%=contextPath%>/Fine_id_Phone.me";
			  frm.submit();
			 }
			 

			 function gopwfind() {
			  var frm = document.idfindscreen;
			  frm.method = "post";
			  frm.action = "./pw_find.jsp";
			  frm.submit();
			 }
			 

			
			 
			 function id_search1() { //이름,핸드폰으로 '찾기' 버튼

				  var frm = document.idfindscreen;

				  if (frm.name.value.length < 1) {
				   alert("이름을 입력해주세요");
				   return;
				  }

				  if (frm.phone1.value.length<2 || frm.phone1.value.length>4) {
				   alert("핸드폰번호를 정확하게 입력해주세요");
				   return;
				  }
				  if (frm.phone2.value.length<2 || frm.phone2.value.length>4) {
				   alert("핸드폰번호를 정확하게 입력해주세요");
				   return;
				  }

				  frm.method = "post";
				  frm.action = "<%=contextPath%>/id_search.jsp"; //넘어간화면
				  frm.submit();  }
			 
			 function id_search2() { //이름,이메일로 '찾기' 버튼

				  var frm = document.idfindscreen;

				  if (frm.name2.value.length < 1) {
				   alert("이름을 입력해주세요");
				   return;
				  }
				  if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
				   alert("이메일을 입력해주세요");
				   return;
				  }

				  frm.method = "post";
				  frm.action = "./id_search2.jsp"; //넘어간화면
				  frm.submit();  }
			 
			 function checkid() {

				  var frm = document.idfindscreen;

				  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';

				  if (!regExp.test(frm.email.value)) {

				   alert('올바른 email을 입력해주세요.');

				   frm.email.focus();

				  }

				 }

				 function domainCheck() {

				  var frm = document.idfindscreen;

				  if (frm.domain.value == 0) {
				   frm.e_domain.value = "";
				   frm.e_domain.disabled = false;

				  } else {
				   frm.e_domain.value = frm.domain.value;
				   frm.e_domain.disabled = true;

				  }

				 }

			  --%>
			 
		
		
	})
	




</script>
</body>
</html>