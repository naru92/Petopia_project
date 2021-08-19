<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>리뷰 작성 완료 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/withdrawal_success.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<article class="one">
				<h3>기부 완료</h3>
				<div class="result">
					기부되었습니다.<br>
					소중한 마음 감사합니다.
				</div>
				<section id="content">
					<a href="myDonation"><button class="shop-btn">목록으로</button></a>
				</section>
			</article>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>
</html>