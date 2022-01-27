<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.movinial.community.model.vo.*" %>
<%
	Community c = (Community)request.getAttribute("c");
	CommunityFile cf = (CommunityFile)request.getAttribute("cf");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMINITY 게시글 수정</title>
<style>
	.outer{
	    color: black;
	    width: 1200px;
	    height: 100%;
	    margin: auto;
	    margin-top: 50px;
	}
	
	table{
		border: 0.1px solid black;
		width: 1000px;
	}
	table th{text-align: center;}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<div class="outer">
	
		<br>
        <h1 style="margin-left: 100px; margin-bottom: 25px;">COMMUNITY</h1>
        
		<form id="update-form" action="<%= contextPath %>/update.cm" method="post" enctype="multipart/form-data">
			<div align="right" style="width:1100px; color: red; font-weight: bold;">
				<input type="checkbox" class="form-check-input" name="spoiler">컨텐츠 스포일러가 포함된 글이면 체크해 주세요.
			</div>
			<!--  input 태그의 hidden 타입으로 해당 게시글 번호 넘기기 -->
			<input type="hidden" name="cno" value="<%= c.getCommunityNo() %>">
			
			<table align="center" border="1">
				<tr>
					<th width="100">제목</th>
					<td colspan="6" width="800"><input type="text" name="title" value="<%= c.getCommunityTitle() %>" class="form-control" placeholder="제목을 입력해 주세요 ^_^" maxlength="80" required></td>
				</tr>
				<tr>
					<th>말머리</th>
					<td colspan="6">
						<select class="form-control" name="category">
							<!-- <option value="notice">공지</option> --> <!-- 로그인 아이디가 관리자면 보여지도록 --> 
							<option>일반</option>
							<option>정보</option>
							<option>리뷰</option>
						</select>
						<script>
							$(function(){
								$('#update-form option').each(function(){ // 최초 게시글 작성시 선택한 카테고리를 수정시 기본값으로 선택
									
									if($(this).text() == "<%= c.getCommunityCategory() %>") {
										
										$(this).attr('selected', true);
									}
								})
								$('.form-check-input').each(function(){ // 최초 게시글 작성시 스포일러포함 여부 체크박스를 수정시 기본값으로 선택
									
									if("Y" == "<%= c.getSpoiler() %>") {
										
										$(this).attr('checked', true);
									}
								})

							})
						</script>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
					<% if(cf != null) { %> <!-- 기존 파일이 있으면 -->
						<%= cf.getOriginName() %> <!-- 원본 파일명 가져와서 보여주기 -->
						<input type="hidden" name="originFileNo" value="<%= cf.getFileNo() %>">
						<input type="hidden" name="originFileName" value="<%= cf.getChangeName() %>">
						
					<% } %>
					<!-- 수정할 파일 입력란-->
					<input type="file" class="form-control-file border" name="reUpfile" onchange="contentImg(this);">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<img id="img" width="900" style="display:none;"> <!-- 이미지 미리보기 영역 기본적으로 숨겨져있음 -->
						<textarea class="form-control" name="content" rows="20" style="resize: none;" required><%= c.getCommounityContent() %></textarea>
					</td>
				</tr>
			</table>
			<script>
				function contentImg(inputFile){
	
					if(inputFile.files.length == 1){ // 파일이 있는 경우
	
						var reader = new FileReader();
	
						reader.readAsDataURL(inputFile.files[0]);
	
							reader.onload = function(e){
							// 이미지 미리보기, 선택한 영역에 이미지를 넣으며 감추어져있던 영역이 보여지게함
							$("#img").attr("src", e.target.result).css('display', 'flex');
						}
					}
					else { // 파일 선택후 취소하는 경우
							// 미리보기 사라지게 하기
							$("#img").attr("src", null);
					}
				}
			</script>


			<br>

			<div align="center">
				<button type="submit" class="btn btn-warning">게시글 수정</button>
				<a href="<%= contextPath %>/list.cm?currentPage=1" class="btn btn-secondary">목록으로 돌아가기</a>
                <button type="button" class="btn btn-secondary" onclick="history.back();">이전 페이지로 이동</button>
			</div>
			<br><br>
		</form>
	</div>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>