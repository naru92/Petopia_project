<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>아이디찾기 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/findid_style.css">
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
					<h3>비밀번호 변경 완료</h3>
					<p>비밀번호가 정상적으로 변경되었습니다.</p>
				</form>
				<div class="next-btn">
					<a href="/login"><button class="btn-login">로그인</button></a>
					<a href="/help/idInquiry"><button class="btn-main">아이디찾기</button></a> 
				</div>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>