<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.member.model.vo.Member, com.movinial.common.model.vo.PageInfo"  %>
<%
		ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		
		int currentPage = pi.getCurrentPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리(관리자)</title>
<style>

    #div3{
        border: 1px solid black;
    }
    
    #all{
        width: 1500px;
        height: 850px;
        margin: 10px auto;
    }
    #div1{
        width: 100%;
        float: left;
        height: 100px;
        padding-top: 10px;
        padding-left: 10px;        
    }

    #div2{
        width: 100%;
        float: left;
        height: 60px;
    }   
    #div2_1{
        width: 60%;
        height: 100%;
        float: left;
    }
    #div2_1>input{
        width: 300px;
        height: 40px;
        
        margin-left: 20px;
        border-top: none;
        border-left: none;
        border-right: none;
    }

    #div2_1>button{
        width: 60px;
        height: 40px;
        margin-left: 10px;
    }

    #div2_2{
        width: 40%;
        height: 100%;
        float: left;
    }
    #div2_2>button{
        width: 60px;
        height: 40px;
        margin-right: 30px;
        float: right;
    }


    #div3{
        width: 100%;
        height: 630px;
        float: left;
    }

    #div3 th, #div3 td{
        text-align: center;
        padding: auto;

    }


</style>
</head>
<body>
	
	    <%@ include file = "../common/header.jsp" %> <!-- header -->
	
	    <br><br><br>
	    
        <form action="delete.mem" method="post">	     

            <div id="all"> <!-- 전체-->
                <div id="div1"><h1 style="font-size: 60px; font-weight: 550;">회원 관리</h1></div>
                <br><br><br><br><br>
                <div id="div2">
                    <div id="div2_1">
                        <input type="text" id="searchKeyword" placeholder="회원  이름, 닉네임을 입력하시오.">&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-secondary" id="search">검색</button>
                        <!-- 구분? -->
                    </div>
                    <div id="div2_2">
                        <button type="submit" class="btn btn-secondary">차단</button>
                    </div>
                </div>
                
                <div id="div3">  <!-- table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width:50px;"></th>
                                <th style="width:60px;">번호</th>
                                <th style="width:150px;">아이디</th>
                                <th style="width:100px;">이름</th>
                                <th style="width:200px;">닉네임</th>
                                <th style="width:200px;">이메일</th>
                                <th style="width:150px;">연락처</th>
                                <th style="width:60px;">구분</th>
                                <th style="width:60px;">상태</th>
                                <th style="width:110px;">가입일</th>
                                <th style="width:110px;">수정일</th>
                            </tr>
                        </thead>                        
                        <tbody>                           
                            <!-- 게시글 출력 -->
                            <% if (list.isEmpty()){ %>
                                <tr>
                                    <td colspan="12">조회된 게시글이 없습니다.</td>
                                </tr>
                            <%} else { %>
                                <%for(Member m : list) { %>                                        
                                    <tr>
                                            <td><% if(!m.getMemberId().equals("admin")){ %><input type="checkbox" class="check" name="check" style='zoom:2.0;' value="<%= m.getMemberNo() %>"><%} %></td>
                                            <td><%= m.getMemberNo() %></td>
                                            <td><%= m.getMemberId() %></td>
                                            <td><%= m.getMemberName() %></td>
                                            <td><%= m.getMemberNickname() %></td>
                                            <td><%= m.getEmail() %></td>
                                            <td><%= m.getPhone() %></td>
                                            <td><%= m.getStatus() %></td>
                                            <td><%= m.getMemberType() %></td>
                                            <td><%= m.getEnrollDate() %></td>
                                            <td><% if(m.getModifyDate() == null){ %> 수정없음 <% } else { %> <%= m.getModifyDate() %> <% } %></td>
                                    </tr>                                        
                                <%} %>
                            <%} %>
                                        
                        </tbody>
                    </table>                                
                </div>
            </div>               
        </form>               
                        
           <script> 
           
                $("#search").click(function(){
                		
	                  $.ajax({
	
		                  url : "search.mem",
		                  data : {Keyword : $('#searchKeyword').val()},
		                  type : "post",
		                  success : function(list){ 
		                      var result = "";
		                      for(var i in list){

		                       if(list[i].modifyDate == null){
                                    list[i].modifyDate = "수정없음";
                               } 

                                    result += "<tr style='height:60px'><td>";
                               if(list[i].memberNo != 1){
                                    result += "<input type='checkbox' class='check' name='check' style='zoom:2.0;' value='" + list[i].memberNo + "'>";
                               }

                                    result += "</td><td>"+ list[i].memberNo +"</td>"+
                                            "<td>"+ list[i].memberId +"</td>"+
                                            "<td>"+ list[i].memberName +"</td>"+
                                            "<td>"+ list[i].memberNickname +"</td>"+
                                            "<td>"+ list[i].email +"</td>"+
                                            "<td>"+ list[i].phone +"</td>"+
                                            "<td>"+ list[i].status +"</td>"+
                                            "<td>"+ list[i].memberType +"</td>"+
                                            "<td>"+ list[i].enrollDate +"</td>"+
                                            "<td>"+ list[i].modifyDate +"</td>"+
                                            "</tr>";                           

		                        }
		                        if(result != null){		                        	
			                        $("tbody").html(result);           	
		                        }

		                    } // success
		                    
	                    }) // ajax
                	})                    
                
           </script>

                <!-- 여기다가 페이징 처리-->
                <div class="paging-area" align="center">
                    
                    <% if(currentPage != 1){ %>
                        <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/manage.mem?currentPage=<%= currentPage - 1 %>'">&lt;</button>
                    <%} %>
                        
                    <% for(int i = startPage; i <= endPage; i++){ %>
                        <% if(i != currentPage){ %>
                            <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/manage.mem?currentPage=<%= i %>'"><%= i %></button>
                        <%}else{  %>
                            <button class="btn btn-secondary" disabled><%= i %></button>
                        <%} %>
                    <%} %>
                                    
                    <% if(currentPage != maxPage){ %>
                        <button class="btn btn-secondary" onclick="location.href='<%= contextPath %>/manage.mem?currentPage=<%= currentPage + 1 %>'">&gt;</button>
                    <%} %>
                                        
                </div>
                    
                    <hr>
                    <br><br>
                    <%@ include file = "../common/footer.jsp" %> <!-- footer -->
                    
                </body>
</html>