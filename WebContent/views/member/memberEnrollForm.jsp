<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입페이지</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        


	    <script type="text/javascript">
		    $(document).ready(function(){
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
                var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
        </script>
    </head>
 
</html>
<body>

    <%@ include file = "../common/header.jsp" %> <!-- header -->

    <div>
    <form>
        <fieldset> 
            <legend>
                회원가입 약관 동의
            </legend> 
            
            <table>
            
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="cbx_chkAll" /></td>
                        <td>약관 전체 동의</td>
                    </tr>	
                    <tr>
                        <td><input type="checkbox" name="chk" required></td>
                        <td>(필수)서비스 이용약관</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>(선택)개인정보처리방침</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>(선택)마케팅용 이메일 및 SMS수신 동의</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </fieldset>
    </form>


    <div class="outer">
        <br>
       

        <form id="enroll-form" action="<%= contextPath %>/GenreNext.me" method="post">
            <!-- 아이디, 비밀번호, 이름, 닉네임, 이메일주소,  전화번호, 전화번호 인증 -->
            <table>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" name="memberId" maxlength="12" id="memberId" required></td>
                    <td><button type="button" onclick="idCheck();" class="btn bnt-sm btn-secondary">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="memberPwd" maxlength="15" id="memberPwd" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 재확인</td>
                    <td><input type="password" maxlength="15" id="memberPwd" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="memberName" id="memberName" maxlength="6" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 닉네임</td>
                    <td><input type="text" name="nickName" id="nickName" maxlength="6" required></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>* 이메일</td>
                    <td><input type="email" name="email" id="email"></td>
                    <td></td>
                </tr>

                <tr>
                    <td>* 연락처</td>
                    <td>
                        <select name="phone1">
                          <option value="010">010</option>
                          <option value="011">011</option>
                          <option value="016">016</option>
                          <option value="017">017</option>
                        </select> 
                        <input type="text" name="phone2"> </td>
                        
                     <!--   <td><input type="button" value="휴대폰인증"></td>   -->
                </tr>

            </table>

            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-sm btn-secondary"
                	onclick="">다음</button>
                <button type="reset" class="btn btn-sm btn-danger">초기화</button>
            </div>
            
            <script>
            	function idCheck(){
            		// 인풋태그로부터 값을 뽑아와야함 -> 인풋태그요소 자체먼저 뽑자
            		var $userId = $("#enroll-form input[name=userId]");
            		// name이 userId인 요소가 menubar.jsp에도 있기 때문에
            		// 조금 더 디테일하게 선택해야함
            		
            		// ajax로 컨트롤러에 요청하기
            		$.ajax({
            			url : "idCheck.me",
            			data : { checkId : $userId.val() },
            			success : function(result){
            				
            				// result 경우의 수 : "NNNNN", "NNNNY"
            				// 문자열 동등 비교로 따지기
            				if(result == "NNNNN"){ // 중복된 아이디 == 사용불가
            					
            					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
            				
            					//재입력 유도
            					$userId.focus();
            				}
            				else{ // 중복되지 않은 아이디 == 사용가능
            					
            					// 알람창 => confirm()
            					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
            						
            						// 중복확인 전까지는 submit버튼을 막았다가 if문 내부로 오면 submit활성화
            						$("#enroll-form button[type=submit]").removeAttr("disabled");
            						
            						// 아이디 값을 이후로 못바꾸게 확정 => readonly
            						$userId.attr("readonly", true);
            					}
            					else { // 취소를 선택 => 다시 입력
            						
            						$userId.focus(); // 다시입력 유도
            					}
            					
            					
            				}
            				
            				
            			},
            			error : function(){
            				console.log("아이디 중복체크용 ajax 실패");
            			}
            		})
            	}
            </script>

            <br><br><br>
        </form>


    </div>

    <%@ include file="../common/footer.jsp" %>


</body>
</html>