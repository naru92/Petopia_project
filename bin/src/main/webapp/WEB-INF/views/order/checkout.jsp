<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<!-- CSS here -->
<link rel="stylesheet" href="petopia/css/orderstyle.css">
<link rel="stylesheet" href="petopia/css/orderbootstrap.min.css">

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
		<!-- Hero Area Start-->
		<div class="slider-area ">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-left">
								<br> <br>
								<div class="order">
									<p>OrderForm</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- OrderForm Start -->
		<div class="container">
			<div class="orderform">
				<div class="header">
					<img alt="" src="http://www.dwcreative.uk/invoice/invoice1.png" />
				</div>
				<br> <br>
				<div class="thanks2">
					<p>주문 결제</p>
				</div>
				<div class="spacing"></div>

				<div class="wrapper">
					<div class="sectionInner container">
						<div class="content">
							<div class="joinStepWrap ">
								<img src="../../lib/img/login/join_step03.gif" alt=""
									class="joinStep_Img container" />
							</div>
							<table class="tableWrap">
								<tbody class="personalInfo">
									<tr>
										<th class="tableNumber">주문자 명</th>
										<td class="tableTitle"><label for="checkId"><input
												type="text" id="checkId" class="inputBox" /></label> <span
											class="text">주문자 명을 입력해주세요.</span></td>
									</tr>
									<tr>
										<th class="tableNumber">연락처</th>
										<td class="tableTitle"><label for="insertPw"><input
												type="password" id="insertPw" class="inputBox" /></label> <span
											class="text">연락처를 입력해주세요.</span></td>
									</tr>
									<tr>
										<th class="tableNumber">우편번호</th>
										<td class="tableTitle"><label for="PostalCode"><input
												type="text" id="PostalCode" class="inputBox"
												style="width: 30%;" /></label> <a href="#" class="btn01">우편번호
												검색</a></td>
									</tr>
									<tr class="address">
										<th class="tableNumber">주소</th>
										<td class="tableTitle"><label for="address1"><input
												type="text" id="address1" class="inputBox"
												style="width: 100%;" /></label> <label for="address2"><input
												type="text" id="address2" class="inputBox"
												style="width: 100%;" placeholder="나머지 주소를 입력해주세요" /></label></td>
									</tr>
								</tbody>
							</table>
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