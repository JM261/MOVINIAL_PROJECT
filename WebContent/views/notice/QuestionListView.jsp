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
	    border : 1px solid #bcbcbc;
	    width: 1100px;
	    height: 850px;
	     margin: auto;
	    margin-bottom: 30px;
	
	}
	.list-area{
	    border: 1px solid #bcbcbc; 
	    font-size: 22px;  
	    width: 1000px;
	    margin : auto;
	    text-align: center;
	    
	}
	table{
		border-bottom : 1px solid #bcbcbc;
	}
	
	.btn-area{
	    width : 800px;
	    height: 80px;
	    align: center;
	}
	.btn-area>a{
	    color:white;
	    font-size: 25px;
	    margin-left: 50px;
	    text-decoration: none;
	    text-align:center;
	
	}
	#titleDate:hover{
	    cursor: pointer;
	    background: lightgray;
	}
	
	td{
	    height: 55px;
	}
	
	#h2{
	    font-weight: bolder;
	}
	
	#qnaNo{
		display:none;
	}
	#reply{
		color:rgb(105, 105, 105);
		}
	tr td{
		border-bottom: 1px solid #bcbcbc; 
	}  
	
	#Qwriter{
		display:none;
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
            
            <%if(loginUser != null){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary" style="background: black;">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">나의 문의내역</a>
            <%} %>
        </div>
        
        <form id="list-form" action="<%= contextPath %>/questionDetail.no">
        <table align="center" class="list-area">
            
            <thead>
               <%-- <tr>
                 	<th width="200">문의 분류</th>
                    <th width="400">제목</th>
                    <th width="200">작성일</th>
                    <th width="100">답변확인</th>
                </tr>--%> 
            </thead>
            <tbody>
                <!-- 게시글 출력 .-->
				<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>"> 
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="5"> 작성된 문의내역이 없습니다. </td>
	                </tr>
	            <%}else{ %>      
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Question q : list) { %>
					
		                <tr id="titleDate">
		                	<td id="qnaNo"><%= q.getQnaNo() %></td>
		                    <td width="210">[ <%= q.getCategory() %> ]</td> 
		                    <td id="Qwriter"><%=q.getQnaWriter() %></td> 
		                	<td width="450"><%= q.getQnaTitle() %></td>   
		                    <td width="150"><%= q.getCreateDate() %></td>
		                    <td width="90"><a href="<%=contextPath%>/questionDetail.no?qno=<%= q.getQnaNo() %>" id="reply">답변확인</a></td>
		                </tr>	                	
		                <%} %>
                	<%} %>
             	
            </tbody>
        
        </table>
    </form>
	



		<script>
        
            $(function(){
                $(".list-area>tbody>tr").click(function(){
                    // /jsp/ditail.bo?qno=X

                    location.href = "<%=contextPath%>/questionDetail.no?qno="+ $(this).children().eq(0).text();             
                })
            })
            
        </script>




        <br><br>


        
        <!-- 페이징바 -->
        <div class = "paging-area pagingation" align="center">
           <!-- 페이징 버튼 <를 담당 : 이전페이지로 이동 -->
            <%if(currentPage != 1){ %>
            	<button class="page-item" onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= currentPage - 1 %>'">&lt;</button>
          	<%} %>
          	
          <% for(int i = startPage; i <= endPage; i++){ %>
            <%if(i != currentPage){ %>
            						<!-- http://localhost:8001/jsp/list.bo?currentPage=XX -->
            	<button class="page-item" onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= i %>'"><%= i %></button>
            <%}else{ %>
            	<button class="page-item" style="color:coral"><%= i %></button>
          	<%} %>
          <%} %>  
          
          <!-- 페이징바에서 > 를 담당 : 다음페이지 이동 -->
          <%if(currentPage != maxPage){ %>
        	   <button class="page-item" onclick="location.href='<%= contextPath %>/questionList.no?currentPage=<%= currentPage + 1 %>'">&gt;</button>
		  <%} %>
        </div>
        
 </div>




 <%@ include file="../common/footer.jsp" %>        
</body>
</html>