<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입페이지</title>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        
        <style>
		details { margin:5px 0 10px; }
		details > summary { background:#444; color:#fff; padding:10px; outline:0; border-radius:5px; cursor:pointer; transition:background 0.5s; text-align:left; box-shadow: 1px 1px 2px gray;}
		details > summary::-webkit-details-marker { background:#444; color:#fff; background-size:contain; transform:rotate3d(0, 0, 1, 90deg); transition:transform 0.25s;}
		details[open] > summary::-webkit-details-marker { transform:rotate3d(0, 0, 1, 180deg);}
		details[open] > summary { background:#444;}
		details[open] > summary ~ * { animation:reveal 0.5s;}
		.tpt { background:#444; color:#fff; margin:5px 0 10px; padding:5px 10px; line-height:25px; border-radius:5px; box-shadow: 1px 1px 2px gray;}
		
		@keyframes reveal {
		    from { opacity:0; transform:translate3d(0, -30px, 0); }
		    to { opacity:1; transform:translate3d(0, 0, 0); }
		}
		
		.terms{
            display: block;

		}
		.terms>input{
            margin: 0 auto;			
		}
		</style>
        
        
    </head>
 
</html>
<body>

    <%@ include file = "../common/header.jsp" %> <!-- header -->

    <div class=terms>
    <form>
        <fieldset> 
            <h1>
                회원가입
            </h1> 
            
            <table>
            
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="cbx_chkAll" /></td>
                        <td>약관 전체 동의</td>
                        
                    </tr>	
                    <tr>
                        <td><input type="checkbox" name="chk" required></td>
                        <td>(필수)서비스 이용약관</td>
                        <td><details>
	   						<summary>서비스이용약관 전체보기</summary>
	   						<p>제1조(목적)
								
								이 약관은 (주)무비니얼(전자상거래 사업자)가 운영하는 (주)무비니얼 웹(이하 “웹”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 웹과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
								
								제2조(정의)
								
								① “웹”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버웹을 운영하는 사업자의 의미로도 사용합니다. ② “이용자”란 “웹”에 접속하여 이 약관에 따라 “웹”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③ ‘회원’이라 함은 “웹”에 회원등록을 한 자로서, 계속적으로 “웹”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. ④ ‘비회원’이라 함은 회원에 가입하지 않고 “웹”이 제공하는 서비스를 이용하는 자를 말합니다.
								
								제3조 (약관 등의 명시와 설명 및 개정)
								
								① “웹”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버웹의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② “웹은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. ③ “웹”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ④ “웹”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 웹의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "웹“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “웹”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “웹”에 송신하여 “웹”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
								
								
								</p>
							</details></td>
                    </tr>
	                    
	                <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>(선택)개인정보처리방침</td>
                        <td><details>
	   						<summary>개인정보처리방침 전체보기</summary>
	   						<p>제1조(목적)
								
								이 약관은 (주)무비니얼(전자상거래 사업자)가 운영하는 (주)무비니얼 웹(이하 “웹”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 웹과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
								
								제2조(정의)
								
								① “웹”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버웹을 운영하는 사업자의 의미로도 사용합니다. ② “이용자”란 “웹”에 접속하여 이 약관에 따라 “웹”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③ ‘회원’이라 함은 “웹”에 회원등록을 한 자로서, 계속적으로 “웹”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. ④ ‘비회원’이라 함은 회원에 가입하지 않고 “웹”이 제공하는 서비스를 이용하는 자를 말합니다.
								
								제3조 (약관 등의 명시와 설명 및 개정)
								
								① “웹”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버웹의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② “웹은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. ③ “웹”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ④ “웹”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 웹의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "웹“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “웹”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “웹”에 송신하여 “웹”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
								
								
								</p>
							</details></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" name="chk"></td>
                        <td>(선택)마케팅용 이메일 및 SMS수신 동의</td>
                        <td><details>
	   						<summary>마케팅용 수신동의 전체보기</summary>
	   						<p>제1조(목적)
								
								이 약관은 (주)무비니얼(전자상거래 사업자)가 운영하는 (주)무비니얼 웹(이하 “웹”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 웹과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
								
								제2조(정의)
								
								① “웹”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버웹을 운영하는 사업자의 의미로도 사용합니다. ② “이용자”란 “웹”에 접속하여 이 약관에 따라 “웹”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③ ‘회원’이라 함은 “웹”에 회원등록을 한 자로서, 계속적으로 “웹”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. ④ ‘비회원’이라 함은 회원에 가입하지 않고 “웹”이 제공하는 서비스를 이용하는 자를 말합니다.
								
								제3조 (약관 등의 명시와 설명 및 개정)
								
								① “웹”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버웹의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② “웹은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. ③ “웹”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ④ “웹”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 웹의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "웹“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “웹”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “웹”에 송신하여 “웹”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
								
								
								</p>
							</details></td>
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
                    <td><input type="text" name="memberId" maxlength="12" id="memberId" placeholder="아이디" required></td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="memberPwd" maxlength="15" id="memberPwd1" placeholder="패스워드" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 재확인</td>
                    <td><input type="password" maxlength="15" id="memberPwd2" placeholder="패스워드 확인" required>
                    	<font id="chkNotice" size="2"></font></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="memberName" id="memberName" maxlength="6" placeholder="이름" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 닉네임</td>
                    <td><input type="text" name="nickName" id="nickName" maxlength="6" placeholder="닉네임" required></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>* 이메일</td>
                    <td><input type="email" name="email" id="email" placeholder="이메일주소"></td>
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
                        <input type="text" name="phone2" placeholder="숫자만 입력"> </td>
                        
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
    
    <script>
    $(function(){
		
		 $('#memberPwd1').keyup(function(){ // 비밀번호 재입력 확인 
		      $('#chkNotice').html('');
		    });

		    $('#memberPwd2').keyup(function(){

		        if($('#memberPwd1').val() != $('#memberPwd2').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		        }

		    });
	    
	  
	  });
    
    $(document).ready(function(){  //이용약관 체크박스 관련 
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


</body>
</html>