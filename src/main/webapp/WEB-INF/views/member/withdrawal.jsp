<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>비밀번호 재확인</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/withdrawal.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="container">
			<div class="withdrawal-form">
				<div class="main">
					<h3>본인 재확인</h3>
					<p>안전한 탈퇴를 위해 아이디와 비밀번호를 다시 한 번 입력해주세요.</p>
				</div>
				<div class="form-group">
					<input type="text" name="member_id" placeholder="아이디">
				</div>
				<div class="form-group">
					<input type="password" name="member_password" placeholder="비밀번호">
				</div>
				<a href=withdrawal_success"><button class="withdrawal-btn">확인</button></a>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>

</html>