<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>후기내역 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/reviewList.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="review-main">
			<div class="content" style="border-bottom: 1px solid black;">
				<h2>후기 관리</h2>
			</div>

			<div class="content">
				<div class="box">
					<div class="pro" style="display: flex;">
						<div>
							<a href="#">
								<img class="p-img" src="/petopia/images/product_1.jpg">
							</a>
						</div>
						<div class="pro-name">
							<a href="#">
								<p>상품 이름</p>
							</a>
						</div>
						<div style="display: flex;">
							<div class="modify">
								<a href="#">
									<p>수정</p>
								</a>
							</div>
							<div>
								<a href="#">
									<p>삭제</p>
								</a>
							</div>
						</div>
					</div>

					<div>
						<div>
							<div style="display: flex;">
								<p>여기 별점과 날짜가 들어갑니다</p>
								<p>2021.08.12</p>
							</div>
							<div>
								<img class="r-pic" src="/petopia/images/product_1.jpg">
							</div>
							<div>
								<h5>리뷰내요입니다.</h5>
							</div>
						</div>
					</div>
				</div>


				<div class="box">
					<div class="pro" style="display: flex;">
						<div>
							<a href="#"> <img class="p-img"
								src="/petopia/images/product_1.jpg">
							</a>
						</div>
						<div class="pro-name">
							<a href="#">
								<p>상품 이름</p>
							</a>
						</div>
						<div style="display: flex;">
							<div class="modify">
								<a href="#">
									<p>수정</p>
								</a>
							</div>
							<div>
								<a href="#">
									<p>삭제</p>
								</a>
							</div>
						</div>
					</div>

					<div>
						<div>
							<div style="display: flex;">
								<p>여기 별점과 날짜가 들어갑니다</p>
								<p>2021.08.12</p>
							</div>
							<div>
								<img class="r-pic" src="/petopia/images/product_1.jpg">
							</div>
							<div>
								<h5>리뷰내요입니다.</h5>
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
</body>

</html>