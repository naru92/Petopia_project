<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>아이디찾기 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/findId_style.css">
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
				<div class="find">
					<a href="/help/findid"><button class="findid-btn">아이디 찾기</button></a>
					<a href="/help/findpw"><button class="findpw-btn">비밀번호 찾기</button></a>
				</div>
				<form action="/loginProcess" method="POST">
					<h3>아이디 찾기</h3>
					<div class="form-group">
						<input type="text" name="member_name" placeholder="이름"> 
						<span class="input-icon"><i class="fa fa-user" aria-hidden="true"></i></span>
					</div>
					<div class="form-group">
						<input type="password" name="member_phoneNumber" placeholder="휴대폰 번호"> 
						<span class="input-icon"><i class="fa fa-phone"></i></span>
					</div>
					<div class="form-group">
						<input type="text" name="member_email" placeholder="이메일"> 
						<span class="input-icon"><i class="fa fa-envelope"></i></span>
						<button type="button" class="sendMail">인증번호전송</button>
					</div>
					<div class="form-group">
						<input type="text" placeholder="이메일 인증번호"> 
						<span class="input-icon"><i class="fa fa-check-circle"></i></span>
					</div>
					<button id ="confirm-button" class="confirm-btn" type="submit" name="submit" >확인</button>
				</form>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>