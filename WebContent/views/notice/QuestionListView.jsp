<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.notice.model.vo.Question, com.movinial.common.model.vo.PageInfo" %>        
<%

	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
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
<title>나의 문의 내역</title>
<style>
.outer{
    border : 1px solid gray;
    width: 1000px;
    height: 500px;
    margin: auto;

}
.list-area{
    border: 1px solid white;
    text-align: center;
}
.list-area>tbody>tr:hover{
    cursor: pointer;
    background: rgb(247, 201, 184);
}


</style>

</head>
<body>
 <%@ include file="../common/header.jsp" %>

	<div class="outer">

        <br>
        <h2 align="center">나의 문의 내역</h2>
        <br>
        
        
        <div align="center">
				&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<a href="<%= contextPath %>/list.no" class="btn btn-sm btn-primary" >공지사항</a> &nbsp; &nbsp;
				<a href="#" class="btn btn-sm btn-primary">FAQ</a> &nbsp; &nbsp;
				
				<% if(loginUser != null ){ %>
				<a href="#" class="btn btn-sm btn-primary">문의하기</a> &nbsp; &nbsp;
				<a href="#" class="btn btn-sm btn-primary">나의 문의 내역</a>
				<%} %>
				<% if(loginUser.getMemberId().equals("admin")){ %>
				<div align="right" style="width:850px;">
				<a href="#" class="btn btn-sm btn-primary">공지사항 작성</a>
				</div>
				<%} %>
		</div>
        

        <table align="center" class="list-area">
            <thead>
                <tr>
                 	<th width="300">문의 분류</th>
                    <th width="300">제목</th>
                    <th width="200">작성일</th>
                    <th width="300">답변확인</th>
                </tr>
            </thead>
            <tbody>
                <!-- 게시글 출력 -->
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="4"> 작성된 문의내역이 없습니다. </td>
	                </tr>
	            <%}else{ %>   <%-- 로그인한 회원  == 글작성자 --%>   
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Question q : list) { %>
		                <tr>
		                    <td><%= q.getQnaTitle() %></td>
		                	<td><%= q.getCategory() %></td>   <!-- 이거 왜 카테고리랑 제목이 반대로 나오지.. -->
		                    <td><%= q.getCreateDate() %></td>
		                    <td><a href="">답변확인</a></td>
		                </tr>
                	<%} %>
             	<%} %>
            </tbody>
        </table>

        <br><br>

        
        <!-- 페이징바 -->
        <div class = "paging-area" align="center">
           <!-- 페이징 버튼 <를 담당 : 이전페이지로 이동 -->
            <%if(currentPage != 1){ %>
            	<button onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= currentPage - 1 %>'">&lt;</button>
          	<%} %>
          	
          <% for(int i = startPage; i <= endPage; i++){ %>
            <%if(i != currentPage){ %>
            						<!-- http://localhost:8001/jsp/list.bo?currentPage=XX -->
            	<button onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= i %>'"><%= i %></button>
            <%}else{ %>
            	<button disabled><%= i %></button>
          	<%} %>
          <%} %>  
          
          <!-- 페이징바에서 > 를 담당 : 다음페이지 이동 -->
          <%if(currentPage != maxPage){ %>
        	   <button onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= currentPage + 1 %>'">&gt;</button>
		  <%} %>
        </div>
 </div>




 <%@ include file="../common/footer.jsp" %>        
</body>
</html>