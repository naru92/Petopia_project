<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이펫 등록</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/join_style.css">
<link rel="stylesheet" href="/petopia/css/memberModify.css">
<link rel="stylesheet" href="/petopia/css/passwordConfirm.css">

<!-- 추후에 수정 -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/petopia_logomini.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://wagtrung.github.io/store/themify-icons/themify-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>비밀번호 확인</h3>
			<div class="result">
				<p class="sub">
					회원님의 소중한 개인정보 보호를 위해 <br> 비밀번호 확인 후 변경이 가능합니다.
				</p>
			</div>

			<article class="one">
				<!-- article 기능이 뭔지 (두개 다)? -->
				<article class="find1">
					<div>
						<section id="content3">
							<div>
								<input type="password" placeholder="비밀번호를 입력해주세요."
									autocomplete="new-password" maxlength="20"
									aria-autocomplete="list">
							</div>
							<p class="validation-check" id="errorMsg" style>비밀번호를 다시
								확인해주세요.</p>

							<a href="welcome.html"><button class="join-btn">확인</button></a>
						</section>
					</div>
				</article>
			</article>
		</div>
	</main>
	<!-- footer -->
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script>
		$("document").ready(function() {
			//해당 페이지의 첫 진입점
			//ex) 로그인한 사용자의 id 를 display
			$("#txtId").val('isnana');
		})

		$("document").ready(function() {
			//해당 페이지의 첫 진입점
			//ex) 로그인한 사용자의 id 를 display
			$("#txtMemberName").val('허하나');
		})

		//테스트용 버튼!!!!
		$("#btnTest").click(function() {
			$("#txtId").attr('readonly', true);
			$("#txtId").addClass('disabledInput');
		})
	</script>

</body>
</html>