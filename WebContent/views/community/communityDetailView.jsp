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
	.reply-list{border: 1px solid grey; background-color: white;}
	.replyBtns:hover{color: coral;}
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
					<td>&nbsp;조회수 <%= c.getViews() %> / 좋아요 <%= c.getLikes() %> / 댓글  <%= c.getReplyCount() %> </td>
				</tr>
				<!-- 게시글 본문 -->
				<tr>
					<!-- 스포일러 주의문구 영역 / 기본값은 안보여지고, 스포일러포함여부에 따라 노출상태 변경 -->
					<td id="contentBlock" colspan='3' style='background-color:lightgray; display: none;'>
						<pre style='height: 550px; font-size: 35px; color:orangered; resize: none;'><br><br><br><br>         * 컨텐츠 스포일러가 포함된 글입니다. <br>             <a onclick='openContent();' class='' style=''>내용을 보시려면 클릭하세요</a></pre>
					</td>
					<!-- 게시글 본문 내용 영역 -->
					<td id="content" colspan="3">
						<% if (cf == null) {%> <!-- 첨부파일이 없으면 -->
						<pre style="height: 550px; font-size: 19px; resize: none;"><%= c.getCommounityContent() %></pre>
						<% } else { %> <!-- 첨부파일이 있으면 -->
						<pre style="height: 550px; font-size: 19px; resize: none;"><img src="<%= contextPath %><%= cf.getFilePath() + cf.getChangeName()%>" alt="이미지 안나오니" width="500" height="300"><br><%= c.getCommounityContent() %></pre>
						<% } %>
					</td>
				</tr>
	        	<tr>
					<% if (cf == null) {%>
	                    <!-- 첨부파일이 없을경우, 항목이 보여지지 않도록 -->
					<% } else { %>
							<!-- 첨부파일이 있을경우 -->
							<th>첨부파일</th>
							<td colspan="3">
		                    <a download="<%= cf.getOriginName() %>" href="<%= contextPath %><%= cf.getFilePath() + cf.getChangeName()%>">
		                    	&nbsp;<%= cf.getOriginName() %>
		                    </a>
	                <% } %>
	                </td>
	            </tr>
			</table>
			<br>
			<!-- 좋아요 / 신고 버튼 영역 -->
			<div style="margin-left: 100px;"><button onclick="checkLikes();" class="btn btn-sm btn-outline-success">좋아요</button>&nbsp;
				<button class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#myModal">신고하기</button>
			</div>
			<div align="center">
                <a href="<%= contextPath %>/list.cm?currentPage=1" style="background-color: rgb(80, 80, 80); color: white;" class="btn btn-secondary">글 목록으로 이동</a>
                <!-- <button type="button" class="btn btn-secondary" onclick="history.back();">이전 페이지로 이동</button> -->
        	<% if(loginUser != null && loginUser.getMemberNo() == c.getMemberNo()) { %>
        		<a href="<%= contextPath%>/updateForm.cm?cno=<%= c.getCommunityNo() %>" style="background-color: rgb(80, 80, 80); color: white;" class="btn btn-secondary" onclick="return confirm('게시글을 수정 하시겠습니까?')">수정</a>
				<a href="<%= contextPath%>/delete.cm?cno=<%= c.getCommunityNo() %>" style="background-color: rgb(80, 80, 80); color: white;" class="btn btn-secondary" onclick="return confirm('게시글을 삭제 하시겠습니까?')">삭제</a>
        	<% } %>
			</div>
			<br>
			<!-- 댓글 영역 -->
		<div class="reply-area">
			<table align="center" class="reply-list">
				<thead>
					<!-- 댓글 삽입되는 영역 -->
				</thead>
			</table>
			<br>
			<table border="1" align="center">
	            <tbody>
					<!-- 댓글 등록 폼 영역 -->
					<tr>
						<td colspan="6">
							<textarea id="replyContent" class="form-control" cols="120" rows="3" maxlength="600" style="resize: none; background-color: rgb(250, 250, 250);"></textarea>
							<td style="background-color: black;"><button style="height: 85px; background-color: black; color: white;" onclick="insertReply()" class="btn btn-sm">등록</button></td>
						</td>
					</tr>
	            </tbody>
	        </table>
		</div>
		<div class="container">
			<!-- 신고화면 모달 -->
			<div class="modal fade" id="myModal">
			  <div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				
				  <div class="modal-header">
					<h4 class="modal-title" style="color: red;">신고 사유</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				  </div>
				  
				  <!-- 신고사유 작성란 -->
				  <div class="modal-body">
				  	<textarea id="reportContent" class="form-control" cols="59" rows="5" style="resize: none;"></textarea>
				  </div>
				  
				  <!-- 신고 제출 버튼 -->
				  <div class="modal-footer">
					<button type="button" onclick="checkReportCommunity();" class="btn btn-danger" data-dismiss="modal">제출</button>
				  </div>

				</div>
			  </div>
			</div>
		  </div>
		<script>
			function selectReplyList(){ // 댓글 리스트 조회하기
				
				$.ajax({ 
					url : "rlist.cm",
					data : {cno : <%= c.getCommunityNo() %>},
					success : function(list){
	                	var result = "";
	                	var userNo = <%= loginUser.getMemberNo() %>
						$('#rcount').html(list.length)
	                	for(var i in list){ // for in 문 사용  ,  댓글 수만큼 반복 => 누적(문자열)
	                		result += "<tr id='rno" +  list[i].replyNo  + "'>"
	                		result += "<td style='text-align: center; width:50px;'>" + list[i].replyWriter + "</td>"
	                		result += "<td style='text-align: left; width:300px;'>" + list[i].replyContent + "</td>"
	                		result += "<td style='text-align: center; width: 70px;'>" + list[i].createDate + "</td>"
							result += "<td style='text-align: center; width: 25px;'><a onclick='replyOfReplyForm(" + list[i].replyNo + ");'>답글</a></td>"
							result += "<td style='text-align: center; width: 25px;'><a onclick='checkReportReply(" + list[i].replyNo + ");'>신고</a></td>"
	                	    if(userNo == list[i].memberNo){ // 현재 접속중인 회원의 회원번호와 해당 댓글을 작성한 회원의 회원번호가 일치하면
								
	                			result += "<td style='width:30px'><a onclick='return editReply(" + list[i].replyNo + ");'><img src='resources/images/modify.png' width='15px' height='15px'></a> &nbsp;&nbsp; <a onclick='deleteReply(" + list[i].replyNo + ");'><img src='resources/images/delete.png' width='15px' height='15px'></a></td>"
	                		}
	                		result += "</tr>"
							selectReplyOfReplyList(list[i].replyNo);
	                	}
	                	$(".reply-area thead").html(result);
	                },
	                error : function(){
	                    console.log("댓글목록 조회하기 실패")
	                }
				})
			}
			function selectReplyOfReplyList(rno){ // 대댓글 리스트 조회하기

				$.ajax({ 
					url : "rrlist.cm",
					data : {rno : rno},
					success : function(list){
	                	var result = "";
	                	var userNo = <%= loginUser.getMemberNo() %>
						// $('#rcount').html(list.length)
	                	for(var i in list){ // for in 문 사용  ,  댓글 수만큼 반복 => 누적(문자열)
	                		var memberNo = list[i].memberNo
	                		result += "<tr style='background-color:rgb(240, 240, 240);' id='rno" +  list[i].replyNo  + "'>"
	                		result += "<td style='text-align: center; width:50px;'>&nbsp;&nbsp;&nbsp;&nbsp;" + list[i].replyWriter + "</td>"
	                		result += "<td style='text-align: left; width:300px;'>┗&nbsp;&nbsp;" + list[i].replyContent + "</td>"
	                		result += "<td style='text-align: center; width: 70px;'>" + list[i].createDate + "</td>"
							result += "<td  colspan='2' style='text-align: center; width: 25px;'><a onclick='checkReportReply(" + list[i].replyNo + ");'>신고</a></td>"
	                	    if(userNo == list[i].memberNo){
	                		result += "<td style='width:30px;'><a onclick='return editReply(" + list[i].replyNo + ");'><img src='resources/images/modify.png' width='15px' height='15px'></a> &nbsp;&nbsp; <a onclick='deleteReply(" + list[i].replyNo + ");'><img src='resources/images/delete.png' width='15px' height='15px'></a></td>"
	                		}
	                		result += "</tr>"
	                	}
	                	$('#rno'+rno).after(result);
	                },
	                error : function(){
	                    console.log("대댓글 목록 조회하기 실패")
	                }
				})
			}
			
			$(function(){

				selectReplyList(); // 문서가 로드될 때 마다 댓글 리스트 조회 요청

				isSpoilerIncluded(); // 해당 게시글 작성자가 스포일러 포함 여부에 체크했으면, 게시글 본문 가려주기
	        })
		
		function isSpoilerIncluded(){ // 스포일러 포함 게시글 본문 가리기
				
			var spoiler = "<%= c.getSpoiler() %>"

			console.log(spoiler);

			if(spoiler == 'Y'){ // 게시글의 스포일러 포함 여부 값이 'Y'면 

				$("#content").hide() // 본문내용 안보이게 하기
				$("#contentBlock").show() // 스포일러 주의문구 보여주기
			}
		}

		function openContent(){ // 스포일러 주의문구 감추고, 본문 내용 보여주기

			$("#content").show()
			$("#contentBlock").hide()
		}


	    function insertReply(){ // 댓글 등록
			
			$.ajax({
				url : "rinsert.cm",
				data : {
					cno : <%= c.getCommunityNo() %>, // 글번호
					content : $("#replyContent").val() // 댓글내용
				},
				type : "post",
				success : function(result){
					
					// 결과값에 따라 댓글 작성 성공했으면 알림 띄우기
					if(result > 0){
						alert("댓글등록 완료");
						
						selectReplyList();
						
						$("#replyContent").val("") // 댓글 작성란 초기화
					}
				},
				error : function(){
					console.log("댓글 등록 AJAX실패");
				}
			})
		}

		function checkLikes(){ // 해당 회원이 이 게시글에 좋아요를 했는지 체크
			var cno = "<%= c.getCommunityNo() %>"
			$.ajax({
				url : "chklike.cm",
				data : {mno : <%= loginUser.getMemberNo() %>},
				success : function(lc){

					if(lc.likesCommunity != null){ // 가져온 likesCommunity의 값이 null이 아니면
						
						var likeCm = lc.likesCommunity.split(',');

						if(likeCm.indexOf(cno) != -1){ // 배열에 찾는 글번호가 있으면, 이미 좋아요를 누른 것
							iDontLikeIt() // 좋아요 취소 
						}
						else{ // 배열에 찾는 이 게시글 글번호가 없으면 좋아요를 누른 적 없는 것
							iLikeIt() // 그럼 좋아요 눌러주기
						}
					}
					else{// 가져온 likesCommunity의 값이 null 이면, 바로 좋아요를 눌러줘라
						iLikeIt()
					}
				},
				error : function(){
					console.log("좋아요 AJAX실패");
				}
			})
		}

		function iLikeIt(){ // 게시글 좋아요

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

		function iDontLikeIt(){ // 게시글 좋아요 취소

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

		function checkReportCommunity(){ // 게시글 신고하기 전 신고여부 체크
			var cno = "<%= c.getCommunityNo() %>"
			$.ajax({
				url : "chkreport.cm",
				data : {
					mno : <%= loginUser.getMemberNo() %>,
					cno : <%= c.getCommunityNo() %>
				},
				success : function(rc){

					if(rc.reportCommunity != null){ // 조회해온 likesCommunity의 값이 null이 아니면
						
						var reportCm = rc.reportCommunity.split(','); 

						if(reportCm.indexOf(cno) != -1){ // 배열에 찾는 글번호가 있으면, 이미 신고한 것
							alert("이미 신고한 게시글 입니다.");
						}
						else{ // 배열에 찾는 이 게시글 글번호가 없으면 신고한 적 없는 것
							reportCommunity() // 그럼 신고하기 실행
						}
					}
					else{// 조회해온 reportCommunity의 값이 null 이면, 바로 신고하기 실행
						reportCommunity()
					}
				},
				error : function(){
					console.log("게시글 신고 AJAX실패");
				}	
			})
		}

		function reportCommunity(){ // 게시글 신고 (신고 누적횟수 증가시키기)

			$.ajax({
				url : "report.cm",
				data : {
					mno : <%= loginUser.getMemberNo() %>,
					cno : <%= c.getCommunityNo() %>
				},
				success : function(report){
					
					if(report > 0){
						alert("해당 게시글을 신고했습니다.");
					}
					else{
						console.log('게시글 신고 실패 ㅜㅜ')
					}
				},
				error : function(){
					console.log("게시글 신고 카운트 증가 AJAX실패");
				}	
			})
		}

		function editReply(rno){ // 댓글 수정 버튼 눌렀을 때, 기존 입력값 가져와서 수정창으로 변경

			if(confirm('댓글을 수정 하시겠습니까?')){

				if($('.replyEditForm').html() == null){ // 수정창 여러개 열리는 것 방지

					$.ajax({
						url : "rselect.cm",
						data : {rno : rno}, // 댓글번호
						success : function(r){

							var result = "";

							result += "<td class='replyEditForm' style='text-align:center; width:70px'>" + r.replyWriter + "</td>"
							result += "<td><textarea id='updateReplyContent'cols='70' class='form-control' rows='2' maxlength='600' style='resize: none; background-color: rgb(250, 250, 250); margin-top : 5px; margin-bottom : 5px'>" + r.replyContent + "</textarea></td>"
							result += "<td style='text-align:center; width:100px;'>" + r.createDate + "</td>"
							result += "<td class='replyNo' style='display:none;'>" + rno + "</td>"
							result += "<td align='center'><a onclick='updateReply();' class='replyBtns'>수정</a></td>"
							result += "<td align='center'><a onclick='selectReplyList();' class='replyBtns'>취소</a></td>"

							$('#rno'+rno).html(result);
						},
						error : function(){
							console.log("댓글 수정창 띄우기 실패")
						}
					})
				}
			}
		}

	    function updateReply(){ // 댓글 수정
			
			$.ajax({ 
				url : "rupdate.cm",
				data : {
					content : $("#updateReplyContent").val(), // 댓글 수정내용
					rno : $('.replyNo').html() // 댓글번호
				},
				type : "post",
				success : function(result){
					
					// 결과값에 따라 댓글 수정 성공했으면 알림 띄우기
					if(result > 0){
						alert("댓글 수정완료.");
						
						selectReplyList(); // 수정 후 댓글 리스트 다시 불러오기
					}
				},
				error : function(){
					console.log("댓글 등록 AJAX실패");
				}
			})
		}

		function deleteReply(rno){ // 댓글 삭제

			if(confirm('댓글을 삭제 하시겠습니까?')){

				$.ajax({ 
					url : "rdelete.cm",
					data : {
						rno : rno, // 댓글번호
						cno : <%= c.getCommunityNo() %> // 글번호
					},
					success : function(result){
						
						// 결과값에 따라 댓글 삭제 성공했으면 알림 띄우기
						if(result > 0){
							alert("댓글 삭제완료.");
							
							selectReplyList();
						}
					},
					error : function(){
						console.log("댓글 삭제 AJAX실패");
					}
				})
			}
		}

		function replyOfReplyForm(rno){ // 대댓글 작성할 댓글 원문 밑에 작성창 띄워주기,
				
			if($('.replyOfReplyForm').html() == null){ // 대댓글 작성창 여러개 생성 방지
 
				var result = "";
		
				result += "<td class='replyOfReplyForm'>"
				result += "<td colspan='2'>"
				result += "<textarea id='reReplyContent' class='form-control' cols='120' rows='2' maxlength='600' style='resize: none; background-color: rgb(250, 250, 250);'></textarea>"
				result += "<td align='center'><a class='replyBtns' onclick='insertReplyOfReply("+ rno +");'>등록</a></td>"
				result += "<td align='center'><a class='replyBtns' onclick='selectReplyList();'>취소</a></td>"
				result += "</td>"
				$('#rno'+rno).after(result);
			}
		}

		function insertReplyOfReply(rno){ // 대댓글 작성

			$.ajax({
				url : "rrinsert.cm",
				data : {
					rno : rno, // 대댓글 작성할 원 댓글의 댓글번호
					cno : <%= c.getCommunityNo() %>, // 글번호
					content : $("#reReplyContent").val() // 댓글내용
				},
				type : "post",
				success : function(result){
					
					// 결과값에 따라 댓글 작성 성공했으면 알림 띄우기
					if(result > 0){
						alert("댓글등록 완료"); // 대댓글 등록 완료

						selectReplyList(); // 댓글 리스트 재요청
					}
				},
				error : function(){
					console.log("대댓글 등록 AJAX실패");
				}
			})
		}

		function checkReportReply(rno){  // 댓글 신고하기 전 신고여부 체크

			if(confirm('해당 댓글을 신고 하시겠습니까?')){

				$.ajax({
					url : "chkreport.re",
					data : {
						mno : <%= loginUser.getMemberNo() %>
					},
					success : function(rr){

						if(rr.reportReply != null){ // 조회해온 reportReply 값이 null이 아니면
							
							var reportRp = rr.reportReply.split(',');

							if(reportRp.indexOf(rno+'') != -1){ // 배열에 찾는 댓글번호가 있으면, 이미 신고한 것
								alert("이미 신고한 댓글 입니다.");
							}
							else{ // 배열에 찾는 댓글번호가 없으면 신고한 적 없는 것
								reportReply(rno) // 그럼 신고하기 실행
							}
						}
						else{// 조회해온 reportReply의 값이 null 이면, 바로 신고하기 실행
							reportReply(rno)
						}
					},
					error : function(){
						console.log("댓글 신고 AJAX실패");
					}	
				})
			}
		}

		function reportReply(rno){ // 댓글 신고 (신고 누적횟수 증가시키기)

			$.ajax({
				url : "report.re",
				data : {
					mno : <%= loginUser.getMemberNo() %>,
					rno : rno
				},
				success : function(report){
					
					if(report > 0){
						alert("해당 댓글을 신고했습니다.");
					}
					else{
						console.log('게시글 신고 실패 ㅜㅜ')
					}
				},
				error : function(){
					console.log("게시글 신고 카운트 증가 AJAX실패");
				}	
			})
		}

		</script>
		
	</div>
	<br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>