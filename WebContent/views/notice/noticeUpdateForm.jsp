<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.notice.model.vo.Notice" %>    
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>

	div{
		/* border: 1px solid black; */
	}

	#allDiv{
		width: 100%;
		text-align: center;
	}
	.outer{
		width: 1000px;
		margin: auto;

	}
	#div1{
		width: 100%;
		height: 40px;
		border: 1px solid black;
		margin-bottom: 2px;
	}
	#div1_1{
		width: 20%;
		float: left;
	}
	#div1_2{
		width: 80%;
		float: left;
	}

	#div2{
		width: 100%;
		height: 400px;
		border: 1px solid black;
	}
	#div2_1{
		width: 20%;
		height: 100%;
		float: left;
		margin: auto;
		padding: auto;
		text-align: center;
		vertical-align: middle;
	}
	#div2_2{
		width: 80%;
		float: left;
	}
	
	
</style>
</head>
<body>

	 <%@ include file="../common/header.jsp" %>
	 <br>
	 <div id="allDiv">
	 	<div class="outer" align='center'>
	
			<br>
	
			<h2 align='center'>공지사항 수정</h2>
			<br>
			<form id="update-form" action="<%= contextPath %>/update.no" method="post">
				<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">

				<div id="div1">
					<div id="div1_1">제목</div>
					<div id="div1_2"><input style="width : 800px; height: 40px;" size="20px" type="text" name="noticeTitle" value="<%= n.getNoticeTitle() %>" required></div>
				</div>
				
				<div id="div2">
					<div id="div2_1">내용</div>
					<div id="div2_1">
						<textarea name="noticeContent" style="width : 800px; height: 400px;" rows="10" style="resize: none;" required><%= n.getNoticeContent() %></textarea>
					</div>
				</div>
				
				<br></br>
	
				<div align="center">
					<button type="submit" class="btn btn-secondary">등록하기</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
					<!-- history.back() : 이전 페이지로 돌아가게 해주는 함수 -->
					
				</div>
			</form>
		</div>	 
	 
	 
	 </div>
	 <br><br>
	 <%@ include file="../common/footer.jsp" %>

</body>
</html>