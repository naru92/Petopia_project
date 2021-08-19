<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>포인트 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/my_point.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="point-main">
			<div class="content">
				<h2>포인트</h2>
				<a href="donate">
					<button class="donationBtn">기부하기</button>
				</a>
			</div>

			<div class="content">
				<div class="my-box">
					<div class="point-info">
						<div>
							<h4>보유 포인트</h4>
						</div>
						<div>
							<h1>&nbsp ${member.member_point}</h1>
						</div>
						<div>
							<h4>&nbsp Point</h4>
						</div>
					</div>
				</div>
			</div>

			<div class="table">
				<div class="table-box">

					<table class="point-table">
						<thead>
							<tr>
								<th>날짜 &nbsp</th>
								<th class="info">*1년 이내의 내역만 조회 가능합니다.</th>
								<th></th>
								<th>포인트</th>
							</tr>
						</thead>

						<c:forEach var="p" items="${point }">
							<tbody>
								<tr>
									<td>${p.member_date}</td>
									<td>${p.member_detail}</td>
									<td></td>
									<td>${p.member_point}point</td>
								</tr>
							</tbody>
						</c:forEach>
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