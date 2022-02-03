<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY 게시글 작성</title>
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

		<form action="<%= contextPath %>/insert.cm" method="post" enctype="multipart/form-data">
			<div align="right" style="width:1100px; color: red; font-weight: bold;" >
				<input type="checkbox" class="form-check-input" name="spoiler">컨텐츠 스포일러가 포함된 글이면 체크해 주세요.
			</div>
			<!--  input 태그의 hidden 타입으로 게시글 작성하는 회원번호 넘기기 -->
			<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">
			<table align="center" border="1">
				<tr>
					<th width="100">제목</th>
					<td colspan="6" width="800"><input type="text" name="title" class="form-control" placeholder="제목을 입력해 주세요 ^_^" maxlength="70" required></td>
				</tr>
				<tr>
					<th>말머리</th>
					<td colspan="6">
						<select class="form-control" name="category">
	<!-- <option value="notice">공지</option> --> <!-- 공지 글 작성은 관리자만 가능 -> 로그인 아이디가 관리자면 보여지도록 -->
							<% if(loginUser.getMemberId().equals("admin")) { %>
							<option>공지</option>
							<% } %>
							<option selected >일반</option>
							<option>정보</option>
							<option>리뷰</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이미지첨부</th>
					<td colspan="6" class="form-group">
						<input type="file" class="form-control-file border" name="upfile" onchange="contentImg(this);">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<img id="img"  style="display:none;"> <!-- 이미지 미리보기 영역, 숨겨져있음 -->
						<textarea class="form-control" name="content" rows="20" maxlength="1300" style="resize: none;" required></textarea>
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
						
						$("#img").attr("src", null); // 미리보기 사라지게 하기
				}
			}
		</script>
			<br>
			<div align="center">
				<button type="submit" class="btn btn-secondary" style="background-color: black; color: white;">게시글 등록</button>
				<a href="<%= contextPath %>/list.cm?currentPage=1" class="btn btn-secondary" style="background-color: rgb(80, 80, 80); color: white;">목록으로 돌아가기</a>
			</div>
		</form>
		<br><br>
	</div>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>