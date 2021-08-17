<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="utf-8" />
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
					<div class="profile-box">
						<img class="profile-pic" src="/petopia/images/petstagram_profile1.jpg">
						<div>
							<p>내 정보</p>
							<h4>${member.member_name} </h4>
							<p>님</p>
						</div>
						<div class="modifybutton">
							<a href="passwordConfirm">
								<button class="ModifyBtn">수정</button>
							</a>
						</div>
					</div>

					<!--마이펫 정보-->
					<div class="profile-box">
							<img class="profile-pic" src="/petopia/images/icon_bar_save_on1.png">
							<div>
								<h4>${mypet.mypet_name}</h4>
								<p>${mypet.mypet_gender}</p>
								<p>${mypet.mypet_age} 살</p>
								<p>${mypet.mypet_weight} kg</p>
							</div>
							<div class="modifybutton">
								<a href="#">
									<button class="ModifyBtn">관리</button>
								</a>
							</div>
					</div>

					<!--등급 정보-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/grade.png">
						</a>
						<div>
							<p>등급</p>
							<a href="#">
								<h4>${member.member_grade}</h4>
							</a>
						</div>
					</div>
				</div>

				<div class="line">
					<!--포인트-->
					<div class="profile-box">
						<a href="point">
							<img class="profile-pic" src="/petopia/images/point.png">
						</a>
						<div>
							<p>포인트</p>
							<a href="point">
								<h4>${member.member_point} &nbsp Point</h4>
							</a>
						</div>
					</div>

					<!--기부-->
					<div class="profile-box">
						<!-- <h4>기부 내역</h4> -->
						<a href="myDonation">
							<img class="profile-pic" src="/petopia/images/donation.png">
						</a>
						<div>
							<a href="myDonation">
								<h4>기부 내역</h4>
							</a>
						</div>
					</div>

				</div>

				<h3 class="mypage-subtitle">MY 쇼핑</h3>
				<div class="line">
					<!--주문내역-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/order.png">
						</a>
						<div>
							<a href="#">
								<h4>주문내역</h4>
							</a>
						</div>
					</div>

					<!--배송조회-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/delivery.png">
						</a>
						<div>
							<a href="#">
								<h4>배송조회</h4>
							</a>
						</div>
					</div>

					<!--취소/반품/교환-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/return.png">
						</a>
						<div>
							<a href="#">
								<h4>취소/반품/교환</h4>
							</a>
						</div>
					</div>
				</div>

				<div class="line">
					<!--최근 본 상품-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/recent_view.png">
						</a>
						<div>
							<a href="#">
								<h4>최근 본 상품</h4>
							</a>
						</div>
					</div>

					<!--장바구니-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/cart.png">
						</a>
						<div>
							<a href="#">
								<h4>장바구니</h4>
							</a>
						</div>
					</div>

					<!--위시리스트-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/wishlist.png">
						</a>
						<div>
							<a href="#">
								<h4>위시리스트</h4>
							</a>
						</div>
					</div>
				</div>

				<h3 class="mypage-subtitle">MY 발자국</h3>
				<div class="line">
					<!--QnA-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/QnA.png">
						</a>
						<div>
							<a href="#">
								<h4>QnA</h4>
							</a>
						</div>
					</div>
					<!--후기 내역-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/review.png">
						</a>
						<div>
							<a href="#">
								<h4>후기 내역</h4>
							</a>
						</div>
					</div>
					<!--댓글 내역-->
					<div class="profile-box">
						<a href="#">
							<img class="profile-pic" src="/petopia/images/comments.png">
						</a>
						<div>
							<a href="#">
								<h4>댓글 내역</h4>
							</a>
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