<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>기부 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/my_donation.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="donation-main">
			<div class="content">
				<h2>기부</h2>
				<a href="donate">
					<button class="donationBtn">기부하기</button>
				</a>
			</div>
			
			<div class="content">
				<div class="my-box">
					<div class="donation-info">
						<div>
							<h4>현재까지 나의 총 기부 횟수</h4>
						</div>
						<div>
							<h1>&nbsp </h1>
						</div>
						<div>
							<h5>&nbsp 번</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="my-box">
					<div class="donation-info">
						<div>
							<h4>현재까지 나의 총 기부금</h4>
						</div>
						<div>
							<h1>&nbsp ${member.member_donation}</h1>
						</div>
						<div>
							<h5>&nbsp 원</h5>
						</div>
					</div>
				</div>
			</div>
			
			<div class="table">
				<div class="table-box">
					<div>
						<h4>${member.member_name}님의 기부 내역을 확인하세요!</h4>
					</div>

					<table class="donation-table">
						<thead>
							<tr>
								<th>기부 내역 &nbsp</th>
								<th class="info">*1년 이내의 기부 내역만 조회 가능합니다.</th>
								<th>기부 포인트</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="d" items="${donationList}">
							<tr>
								<td>${d.member_point_usedate }</td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
<!-- 							<tr>
								<td>2021.06.02</td>
								<td></td>
								<td>1000 point</td>
							</tr> -->
						</tbody>
					</table>

				</div>
			</div>

			


			<div class="content"></div>

		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>


</body>

</html>