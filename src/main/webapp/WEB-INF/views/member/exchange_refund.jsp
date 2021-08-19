<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>취소/반품/교환 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/exchange_refund.css">
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
				<h2>취소/반품/교환</h2>
			</div>

			<div class="content">
				<c:forEach var="o" items="${orderList }">
					<div class="box">
						<div class="date">
							<h6>${o.order_date_str }</h6>
							<a href="/member/orderdetail?order_idx=${o.order_idx}">
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
										<p>${o.product_price }원&nbsp&nbsp ${o.order_quantity }개</p>
									</div>
								</div>
							</div>
							<div class="BtnList">
								<a href="${root}board/mypage_qna_register?board_id=2&reqeust=exchange">
									<button class="Btn1">교환/환불</button>
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

	<script>
		function show() {
			document.querySelector(".background").className = "background show";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		<!-- document.querySelector("#show").addEventListener('click', show);-->
		<!-- document.querySelector("#close").addEventListener('click', close);-->
	</script>

</body>

</html>