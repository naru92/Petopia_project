<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://wagtrung.github.io/store/themify-icons/themify-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- 아임포트 전용 결제 제이쿼리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
				<div class="header">
					<img alt="" src="http://www.dwcreative.uk/invoice/invoice1.png" />
				</div>
				<br> <br>
				<div class="thanks2">
					<p>주문자 정보 입력</p>
				</div>
				<div class="spacing"></div>

				<div class="wrapper">
					<div class="sectionInner container">
						<div class="content">
							<div class="joinStepWrap ">
								<img src="../../lib/img/login/join_step03.gif" alt=""
									class="joinStep_Img container" />
							</div>

							<form method="post" action="/order/confirmation">
								<table>
									<tbody class="personalInfo">
										<tr>
											<th class="tableNumber">주문자 명</th>
											<td class="tableTitle"><label for="checkName"> <input
													type="text" id="checkName" class="inputBox"
													name="order_name" /></label> <span class="text">주문자 이름을
													입력해주세요.</span></td>
										</tr>
										<tr>
											<th class="tableNumber">수령자 명</th>
											<td class="tableTitle"><label for="checkName"> <input
													type="text" id="checkName" class="inputBox"
													name="order_receiver_name" /></label> <span class="text">수령자
													이름을 입력해주세요.</span></td>
										</tr>
										<tr>
											<th class="tableNumber">수령자 연락처</th>
											<td class="tableTitle"><label for="checkTel"> <input
													type="text" id="checkTel" class="inputBox"
													name="order_receiver_phonenumber" /></label> <span class="text">핸드폰
													번호를 입력해주세요. (예시: 010-1111-1111)</span></td>
										</tr>
										<tr>
											<th class="tableNumber">우편번호</th>
											<td class="tableTitle"><label for="PostalCode">
													<input type="text" id="postcode" placeholder="우편번호"
													class="inputBox2" name="address1" readonly> <input
													type="button" onclick="execDaumPostcode()" value="우편번호 찾기"
													readonly>
											</label><br></td>
										</tr>
										<tr class="address">
											<th class="tableNumber">주소</th>
											<td class="tableTitle"><label for="address1"> <input
													type="text" id="roadAddress" placeholder="도로명 주소"
													class="inputBox" name="address2" readonly><br>
													<input type="text" id="detailAddress" placeholder="상세주소"
													class="inputBox" name="address3"></label></td>
										</tr>

									</tbody>
								</table>
								<input type="button" id = "submit" value="주문서 내보내기">
							</form>

						</div>
					</div>
				</div>

				<div class="spacing2">
					<hr>
				</div>

				<!-- 결제 전 장바구니 표 시작 -->
				<div class="orderform">
					<div class="header">
						<img alt="" src="http://www.dwcreative.uk/invoice/invoice1.png" />
					</div>
					<br> <br>

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
									<th>상품명</th>
									<th>옵션</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</thead>

							<c:forEach var='o' items="${order}">
								<tbody>
									<tr>
										<td>${o.product_name}</td>
										<td>${o.product_coloroption }</td>
										<td></td>
										<td>${o.product_price}</td>
									</tr>

								</tbody>
							</c:forEach>
						</table>

						<c:forEach var='o' items="${order}">
							<div class="payment">
								<br /> <strong>배송비 : 무료</strong><br />
								<strong> 총 결제금액: </strong><strong>${o.product_price}원</strong><br />
							</div>
						</c:forEach>
						<!-- <button onclick = "requestPay()">결제하기</button> -->
						<!-- <button onclick = "requestPay()" type = "submit">결제하기</button> -->

						<a href="getInsertInfo"><button type="submit"
								onclick="request_pay()">주문</button></a> <input type="submit"
							onclick="postCode()" value="결제하기">
					</div>

					<!-- <a href="main.html"><button class="homeBtn">결제하기</button></a> -->
				</div>
			</div>

		</div>
	</main>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<!--  주소 api js-->
	<%@include file="../include/default_mapApi_js.jsp"%>

	<!--  아임포트 js -->
	<script type="text/javascript">
	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp61748969'); // 가맹점 식별 코드
		
		var msg;
		var date = new Date(); 
		
		IMP.request_pay({
			pg: 'html5_inicis',
			pay_method: $('payment_method').val(),
			merchant_uid: 'merchant_' + date.getTime(),
			name: $('product_name').val(),
			amount: $('product_price').val(),
			buyer_name: $('order_name').val(),
			buyer_name: $('order_receiver_name').val(),
			buyer_tel: $('order_receiver_phonenumber').val(),
			buyer_addr: $('order_receiver_address').val(),
		}, function(rsp) {
			if (rsp.success) {
				// orderLog 배열 저장
				var orderLogVO = new Array();
				
				$(".cart_product").each(function(i) {
			
					var pno = $("#pno" + i).html();
					var payAmount = $("#quantity" + i).html();
					var payPrice = $("#amountPrice" + i).html();
					
					var data = [];
					
					data[i] = {
							pno : pno,
							payAmount : payAmount,
							payPrice : payPrice
					};
					
					orderLogVO.push(data[i]);
					
					console.log(data[i]);
				});
				
				console.log(orderLogVO);
				
				// 구매 이력 기록
				$.ajax({
					traditional : true,
					type:'post',
					url: "/purchase/afterPurchase",
					data: JSON.stringify(orderLogVO),
					contentType: "application/json; charset=utf-8",
					dataType: 'text',
					success: function(result, status, xhr) {
						console.log("after purchase process success");
						callback(result);
					}
				});
				
				// 장바구니 내용물 삭제
				$(".cart_product").each(function(i) {
					var cartNumber = $("#cartNo" + i).val();
					
					console.log("delete cart Item " + cartNumber);
					
					$.ajax({
						type: 'post',
						url: '/purchase/deleteCartItem',
						data: JSON.stringify(cartNumber),
						contentType: "application/json; charset=utf-8",
						dataType: 'text',
						success: function(result, status, xhr) {
						  	console.log('delete cart item ' + result);
						  }
					});	
				});
				
				var msg = '결제가 완료되었습니다. ';
				msg += ' 고유ID : ' + rsp.imp_uid;
				msg += ' 상점 거래ID : ' + rsp.merchant_uid;
				msg += ' 결제 금액 : ' + rsp.paid_amount;
				msg += ' 카드 승인번호 : ' + rsp.apply_num;
			} else {
				msg = '결제에 실패하였습니다. ';
				msg += '에러 내용 : ' + rsp.error_msg;
				}

			alert(msg);
			location.replace('/purchase/Cart'); 
		});
	});
	
	</script>

	<!-- order_detail 데이터 ajax로 넘기기 -->
	<script>
		$(document).ready(function(){
			$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
			$.ajax({
				type:'post',   //post 방식으로 전송
				url:'/order/confirmation',   //데이터를 주고받을 파일 주소
				data:sendData,   //위의 변수에 담긴 데이터를 전송해준다.
				dataType:'html',   //html 파일 형식으로 값을 담아온다.
				success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					console.log(date);
				}
			});
		});
	});
	</script>

	<!-- 주소 API 값 하나로 묶기 -->
	<script>
	function postCode(){ 
		var post1 = document.getElementById("postcode").value;
		var post2 = document.getElementById("roadAddress").value;
		var post3 = document.getElementById("detailAddress").value;
		 
		var addr = post1 + " " +  post2 + " " + post3;
		console.log("주소 : " + addr);
	
	 }
	</script>

</body>
</html>