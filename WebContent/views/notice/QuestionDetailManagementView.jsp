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
    	height:800px;
    	margin: auto;
    	margin-bottom: 30px;
    }
    
    .detail-area{
	    border: 1px solid #bcbcbc; 
	    font-size: 22px;  
	    width: 950px;
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
	
	#noticeInsertbtn{
    float: right;
    margin-right: 100px;
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
            <a href="<%= contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">공지사항 &nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/FAQList.no" class="btn btn-sm btn-secondary" style="background: black;">FAQ&nbsp;&nbsp;&nbsp;</a>
            
            <% if(loginUser != null && !loginUser.getMemberId().equals("admin")){ %>
            <a href="<%=contextPath%>/qEnrollForm.no" class="btn btn-sm btn-secondary" style="background: black;">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/questionList.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">나의 문의내역</a>
            <%} %>
            
            <% if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
            	<a href="<%=contextPath%>/questionListManagement.no?currentPage=1" class="btn btn-sm btn-secondary" style="background: black;">문의내역</a>  <!-- 문의 내역 조회하기  -->
               
            <% } %>
            
        </div>        

        <table align="center" class="detail-area" >
            <tr>
                <th class="tableWidth">카테고리</th>
                <td class="tableWidth"><%= q.getCategory() %></td> 
                <th class="tableWidth">작성자</th>
                <td class="tableWidth"><%= q.getQnaWriter() %></td>
            	<th class="tableWidth">작성일</th>
                <td class="tableWidth"><%= q.getCreateDate() %></td>
            </tr> 
            <tr> 
                <th class="tableWidth">제목</th>
                <td class="tableWidth" colspan="5"><%= q.getQnaTitle() %></td>
             
            </tr>
    
            <tr>
                <th>내용</th>
                <td colspan="5">
                    <p style="height : 200px;"><%= q.getQnaContent() %></p>
                </td>
                
            </tr>

           <tr>
                <th>첨부파일</th>
                <td colspan="5">
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

        <div align="center">
            <a href="<%= contextPath%>/questionListManagement.no?currentPage=1" class="btn btn-secondary qbtn" id="listFont" style="background: black;">목록가기</a>
            <a href="<%=contextPath%>/questionDetail.no?qno=<%= q.getQnaNo() %>" class="btn btn-secondary qbtn" id="listFont" style="background: black;">답변하기</a>
        </div>
        <div>
        
    </div>
</body>
</html>