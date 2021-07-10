<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<title>Login</title>
<!-- CSS here -->
<link rel="stylesheet" href="petopia/css/login_style.css">
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
					<h1>로그인</h1>
					<div class="form-group">
						<input type="id" name="id" placeholder="아이디"> <span
							class="input-icon"><i class="fa fa-user-circle"
							aria-hidden="true"></i></span>
					</div>
					<div class="form-group">
						<input type="password" name="psw" placeholder="비밀번호"> <span
							class="input-icon"><i class="fa fa-lock"></i></span>
					</div>
					<button class="login-btn">로그인</button>
					<div class="reset-group">
						<a class="reset-id" href="#">아이디찾기</a> <a class="reset-psw"
							href="#">비밀번호찾기</a> <a class="sign-up" href="joinagree">회원가입</a>
					</div>
					<div class="seperator">
						<b>or</b>
					</div>
					<p>SNS 간편 로그인</p>
					<!-- Social login buttons -->
					<div class="social-icon">
						<button class="naver" type="button"></button>
						<button class="kakao" type="button"></button>
					</div>
				</form>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>