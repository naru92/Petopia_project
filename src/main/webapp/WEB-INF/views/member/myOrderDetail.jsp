<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>주문내역 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/myOrderDetail.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="orderList-main">
			<div class="content">
				<h2>주문 상세</h2>
			</div>

			<div class="content">
				<div class="box">
					<div>
						<h4>2021. 08. 31 주문</h4>
						<p>주문 번호 23745290368423</p>
					</div>
					<div class="box2">
						<div class="orderList">
							<div>
								<h4>배송 완료</h4>
							</div>
							<div class="orderList-info">
								<img src="/petopia/images/product_1.jpg">
								<div class="info">
									<h5>상품 이름이 먇ㅍ;ㅣ쿠ㅑ두 어마 어마하게 길지만 여기 옵니당</h5>
									<p>5000원 &nbsp &nbsp 1개</p>
								</div>
							</div>
						</div>
						<div class="BtnList">
							<a href="#">
								<button class="Btn1">배송조회</button>
							</a>
							<a href="#">
								<button class="Btn">교환/환불 신청</button>
							</a>
							<a href="#">
								<button class="Btn">리뷰 작성하기</button>
							</a>
						</div>
					</div>
					
					<div class="box2">
						<div class="orderList">
							<div>
								<h4>배송 완료</h4>
							</div>
							<div class="orderList-info">
								<img src="/petopia/images/product_1.jpg">
								<div class="info">
									<h5>상품 이름이 먇ㅍ;ㅣ쿠ㅑ두 어마 어마하게 길지만 여기 옵니당</h5>
									<p>5000원 &nbsp &nbsp 1개</p>
								</div>
							</div>
						</div>
						<div class="BtnList">
							<a href="#">
								<button class="Btn1">배송조회</button>
							</a>
							<a href="#">
								<button class="Btn">교환/환불 신청</button>
							</a>
							<a href="#">
								<button class="Btn">리뷰 작성하기</button>
							</a>
						</div>
					</div>
				</div>
				
				
				<div>
					<h4 style="border-bottom: 2px solid black; padding-bottom: 7px;">받는 사람 정보</h4>
				</div>
				<div>
					<table class="t-list">
						<tr>
							<td>받는 사람</td>
							<td>이노마</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>010-0000-0000</td>
						</tr>
						<tr>
							<td>받는 주소</td>
							<td>서울특별시 어쩌구 땡땡동 118-47 49호</td>
						</tr>
						<tr>
							<td>배송 요청 사항</td>
							<td>문앞</td>
						</tr>
					</table>
				</div>
				
				
				<div>
					<h4 style="border-bottom: 2px solid black; padding-bottom: 7px;">결제 수단</h4>
				</div>
				<div>
					<table class="t-list">
						<tr>
							<td >결제 수단</td>
							<td style="color: black;">총 결제 금액</td>
						</tr>
						<tr>
							<td style="font-size: 20px; color: black;">신한 카드</td>
							<td style="font-size: 20px; color: black;">14200 원</td>
						</tr>
					</table>
				</div>
				
				
			</div>





			<div class="content"></div>

		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script>
		
	<%@include file="../include/default_sidebar_js.jsp"%>
		
	</script>
</body>

</html>