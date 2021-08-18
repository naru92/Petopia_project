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
				<div class="box">
					<div class="date">
						<h4>2021.08.31</h4>
						<a href="myOrderDetail">
							<h5>주문 상세 보기 ></h5>
						</a>
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
							</a> <a href="#">
								<button class="Btn">교환/환불 신청</button>
							</a>
							
								<button class="Btn" id="show">후기 작성하기</button>

								<div class="background">
									<div class="window">
										<div class="popup">
											<div class="modal-title">
												<h4>상세 후기 작성</h4>
											</div>
											<div class="uploadResult" name="attachList">
												<ul>
                       							</ul>
											</div>
											<button class="closeBtn" id="close">취소하기</button>
											<button class="closeBtn"  type="submit" id="insertSubmit">등록하기</button>
										</div>
									</div>
								</div>
							





						</div>



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

	<script>
		function show() {
			document.querySelector(".background").className = "background show";
		}

		function close() {
			document.querySelector(".background").className = "background";
		}

		document.querySelector("#show").addEventListener('click', show);
		document.querySelector("#close").addEventListener('click', close);
	</script>

</body>

</html>