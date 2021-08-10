<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>기부 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/donation.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<main>
		<div class="donation-main">
			<h1>기부</h1>
			<div class="content">
				<img class="donation-img" src="images/donation.png">
			</div>
			
			
			<div class="content">

				<div class="donation-box">
					<div class="donation-subtitle">
						<h4>오늘 함께한 기부금</h4>
					</div>
					<div class="donation-info">
						<div>
							<h3>50</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>40,000</h3>
						</div>
						<div>
							<h5>&nbsp 원을</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h5>기부하였습니다.</h5>
						</div>
					</div>
				</div>

				<div class="donation-box">
					<div class="donation-subtitle">
						<h4>이번 달 누적 기부금</h4>
					</div>
					<div class="donation-info">
						<div>
							<h3>204</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>963,272</h3>
						</div>
						<div>
							<h5>&nbsp 원을</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h5>기부하였습니다.</h5>
						</div>
					</div>
				</div>


				<div class="donation-box">

					<div class="donation-subtitle">
						<h4>총 누적 기부금</h4>
					</div>
					<div class="donation-info">
						<div>
							<h3>141,794</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>1,023,928,575</h3>
						</div>
						<div>
							<h5>&nbsp 원을</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h5>기부하였습니다.</h5>
						</div>
					</div>
				</div>
			</div>
			<div>
				<h2>사용 내역</h2>
				<div class="list-box">2021.07 사용 내역</div>
				<div class="list-box">2021.06 사용 내역</div>
				<div class="list-box">2021.05 사용 내역</div>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
	<script>
	<%@include file="../include/default_sidebar_js.jsp"%>
	</script>
</body>

</html>