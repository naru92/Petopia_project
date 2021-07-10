<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<title>welcome Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="petopia/css/welcome_style.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>회원가입</h3>
			<div class="result">
				<span class="blue">회원가입</span>이 <span class="blue">완료</span>되었습니다.
			</div>

			<article class="one">
				<div class="taball">
					<div class="tab1">
						<img src="https://image.flaticon.com/icons/svg/126/126486.svg"><br>STEP
						1<br>가입하기<br>
					</div>
					<div class="tab2">
						<img src="https://image.flaticon.com/icons/svg/1159/1159633.svg"><br>STEP
						2<br>약관동의<br>
					</div>
					<div class="tab3">
						<img src="https://image.flaticon.com/icons/svg/839/839860.svg"><br>STEP
						3<br>정보입력<br>
					</div>
					<div class="tab4">
						<img src="https://image.flaticon.com/icons/svg/3064/3064197.svg"><br>STEP
						4<br>가입완료<br>
					</div>
				</div>

				<section id="content4">
					<img
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTM2MiA0NzcuNWMtMjYuMDc1IDAtNDguMzE4LTE2LjcxOS01Ni41NzMtNDBoLTEwOC44NTRjLTE4LjkwNyA1My4wMTYtOTQuMjYgNTIuOTgzLTExMy4xNDYgMGgtMy40MjdjLTQ0LjA5IDAtNzkuOTY1LTM1Ljg1NC04MC03OS45MzggMC0uMDExIDAtLjAyMSAwLS4wMzF2LTExMS4wMzFjLjEzMy02MC45NSAxNS4wNzUtMTE0LjgzNiA1OC4zMjctMTU0LjMyNiA0Mi44NjMtMzguODA5IDEwNy44NDktNTcuNjc0IDE5OC42NzMtNTcuNjc0IDQ4LjAzNSAwIDg4LjA2OSAyNy4wMzIgMTE1Ljc3MyA3OC4xNzQgMTMuOTgyIDI1LjgxMiAyMS44OTYgNTIuNDM5IDI1Ljk4IDY5LjU2MiAyNy4wNyA1LjUzMSA1MC44MDMgMTQuMDE1IDcyLjIyIDI1Ljc4NyAyNS4zMDcgMTMuOTExIDQxLjAyNyA0MC42ODIgNDEuMDI3IDY5Ljg2NnY3OS42MTFjMCA0NC4xMTItMzUuODg4IDgwLTgwIDgwaC0xMy40MjdjLTguMjU1IDIzLjI4MS0zMC40OTggNDAtNTYuNTczIDQwem0tMTgyLTgwaDE0MmMxMS4wNDYgMCAyMCA4Ljk1NCAyMCAyMCAxLjA5OCAyNi41MzMgMzguOTA2IDI2LjUyNSA0MCAwIDAtMTEuMDQ2IDguOTU0LTIwIDIwLTIwaDMwYzIyLjA1NiAwIDQwLTE3Ljk0NCA0MC00MHYtNzkuNjExYzAtMTQuNTkyLTcuNzc2LTI3LjkzMi0yMC4yOTUtMzQuODEzLTIwLjg0OC0xMS40NTktNDQuNjk2LTE5LjI1Ni03Mi45MDgtMjMuODMzLTkuMTg5LTEuMzIyLTE1LjY4NS05LjQ0NC0xNi42MTMtMTYuODUzLTQuMDM2LTIxLjM1Ny0yOC4wNjktMTI3Ljg5LTEwNS4xODQtMTI3Ljg5LTE5Mi4zMzUgMC0yMTcgOTEuOTItMjE3IDE3MnYxMTFjMCAyMi4wNTYgMTcuOTQ0IDQwIDQwIDQwaDIwYzExLjA0NiAwIDIwIDguOTU0IDIwIDIwIDEuMDk5IDI2LjUzMyAzOC45MDYgMjYuNTI1IDQwIDAgMC0xMS4wNDYgOC45NTQtMjAgMjAtMjB6bTEwNS0xMzZjLTcuMDI5IDAtMTMuMjEgMy42MjYtMTYuNzc3IDkuMTA5LTMxLjc1NiA0My42OTMtODUuMDY4IDQzLjI3LTExNi40NTUtLjAxMy0zLjU2OC01LjQ3Ni05Ljc0NS05LjA5Ni0xNi43NjgtOS4wOTYtMTUuOTM5LS4xNjItMjUuNTc4IDE4LjMzLTE2LjUyMyAzMS4yNzIgNDYuNzg2IDY3LjA2OSAxMzYuMDA0IDY3LjI2NSAxODIuOTguMDk2IDkuMTYxLTEyLjkzNS0uNDY3LTMxLjUzLTE2LjQ1Ny0zMS4zNjh6bS0xMDgtNjRjMCAxMy44MDctMTEuMTkzIDI1LTI1IDI1LTMzLjE2Mi0xLjMxNy0zMy4xNTMtNDguNjg4IDAtNTAgMTMuODA3IDAgMjUgMTEuMTkzIDI1IDI1em05MS0yNWMtMTMuODA3IDAtMjUgMTEuMTkzLTI1IDI1IDEuMzE3IDMzLjE2MiA0OC42ODggMzMuMTUzIDUwIDAgMC0xMy44MDctMTEuMTkzLTI1LTI1LTI1eiIgZmlsbD0iIzJhYzFiYyIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiIgY2xhc3M9IiI+PC9wYXRoPjwvZz48L3N2Zz4=" />
					<div class="result2">
						<span class="blue">PETOPIA</span>에 오신걸 <span class="blue">환영합니다!</span>
					</div>
					<p class="info">
						모든 회원가입 절차가 완료되었습니다.<br>로그인 후 다양한 혜택과 서비스를 이용하실 수 있습니다.
					</p>
					<a href="main"><button class="shop-btn">메인으로</button></a>
				</section>
			</article>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>
</html>