<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.notice.model.vo.Notice, com.movinial.common.model.vo.PageInfo" %>        
<%
	

	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	
        
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들때 필요한 변수 세팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.outer{
    border: 1px solid #bcbcbc; 
    width: 1100px; 
    height:850px;
    margin: auto;
    margin-bottom: 30px;

}
.list-area{
    border: 1px solid #bcbcbc; 
    font-size: 22px;  
    width: 1000px;
    
}
.btn-area{
    width : 800px;
    height: 80px;
 
}
.btn-area>a{
    color:black;
    font-size: 25px;
    margin-left: 50px;
    text-decoration: none;
    text-align:center;

}

#titleDate:hover{
    cursor: pointer;
    background: #e6e6e6;
}

#noticeTitle{
   border-bottom: 1px solid #bcbcbc; 
}
#noticeDate{
    border-bottom: 1px solid #bcbcbc; 
    text-align: right;
}

#noticeNo{
    display: none;
}

td{
    height: 55px;
}

#h2{
    font-weight: bolder;
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
            
            <%if(loginUser != null){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary">나의 문의내역</a>
            <%} %>
        </div>

        <table align="center" class="list-area">
          <!--  <thead>
                <tr>                
                    <th width="500">제목</th>
                    <th width="300">작성일</th>                  
                </tr>
            </thead> -->
            <tbody>
                <!-- 게시글 출력 -->
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="3"> 공지사항이 없습니다. </td>
	                </tr>
	            <%}else{ %>    
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Notice n: list) { %>
		                <tr id="titleDate">
		                	<td id="noticeNo"><%= n.getNoticeNo() %></td>		                
		                    <td id="noticeTitle"><%= n.getNoticeWriter() %></td>  <!-- n.getNoticeTitle  왜 제목이랑.. 내용이... 바뀌어서 나오는거지? -->
		                    <td id="noticeDate"><%= n.getCreateDate() %></td>
		                </tr>                       
                	<%} %>
             	<%} %>
            </tbody>
        </table>

        <script>
			$(function(){
				$(".list-area>tbody>tr").click(function(){


					// 클릭했을 때 해당 공지사항의 번호를 넘기자!!!!
					// 해당 tr태그의 자손 중에서도 첫번째 td의 값이 필요함!!(내용물을 뽑자!!!)
					var nno = $(this).children().eq(0).text(); //글번호

					//console.log(nno);

					// 글번호가지고 요청
					// 대놓고 요청 => url에 키와 밸류를 대놓고 작성해서 요청을 보내버리자
					// GET방식 : 요청할url?키=밸류&키=밸류&키=밸류....
					// "쿼리스트링" => ? 뒤의 내용들, 직접만들어서 보내보자
					// localhost:8001/jsp/detail.no?nno=글번호

					location.href = "<%= contextPath %>/noticeDetail.no?nno=" + nno;
				})
			})
		</script>

 


        <br><br>
      
        <!-- 페이징바 -->
        <div class = "paging-area" align="center">
           <!-- 페이징 버튼 <를 담당 : 이전페이지로 이동 -->
            <%if(currentPage != 1){ %>
            	<button onclick="location.href='<%= contextPath %>/noticeList.no?currentPage=<%= currentPage - 1 %>'">&lt;</button>
          	<%} %>
          	
          <% for(int i = startPage; i <= endPage; i++){ %>
            <%if(i != currentPage){ %>
            						<!-- http://localhost:8001/jsp/list.bo?currentPage=XX -->
            	<button onclick="location.href='<%= contextPath %>/noticeList.no?currentPage=<%= i %>'"><%= i %></button>
            <%}else{ %>
            	<button disabled><%= i %></button>
          	<%} %>
          <%} %>  
          
          <!-- 페이징바에서 > 를 담당 : 다음페이지 이동 -->
          <%if(currentPage != maxPage){ %>
        	   <button onclick="location.href='<%= contextPath %>/noticeList.no?currentPage=<%= currentPage + 1 %>'">&gt;</button>
		  <%} %>
        </div>  
       
        
 </div>




 <%@ include file="../common/footer.jsp" %>        
</body>
</html>