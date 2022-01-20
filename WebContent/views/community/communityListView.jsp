<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.community.model.vo.Community, com.movinial.common.model.vo.PageInfo" %>
<%
	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들 떄 필요한 변수 미리 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY</title>
<style>
    .outer{
    /* background-color: skyblue; */
    color: black;
    width: 1000px;
    height: 100%;
    margin: auto;
    margin-top: 50px;
    border: 1px solid black;
}

.list-area{
    /* border: 1px solid white; */
    text-align: center;
}
.list-area>tbody>tr:hover{
    cursor : pointer;
    background : lightblue;
}
.community-category>a{
    color: black;
    font-weight: bolder;
    text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>

	    <div class="outer">

        <br>
        <h1 style="margin-left: 100px; margin-bottom: 20px;">COMMUNITY</h1>

        <div class="community-category">
        <a href="<%= contextPath %>/filterCategoryAll.cm" style="margin-left: 100px;">전체</a>
        <a href="<%= contextPath %>/filterCategoryNotice.cm" style="margin-left: 10px;">공지</a>
        <a href="<%= contextPath %>/filterCategoryGeneral.cm" style="margin-left: 10px;">일반</a>
        <a href="<%= contextPath %>/filterCategoryInfo.cm" style="margin-left: 10px;">정보</a>
        <a href="<%= contextPath %>/filterCategoryReview.cm" style="margin-left: 10px;">리뷰</a>
        </div>
        <div align="right" style="width:900px">
        <a align="right" href="<%= contextPath %>/enrollForm.cm" class="btn btn-sm btn-secondary" style="margin-bottom: 5px;">글쓰기</a>
        </div>
        <table align="center" class="list-area">
            <thead>
                <tr style="background-color: lightgray;">
                    <th width="55">번호</th>
                    <th width="60">말머리</th>
                    <th width="350">제목</th>
                    <th width="100">작성자</th>
                    <th width="110">작성일</th>
                    <th width="50">조회수</th>
                    <th width="75">좋아요</th>
                </tr>
            </thead>
            <tbody>
            	<!-- 게시글 출력 -->
            	<% if(list.isEmpty()) { %>
            	<tr>
            		<td colspan="6">조회된 게시글이 없습니다.</td>
            	</tr>
            	<% } else { %>
            	<!-- 반복: list에 있는 값을 순차적으로 접근해서 뽑아보기 -->
				<!-- 글번호 말머리 제목 작성자 작성일 조회수 좋아요 -->
      				<% for(Community c : list) {%>
                <tr style="border: 1px solid lightgray;">
                    <td><%= c.getCommunityNo() %></td>
                    <td><%= c.getCommunityCategory() %></td>
                    <td><%= c.getCommunityTitle() %></td>
                    <td><%= c.getCommunityWriter() %></td>
                    <td><%= c.getCreateDate() %></td>
                    <td><%= c.getViews() %></td>
                    <td><%= c.getLikes() %></td>
                </tr>
                	<% } %>
				<% } %>
            </tbody>
        </table>

        <br>

        <script>
            $(function(){

                $('.list-area>tbody>tr').click(function(){

                    // /jsp/detail.bo?bno=x

                    location.href = "<%= contextPath %>/detail.cm?cno=" + $(this).children().eq(0).text();

                })
            })

        </script>

        <!-- 페이징바 -->
        <div class="paging-area" align="center">

            <!-- 페이징 버튼 -->
            <% if(currentPage != 1) { %>
            <button onclick="location.href='<%= contextPath %>/list.cm?currentPage=<%= currentPage - 1 %>'">&lt;</button>
            <% } %>
            <% for(int i = startPage; i <= endPage; i++) { %>
            	<% if(i != currentPage) { %>
            	<!-- /jsp/list.bo?currentPage=8 -->
            		<button onclick="location.href='<%= contextPath %>/list.cm?currentPage=<%= i %>'"><%= i %></button>
            	<%} else {%>
            		<button disabled><%= i %></button>
            	<% } %>
            <% } %>
            <!--  페이징바에서 > 를 담당 : 다음페이지 이동 -->
            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/list.cm?currentPage=<%= currentPage + 1 %>'">&gt;</button>
            <% } %>
        </div>
        <br>
    </div>
    <br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>