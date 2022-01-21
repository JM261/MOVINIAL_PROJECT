<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리(관리자)</title>
<style>

    div{
        border: 1px solid black;
    }
    #all{
        width: 1200px;
        height: 660px;
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
        float: left;
        height: 500px;
    }



</style>
</head>
<body>
	
    <%@ include file = "../common/header.jsp" %> <!-- header -->

    <br><br><br>

    <div id="all"> <!-- 전체-->
        <div id="div1"><h1 style="font-size: 60px; font-weight: 550;">회원 관리</h1></div>

        <div id="div2">
            <div id="div2_1">
                <input type="text" placeholder="회원 아이디, 이름을 입력하시오.">&nbsp;&nbsp;&nbsp;
                <button class="btn btn-secondary">검색</button>
                <!-- 구분? -->
            </div>
            <div id="div2_2">
                <button class="btn btn-secondary">차단</button>
            </div>
        </div>

        <div id="div3">  <!-- table -->
            <table class="table">
                <thead>
                  <tr>
                    <th><input type="checkbox" style='zoom:2.0;'></th>
                    <th>번호</th>
                    <th>구분</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>상태</th>
                    <th>메모</th>
                  </tr>
                </thead>

                <tbody>

                  <tr>
                    <td><input type="checkbox" style='zoom:2.0;'></td>
                    <td>1</td>
                    <td>관리자</td>
                    <td>admin</td>
                    <td>관리자</td>
                    <td>010-1111-1111</td>
                    <td>111@111</td>
                    <td>관리</td>
                    <td>나는관리자다</td>
                  </tr>    

                </tbody>
              </table>


        </div>

    </div>



	<hr>
    <br>
    <%@ include file = "../common/footer.jsp" %> <!-- footer -->
	
</body>
</html>