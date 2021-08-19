<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>Confirmation</title>

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/orderconfirmation.css">
<link rel="stylesheet" href="/petopia/css/orderbootstrap.min.css">

<!-- 추후에 수정 -->
<link rel="shortcut icon" type="image/x-icon" href="/images/petopia_logomini.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

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
								<div class="thanks2">
									<p>OrderConfirmation</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- order detail Start -->
		<div class="container">
			<div class="invoice">

				<!-- <div class="header">
					<img alt="" src="http://www.dwcreative.uk/invoice/invoice1.png" />
				</div> -->
				<br>
				
				<div class="thanks">
					<p>고객님의 주문이 완료되었습니다.</p>
				</div>

				<div class="spacing"></div>
				
				<div class="deliver">
					<table>
						<br>
						<tr>
							<td>${confirmation_deposit.order_receiver_address}</td>
						</tr>
					</table>
				</div>
				
				<div class="client">
					<table>
						<br>
						<tr>
							<td>주문자명</td>
							<td>${confirmation_deposit.order_name}</td>
						</tr>
						<tr>
							<td>수령자명</td>
							<td>${confirmation_deposit.order_receiver_name}</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>${confirmation_deposit.order_receiver_phonenumber}</td>
						</tr>
					</table>
				</div>

				<div class="orderinfo">
					<table>
						<br>
						<tr>
							<td>주문번호</td>
							<td>${confirmation_deposit.order_idx}</td>
						</tr>
						<tr>
							<td>주문날짜</td>
							<td>${confirmation_deposit.order_date}</td>
						</tr>
						<tr>
							<td>결제수단</td>
							<td>무통장입금</td>
						</tr>
					</table>
				</div>
				
				<div class="spacing"></div>
				
				<div class="deposit">
					<p>[입금계좌 안내]</p>
					<strong>비트 123-45678-910112 (Petopia)</strong>
				</div>
				
				<sec:authorize access="hasRole('ROLE_MEMBER')">
				<div class="point">
					<p>[POINT]</p>
					<strong>1000P가 적립되었습니다. 기부하시겠습니까?</strong>
					<div class="donation_btn">
						<br> 
						<a href="/member/myDonation"><button class="donationBtn">기부하기</button></a>
					</div>
				</div>
				</sec:authorize>

				<div class="productinfo">
					<p>주문 상품 정보</p>
					<table>
					<c:forEach var='o' items="${order}">
						<tbody>
							<tr>
								<th class="name">상품명</th>
								<th class="detail">상품 설명</th>
								<th class="qty">수량</th>
								<th class="qty">옵션</th>
								<th class="cost">가격</th>
							</tr>
							<tr>
								<td class="name">${sessionScope.cart[0].productList[0].product_name}</td>
								<td class="detail">${sessionScpoe.cart[0].productList[0].product_detail_info}</td>
								<td class="qty">${sessionScope.cart[0].amount}</td>
								<td class="qty">${sessionScope.cart[0].productList[0].product_coloroption}</td>
								<td class="cost">${sessionScope.cart[0].productList[0].product_price}원</td>
							</tr>
						</tbody>
					</c:forEach>
					</table>
					
					<c:forEach var='o' items="${order}">		
					<div class="payment">
						<strong> 총 결제금액: </strong><strong>${totalPrice}원</strong><br />
					</div>
					</c:forEach>
				</div>

				<div class="spacing"></div>

				<div class="note">
					<p>NOTICE!</p>
					교환/환불 문의는 홈페이지 내의 고객센터로 해주시기 바랍니다.<br /> 주문해주셔서 감사합니다. <br />
				</div>

				<div class="spacing"></div>
				<!-- order detail ent -->
				<a href="/main"><button class="homeBtn">홈으로 가기</button></a>
				
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

		
	<!-- sidebar js -->
		<%@include file="../include/default_sidebar_js.jsp" %>
	<script>
		$(".ctgli:has(.ctgulChild)").click(function(e) {
			e.preventDefault();
			//li_HAVE_Child-hasShowed-hasSlideD
			if ($(this).hasClass('showed')) {
				//-x-hasSlideD
				$(this).children('.ctgulChild');
			} else {
				$('.ctgulChild');
				$('.ctgli').removeClass('showed');
				$(this).addClass('showed');
				$(this).children('.ctgulChild').slideToggle();
			}
		});
		$('.ctgli').click(function() {
			$(this).toggleClass('wtok');
		});
	</script>

	 
</body>


</html> 