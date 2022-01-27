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
	    color:black;
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
	    background: #e6e6e6;
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
            <a href="<%= contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary">공지사항 &nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/FAQList.no" class="btn btn-sm btn-secondary">FAQ&nbsp;&nbsp;&nbsp;</a>
            
            <% if(loginUser != null && !loginUser.getMemberId().equals("admin")){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary">나의 문의내역</a>
            <%} %>
            
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
            	<a href="<%=contextPath%>/questionListManagement.no?currentPage=1" class="btn btn-sm btn-secondary">문의내역</a>  <!-- 문의 내역 조회하기  -->
                <a href="<%=contextPath%>/enrollForm.no" id="noticeInsertbtn" class="btn btn-sm btn-secondary">추가</a> <!-- 추가 -->
            <% } %>
            
        </div>
        
        <div align="center" class="list-area">
            
                <!-- 게시글 출력 -->
                <div class="divQ">Q. 반품은 언제되나요?</div>
                <p class="divA">&nbsp; A. 반품은 평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.</p>
            
                <div class="divQ">Q. 상품의 위치를 알고 싶습니다평일 A. 반품은 3~4달 정도 소요됩니다.</div>
                <p class="divA">&nbsp;  A. 택배사에 문의하세요평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.</p>
            
                <div class="divQ">Q. 이 사이즈가 있나요평일 A. 반품은 3~4달 정도 소요됩니다?</div>
                <p class="divA">&nbsp; A. 네 있어A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.요.</p>
            
                <div class="divQ">Q. 전화통화 A. 반품은 3~4달 정도 소요됩니다.가능한 시간은 언제인가요?</div>
                <p class="divA">&nbsp; A. 평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소평일 A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.9-6시 입니다.</p>
            
                <div class="divQ">Q.판매자의 연A. 반품은 3~4달 정도 소요됩니다.락처를 알고 싶어요</div>
                <p class="divA">&nbsp; A. 게시판을 이A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.용해주세요.</p>

                <div class="divQ">Q. 이 사이즈가 있나A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.요?</div>
                <p class="divA">&nbsp; A. 네 있A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.A. 반품은 3~4달 정도 소요됩니다.어요.</p>
            
                <div class="divQ">Q. 전화통화 가능한 A. 반품은 3~4달 정도 소요됩니다.시간은 언제인가요?</div>
                <p class="divA">&nbsp; A. 평일 9-6시 A. 반품은 3~4달 정도 소요됩니다.입니다.</p>
            
            
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