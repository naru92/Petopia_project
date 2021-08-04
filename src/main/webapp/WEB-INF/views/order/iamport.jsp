<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>

<!doctype html>
<html lang="ko">

<head>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 아임포트 -->
<script type="text/javascript"   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

   <!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!-- jQuery validation CDN form validation : form 태그 아래에 위치해야 작동한다. (왜 인지는 잘 모름) -->
   <!-- jQuery 플러그인 이기때문에 jQuery가 있어야 한다. -->
   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
   <!-- jQuery validation method CDN -->
   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
   <!-- jQuery validation CDN form validation end-->
    
    
    

<%-- <sec:csrfMetaTags/> --%>
<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- new korean font from google -->
<!-- NotoSansKR, Gothic A1 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Nanushare</title>

<!-- CSS -->
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
<link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/style.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/color.css">
<link rel="stylesheet"   href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   
<!-- 웹페이지 탭 로고이미지 삽입 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">

<script type="text/javascript">
   /* 카드결제 option */
   $(function() {
      $('#donaCardSelect').change(function() {
         if ($('#donaCardSelect').val() == "") {
            $("#selectCardDirect").val(""); //값 초기화
            $("#selectCardDirect").prop("readonly", false); //활성화
         }
         /* else if($('#donaTransSelect').val() == ""){
              $("#selectTransDirect").val(""); //값 초기화
              $("#selectTransDirect").prop("readonly",true); //textBox 비활성화
             } */
         else {
            $("#selectCardDirect").val($('#donaCardSelect').val()); //선택값 입력
            $("#selectCardDirect").prop("readonly", true); //비활성화
         }
      });
   });

   /* 계좌결제 option */
   $(function() {
      $('#donaTransSelect').change(function() {
         if ($('#donaTransSelect').val() == "") {
            $("#selectTransDirect").val(""); //값 초기화
            $("#selectTransDirect").prop("readonly", false); //활성화
         }
         /* else if($('#donaTransSelect').val() == ""){
              $("#selectTransDirect").val(""); //값 초기화
              $("#selectTransDirect").prop("readonly",true); //textBox 비활성화
             } */
         else {
            $("#selectTransDirect").val($('#donaTransSelect').val()); //선택값 입력
            $("#selectTransDirect").prop("readonly", true); //비활성화
         }
      });
   });

   $(function() {
      var IMP = window.IMP; // 생략가능 
      IMP.init('imp54168696'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

      var token = $("meta[name='_csrf']").attr("content");
      var header = $("meta[name='_csrf_header']").attr("content");
      $(document).ajaxSend(function(e, xhr, options) {
         xhr.setRequestHeader(header, token);
   });

   /* 카드결제 */
   $('#donaCard').click(function requestCard() {
      var selectCardDirect = $("#selectCardDirect").val();
      selectCardDirect = parseInt(selectCardDirect);

      $.ajax({ //로그인한 회원의 정보를 가져온다.
         type : 'post',
         url : "${pageContext.request.contextPath}/my/commonDonation",
         contentType : "application/json; charset=UTF-8",
         data : 'json',
         success : function(data) {
                  console.log(data);

                  IMP.request_pay({
                           pg : 'inicis', // version 1.1.0부터 지원.
                           pay_method : 'card', //결제 수단       
                           merchant_uid : 'Nanushare__'
                                 + new Date()
                                       .getTime(), //가맹점에서 생성/관리하는 고유 주문번호
                           name : '후원금', //주문명
                           amount : selectCardDirect, //결제금액 ,int 타입으로 세팅했음,
                           buyer_email : data.member_id, //구매자 이메일
                           buyer_name : data.name
                           //주문자 이름   
                           /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
                           /*  m_redirect_url은 모바일 결제프로세스가 시작되면서 PG사의 페이지로 redirect되었다가, 
                            완료 후 다시 사이트로 복귀하기 위해 사용되는 파라메터입니다. 
                            이 경우, m_redirect_url에 해당되는 서버 핸들러에서 결제여부 체크 및 금액 변조확인이 이루어져야 합니다. 
                            이를 위해 결제완료 후 랜딩되는 URL은 다음과 같은 추가 파라메터를 가지게 됩니다. */
                           },
                           function(rsp) {
                              if (rsp.success) { //결제 성공시 호출
                                 var msg = '결제가 완료되었습니다.';
                                 /* msg += '고유ID : ' + rsp.imp_uid;
                                 msg += '상점 거래ID : ' + rsp.merchant_uid;
                                 msg += '결제 금액 : ' + rsp.paid_amount;
                                 msg += '카드 승인번호 : ' + rsp.apply_num; */

                                 var obj = new Object();
                                 var arr = new Array();

                                 obj.merchant_uid = rsp.merchant_uid; //결제번호
                                 obj.buyer_email = rsp.buyer_email; //결제자 이메일
                                 obj.amount = rsp.paid_amount; //결제 금액
                                 obj.paid_at = rsp.paid_at; //결제 승인시각, UNIX timestamp로 출력
                                 obj.pg_provider = rsp.pg_provider; //pg사,
                                 obj.pay_method = rsp.pay_method; //결제방법
                                 obj.status = rsp.status;
                                 //ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
                                 arr.push(obj);
                                 
                                 $.ajax({
                                       type : "post",
                                       url : "${pageContext.request.contextPath}/my/cardDonation",
                                       cache : false,
                                       contentType : 'application/json; charset=utf-8',
                                       dataType : 'json',
                                       data : JSON.stringify(arr)
                                       
                                 }) // success ajax end
                                 swal({
                                    title :msg , 
                                    icon : "success" , 
                                    button : true 
                                 }).then(function () {
                                    $(location).attr('href', "${pageContext.request.contextPath}/my/donation/thank");
                                 });
                                 
                                 
                              } else { //결제 실패시 호출
                                 
                                 swal({
                                    title :"결제에 실패하였습니다." , 
                                    icon : "error" , 
                                    button : true 
                                 }).then(function () {
                                    location.reload();
                                 });
                              
                              }
                              
                           });
               },
               error : function(e) {

                  console.log("에러");
                  console.log(e);
               }

            }); //ajax end

      }); //카드결제 end

      /* 실시간 계좌 이체 */
      $('#donaTrans').click(function requestTrans() {
         var selectTransDirect = $("#selectTransDirect").val();
         selectTransDirect = parseInt(selectTransDirect);

         $.ajax({ //로그인한 회원의 정보를 가져온다.
            type : 'post',
            url : "${pageContext.request.contextPath}/my/commonDonation",
            contentType : "application/json; charset=UTF-8",
            data : 'json',
            success : function(data) {
            console.log(data);

            IMP.request_pay({
                     pg : 'inicis', // version 1.1.0부터 지원.
                     pay_method : 'trans', //결제 수단       
                     merchant_uid : 'Nanushare__' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호
                     name : '후원금', //주문명
                     amount : selectTransDirect, //결제금액 ,int 타입으로 세팅했음,
                     buyer_email : data.member_id, //구매자 이메일
                     buyer_name : data.name
                     //주문자 이름   
                     /* m_redirect_url : 'https://www.yourdomain.com/payments/complete' */
                     /*  m_redirect_url은 모바일 결제프로세스가 시작되면서 PG사의 페이지로 redirect되었다가, 
                      완료 후 다시 사이트로 복귀하기 위해 사용되는 파라메터입니다. 
                      이 경우, m_redirect_url에 해당되는 서버 핸들러에서 결제여부 체크 및 금액 변조확인이 이루어져야 합니다. 
                      이를 위해 결제완료 후 랜딩되는 URL은 다음과 같은 추가 파라메터를 가지게 됩니다. */
                     },
                     function(rsp) {
                        if (rsp.success) { //결제 성공시 호출
                           var msg = '결제가 완료되었습니다.';
                           /* msg += '고유ID : ' + rsp.imp_uid;
                           msg += '상점 거래ID : ' + rsp.merchant_uid;
                           msg += '결제 금액 : ' + rsp.paid_amount;
                           msg += '카드 승인번호 : ' + rsp.apply_num; */

                           var obj = new Object();
                           var arr = new Array();

                           obj.merchant_uid = rsp.merchant_uid; //결제번호
                           obj.buyer_email = rsp.buyer_email; //결제자 이메일
                           obj.amount = rsp.paid_amount; //결제 금액
                           obj.paid_at = rsp.paid_at; //결제 승인시각, UNIX timestamp로 출력
                           obj.pg_provider = rsp.pg_provider; //pg사,
                           obj.pay_method = rsp.pay_method; //결제방법
                           obj.status = rsp.status;
                           //ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
                           arr.push(obj);
                           $.ajax({

                                 type : "post",
                                 url : "${pageContext.request.contextPath}/my/transDonation",
                                 cache : false,
                                 contentType : 'application/json; charset=utf-8',
                                 dataType : 'json',
                                 data : JSON.stringify(arr)
                                 

                           }) // success ajax end
                           swal({
                              title :msg , 
                              icon : "success" , 
                              button : true 
                           }).then(function () {
                              $(location).attr('href', "${pageContext.request.contextPath}/my/donation/thank");
                           });
                           
                           
                        } else { //결제 실패시 호출
                           swal({
                              title :"결제에 실패하였습니다." , 
                              icon : "error" , 
                              button : true 
                           }).then(function () {
                              location.reload();
                           });
                           
                        }
                        
                        
                  });
            },
            error : function(e) {
      
               console.log("에러");
               console.log(e);
            }

         }); //ajax end

      }); //실시간계촤이체 end

   }); //function end
</script>

<style type="text/css">
/*  a 태그 후버시 밑줄, 파랑 속성 제거 */
a:hover { 
    text-decoration: none;
    color:#333;
}

#forimg {
   background-color: #eaf0fe;
   background-image: url('/resources/banner_imgs/donation_banner.jpg');
   background-repeat:no-repeat;
   background-position: center;
   background-height:100%;
}
.black-transparent {
   opacity:50%;
}
.error {
    color: red;
}
</style>


