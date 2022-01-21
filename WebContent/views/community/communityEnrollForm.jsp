<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY 게시글 작성</title>
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
	#enroll-form>table th{text-align: center;}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<div class="outer">

		<br>
		<h2 align="center">일반게시판 작성하기</h2>
		<br>
		<!--  파일첨부 요청시 enctype="multipart/form-data" 필수로 지정 -->
		<form id="enroll-form" action="<%= contextPath %>/insert.cm" method="post" enctype="multipart/form-data">
			<!-- 카테고리,제목,내용,첨부파일 입력받기 -->
			<!--  작성자의 회원번호를 hidden으로 같이 넘길 것!!! -->
			<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
			
			<table align="center">
				<tr>
					<th width="100">말머리</th>
					<td width="500">
						<select name="category">
							<option  type="hidden">공지</option>
							<option  type="hidden">일반</option>
							<option  type="hidden">정보</option>
							<option  type="hidden">리뷰</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" rows="10" style="resize: none;" required></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
			</table>

			<br>

			<div align="center">
				<button type="submit" class="btn btn-sm btn-primary">작성하기</button>
				<button type="reset" class="btn btn-sm btn-secondary">취소</button>
			</div>

		</form>
	</div>

</body>
</html>