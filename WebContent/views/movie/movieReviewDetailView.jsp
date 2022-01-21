<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.movinial.review.model.vo.Review, com.movinial.common.model.vo.PageInfo" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
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
<title>리뷰 상세보기</title>
<style>
	.enroll-form>textarea {
		resize: none;
	}
    .enroll-form>div {
        display: inline-block;
    }
	.paging-area>a:hover {
		cursor: pointer;
	}

</style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>

        <!-- 리뷰 상세보기: 영화 상세 정보 -->
        <div class="content reviewDetailTitle">

            <h2>리뷰 상세보기</h2>

            <br><br>

            <table>
                <tr>
                    <td>
                        <h2>영화제목</h2>
                    </td>
                    <td align="right">
                        <img src="영화이미지" alt="영화 포스터">
                    </td>
                </tr>
            </table>
        </div>

        <!-- 리뷰 -->
        <div class="content">
            <table>
            
            	<!-- 조회된 리뷰가 없을 때 -->
            	<% if(list.isEmpty()) { %>
            	
	            	<tr>
	            	    <td colspan="6">조회된 리뷰가 없습니다.</td>
	            	</tr>
	            	
            	<% } else {%>
            	
            		 <!-- 리뷰 10개 출력 -->
            		<% for(Review r: list) { %>
		                <tr>
		                    <td>
		                    	<%= r.getReviewWriter() %>
		                    </td>
		                    <td>
                                작성일 <%= r.getCreateDate() %> <a type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#reportForm">신고하기</a><!-- MODAL -->
		                    </td>
		                </tr>
		                <tr>
		                    <td rowspan="2">
		                        <img src="" alt="유저 프로필 이미지 경로">
		                    </td>
		                    <td>
		                    	<p>
		                    		<%= r.getReviewContent() %>
		                    	</p>
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <img src="" alt="좋아요 아이콘"> 좋아요 <%= r.getLikes() %>
		                    </td>
		                </tr>
	                <% } %>
	                
                <% } %>
                
            </table>

            <br><br>

            <!-- 리뷰 작성 -->
            <form action="" method="post" class="enroll-form">

                <textarea class="form-control" name="reviewContent" cols="200" rows="7" placeholder="해당 영화에 관련된 리뷰만 작성하시기 바랍니다.&#13;&#10;광고성 글, 비방글, 욕설 등 부적절한 내용이 포함될 시 신고 될 수 있으며, 부적절한 컨텐츠로 판단되면 별도의 안내없이 삭제 조치 될 수 있습니다."></textarea>

                <br>
                <div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="reviewShow" value="Y" id="public">
                            <label for="public">공개</label>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="reviewShow" value="N" id="private">
                            <label for="private">비공개</label>
                        </label>
                    </div>
                </div>

                    <button type="submit" class="btn btn-sm btn-secondary" align="right">등록</button>

            </form>



			<!-- 페이징바 -->
			<div class="paging-area" align="center">

				<!-- 페이징 버튼 -->
				<!-- 페이징바에서 < 를 담당: 이전페이지 이동 -->
				<% if(currentPage != 1) { %>
					<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage - 1 %>'">&lt;</a>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++) { %>
					<% if(i != currentPage) { %>
						<!-- http://localhost:8001/jsp/list.bo?currentPage=8 -->
						<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= i %>'"><%= i %></a>
					<% } else { %>
						<a class="btn-secondary btn-sm" disabled><%= i %></a>
					<% } %>
				<% } %>
				
				<!-- 페이징바에서 > 를 담당: 다음페이지 이동 -->
				<% if(currentPage != maxPage) { %>
					<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage + 1 %>'">&gt;</a>
				<% } %>

			</div>



        </div>

        <!-- 리뷰 신고 Modal -->
        <div class="modal fade" id="reportForm">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
		
			        <!-- Modal Header -->
			        <div class="modal-header">
				        <h4 class="modal-title">신고 사유</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
		
				    <!-- Modal body -->
				    <div class="modal-body">
					    <form action="신고처리할 서블릿" method="post">
							<table>
								<textarea name="reportContent" cols="60" rows="10" style="resize: none;"></textarea>
							</table>

							<br>
	
							<button type="submit" class="btn btn-secondary">신고</button>
                            <!-- <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">취소</button> -->
					    </form>
				    </div>

			    </div>
			</div>
		</div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>