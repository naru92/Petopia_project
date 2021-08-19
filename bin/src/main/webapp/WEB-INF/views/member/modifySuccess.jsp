<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>아이디찾기 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/modifySuccess_style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="container">
			<div class="login-form">
				<form>
					<h3>회원정보 수정 완료</h3>
					<p>회원정보가 정상적으로 변경되었습니다.</p>
				</form>
				<div class="next-btn">
					<a href="/main"><button class="btn-main">메인으로</button></a>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>