</head>
<body>
   <!-- Header -->
   <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
   <!-- Header -->
   
   <!-- Banner -->
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
                <!--     <h1>후원금기부</h1>
               <p>Point donation: Application Form</p> -->
                </div>
            </div>
        </div>
    </div>

    <!-- Content -->
    <div class="charity-fancy-title " style="margin-top:70px; margin-bottom:20px;">
      <h2> 후원금 나눔하기 </h2>
   </div> 
   
   <div class="charity-main-content">

      <!-- Main Section -->
      <div class="charity-main-section">
         <div class="container">
            <div class="row">
               <div class="col-md-9">
               
                  <!--// company-timeLine \\-->
                  <div class="charity-team-warp">

                     <h3>후원금 나눔하기</h3>
                     <span class="mb-3">Point donation_ Application Form</span>
                     <figure><img src="${pageContext.request.contextPath}/resources/charity/donation-images/후원.png"   alt=""></figure>
                     <!-- 788x355 -->

                     <p>후원 회원 여러분, 나누셰어 프로젝트의 나눔 활동에 동참해주셔서 감사합니다. <br>안내 사항을 다시 한 번 꼭 확인해 주시고 후원 부탁드립니다. <br> 
                     감사합니다.</p>
                     <!-- charity-team-contact -->
                     <div class="charity-team-contact">
                        <ul class="chaity-contact-info">
                           <li>
                              <h6>후원금 나눔 관련:</h6>
                              <span>02-722-1481</span>
                           </li>
                           <li>
                              <h6>Email:</h6> 
                              <a href="mailto:name@email.com">info@nanushare.com</a>
                           </li>
                        </ul>
                     </div> 
                     <!-- charity-team-contact -->

                  </div>
                  <!--// company-timeLine \\-->


                  <!--// volunteer-form \\-->
                  
                  <!-- 버튼을 눌렀을때 결제가 진행, 결제가완료 되면 db카운트 -->
                  <!-- 서버로 넘겨줄 정보 즉, nanushare db에 저장할 정보 -->
                  <!-- 아임포트 서버에도 내가 원하느정보를 던져주고, rest api를 통해서 아임포트 서버로부터 내가 원하는장보를 가져와서 db에 저장  -->
                  <!-- 결제번호(dnt_paynum), 결제자 아이디(member_id), 결제금액(dntprice), 결제날짜(dntdate), 결제처리 상태(카드는 즉시 완료 되지만, 무통장은 확인을 해야함 --사용안함, 카드와, 실시간계좌이체만 사용),pg사(pg), 결제방법 분류 번호(pcat_num) 사용안함  -->
                  <!-- 1. 카드, 2. 계좌 -->

                  <!-- 컨트롤러에서 회원정보 가져오기 member_id, 이름 -->
                  <!-- 카카오페이는 100원 미만 결제 불가  -->
                  <div class="widget_title mt-4">
                     <h2 style="font-size:22px;">카드결제</h2>
                  </div>
                  <div class="charity-volunteer-form">
                   <form id = "cardVali">
                     <ul class="mt-4">
                        
                        <li>
                           <label>결제금액:</label> 
                           <input type="text" name="selectCardDirect" id="selectCardDirect" />
                        </li>
                        <li> <!-- class="charity-select-form" -->
                           <label>(select)</label>
                           <div class="charity-select-two">
                              <select name="donaCardSelect" id="donaCardSelect" >
                                 <!-- 결제금액 선택해서 아임포트에 전달 -->
                                 <option value="">직접입력</option>
                                 <option value="1000">1,000원</option>
                                 <option value="5000">5,000원</option>
                                 <option value="10000">10,000원</option>
                              </select>
                           </div>
                        </li>
                     </ul>
                     <div class="charity-team-contactus mt-3">
                        <button class="charity-sub-btn" type="button" id="donaCard" onclick="requestCard()" value="카드">카드 결제</button>
                        <br />
                     </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               </form>
                  
               </div>
               <div class="widget_title mt-4">
                  <h2 style="font-size:22px;">계좌이체</h2>
               </div>
               <div class="charity-volunteer-form">   
                  <form id="transVali">
                     <ul class="mt-4">
                        <li>
                           <label>결제금액:</label>
                           <input type="text" name="selectTransDirect" id="selectTransDirect" />
                        </li>
                        <li> <!--  class="charity-select-form" 이 부분이 크기 좀 작게 만드는 거 -->
                           <label>(select)</label>
                           <div class="charity-select-two">
                              <select name="donaTransSelect" id="donaTransSelect">
                                 <option value="">직접입력</option>
                                 <option value="1000">1,000원</option>
                                 <option value="5000">5,000원</option>
                                 <option value="10000">10,000원</option>
                              </select>
                           </div>
                        </li>
                     </ul>
                     <div class="charity-team-contactus mt-3">
                        <button class="charity-sub-btn" type="button" id="donaTrans" value="계좌" onclick="requestTrans()">계좌 결제</button>
                     </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  </form>
               </div>   
                  
                  
               <div class="charity-team-contactus mt-3">
                  <button type="button" class="charity-sub-btn" onclick="location.href='${pageContext.request.contextPath}/donation/money/main'"><i class="fa fa-arrow-left"> 이전화면으로</i></button>
               </div>
               <!-- jQuery validation CDN form validation : form 태그 아래에 위치해야 작동한다. (왜 인지는 잘 모름) -->
               <!-- jQuery 플러그인 이기때문에 jQuery가 있어야 한다. -->
               <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
               <!-- jQuery validation method CDN -->
               <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
                   <!-- jQuery validation CDN form validation end-->   
               
               <script type="text/javascript">
                $("#cardVali").validate({
                  rules:{
                     selectCardDirect : {
                        required: true,
                        digits: true,         /* (양수)숫자만 입력가능 -number와 다른점은 소수와 음수일 경우 false*/
                                spaceCheck: true                            
                                      
                     },
                     donaTransSelect : {
                        required: true
                     }
                     
                     
                  },
                  messages : {
                     selectCardDirect : {
                        required : "필수 작성내용 입니다.",
                        digits : "숫자만 입력이 가능합니다.",
                        spaceCheck : "공백없이 입력해주세요."                        
                        
                               
                     },
                     donaTransSelect : {
                        required : "필수 작성내용 입니다."
                     }
                     
                  },
                   errorElement: 'span',         /* 디폴트는 lable 태그 lable->span 으로 수정 */
                         errorClass: 'error',         /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/

                         errorPlacement: function(error, element) {
                             if (element.is(":text") ) {
                                 element.parent().parent().after(error);
                             } else {
                                 element.after(error);
                             }
                         }
                  
                   
                })
               
               
               </script>
               
               <script type="text/javascript">
                $("#transVali").validate({
                  rules:{
                     selectTransDirect : {
                        required: true,
                        digits: true,         /* (양수)숫자만 입력가능 -number와 다른점은 소수와 음수일 경우 false*/
                                spaceCheck: true,                              
                     },
                     donaCardSelect : {
                        required: true
                     }
                     
                     
                  },
                  messages : {
                     selectTransDirect : {
                        required : "필수 작성내용 입니다.",
                        digits : "숫자만 입력이 가능합니다.",
                        spaceCheck : "공백없이 입력해주세요.",                        
                     },
                     donaCardSelect : {
                        required : "필수 작성내용 입니다."
                     }
                     
                  },
                   errorElement: 'span',         /* 디폴트는 lable 태그 lable->span 으로 수정 */
                         errorClass: 'error',         /* 디폴트 클래스 이름은 error, 클래스 이름을 변경할 수 있다.*/

                         errorPlacement: function(error, element) {
                             if (element.is(":text") ) {
                                 element.parent().parent().after(error);
                             } else {
                                 element.after(error);
                             }
                         }
                  
                   
                })
               
               
               </script>      
                  
                  
               <script>
                  function chk_Number(object) {
                     $(object).keyup(function() {
                        $(this).val($(this).val().replace(/[^0-9]/g, ""));
                     });
                  }
               </script>

               <!--  지침: 확인 사항 리스트 -->
               <!--  내용 참고 : https://www.donorpoints.com/ -->
               <div class="widget_title mt-5">
                  <h2 style="font-size:22px;">후원 전 반드시 확인해 주세요!</h2>
               </div>
               <div class="charity-campaign-content">
                  <div class="row">
                     <div class="col-md-12">
                        <ul class="charity-item-text">
                           <!-- charity-list-style-one -->
                           <li class="mt-3">다음 내용은 2021년 3월 17일 기준으로 작성되었습니다.</li>
                           <li class="mt-3">나누셰어 회원이 되시면 돈기부여 페이지에서 후원나눔을 하실 수 있습니다.</li>
                           <li class="mt-3">기부하신 내역과 결제 취소는 마이페이지에서 확인하실 수 있습니다.</li>
                        </ul>
                     </div>
                     <div class="col-md-5">
                        <img src="/resources/extra-images/Campaign-img1.png" alt=""
                           class="charity-campaing-image">
                     </div>
                  </div>
               </div>

               <!--// 연락처 이메일 \\-->
               <!-- <div class="charity-team-contactus">
                  <ul>
                     <li><i class="fa fa-phone"></i>
                        <h5>후원 관련:</h5> <span>02 1234 5678</span></li>
                     <li><i class="fa fa-envelope"></i>
                        <h5>Email:</h5> <a href="mailto:name@email.com">info@example.com</a>
                     </li>
                  </ul>
               </div> -->
               <!--\\ 연락처 이메일 //-->


            </div>
            <!-- aside 제외한 왼쪽 컨텐츠 div 끝 -->

            <!-- 우측 배너  aside -->
            <%@ include file="/WEB-INF/views/board_show/aside.jsp"%>
            <!-- aside end -->
            
         </div> <!-- container end -->
      </div>
   </div>
   <!-- Main Section -->

   </div>
   <!-- Content -->


   <!-- Footer -->
   <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
   <!-- Footer -->


   <!-- jQuery -->
   <script src="/resources/charity/script/jquery.js"></script>
   <script src="/resources/charity/script/popper.min.js"></script>
   <script src="/resources/charity/script/bootstrap.min.js"></script>
   <script src="/resources/charity/script/slick.slider.min.js"></script>
   <script src="/resources/charity/script/progressbar.js"></script>
   <script src="/resources/charity/script/fancybox.min.js"></script>
   <script src="/resources/charity/script/jquery.countdown.min.js"></script>
   <script src="https://maps.googleapis.com/maps/api/js"></script>
   <script src="/resources/charity/script/jquery.jplayer.js"></script>
   <script src="/resources/charity/script/jplayer.playlist.js"></script>
   <script src="/resources/charity/script/functions-main.js"></script>

</body>

</html>