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
	.reply-list{border: 1px solid grey; background-color: rgb(234, 247, 255);}
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
	                <th>첨부파일</th>
	                <td colspan="3">
	                    <!-- 첨부파일이 없을경우 -->
	                    <% if (cf == null) {%>
	                     &nbsp; 
						<% } else { %>
		                    <!-- 첨부파일이 있을경우 -->
		                    <a download="<%= cf.getOriginName() %>" href="<%= contextPath %><%= cf.getFilePath() + cf.getChangeName()%>">
		                    	<%= cf.getOriginName() %>
		                    </a>
	                    <% } %>
	                </td>
	            </tr>
			</table>
			<br>

			<div align="center">
                <a href="<%= contextPath %>/list.cm?currentPage=1" class="btn btn-secondary">목록가기</a>
                <button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
        	<% if(loginUser != null && loginUser.getMemberNo() == c.getMemberNo()) { %>
        		<a href="<%= contextPath%>/updateForm.bo?bno=<%= c.getCommunityNo() %>" class="btn btn-warning">수정</a>
        		<a href="<%= contextPath%>/delete.bo?bno=<%= c.getCommunityNo() %>"" class="btn btn-danger" id="deleteNotice">삭제</a>
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
							<textarea id="replyContent" class="form-control" cols="120" rows="3" style="resize: none; background-color: rgb(235, 235, 235);"></textarea>
							<td><button onclick="insertReply();" class="btn btn-sm btn-secondary">등록</button></td>
						</td>
					</tr>
	            </tbody>
	        </table>
		</div>
		<script>
			function selectReplyList(){
				
				$.ajax({
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
			
			$(function(){
	             selectReplyList();

	            //  setInterval(selectReplyList, 5000);
	        })
	    function insertReply(){
			
			$.ajax({
				url : "rinsert.cm",
				data : {
					content : $("#replyContent").val(), // text()가 아닌 val()로 가져가야 함
					cno : <%= c.getCommunityNo() %>
				},
				type : "post",
				success : function(result){
					
					// result 값에 따라서 성공했으면 성공메시지 띄워주기 alert()
					if(result > 0){
						alert("댓글이 등록 되었습니다.");
						
						selectReplyList();
						
						$("#replyContent").val("") // 작성란 초기화
					}
				},
				error : function(){
					console.log("댓글 등록 AJAX실패");
				}
				
			})
			
		}
		</script>
		
	</div>
	<br><br>
    <%@ include file = "../common/footer.jsp" %>
</body>
</html>