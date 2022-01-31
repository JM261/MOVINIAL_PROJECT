<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.notice.model.vo.Notice, com.movinial.common.model.vo.PageInfo" %>        
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
	.outer{
	    border: 1px solid #bcbcbc; 
	    width: 1100px; 
	    height: 850px;
	    margin: auto;
	    margin-bottom: 30px;
	
	}
	.list-area{
	     
	    font-size: 22px;  
	    width: 1100px;
	    
	}
	.btn-area{
	   	width : 100%;
	    height: 80px;
	}
	.btn-area>a{
	    color:white;
	    font-size: 25px;
	    margin-left: 50px;
	    text-decoration: none;
	    text-align:center;
	
	}
	.divQ{
	    border: 1px solid #bcbcbc; 
	    width: 1000px;
	    height: 55px;
	    line-height: 30px;
	    padding: 8px;
	    color:rgb(0, 0, 0);
	    text-align: left;
		
	    
	}
	.divQ:hover{
	    cursor: pointer;
	    background: lightgray
	}
	.divA{
	    width:1000px;
	   height:200px;
	   
	    padding: 8px;
	    color: rgb(0, 0, 0);
	    text-align: left;
	    display:none;
	}
	#h2{
	    font-weight: bolder;
	}
	#noticeInsertbtn{
	    float: right;
	    margin-right: 100px;
	}

</style>

</head>
<body>
 <%@ include file="../common/header.jsp" %>

	<div class="outer">
        <br>
        <h2 id="h2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터</h2>
        <br>
        <div class="btn-area">
            <a href="<%= contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">공지사항 &nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/FAQList.no" class="btn btn-sm btn-secondary" style="background: black;">FAQ&nbsp;&nbsp;&nbsp;</a>
            
            <% if(loginUser != null && !loginUser.getMemberId().equals("admin")){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary" style="background: black;">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">나의 문의내역</a>
            <%} %>
            
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
            	<a href="<%=contextPath%>/questionListManagement.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">문의내역</a>  <!-- 문의 내역 조회하기  -->
               
            <% } %>
            
        </div>
        
        <div align="center" class="list-area">
            
                <!-- 게시글 출력 -->
                <div class="divQ">Q. 아이디를 바꾸고 싶어요. </div>
                <p class="divA">&nbsp; A. 한번 입력하신 아이디를 바꾸실 수 없습니다.  <br> <br>
                						 &nbsp;&nbsp;&nbsp;&nbsp;아이디를 바꾸고 싶으신 경우 회원탈퇴 후 새로 회원가입 하셔야 합니다. <br>
                						 &nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴는 MOVINIAL을 통해서만 가능합니다.</p>
            
                <div class="divQ">Q. 비밀번호를 바꾸고 싶어요.</div>
                <p class="divA">&nbsp;  A. 비밀번호를 바꾸실 수 있는 방법은 아래와 같습니다. <br> <br>
											&nbsp;&nbsp;&nbsp;&nbsp;(1) 로그인 > [닉네임] 클릭 > [마이페이지] 이동 <br>
											&nbsp;&nbsp;&nbsp;&nbsp;(2) [회원정보수정] 클릭 <br>
											&nbsp;&nbsp;&nbsp;&nbsp;(3) 회원정보 수정 > 비밀번호 입력 <br>
											&nbsp;&nbsp;&nbsp;&nbsp;(4) 비밀번호 변경 완료</p>
            	<div class="divQ">Q. 법인 회원으로 가입할 수 있나요?</div>
                <p class="divA">&nbsp; A. MOVINIAL은 개인고객을 위한 서비스입니다.<br>
                &nbsp;&nbsp;&nbsp;&nbsp; 따라서 법인으로 회원가입하실 수 없습니다.<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp; MOVINIAL와의 제휴를 원하실 경우 movinial@mail.com으로 이메일 주시거나<br>
                &nbsp;&nbsp;&nbsp;&nbsp; 회원가입을 통해 사용하시기 바랍니다. </p>
            
                <div class="divQ">Q. 불량 이용자는 어떻게 되나요?</div>
                <p class="divA">&nbsp; A. MOVINIAL 약관에 명시된 내용에 따라 신고가 누적된 불량 이용자는 서비스 사용 중지<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;또는 계정이 삭제될 수 있습니다. </p>
            
                <div class="divQ">Q. 로그인이 안될때 고객문의를 남길 수 있는 방법이 있나요?</div>
                <p class="divA">&nbsp; A. 로그인이 되지 않으시는 경우<br> <br>
                &nbsp;&nbsp;&nbsp;&nbsp;아래 MOVINIAL 대표 메일로 이메일 문의를 남겨주시면 성심성의껏 답변 드리겠습니다. <br><br>
                &nbsp;&nbsp;&nbsp;&nbsp; MOVINIAL 대표메일 : mivinial@mail.net <br>
                &nbsp;&nbsp;&nbsp;&nbsp; 문의 발생시 상세 정보를 남겨조시면 더욱 빠른 조치가 가능합니다.
                </p>

				<div class="divQ">Q. 영화 또는 시리즈를 관심 콘텐츠에 추가하려면 어떻게 하나요?</div>
                <p class="divA">&nbsp; A. 콘텐츠를 관심 콘텐츠에 추가하는 것은 어렵지 않습니다. <br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;영화를 관심 콘텐츠에 추가하려면 다음 단계를 따르세요.<br>
				&nbsp;&nbsp;&nbsp;&nbsp;관심 콘텐츠에 추가하려는 영화 또는 시리즈를 선택합니다. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;콘텐츠 정보 페이지에서 좋아요를 선택합니다. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;콘텐츠가 관심 콘텐츠에 추가되면 마이페이지에서 확인하실 수 있습니다.</p>

                <div class="divQ">Q. 커뮤니티는 아무나 이용할 수 있나요?</div>
                <p class="divA">&nbsp; A. 커뮤니티는 비회원일 경우, 커뮤니티 메인 글제목만 볼 수 있습니다. <br>
               &nbsp;&nbsp;&nbsp;&nbsp; 글작성, 좋아요 등의 기능들은 로그인한 회원에 한하여 이용이 가능합니다.   </p>
            
                
            
            
         <script>
                $(function(){
                $('.divQ').click(function(){

                // $(this) : 현재 클릭 이벤트가 발생한 div요소
                // $(this).next() : 현재 클릭이벤트가 발생한 div요소 바로 뒤에 있는 p요소
               
                var $p = $(this).next();
                // jQuery 방식으로 선택된 요소를 담아줄 때
                // 변수명 앞에 $를 붙인다

                // css() 메소드 또한 속성명만 매개변수로 넘기게 되면
                // 해당 속성값을 반환해준다.( getter/setter 역할을 동시해 수행가능함)
                if($p.css('display') == 'none'){
                   
                    // 기존에 열려있던 p태그를 닫아준다.
                    $p.siblings('p').slideUp(50);

                    // 새로운 p태그을 열어준다.
                    $p.slideDown(50);
                }
                else{
                    $p.slideUp(50);
                }
            		})
        		})
        </script>
        
        </div>
        <br><br>
 </div>

 <%@ include file="../common/footer.jsp" %>        
</body>
</html>