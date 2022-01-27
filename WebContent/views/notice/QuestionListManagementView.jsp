<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.notice.model.vo.Question, com.movinial.common.model.vo.PageInfo" %>        
<%

	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 관리</title>
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
        
		<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
        <table align="center" class="list-area">
            
            <thead>
                <tr>
                 	<th width="200">문의 분류</th>
                    <th width="400">제목</th>
                    <th width="200">작성일</th>
                    <th width="100">답변확인</th>
                </tr> 
            </thead>
            <tbody>
                <!-- 게시글 출력 -->
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="5"> 작성된 문의내역이 없습니다. </td>
	                </tr>
	            <%}else{ %>   <%-- 로그인한 회원  == 글작성자 --%>   
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Question q : list) { %>
		                <tr id="titleDate">
		                	<td id="qnaNo"><%= q.getQnaNo() %></td>
		                    <td width="200">[ <%= q.getQnaWriter() %> ]</td> <!-- 카테고리.... 일단하고.. 나중에 수정  -->
		                    <td id="Qwriter"><%=q.getCategory() %></td> <!-- 작성자 ..... -->
		                	<td width="400"><%= q.getQnaTitle() %></td>   
		                    <td width="200"><%= q.getCreateDate() %></td>
		                    <td width="100"><a href="" id="reply">답변확인</a></td>
		                    <%} %>
		                </tr>
                	<%} %>
             	
            </tbody>
        
        </table>

		<script>
        
            $(function(){
                $(".list-area>tbody>tr").click(function(){

                    location.href = "<%=contextPath%>/questionDetail.no?qno="+ $(this).children().eq(0).text();                    
                    
                })

            })
            
        </script>

        <br><br>
        
        <!-- 페이징바 -->
        <div class = "paging-area" align="center">
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
          
          <%if(currentPage != maxPage){ %>
        	   <button onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= currentPage + 1 %>'">&gt;</button>
		  <%} %>
        </div>
 </div>
	
	
	
	
	
	

	<%@ include file="../common/footer.jsp" %>  

</body>
</html>