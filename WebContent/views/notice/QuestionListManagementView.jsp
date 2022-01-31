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

<style>
	.outer{
	    border: 1px solid #bcbcbc; 
	    width: 1500px; 
	    height:900px;
	    margin: auto;
	    margin-bottom: 30px;
	
	}
	.list-area{
	    border: 1px solid #bcbcbc; 
	    font-size: 22px;  
	    width: 1400px;
	    margin : auto;
	    text-align: center;
	    
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
	tr td{
		border-bottom: 1px solid #bcbcbc; 
	}
	#titleDate:hover{
	    cursor: pointer;
	    background: #e6e6e6;
	}
	
	.noticeTitle{
	   border-bottom: 1px solid #bcbcbc; 
	   padding-left: 20px;
	}
	.noticeDate{
	    border-bottom: 1px solid #bcbcbc; 
	    text-align: right;
	    padding-right: 20px;
	}
	
	#qnaNo{
	    display: none;    
	}
	th{
	    height: 55px;
		border-bottom: 1px solid #bcbcbc;
		background: #f7f5f5;
	}
	td{
	    height: 55px;
	}
	#reply{
		color:rgb(105, 105, 105);
		}
	
	#h2{
	    font-weight: bolder;
	}
	#noticeInsertbtn{
	    float: right;
	    margin-right: 100px;
	}
	.pagingation{
		border:none;
	}
	
	.page-item{
		border:none;
		color : black;
		background-color:white;
		width:30px;
	}
	

</style>
	
	
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
        
		<%-- <input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">--%>
       	 <table align="center" class="list-area">
            
            <thead>
                <tr>
                 	<th width="250">문의 분류</th>
                    <th width="400">제목</th>
                    <th width="150">회원번호</th>
                    <th width="150">작성일</th>
                    <th width="100">답변하기</th>
                </tr> 
            </thead>
            <tbody>
                <!-- 게시글 출력 -->
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="5"> 작성된 문의내역이 없습니다. </td>
	                </tr>
	            <%}else{ %>     
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Question q : list) { %>
		                <tr id="titleDate">
		                	<td id="qnaNo"><%= q.getQnaNo() %></td>
		                    <td>[ <%= q.getCategory() %> ]</td> 
		                	<td><%= q.getQnaTitle() %></td>
		                	<td><%= q.getQnaWriter() %></td>
		                    <td><%= q.getCreateDate() %></td>
		                    <td><a href="<%=contextPath%>/questionDetail.no?qno=<%= q.getQnaNo() %>" id="reply">답변하기</a></td>
		                    <%} %>
		                </tr>
                	<%} %>
             	
            </tbody>
        
       	 </table>

		<script>
        
            $(function(){
                $(".list-area>tbody>tr").click(function(){

                    location.href = "<%=contextPath%>/questionDetailManagement.no?qno="+ $(this).children().eq(0).text();                    
                    
                })

            })
            
        </script>

        <br><br>
        
        <!-- 페이징바 -->
        <div class = "paging-area pagingation" align="center">
            <%if(currentPage != 1){ %>
            	<button class="page-item" onclick="location.href='<%= contextPath %>/questionListManagement.no?currentPage=<%= currentPage - 1 %>'">&lt;</button>
          	<%} %>
          	
          <% for(int i = startPage; i <= endPage; i++){ %>
            <%if(i != currentPage){ %>
            	<button class="page-item" onclick="location.href='<%= contextPath %>/questionListManagement.no?currentPage=<%= i %>'"><%= i %></button>
            <%}else{ %>
            	<button class="page-item" style="color:coral"><%= i %></button>
          	<%} %>
          <%} %>  
          
          <%if(currentPage != maxPage){ %>
        	   <button class="page-item" onclick="location.href='<%= contextPath %>/questionListManagement.no?currentPage=<%= currentPage + 1 %>'">&gt;</button>
		  <%} %>
        </div>
        
       
 </div>
	

	<%@ include file="../common/footer.jsp" %>  

</body>
</html>