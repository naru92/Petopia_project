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
	<%@include file="../include/default_sidebar.jsp"%>
	<main>
		<div class="donation-main">
			<h1>기부</h1>
			<div class="content">
				<img class="donation-img" src="images/donation.png">
			</div>

			<div class="content">
				<div class="my-box">
					<div class="donation-info">
						<div>
							<h4>현재까지 나의 총 기부금&nbsp&nbsp</h4>
						</div>
						<div>
							<h1 class="number">10000</h1>
						</div>
						<div>
							<h5>&nbsp 원</h5>
						</div>
					</div>
				</div>
				<div class="donation-bt">
					<a href="mypage_donation"><button class="donationBtn">기부하기</button></a>
				</div>
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
				<a href=""><div class="list-box">2021.07 사용 내역</div></a> <a href=""><div
						class="list-box">2021.06 사용 내역</div></a> <a href=""><div
						class="list-box">2021.05 사용 내역</div></a>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js">
		$(document).ready(function() {
			$(function() {
				  var cnt0 = 0;

				  counterFn();

				  function counterFn() {

				    id0 = setInterval(count0Fn, 100);

				    function count0Fn() {
				      cnt0++;
				      if (cnt0 > 99) {
				        clearInterval(id0);
				      } else {
				        $(".number").text(cnt0);
				      }
				    }
				  }
				});
		});
	</script>
	
	<script>
	<%@include file="../include/default_sidebar_js.jsp"%>
	</script>
</body>

</html>