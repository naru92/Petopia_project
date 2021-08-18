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
							<h4>${o.order_date }2021.08.31</h4>
							<a href="myOrderDetail">
								<h5>주문 상세 보기 ></h5>
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
								<button class="Btn" id="show">후기 작성하기</button>

								<div class="background">
									<div class="window">
										<div class="popup">

											<div class="modal-header">
												<h3 class="modal-title" id="insertModalLabel">후기 작성</h3>
												<span class="close">&times;</span>
											</div>
											<div class="form-group">
												<label for="message-text" class="control-label">내용</label>
												<textarea class="form-control" name="content_text"
													id="insertContentText" placeholder="200자 이내로 작성 가능합니다."
													style="resize: none" maxlength="200"></textarea>
												<br>
											</div>
											<div class="modal-footer">
												<button type="submit" id="insertSubmit">등록하기</button>

											</div>
										</div>
									</div>
								</div>
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