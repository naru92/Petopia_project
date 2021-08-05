<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/orderstyle.css">
<link rel="stylesheet" href="/petopia/css/orderbootstrap.min.css">

<!-- 추후에 수정 -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/petopia_logomini.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- 아임포트 전용 결제 제이쿼리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- default_css -->
	<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<!-- Hero Area Start-->
		<div class="slider-area ">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-left">
								<br> <br>
								<div class="order">
									<p>OrderForm</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- OrderForm Start -->
		<div class="container">
			<div class="orderform">
				
				<br> <br>
				<div class="thanks2">
					<p>주문자 정보 입력</p>
				</div>
				<div class="spacing"></div>

				<div class="wrapper">
					<div class="sectionInner container">
						<div class="content">
							
							<form id="orderInsert" method="post">
								<table>
									<tbody class="personalInfo">
										<tr>
											<th class="tableNumber">주문자 명</th>
											<td class="tableTitle">
											<label for="checkName"><input type="text" id="checkName1" class="inputBox" name="order_name" /></label> 
											<span class="text">주문자 이름을 입력해주세요.</span></td>
										</tr>
										
										<tr>
											<th class="tableNumber">수령자 명</th>
											<td class="tableTitle">
											<label for="checkName"><input type="text" id="checkName2" class="inputBox" name="order_receiver_name" /></label>
											<span class="text">수령자이름을 입력해주세요.</span></td>
										</tr>
										
										<tr>
											<th class="tableNumber">수령자 연락처</th>
											<td class="tableTitle">
											<label for="checkTel"><input type="text" id="checkTel" class="inputBox" name="order_receiver_phonenumber" /></label> 
											<span class="text">핸드폰 번호를 입력해주세요. (예시: 010-1111-1111)</span></td>
										</tr>
										
										<tr>
											<th class="tableNumber">우편번호</th>
											<td class="tableTitle">
											<label for="PostalCode">
											<input type="text" id="postcode" placeholder="우편번호" class="inputBox2" name="address1" readonly> 
											<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" readonly></label><br></td>
										</tr>
										
										<tr class="address">
											<th class="tableNumber">주소</th>
											<td class="tableTitle">
											<label for="address1"> 
											<input type="text" id="roadAddress" placeholder="도로명 주소" class="inputBox" name="address2" readonly><br>
											<input type="text" id="detailAddress" placeholder="상세주소" class="inputBox" name="address3"></label></td>
										</tr>
										
										<tr class = "paymentMethod">
										<th class = "tableNumber2">결제수단</th>
										<td class = "tableTitle">
										<label for="checkMethod"> <input type="radio" id="select1" name="selectPayment" value = "1"  />&nbsp;무통장입금&nbsp;&nbsp;&nbsp;</label> 
										<label for="checkMethod"> <input type="radio" id="select2" name="selectPayment" value = "2" />&nbsp;카드결제</label> 
										<span class="text">결제수단을 선택해주세요.</span>
										
										</td>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>

				<div class="spacing2">
					<hr>
				</div>

				<!-- 결제 전 장바구니 표 시작 -->
				<div class="orderform">
					<br>

					<div class="thanks2">
						<p>주문하실 상품</p>
					</div>
					<div class="spacing"></div>
					<div class="order2"></div>
					<!-- 주문 내역 표 끝 -->
					
					<br>

					<div class="table-responsive">
						<table class="orderProduct" id="ProductLog" cellspacing="0">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명</th>
									<th>옵션</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</thead>

							<c:forEach var='o' items="${order}">
								<tbody>
									<tr>
										<td id = "product_idx">${o.product_idx}</td>
										<td>${o.product_name}</td>
										<td>${o.product_coloroption}</td>
										<td id = "quantity" value = 3></td>
										<td>${o.product_price}</td>
									</tr>

								</tbody>
							</c:forEach>
						</table>

						<c:forEach var='o' items="${order}">
							<div class="payment">
								<br /> <strong>배송비 : 무료</strong><br /> <strong> 총
									결제금액: </strong><strong>${o.product_price}원</strong><br />
							</div>
						</c:forEach>
						</div>
						<div class = "paymentBtn">
						<button id ="paymentBtn" type = "submit">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<!--  주소 api js-->
		<%@include file="../include/default_mapApi_js.jsp"%>

	<!-- 주문서 작성 ajax -->
	<script type="text/javascript">
	 $(document).ready(function() { 
	      $('#paymentBtn').click(function(){
	    	  
	    	  var payment_method = $(':input:radio[name="selectPayment"]:checked').val();
	    	  
	    	  var quantity = Number($('#quantity').val());
	    	  
	    	  console.log('click')
			  console.log($("#checkName1").val());	
		      console.log($("#checkName2").val());
		      console.log($("#checkTel").val());
		      console.log($("#postcode").val() + " " + $("#roadAddress").val() + " " + $("#detailAddress").val());
	    	  console.log(payment_method);
	    	  
	    	  if(payment_method == 1){
	    		  // 무통장입금
	    		  $.ajax({
	  	            type: "POST",
	  	            url: "/order/order-proc",
	  	            data: { "order_name": $('#checkName1').val(),
	  	                  "order_receiver_name": $("#checkName2").val(),
	  	                  "order_receiver_phonenumber": $('#checkTel').val(),
	  	                  "order_receiver_address": $('#postcode').val() + " " + $('#roadAddress').val() + " " + $('#detailAddress').val(),
	  	                  "payment_method": $('#select1').val(),
	  	                  "order_quantity": quantity,
	  	                  "product_idx" : $('#product_idx').text()
	  	            },
	  	                  
	  	            success: function(result){
	  	               alert('주문이 완료되었습니다.');
	  	               console.log(result)
	  	               location.href = "/order/confirmation_deposit";
	  	               
	  	            }, error: function(result){
	  	               alert('주문이 실패했습니다.');
	  	               console.log(result)
	  	            }
	  	         });
	    		  
	    	  }else{
		    	  		IMP.init('imp61748969'); //가맹점 식별코드
		    	  		IMP.request_pay({
		    	  		    pg : 'kakaopay',
		    	  		    pay_method : 'card',
		    	  		    merchant_uid : 'merchant_' + new Date().getTime(),
		    	  		    name : 'PETSHOP 반려동물 용품 결제' , //결제창에서 보여질 이름
		    	  		    amount : 100, //실제 결제되는 가격
		    	  		    buyer_name : $('#checkName1').val(),
		    	  		    buyer_tel : $('#checkTel').val(),
		    	  		    buyer_addr : $('#postcode').val() + " " + $('#roadAddress').val() + " " + $('#detailAddress').val(),
		    	  		}, function(rsp) {
		    	            if ( rsp.success ) {
		    	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	                jQuery.ajax({
		    	                    url: "/order/order-proc", //cross-domain error가 발생하지 않도록 주의해주세요
		    	                    type: 'POST',
		    	                    dataType: 'json',
		    	                    data: { "order_name": $('#checkName1').val(),
		    		  	                  "order_receiver_name": $("#checkName2").val(),
		    		  	                  "order_receiver_phonenumber": $('#checkTel').val(),
		    		  	                  "order_receiver_address": $('#postcode').val() + " " + $('#roadAddress').val() + " " + $('#detailAddress').val(),
		    		  	                  "payment_method": $('#select1').val(),
		    		  	                  "order_quantity": quantity,
		    		  	                  "product_idx" : $('#product_idx').text()
		    		  	            },
		    	                }).done(function(data) {
		    	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    	                    if ( everythings_fine ) {
		    	                        msg = '결제가 완료되었습니다.';
		    	                        msg += '\n고유ID : ' + rsp.imp_uid;
		    	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    	                        msg += '\결제 금액 : ' + rsp.paid_amount;
		    	                        msg += '카드 승인번호 : ' + rsp.apply_num;
		    	                        
		    	                        alert(msg);
		    	                    } else {
		    	                        //[3] 아직 제대로 결제가 되지 않았습니다.
		    	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    	                    }
		    	                });
		    	                //성공시 이동할 페이지
		    	                location.href = "/order/confirmation_card";
		    	            } else {
		    	                msg = '결제에 실패하였습니다.';
		    	                msg += '에러내용 : ' + rsp.error_msg;
		    	                //실패시 alert 문 실행
		    	                alert(msg);
		    	            }
		    	        });
	    	  		}
	      		});
	   		});

	
	</script>

</body>
</html>