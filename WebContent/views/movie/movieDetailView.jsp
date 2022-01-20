<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.movie.model.vo.Movie" %>
<%
	// Movie m = (Movie)request.getAttribute("m");

	// int mno = m.getMovieNo();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 페이지</title>
<style>
	table {
		border: solid 1px black;
	}
	table td {
		border: solid 1px black;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

		<!-- 영화 상세 정보 -->
		<div class="content">
			<table>
				<tr>
					<td rowspan="7">
						<img src="영화이미지" alt="영화 포스터">
					</td>
					<td>
						<h2>영화제목</h2>
					</td>
					<td>
						<h3>이 영화 보셨나요?</h3>
					</td>
					<td>
						<img src="../../resources/images/movie_seen_icon.png" alt="봤어요 아이콘"> 봤어요 숫자 2222
					</td>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>
				<tr>
					<td colspan="5">
						개요 <br>
						천문학과 대학원생 케이트 디비아스키(제니퍼 로렌스)와 담당 교수 랜들 민디 박사(레오나르도 디카프리오)는 태양계 내의 궤도를 돌고 있는 혜성이 지구와 직접 충돌하는 궤도에 들어섰다는 엄청난 사실을 발견한다. 하지만 지구를 파괴할 에베레스트 크기의 혜성이 다가온다는 불편한 소식에 아무도 신경 쓰지 않는다. 지구를 멸망으로 이끌지도 모르는 소식을 사람들에게 알리기 위해 언론 투어에 나선 두 사람, 혜성 충돌에 무관심한 대통령 올리언(메릴 스트립)과 그녀의 아들이자 비서실장 제이슨(조나 힐)의 집무실을 시작으로 브리(케이트 블란쳇)와 잭(타일러 페리)이 진행하는 인기 프로그램 ‘더 데일리 립’ 출연까지 이어가지만 성과가 없다. 혜성 충돌까지 남은 시간은 단 6개월, 24시간 내내 뉴스와 정보는 쏟아지고 사람들은 소셜미디어에 푹 빠져있는 시대이지만 정작 이 중요한 뉴스는 대중의 주의를 끌지 못한다. 도대체 어떻게 해야 세상 사람들이 하늘을 좀 올려다볼 수 있을까?!
					</td>
				</tr>
				<tr>
					<td colspan="5">
						개봉년도 2222
						
					</td>
				</tr>
				<tr>
					<td colspan="5">
						제작국가
						미국
					</td>
				</tr>
				<tr>
					<td colspan="5">
						감독
						내가 감독
					</td>
				</tr>
				<tr>
					<td colspan="5">
						제작사
						내가 만듦
					</td>
				</tr>
			</table>
		</div>


		<!-- 리뷰 -->
		<div class="content">
			<table>

				<!-- 리뷰 제목 -->
				<tr>
					<td>
						<h2>리뷰</h2>
					</td>
					<td align="right">
						<a href="<%= contextPath %>/reviewList.mo">MORE</a>
					</td>
				</tr>

				<!-- 리뷰 게시글 한 개당 목록 -->
				<!-- 영화 상세 페이지에서 5개만 출력 -->
				<tr>
					<td>
						유저 닉네임
					</td>
					<td>
						작성일 2222/11/22 12:34:56<a type="button" class="btn btn-info" data-toggle="modal" data-target="#reportForm">신고하기</a>
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<img src="" alt="유저 프로필 이미지 경로">
					</td>
					<td>
						듣기만 하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온
					</td>
				</tr>
				<tr>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>

				<tr>
					<td>
						유저 닉네임
					</td>
					<td>
						작성일 2222/11/22 12:34:56<a href="">신고하기</a> <!-- MODAL -->
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<img src="" alt="유저 프로필 이미지 경로">
					</td>
					<td>
						듣기만 하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온
					</td>
				</tr>
				<tr>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>

				<tr>
					<td>
						유저 닉네임
					</td>
					<td>
						작성일 2222/11/22 12:34:56<a href="">신고하기</a> <!-- MODAL -->
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<img src="" alt="유저 프로필 이미지 경로">
					</td>
					<td>
						듣기만 하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온
					</td>
				</tr>
				<tr>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>

				<tr>
					<td>
						유저 닉네임
					</td>
					<td>
						작성일 2222/11/22 12:34:56<a href="">신고하기</a> <!-- MODAL -->
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<img src="" alt="유저 프로필 이미지 경로">
					</td>
					<td>
						듣기만 하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온
					</td>
				</tr>
				<tr>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>

				<tr>
					<td>
						유저 닉네임
					</td>
					<td>
						작성일 2222/11/22 12:34:56<a href="">신고하기</a> <!-- MODAL -->
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<img src="" alt="유저 프로필 이미지 경로">
					</td>
					<td>
						듣기만 하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온
					</td>
				</tr>
				<tr>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 숫자 2222
					</td>
				</tr>
			</table>
		</div>

		
		<!-- Modal 영역 -->
		<!-- 신고하기 -->
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
	
							<button type="submit" class="btn btn-info btn-sm">비밀번호 변경</button>
					</form>
				</div>
			</div>
			</div>
		</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>