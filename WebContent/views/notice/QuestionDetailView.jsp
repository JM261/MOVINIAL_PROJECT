<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "com.movinial.notice.model.vo.*" %>    
<%
	Question q = (Question)request.getAttribute("q");  // : Object
	//게시글번호,  카테고리명, 제목, 내용, 작성자 아이디, 작성일
	
	Qfile at = (Qfile)request.getAttribute("at");	  // : Object	
	// at => attachment 객체 = 파일번호, 원본명, 수정명, 저장경로

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의 내역</title>
</head>
<body>
<style>
    .outer{
        border: 1px solid #bcbcbc; 
    	width: 1100px; 
    	height:1300px;
    	margin: auto;
    	margin-bottom: 30px;
    }
    
    .detail-area{
	    border: 1px solid #bcbcbc; 
	    font-size: 22px;  
	    width: 1000px;
        height:500px;
	}
    
    .btn-area{
	    width : 800px;
	    height: 80px;
	    
	}
	.btn-area>a{
	    color:white;
	    font-size: 25px;
	    margin-left: 50px;
	    text-decoration: none;
	    text-align:center;
	}

	#h2{
    font-weight: bold;
	}
	
    td{
    height: 55px;
	}
	table td, table th {
	    border: 1px solid #bcbcbc;
	}
	.tableWidth{
	    height: 30px;
	}
	table tr th{
	width:110px;
    background: #f7f5f5;
    }
	
	.qbtn{
	height : 50px;
	}
	
	#listFont{
	font-size:22px;
	}
    
    .reply-area{
    	border: 1px solid #bcbcbc; 
	    font-size: 22px;  
	    width: 1000px;
        height: 110px;
		text-align: center;
		
    }
    
	textarea:focus{
		outline: none;
	}
   .reply1{
	   height: 150px;
	   
   }
   
</style>
</head>
<body>

	 <%@ include file="../common/header.jsp" %>

    <div class="outer">
        <br>
        <h2 id="h2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터</h2>
        <br>
        <div class="btn-area">
            <a href="<%=contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">공지사항 &nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/FAQList.no" class="btn btn-sm btn-secondary" style="background: black;">FAQ&nbsp;&nbsp;&nbsp;</a>
            
            <%if(loginUser != null && !(loginUser.getMemberId().equals("admin")) ){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary" style="background: black;">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">나의 문의내역</a>
            <%} %>
        </div>

        <table align="center" class="detail-area" >
            <tr>
                <th class="tableWidth">카테고리</th>
                <td class="tableWidth"><%= q.getCategory() %></td> 
            	<th class="tableWidth">작성일</th>
                <td class="tableWidth"><%= q.getCreateDate() %></td>
            </tr> 
            <tr> 
                <th class="tableWidth">제목</th>
                <td class="tableWidth" colspan=3><%= q.getQnaTitle() %></td>
                
            </tr>
    
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height : 200px;"><%= q.getQnaContent() %></p>
                </td>
                
            </tr>

           <tr>
                <th>첨부파일</th>
                <td colspan="3">
                    <!-- 첨부파일이 없을 경우-->
                    <% if(at == null){ %>
                    	첨부파일이 없습니다.
					<%}else{ %>
	                    <!-- 첨부파일이 있을 경우-->
	                    <a download="<%= at.getOriginName() %>" href="<%=contextPath%>/<%= at.getFilePath()+at.getChangeName()%>">
	                    	<%= at.getOriginName() %>
	                    </a>
                	<%} %>
                </td>      
            </tr>  

        </table>
        <br>

	 <!-- 댓글창(답변) 만들기 -->

    <div id="reply-area">
        <table align="center" class="reply-area">
            <thead>
                <!-- 댓글 작성 영역 -->
                <!-- 로그인이 되어있을 경우 : 댓글 작성 가능 -->
                <%if(loginUser.getMemberId().equals("admin")){ %>
	                <tr>
	                    <th>답변 등록</th>
	                    <td class="reply1">
	                        <textarea class="replyContent"  cols="75" rows="1" style="resize: none; border:none;"></textarea>	    
	                    </td>
	                    <td><button onclick="insertAnswer()" class="btn btn-sm btn-info" style="background: black;">등록</button></td>
	                </tr>
				<%}else{ %>
	                <!-- 로그인이 되어있지 않을 경우 : 작성 불가능-->
	                <tr>
	                    <th>문의 답변</th>
	                    <td class="reply1">
	                        <textarea class="replyContent" readonly cols="80" rows="1" style="resize: none; border:none;">기다려주시면 문의내용에 답변해드리겠습니다.</textarea>
	                    </td>
	                </tr>
             	<%} %>
            </thead>
            <tbody>
               
            </tbody>
        </table>
      </div>  
      
      
      
         <script>
        function selectAnswerList(){

            $.ajax({
                url : "rlist.no",
                data : {qno : <%= q.getQnaNo() %>},
                success : function(list){

                	// 댓글 개수만큼 반복 => 누적(문자열)
                	var result = "";
                	for(var i in list){ // for in
                		result += "<tr>"
             			   	  
                			   + "<td>" + list[i].answerContent + "</td>"
                			  
                			   + "<td>" + list[i].createDate + "</td>"
                			   + "</tr>";
                	}
                	
                	$("#reply-area tbody").html(result);
                },
                error : function(){
                    consol.log("답변 조회 실패");
                }

            })

        }
      
        // 댓글은 화면이 로딩되어있을 때 곧바로 뿌려줘야함 => window.onload => $(function)
        $(function(){
        	
        	selectAnswerList();
        	
        	//setInterval(selectAnswerList, 1000);
        	
        })
        
        function insertAnswer(){
        	
        	$.ajax({
        		url : "rinsert.no",
        		data : {
        			content : $(".replyContent").val(), // text()가 아닌 val()로 가져와야 됨
        			qno : <%= q.getQnaNo() %> 
        		},
        		type : "post",
        		success : function(result){
        			
        			// result 값에 따라서 성공했으면 성공메시지 띄워주기
        			if(result > 0 ){
        				
        			 	alert("답변을 작성했습니다.");
        			 	
        			 	selectAnswerList();
        			 	
        			 	$(".replyContent").val("") // 작성란 초기화
        			}
        		},
        		error : function(){
        			console.log("답변 실패");
        		}     		
        	})
        }



    </script>
        
        
    
	<br><br><br><br>

        <div align="center"> <br>
			<%if(loginUser.getMemberId().equals("admin")){ %>
				<a href="<%= contextPath%>/questionListManagement.no?currentPage=1" class="btn btn-secondary qbtn" id="listFont" style="background: black;">목록가기</a>
			<%} else{%>	
				<a href="<%= contextPath%>/questionList.no?currentPage=1" class="btn btn-secondary qbtn" id="listFont" style="background: black;">목록가기</a>
			<% } %>	
    	</div>  

        </div>
   


	<%@ include file="../common/footer.jsp" %>   
</body>
</html>