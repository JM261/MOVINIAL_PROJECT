<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.movinial.notice.model.vo.*" %>    
<%
	Question q = (Question)request.getAttribute("q");  // : Object
	// b => board 객체 - 게시글번호,  카테고리명, 제목, 내용, 작성자 아이디, 작성일
	
	//Attachment at = (Attachment)request.getAttribute("at");	  // : Object	
	// at => attachment 객체 = 파일번호, 원본명, 수정명, 저장경로

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의 내역</title>
</head>
<body>
style>
    .outer{
        background-color: rgb(200, 235, 135);
        color: white;
        width: 1000px;
		height: 500px;
        margin : auto;
        margin-top : 50px;
    }

    table{ border: 1px solid white;}
</style>
</head>
<body>

	 <%@ include file="../common/header.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">나의 문의 내역</h2>
        <br>

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="70">카테고리</th>
                <td width="70"><%= q.getCategory() %></td>
                <th width="70">제목</th>
                <td width="350"><%= q.getQnaTitle() %></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= q.getQnaWriter() %></td>
                <th>작성일</th>
                <td><%= q.getCreateDate() %></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height : 200px;"><%= q.getQnaContent() %></p>
                </td>
                
            </tr>
        <%--   <tr>
                <th></th>
                <td colspan="3">
                    <!-- 첨부파일이 없을 경우-->
                    <% if(at == null){ %>
                    	첨부파일이 없습니다.
					<%}else{ %>
	                    <!-- 첨부파일이 있을 경우-->
	                    <a download="<%= at.getOriginName() %>" href="<%=contextPath%>/<%= at.getFilePath()+at.getChangeName()%>">
	                    	<%= at.getOriginName() %>
	                    </a>
                	<%} %>
                </td>      
            </tr>  --%>
        </table>

        <br>
        <div align="center">
            <a href="<%= contextPath%>/list.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>
         <%-- 
            <!-- 작성자만 보이게끔 -->
        	<!--  로그인이 되어있고, 현재 로그인된 사용자가 작성자와 동일할 경우에만  -->
        	<% if(loginUser != null && loginUser.getUserId().equals(q.getQnaWriter())){ %>
        		<a href="<%= contextPath%>/updateForm.bo?bno=<%= q.getQnaNo() %>" class="btn btn-sm btn-warning">수정하기</a>  <!-- b. getBoardNo : 현재 보고 있는 글 번호 -->
        		<a href="<%= contextPath%>/delete.bo?bno=<%= q.getQnaNo() %>" class="btn btn-sm btn-danger">삭제하기</a>
        		   <!-- localhost:8001/jsp/delete.no?nno=XX  -->
        	<%} %>
        	
        	--%>   

        </div>
    </div>
</body>
</html>