<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>로그인 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/login_style.css">
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
				<form action="/loginProcess" method="POST">
					<h1>로그인</h1>
					<div class="form-group">
						<input type="text" name="member_id" placeholder="아이디"> 
						<span class="input-icon"><i class="fa fa-user-circle"aria-hidden="true"></i></span>
					</div>
					<div class="form-group">
						<input type="password" name="member_password" placeholder="비밀번호"> <span
							class="input-icon"><i class="fa fa-lock"></i></span>
					</div>
					<button id ="login-button" class="login-btn" type="submit" name="submit" >로그인</button>
				</form>	
					<div class="reset-group">
						<a class="reset-id" href="help/findid">아이디찾기</a> 
						<a class="reset-psw" href="help/findpw">비밀번호찾기</a> 
						<a class="sign-up" href="joinAgree">회원가입</a>
					</div>
					
					<div class="seperator">
						<b>or</b>
					</div>
					
					<p>SNS 간편 로그인</p>
					<!-- Social login buttons -->
					<div class="social-icon">
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=oXosCRoUhjS_qv3Pgdcy&state=state&redirect_uri=http://localhost:8282/naver/callback">
						<button class="naver" type="button"></button></a>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=ff1341405313f721c279ce5cd541bf40&redirect_uri=http://localhost:8282/kakao/callback&response_type=code">
						<button class="kakao" type="button"></button></a>
					</div>
					
					<div class="seperator">
						<b>or</b>
					</div>
				
				<form>	
					<h3>비회원 주문조회</h3>
					<div class="form-group">
						<input type="text" name="user_name" placeholder="주문자이름"> 
						<span class="input-icon"><i class="fa fa-user-circle"aria-hidden="true"></i></span>
					</div>
					<div class="form-group">
						<input type="password" name="order_idx" placeholder="주문번호"> 
						<span class="input-icon"><i class="fa fa-lock"></i></span>
					</div>
					<button id ="userlogin-button" class="login-btn" type="submit" name="submit">주문조회하기</button>
				</form>
				
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>