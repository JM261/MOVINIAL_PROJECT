<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	#outer{
     	border: 1px solid #bcbcbc;
        
        width: 1100px;
		height: 600px;
        margin : auto;
        
    }

	#enroll-form>table {border : 1px solid white;  margin : auto;}
	#enroll-form input, #enroll-form textarea{
		width: 800px;
		box-sizing: border-box;
	}

	#enroll-form textarea{
		height: 300px;
	}

	.btn1{
		width: 390px;
	}
	
	#h2{
    	font-weight: bolder;
    }
    
	table{
		font-size: 22px;
	}
	
	.qbtn{
		height : 50px;
		font-size:22px;
	}

</style>
</head>
<body>

	 <%@ include file="../common/header.jsp" %>
	 <br>
	 <div id="outer">
	 	
	
			<br>
	
			<h2 id="h2" align="left"> &nbsp; 공지사항 작성</h2>
			<br>
			<form id="enroll-form" action="<%= contextPath %>/insert.no" method="post">
			
			
			
				<input type="hidden" name="memberNo" value="<%= loginUser.getMemberNo() %>">

				<table align="center" border="1">
					<tr>
						<th>제목</th>
						<td><input type="text" name="memberTitle" required></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="memberContent" rows="10" style="resize: none" required></textarea>
						</td>
					</tr>
				
				</table>
	
	
	
				<div align="center">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn1 btn-secondary qbtn" style="background: black; font-size: 22px;">등록하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn1 btn-secondary qbtn" onclick="history.back();" style="background: black; font-size: 22px;">뒤로가기</button>
					<!-- history.back() : 이전 페이지로 돌아가게 해주는 함수 -->
					
				</div>
			</form>
			<br>
		
	 
	 
	 </div>
	 <br><br>
	 <%@ include file="../common/footer.jsp" %>

</body>
</html>