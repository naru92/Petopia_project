<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>등급혜택 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/grade.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="grade-main">
			<h1>등급별 혜택 안내</h1>
			<p>펫토피아에 가입하시면 브론즈 회원이 되시며,</p>
			<p>펫토피아에서 구매하신 실적에 따라 브론즈, 실버, 골드 회원으로 승급됩니다.</p>
			<p>회원 등급에 따라 다양한 혜택이 제공됩니다.</p>
			
			<div class="content">
				<div class="grade-box">
					<div class="grade-subtitle">
						<img src="/petopia/images/bronze_medal.png">
						<h2>BRONZE</h2>
					</div>
					<div class="grade-info">
						<div>
							<h3>승급 기준</h3>
							<p><span class="blue">2년간 구매 누계 실적</span></p>
							<p>20만원 미만 또는 누계횟수 3회 미만</p>
						</div>
						<div>
							<h3>등급별 혜택</h3>
							<p><span class="blue">포인트 적립 (구매 시)</span></p>
							<p>0.2% (월 적립한도 50,000 포인트)</p>
						</div>
					</div>
				</div>

				<div class="grade-box">
					<div class="grade-subtitle">
						<img src="/petopia/images/silver_medal.png">
						<h2>SILVER</h2>
					</div>
					<div class="grade-info">
						<div>
							<h3>승급 기준</h3>
							<p><span class="blue">2년간 구매 누계 실적</span></p>
							<p>20만원 ~ 50만원 미만</p>
							<p>또는 누계횟수 3회 이상</p>
						</div>
						<div>
							<h3>등급별 혜택</h3>
							<p><span class="blue">포인트 적립 (구매 시)</span></p>
							<p>0.3% (월 적립한도 50,000 포인트)</p>
						</div>
						<div>
							<p style="margin-top: 10px;"><span class="blue">유지기간</span></p>
							<p>취득 월로부터 2년간 유효</p>
						</div>
					</div>
				</div>


				<div class="grade-box">

					<div class="grade-subtitle">
						<img src="/petopia/images/gold_medal.png">
						<h2>GOLD</h2>
					</div>
					<div class="grade-info">
						<div>
							<h3>승급 기준</h3>
							<p><span class="blue">2년간 구매 누계 실적</span></p>
							<p>50만원 이상</p>
						</div>
						<div>
							<h3>등급별 혜택</h3>
							<p><span class="blue">포인트 적립 (구매 시)</span></p>
							<p>0.4% (월 적립한도 50,000 포인트)</p>
						</div>
						<div>
							<p style="margin-top: 10px;"><span class="blue">유지기간</span></p>
							<p>취득 월로부터 2년간 유효</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>

</html>