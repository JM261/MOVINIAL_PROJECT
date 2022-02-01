 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- 버튼 부트스트랩 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>내정보 관리</title>
	
	<style>
	
	.updateForm{
		text-align:center;
		height: 880px;
		margin: 0 auto;
		margin-top:50px;
		font-size:20px;
	
	}
	
	#memberUpdateForm{
		width:100%;
		
	}

	#telSection2{
		width:450px;
		border-left:none;
		border-right:none;
		border-top:none;
		margin-left:20px;
	}
	
	.updateMemBtn{
		width:50%;
		background-color:black;
		color:white;
	}
	
	.inputUpdateMem{
		width:600px;
		border-left:none;
		border-right:none;
		border-top:none;
		line-height:40px;
	}
	
	.selectMA{
		width:120px;
		height:37px;
		border-left:none;
		border-right:none;
		border-top:none;
	}

	#chkNickname{
	
	width:800px;

	}
	
	.prefergenreMV{
		line-height:30px;
		border: 1px solid lightgray;
		width: 690px;
		text-align:center;
		margin: 0 auto;
	}

	</style>

</head>
<body>

	<%@ include file="../../views/common/headerSidebar.jsp" %>
  	<%
  	
	//필수입력사항
  	String memberId = loginUser.getMemberId();
	String memberName = loginUser.getMemberName();
	String memberNickname = loginUser.getMemberNickname();
	String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
	
	//선택입력사항
	String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
	String preferGenre = (loginUser.getPreferGenre() == null) ? "" : loginUser.getPreferGenre();

	%>
	
	<div class="dt-content">
		<h2>회원 정보 수정</h2><br>
		<hr>
		<div class="updateForm">
			<form id="memberUpdateForm" action="<%=contextPath%>/updateForm.me" method="post">
				<h2><i> YOUR INFO </i></h2>
				<BR>
				<b>아이디</b>
				<input type="text" name="memberId" value="<%= memberId %>" class="inputUpdateMem" disabled><br><br>

				<b>닉네임</b>
				<input type="text" name="memberNickname" id="nicknameUpdate"
							maxlength="5" class="inputUpdateMem" value="<%=memberNickname %>" required>
				<br>
				<span id="chkNickname" width="800px" style="color:gray"></span><br><br>
				
				<b>이름</b>
				<input type="text" name="memberName" class="inputUpdateMem" value="<%=memberName %>" disabled><br><br>
				
				<b>이메일</b>
				<input type="email" name="email" class="inputUpdateMem" value="<%=email %>"><br><br>
				
				<b>연락처</b>
				
				<select name="mobile1" class="selectMA">
					<% String[] mobileAgency = { "010", "011", "016", "017", "019" }; %>
			
					<%
						String phoneBefore = loginUser.getPhone().substring(0,3);
						String phoneAfter = phone.substring(4);
						
						for (String ma : mobileAgency) {
					%>
		                   <option value="<%= ma %>" 
		                   <% if(phoneBefore.equals(ma)) { %>
		                    	selected
		                   <% } %>><%= ma %></option>
						<%}%>
				</select>
				
				<input type="text" id="telSection2" name="mobile2" maxlength="9" size="9" placeholder="휴대전화" value="<%=phoneAfter%>" required>
				
				<br><br><br>

				<input type="hidden" id="preferGenreStr" class="inputUpdateMem" value="<%=preferGenre%>">
				<div class="prefergenreMV">
				<br>
				<b><i>선호장르[최대 3개]</i></b>
					<br><br>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="28">액션</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="12">모험</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="16">애니메이션</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="35">코미디</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="80">범죄</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="99">다큐멘터리</label>
					<br>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="18">드라마</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="10751">가족</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="14">판타지</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="36">역사</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="27">공포</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="10402">음악</label>
					<br>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="9648">미스터리</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="10749">로맨스</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="878">SF</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="10770">스릴러</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="53">스릴러</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="10752">전쟁</label>
					<label><input type="checkbox" onclick=CountChecked(this) name="preferGenre" value="37">서부</label>
					<br>
					<br>
				</div>	
					<br>
					<br>
					<button type="submit" id="updateMemBtn" class="updateMemBtn">변경</button>

					<script>
					var nicknameCheck = true;
					$(function(){
						
						var preferGenreStr = $('#preferGenreStr').val().split(",");

						$("input[name='preferGenre']").each(function(){
							
							if(preferGenreStr.includes($(this).val())){ 
								$(this).attr('checked', true)
								totalChecked += 1;
							}
						})
					})
					
					//최대 클릭 가능 수
					var maxChecked = 3;  
					
					//체크 수
					var totalChecked = 0; 
					
					function CountChecked(field) {
						
						//누를때마다 클릭수 +1, -1
					    if (field.checked){
					        totalChecked += 1;
					    } else{
					        totalChecked -= 1;
					    }
					    	
						//총 체크 수가 3을 초과하면 알림창 그리고 클릭수 -1
					    if (totalChecked > maxChecked) {
					        alert ("최대 3개 까지만 가능합니다.");
					   		 field.checked = false;
					    	totalChecked -= 1;
					    }
					}
				
						$("#nicknameUpdate").on('keyup', function() {
						
						var $nicknameMem = $('#nicknameUpdate');
				
							$.ajax({
								
								url: "<%=contextPath%>/nickCheck.me",
								data : { nicknameUp : $nicknameMem.val()},
								
								success : function(result){
									if(result == "NNNNN"){
										$('#chkNickname').html("이미 존재하는 닉네임입니다");
										$('#updateMemBtn').prop('disabled', true);
										$nicknameMem.focus();
																			
									}else {
										$('#chkNickname').html("사용할 수 있는 닉네임입니다");
										$('#updateMemBtn').prop('disabled', false);
										/* $(".updateMemBtn").removeAttr("disabled"); */
										$updateMemBtn.attr("disabled", true);
									
									}
								}
							})
						})
			
					</script>
			</form>
		</div>
	</div>
		
</body>

</html>
	
	<%@ include file="../../views/common/footer.jsp" %>
