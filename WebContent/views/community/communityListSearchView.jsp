<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.community.model.vo.Community, com.movinial.common.model.vo.PageInfo" %>
<%
	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String searchType = (String)session.getAttribute("searchType");
	String keyword = (String)session.getAttribute("keyword");
	
	// 페이징바 만들 때 필요한 변수 미리 셋팅
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
	    color: black;
	    width: 1000px;
	    height: 100%;
	    margin: auto;
	    margin-top: 50px;
	    border: 1px solid black;
	}
	.list-area{
	    text-align: center;
	}
	.list-area>tbody>tr:hover{
	    cursor : pointer;
	    background : rgb(240, 240, 240);
	}
	.community-category>a{
	    color: black;
	    font-weight: bolder;
	    text-decoration: none;
        margin-left: 10px;
	}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>

	    <div class="outer">

        <br>
        <h1 style="margin-left: 100px; margin-bottom: 20px;">COMMUNITY</h1>

        <div class="community-category" style="margin-bottom: 5px;" >
        <a href="<%= contextPath %>/list.cm?currentPage=1" style="margin-left: 100px;">전체</a>
        <a href="<%= contextPath %>/list.cc?currentPage=1&cct=공지" >공지</a>
        <a href="<%= contextPath %>/list.cc?currentPage=1&cct=일반" >일반</a>
        <a href="<%= contextPath %>/list.cc?currentPage=1&cct=정보" >정보</a>
        <a href="<%= contextPath %>/list.cc?currentPage=1&cct=리뷰" >리뷰</a>
        <% if(loginUser != null) { %>
        <a align="right" style="color: white; font-weight: lighter; margin-left: 518px;" href="<%= contextPath %>/enrollForm.cm" class="btn btn-sm btn-secondary">글쓰기</a>
        <% } %>
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
                    <!-- 향상된 for문(읽어오기만 할 것이기 때문)으로 list에 있는 값 순차적으로 출력 -->
                    <!-- 글번호 말머리 제목 작성자 작성일 조회수 좋아요 -->
                        <% for(Community c : list) {%>
                            <% if(!c.getCommunityCategory().equals("공지")) { %>
                                <tr style="border: 1px solid lightgray;">
                            <% } else { %>
                                <tr style="border: 1px solid lightgray; font-weight: bolder; background-color: ghostwhite;">
                            <% } %>
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

                $('.list-area>tbody>tr').click(function(){ // 게시글 리스트 클릭 시 
                    
                    var loginUser = '<%= loginUser %>'

                	if(loginUser != 'null') { // 로그인정보가 있으면 게시글을 열람할 수 있게 요청

                    location.href = "<%= contextPath %>/detail.cm?cno=" + $(this).children().eq(0).text();
                    }
                    else{ // 로그인정보가 없으면 로그인 화면으로 보내버리기
                        alert("로그인 후 이용해주시기 바랍니다.");
                        location.href = "<%= contextPath %>/login.me"
                    }

                })

            })
        </script>

        <!-- 커뮤니티 게시글 검색창 -->
        <div class="search-area" align="center">
            <form action="<%= contextPath %>/search.cm?currentPage=1" method="post" >
                <table>
					<tr>
						<td>
                            <select class="btn-sm" name="searchType">
								<option value="titleNcontent">제목 + 내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
                            </select>
						<script>
							$(function(){
								$('.search-area option').each(function(){
									// 내가 선택 요소에 차례대로 접근해서 요소의 value가 게시글 검색시 선택한 항목일 경우
									if($(this).val() == "<%= searchType %>") {
										
										// 해당 항목을 select 시키겠다
										$(this).attr('selected', true);
									}
								})
							})
						</script>
                        </td>
						<td><input type="text" class="" name="keyword" maxlength="10" value="<%= keyword %>"></td>
						<td><button type="submit" class="btn btn-secondary btn-sm"><img src="resources/images/searchbtn.png" width="15px" height="15px"  alt="검색버튼"></button></td>
                    </tr>
				</table>
            </form>
        </div>
        <br>


        <!-- 페이징 처리 영역 -->
        <div class="paging-area" align="center">

            <% if(currentPage != 1) { %>
            <!-- 이전 페이지로 이동 -->
            <button class="btn btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/search.cm?currentPage=<%= currentPage - 1 %>&searchType=<%= searchType%>&keyword=<%= keyword%>'">&lt;</button>
            <% } %>
            <% for(int i = startPage; i <= endPage; i++) { %>
                <% if(i != currentPage) { %>
                    <button class="btn btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/search.cm?currentPage=<%= i %>&searchType=<%= searchType%>&keyword=<%= keyword%>'"><%= i %></button>
                <%} else { %>
                    <button class="btn btn-secondary btn-sm" disabled><%= i %></button>
                <% } %>
            <% } %>
            <!-- 다음 페이지로 이동 -->
            <% if(currentPage != maxPage) { %>
            <button class="btn btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/search.cm?currentPage=<%= currentPage + 1 %>&searchType=<%= searchType%>&keyword=<%= keyword%>'">&gt;</button>
            <% } %>
            </div>
        <br>
    </div>
    <br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>