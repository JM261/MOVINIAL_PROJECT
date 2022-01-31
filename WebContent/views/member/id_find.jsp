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
         				<table width="750px" align="center" border=0; style="background-color: #F6F6F6; margin-top: 3%">
							<tr>
								<td align="center"></td>
								<td><h2>아이디 찾기</h2></td>
								
								<td width="300px"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
        			<td>
         				<table width="Auto" align="center" border=0; style="background-color: #F6F6F6; margin-top: 3%">
							<tr>
							
								<td><div id="sub-title">| 회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호 같아야 합니다.</div></td>
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
										
								</td>
							</tr>
							 <tr>
								<td>
									<table width="380px" height="70px" align="center" border="0" style="font-size: 16px;">
										<tr>
											<td>이름</td>
											<td><input type="text" name="memberName" id= "memberId" required></td>
										</tr>
										<br>
										<tr>
											<td>휴대폰</td>
											<td><select name="phone1">
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
												</select> - <input type="text" name="phone2" style="width: 70px" required>
														- <input type="text" name="phone3" style="width: 70px" required></td>
										</tr>
									</table>
								</td>
							 </tr>
							<tr>
								<td>
									<table width="140px" height="10px" border="0" style="margin-top: 2%;" align="center">
										<tr>
											<td><input type="submit" id="find" name="find" value="찾기" align="center"  style="cursor: pointer; background: white; color: black; border-color: black;"></td>
										</tr>
									</table>
									</form>
								</td>
							</tr>
      					</table>
   	 			 </table>
          </table>
          <br>
   
       <%@ include file="../common/footer.jsp" %>
   
 <script>
	$(function(){
		
		
		<%-- $('#find').click(function(){
			id_search1();
		})
		
	
			 function goidfind() {
			  var frm = document.idfindscreen;
			  frm.method = "post";
			  frm.action = "<%=contextPath%>/Fine_id_Phone.me";
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
			 
			 
			 function checkid() {

				  var frm = document.idfindscreen;

				  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';

				  if (!regExp.test(frm.email.value)) {

				   alert('올바른 email을 입력해주세요.');

				   frm.email.focus();

				  }

				 }

			

			  --%>
			 
		
	
	




</script>
</body>
</html>