<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.movinial.community.model.vo.*" %>
<%
	Community c = (Community)request.getAttribute("c");
	CommunityFile cf = (CommunityFile)request.getAttribute("cf");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITY 상세보기</title>
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
	.replyWriter{text-align: center; width:50px;}
	.replyContent{text-align: left; width:300px;}
	.replyCreateDate{text-align: center; width: 60px;}
	.reply-list{border: 1px solid grey; background-color: rgb(245, 250, 250);}
</style>
</head>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<div class="outer">

        <br>
        <h1 style="margin-left: 100px; margin-bottom: 25px;">COMMUNITY</h1>

			<table align="center" border="1">
				<tr>
					<td style="font-weight: bolder; text-align: center;">&nbsp;<%= c.getCommunityCategory() %></td> <!-- 말머리(카테고리) -->
					<td style="font-weight: bolder;" colspan="6">&nbsp;<%= c.getCommunityTitle() %></td> <!-- 제목 -->
				</tr>
                <tr>
                    <td width="110" style="text-align: center;"><%= c.getCommunityWriter() %></td> <!-- 작성자 -->
                    <td width="105" style="text-align: center;"><%= c.getCreateDate() %></td> <!-- 작성일 -->
					<td>&nbsp;조회수 <%= c.getViews() %> / 좋아요 <%= c.getLikes() %> / 댓글 <span id="rcount"></span></td>
                </tr>
				<tr>
					<th style="display: none;">첨부이미지</th>
					<td colspan="3">
						<% if (cf == null) {%>
						<pre style="height: 550px;"><%= c.getCommounityContent() %></pre>
						<% } else { %>
						<pre style="height: 550px;"><img src="<%= contextPath %><%= cf.getFilePath() + cf.getChangeName()%>" alt="이미지 안나오니" width="500" height="300"><br><%= c.getCommounityContent() %></pre>
						<% } %>
					</td>
				</tr>
	            <tr>
					<% if (cf == null) {%>
	                    <!-- 첨부파일이 없을경우 -->
						<!-- 첨부파일 항목이 보여지지 않도록. -->
					<% } else { %>
							<!-- 첨부파일이 있을경우 -->
							<th>첨부파일</th>
							<td colspan="3">
		                    <a download="<%= cf.getOriginName() %>" href="<%= contextPath %><%= cf.getFilePath() + cf.getChangeName()%>">
		                    	<%= cf.getOriginName() %>
		                    </a>
	                <% } %>
	                </td>
	            </tr>
			</table>
			<br>
			<!-- 좋아요 / 신고 버튼 영역 -->
			<div style="margin-left: 100px;"><button onclick="checkLikes();" class="btn btn-sm btn-outline-success">좋아요</button>&nbsp;<button class="btn btn-sm btn-outline-danger">신고하기</button></div>
			<div align="center">
                <a href="<%= contextPath %>/list.cm?currentPage=1" class="btn btn-secondary">목록으로 돌아가기</a>
                <!-- <button type="button" class="btn btn-secondary" onclick="history.back();">이전 페이지로 이동</button> -->
        	<% if(loginUser != null && loginUser.getMemberNo() == c.getMemberNo()) { %>
        		<a href="<%= contextPath%>/updateForm.cm?cno=<%= c.getCommunityNo() %>" class="btn btn-warning" onclick="return confirm('게시글을 수정 하시겠습니까?')">수정</a>
        		<a href="<%= contextPath%>/delete.cm?cno=<%= c.getCommunityNo() %>"" class="btn btn-danger" onclick="return confirm('게시글을 삭제 하시겠습니까?')">삭제</a>
        	<% } %>
			</div>
			<br>
		<div class="reply-area">
			<table align="center" class="reply-list">
				<thead>

				</thead>
			</table>
			<br>
			<table border="1" align="center">
				<!-- 댓글 영역 -->
	            <tbody>
					<tr>
						<td colspan="6">
							<textarea id="replyContent" class="form-control" cols="120" rows="3" style="resize: none; background-color: rgb(250, 250, 250);"></textarea>
							<td style="background-color: gray;"><button style="height: 85px;" onclick="insertReply();" class="btn btn-sm btn-secondary">등록</button></td>
						</td>
					</tr>
	            </tbody>
	        </table>
		</div>
		<script>

			function selectReplyList(){ // 댓글 작성
				
				$.ajax({ // 댓글 리스트 조회하기
					url : "rlist.cm",
					data : {cno : <%= c.getCommunityNo() %>},
					success : function(list){
	                	var result = "";
						$('#rcount').html(list.length)
	                	for(var i in list){ // for in문 사용  ,  댓글 수만큼 반복 => 누적(문자열)
	                		result += "<tr>"
	                			   + "<td class='replyWriter'>" + list[i].replyWriter + "</td>"
	                			   + "<td class='replyContent'>" + list[i].replyContent + "</td>"
	                			  + "<td class='replyCreateDate'>" + list[i].createDate + "</td>"
	                			   + "</tr>";
	                	}
	                	$(".reply-area thead").html(result);
	                },
	                error : function(){
	                    console.log("댓글목록 조회하기 실패")
	                }
				})
			}
			
			$(function(){ // 문서가 로드될때 마다 실행
	             selectReplyList();

	            //  setInterval(selectReplyList, 5000);
	        })
	    function insertReply(){
			
			$.ajax({ // 댓글 작성
				url : "rinsert.cm",
				data : {
					content : $("#replyContent").val(), // text()가 아닌 val()로 가져가야 함
					cno : <%= c.getCommunityNo() %>
				},
				type : "post",
				success : function(result){
					
					// 결과값에 따라 댓글 작성 성공했으면 알림 띄우기
					if(result > 0){
						alert("댓글 등록완료.");
						
						selectReplyList();
						
						$("#replyContent").val("") // 댓글 작성란 초기화
					}
				},
				error : function(){
					console.log("댓글 등록 AJAX실패");
				}
				
			})
			
		}
		function checkLikes(){
			var cno = "<%= c.getCommunityNo() %>"
			$.ajax({
				url : "chklike.cm",
				data : {mno : <%= loginUser.getMemberNo() %>},
				success : function(lc){
					
					var likeCm = lc.likesCommunity.split(',');

					if(likeCm.indexOf(cno) != -1){ // 배열에 찾는 글번호가 있으면, 이미 좋아요를 누른 것
						// console.log('응~ 이미 좋아요 눌렀어~')
						iDontLikeIt()
					}
					else{ // 배열에 찾는 이 게시글 글번호가 없으면 좋아요를 누른 적 없는 것
						iLikeIt() // 그럼 좋아요 눌러주기
					}

				},
				error : function(){
					console.log("좋아요 AJAX실패");
				}	
			})
		}

		function iLikeIt(){

			$.ajax({
				url : "like.cm",
				data : {
					mno : <%= loginUser.getMemberNo() %>,
					cno : <%= c.getCommunityNo() %>
				},
				success : function(like){
					
					if(like > 0){
						alert("해당 게시글을 좋아합니다.");
					}
					else{
						console.log('좋아요 실패 ㅜㅜ')
					}
				},
				error : function(){
					console.log("좋아요 AJAX실패");
				}	
			})
		}
		function iDontLikeIt(){

			$.ajax({
				url : "dislike.cm",
				data : {
					mno : <%= loginUser.getMemberNo() %>,
					cno : <%= c.getCommunityNo() %>
				},
				success : function(dislike){
					if(dislike > 0){
						alert("해당 게시글 좋아한거 취.소.");
					}
					else{
						console.log('좋아요 취소 실패 ㅜㅜ')
					}
				},
				error : function(){
					console.log("좋아요 철회! AJAX실패");
				}	
			})
		}
		
		</script>
		
	</div>
	<br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>