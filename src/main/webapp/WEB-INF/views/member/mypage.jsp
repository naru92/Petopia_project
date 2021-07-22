<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>My페이지 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test2.css">
<link rel="stylesheet" href="/petopia/css/mypage.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
		<%@include file="../include/mypage_sidebar.jsp"%>
	</header>



	<main>

		<div class="mypage-main">
			<h3 class="mypage-subtitle">MY 정보</h3>
			<div class="line">
				<!--내 정보-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<img class="profile-pic" src="images/ddassi.jpg">
					<div>
						<p>내정보</p>
						<c:forEach var='m' items="${memberList}">
							<h4>${m.member_name}</h4>
						</c:forEach>
					</div>
				</div>
				<!--마이펫 정보-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<img class="profile-pic" src="images/noma.jpg">
					<div>
						<c:forEach var='p' items="${mypetList}">
							<h4>${p.mypet_name}</h4>
							<p>${p.mypet_gender}아</p>
							<p>${p.mypet_age}살</p>
							<p>${p.mypet_weight}kg</p>
						</c:forEach>
					</div>
				</div>
				<!--등급 정보-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<c:forEach var='m' items="${memberList}">
							<p>등급</p>
							<h4>${m.member_grade}</h4>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="line">
				<!--포인트-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<c:forEach var='m' items="${memberList}">
						<p>보유 포인트</p>
						<h4>${m.member_point}Point</h4>
					</c:forEach>
				</div>
				<!--기부-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='mypage_donation';">
					<h4>기부 내역</h4>
				</div>
			</div>

			<h3 class="mypage-subtitle">MY 쇼핑</h3>
			<div class="line">
				<!--주문내역-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>주문내역</h4>
					</div>
				</div>
				<!--배송조회-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>배송조회</h4>
					</div>
				</div>
				<!--취소/반품/교환-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>취소/반품/교환</h4>
					</div>
				</div>
			</div>
			<div class="line">
				<!--최근 본 상품-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>최근 본 상품</h4>
					</div>
				</div>
				<!--장바구니-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>장바구니</h4>
					</div>
				</div>
				<!--위시리스트-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>위시리스트</h4>
					</div>
				</div>
			</div>

			<h3 class="mypage-subtitle">MY 발자국</h3>
			<div class="line">
				<!--QnA-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>QnA</h4>
					</div>
				</div>
				<!--후기 내역-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>후기 내역</h4>
					</div>
				</div>
				<!--댓글 내역-->
				<div class="profile-box" style="cursor: pointer;"
					onclick="location.href='#';">
					<div>
						<h4>댓글 내역</h4>
					</div>
				</div>
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