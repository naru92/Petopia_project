<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>회원 탈퇴 완료 | Petopia</title>
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
				<h3>회원탈퇴</h3>
				<div class="result">
					회원 탈퇴가 완료되었습니다.<br>
					보다 나은 펫토피아로 다시 만나뵐 수 있기를 바랍니다.
				</div>
				<section id="content">
					<a href="/main"><button class="shop-btn">메인으로</button></a>
				</section>
			</article>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>
</html>