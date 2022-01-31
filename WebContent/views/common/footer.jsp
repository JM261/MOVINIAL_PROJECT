<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>footer</title>
    <style>

     
      #footer {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
        padding-right:4%; 
      }

      #footer>h1{
        float:right;
        margin:auto;
      }
      
      #footer>p{
        padding-left:10px;
        line-height: 20px;
      }

      #footer1>ul{
        list-style: none;
        display: inline-block;
        
       
      }
      
      #footer1>ul>li{
        display:inline-block;
        
        
      }

      #footer1>ul>li>a{
        color:black;
        text-decoration: none;
        /* width:20px; */
        margin-left:40px;
      }

      #footer>p{
        padding-left:40px;
      }

      #header>ul>li>a:hover{
        color:coral;
      }

      #footer1>ul>li>a:hover{
        color:coral;
      }

      .info{
        background: none;
        color: black;
        border:0px;
      }

    </style>
  </head>
  <body>
   <!-- <div id="container"> -->
      <div id="footer">
        <div id="footer1">
          <ul>
            <li><b><em>Copyright©</em></b></li>
          
            <li><button type="button" class="info" data-toggle="modal" data-target="#myModal"> &nbsp;개인정보처리방침 &nbsp; &nbsp;</button></li>
            <li><button type="button" class="info" data-toggle="modal" data-target="#myModal2">청소년보호정책</button></li>
            <li><a href="<%= contextPath %>/FAQList.no">고객센터</a></li>
            <li><a href="<%= contextPath %>/noticeList.no?currentPage=1">공지사항</a></li>
            <%if(loginUser != null && loginUser.getMemberId().equals("admin")){ %>
            <li><a href ="<%= contextPath %>/manage.mem?currentPage=1">회원관리</a></li>
            <%} %>
            
          </ul>
        </div>
        <h1><img src="<%= contextPath %>/resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</h1> <!-- 이미지 경로 상대 경로 -->
        <p>   
          (주)무비니얼 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F <br>
       	   통신판매업신고 2021-서울서초-40024 고객센터 02-1511-1234 <br>
          1992-2022 MOVINIAL corp. All rights reserved. <br>  
        </p>
      </div>
    </div>

    
    <div class="modal" id="myModal">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header">
            <h1 class="modal-title">개인정보이용방침</h1>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>
          
          <!-- Modal body -->
          <div class="modal-body">
            <h3>개인정보의 수집 및 이용목적</h3>
            <p>수집한 개인정보는 아래와 같이 회원관리, 서비스 제공 및 향상, 안전한 서비스 이용환경 구축 등을 위해 이용합니다.

              - 이용자 식별, 연령 확인 및 법정대리인 동의 진행, 이용자와 법정대리인의 본인 확인 등 회원 관리
              - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여 인구통계학적 분석, 서비스 방문 및 이용기록의 분석 등 신규 서비스 요소의 발굴 및 기존 서비스 개선
              - 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지
              - 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영
              - 유료 상품 구매/판매와 결제 처리, 비용과 정산 대금의 확인 및 지급
              - 제휴 서비스 제공, 이벤트 정보 및 참여기회 제공, 상품의 배송, 광고성 정보 제공 등 마케팅 및 프로모션
              - 서비스 이용 분석과 통계에 따른 맞춤 서비스 제공 및 광고 게재 등
              - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축
              제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
           
          </div>
          
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal" style="background:black; border:0px;">Close</button>
          </div>
          
        </div>
      </div>
    </div>


    <div class="modal" id="myModal2">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header">
            <h1 class="modal-title">청소년보호정책</h1>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>
          
          <!-- Modal body -->
          <div class="modal-body">
            <h3>유해정보에 대한 접근제한 관리조치</h3>
            <p> 청소년이 건전한 인격체로 성장할 수 있도록 하기 위하여 청소년 보호정책을 수립, 시행하고 있습니다.  
            	청소년이 아무런 제한장치 없이 청소년 유해정보에 접근하는 일이 발생하지 않도록 청소년유해매체물에 대한 별도의 인증절차를 마련하여 적용하고 있습니다. 
            	이외에도 청소년 유해정보가 청소년에게 노출되지 않도록 예방차원의 조치를 강구합니다.
             	청소년들이 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. 
              	각 서비스 담당자들을 대상으로 청소년 보호 관련 법령 및 제재 기준, 유해정보 발견 시 대처방법, 위반사항 처리에 대한 보고 절차 등을 교육하고 있습니다.
              	청소년 유해정보로 인한 피해상담 및 고충처리를 위한 전문인력을 배치하여 그 피해가 확산되지 않도록 하고 있습니다. 이용자 분들께서는 하단에 명시한 "청소년보호 책임자 및 담당자" 항을 참고하여 전화나 메일을 통해 피해상담 및 고충처리를 요청할 수 있습니다.
            </p>
           
          </div>
          
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal" style="background:black; border:0px;">Close</button>
          </div>
          
        </div>
      </div>
    </div>






  </body>
</html>