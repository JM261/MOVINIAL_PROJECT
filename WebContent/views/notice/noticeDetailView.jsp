<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.movinial.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");  // : Object
	// n ==> 글번호, 글제목, 글내용, 작성자 아이디, 작성일 
	
	int nno = n.getNoticeNo();
%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
.outer{
    border: 1px solid #bcbcbc; 
    width: 1100px; 
    height:600px;
    margin: auto;
    margin-bottom: 30px;

}
.list-area{
    border: 1px solid #bcbcbc; 
    font-size: 22px;  
    width: 1000px;
}
.btn-area{
    width : 800px;
    height: 80px;
    align: center;
}
.btn-area>a{
    color:black;
    font-size: 25px;
    margin-left: 50px;
    text-decoration: none;
    text-align:center;

}

#noticeTitle{
   border-bottom: 1px solid #bcbcbc; 
   font-weight: bold;
}
#noticeDate{
    border-bottom: 1px solid #bcbcbc; 
    text-align: right;
    font-weight: bold;
}
td{
    height: 55px;
}
h2{
    font-weight: bold;
}
#noticeContent{
    height:300px;
}


</style>

</head>
<body>
 <%@ include file="../common/header.jsp" %>

	<div class="outer">
        <br>
        <h2 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객센터</h2>
        <br>
        <div class="btn-area">
            <a href="<%= contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary">공지사항 &nbsp;&nbsp;&nbsp;</a>
            <a href="<%=contextPath%>/FAQList.no" class="btn btn-sm btn-secondary">FAQ&nbsp;&nbsp;&nbsp;</a>
            
            <%if(loginUser != null){ %>
            <a href="#" class="btn btn-sm btn-secondary">문의하기&nbsp;&nbsp;&nbsp;</a>
            <a href="#" class="btn btn-sm btn-secondary">나의 문의내역</a>
            <%} %>
        </div>

        <table align="center" class="list-area">
          <!--  <thead>
                <tr>                
                    <th width="500">제목</th>
                    <th width="300">작성일</th>                  
                </tr>
            </thead> -->
            <tbody>
		        <tr>		                
		            <td id="noticeTitle"><%= n.getNoticeWriter() %></td>  <!-- n.getNoticeTitle  왜 제목이랑.. 내용이... 바뀌어서 나오는거지? 일단하고 나중에 고치기☆★  -->
		            <td id="noticeDate"><%= n.getCreateDate() %></td>
		        </tr> 
                <tr>
                    <td colspan="2" id="noticeContent"><%= n.getNoticeTitle() %></td> <!-- getNoticeContent 부분인데 얘도 왜 ...? 일단하고 나중에 고치기☆★  -->
                </tr>                      
                	
            </tbody>
        </table>
        <br>
        <div align="center">
        	<a href="<%= contextPath%>/noticeList.no?currentPage=1" class="btn btn-sm btn-secondary">목록가기</a>
        	
     
        </div>
 </div>




 <%@ include file="../common/footer.jsp" %>        
</body>
</html>