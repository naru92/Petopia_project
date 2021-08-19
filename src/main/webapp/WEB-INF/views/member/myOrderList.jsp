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
<link rel="stylesheet" href="/petopia/css/myOrder.css">
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
				<h2>주문 내역</h2>
			</div>


			<div class="content">
				<c:forEach var="o" items="${orderList }">
					<div class="box">
						<div class="date">
							<h6>${o.order_date_str }</h6>
							<a href="myOrderDetail">
								<h6>주문 상세 보기 ></h6>
							</a>
						</div>
						<div class="box2">
							<div class="orderList">
								<div>
									<h4>${o.delivery_state }</h4>
								</div>
								<div class="orderList-info">
									<img src="/petopia/images/product_1.jpg">
									<div class="info">
										<p>주문번호: ${o.order_idx}</p>
										<h5>${o.product_name }</h5>
										<p>${o.product_price }원&nbsp &nbsp
											${o.order_quantity }개</p>
									</div>
								</div>
							</div>
							<div class="BtnList">
								<a href="#">
									<button class="Btn1">배송조회</button>
								</a>
								<a href="reviewRegister">
									<button class="Btn">후기 작성하기</button>
								</a>

							</div>
						</div>

					</div>
				</c:forEach>




			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

		

</body>

</html>