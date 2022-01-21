<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.notice.model.vo.Question, com.movinial.common.model.vo.PageInfo" %>        
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
	//PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들때 필요한 변수 세팅
	/*
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	*/
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
    background-color: rgb(224, 224, 224);
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

        <table align="center" class="list-area">
            <thead>
                <tr>
                 
                    <th width="300">제목</th>
                    <th width="200">작성일</th>
                    <th width="300">답변확인</th>
                </tr>
            </thead>
            <tbody>
                <!-- 게시글 출력 -->
                <% if(list.isEmpty()){ %>
	                <tr>
	                    <td colspan="2"> 작성된 문의내역이 없습니다. </td>
	                </tr>
	            <%}else{ %>    
					<!--  반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기  -->
					<% for(Question q : list) { %>
		                <tr>
		                    <td><%= q.getQnaTitle() %></td>
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
            <!-- 페이징 버튼 -->
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>&gt;</button>
       

        </div>
 </div>




 <%@ include file="../common/footer.jsp" %>        
</body>
</html>