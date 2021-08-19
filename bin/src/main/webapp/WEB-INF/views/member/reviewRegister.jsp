<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>후기 작성 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/reviewRegister.css">
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
				<h2>리뷰 관리</h2>
			</div>


			<div class="content">
				<div class="box">
					<div class="orderList">
						<h4>상품 후기</h4>
						<p>이 상품에 대해서 얼마나 만족하시나요?</p>
					</div>
					
					<div class="orderList">
						<div class="orderList-info">
							<img src="/petopia/images/product_1.jpg">
							<div class="info">
								<h5>${o.product_name }&nbsp&nbsp
								${o.order_quantity }개</h5>
							</div>
						</div>
					</div>
					
					<div class="orderList" style="display: flex;">
						<div style="width: 150px; line-height: 250px;">
							상세 후기
						</div>
						<div>
							<textarea class="text-box" placeholder="상품 품질에 대한 고객님의 솔직한 후기를 남겨주세요.&#13;&#10;(저작권 침해, 음락, 욕설, 비방글, 판매, 광고 및 홍보성의 글은 임의로 삭제 처리 될 수 있습니다.)">
							</textarea>
						</div>
					</div>
					
					<div class="r-Btn">
						<a href="myOrderList"><button class="Btn2">작성취소</button></a>
						<a href="reviewList"><input type="submit" class="Btn1" value="등록하기"></a>
					</div>
					
					
				</div>




			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>


	<%@include file="../include/default_sidebar_js.jsp"%>





</body>

</html>