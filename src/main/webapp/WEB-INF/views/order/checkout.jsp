<%@ page language="java" contentType="text/html; charset=utf-8"
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
<link rel="stylesheet" href="/petopia/css/orderstyle.css">
<link rel="stylesheet" href="/petopia/css/orderbootstrap.min.css">

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
					<p>주문자 정보 입력</p>
				</div>
				<div class="spacing"></div>

				<div class="wrapper">
					<div class="sectionInner container">
						<div class="content">
							<div class="joinStepWrap ">
								<img src="../../lib/img/login/join_step03.gif" alt=""
									class="joinStep_Img container" />
							</div>
							<table>
								<tbody class="personalInfo">
									<tr>
										<th class="tableNumber">주문자 명</th>
										<td class="tableTitle"><label for="checkName"><input
												type="text" id="checkName" class="inputBox" /></label><span
											class="text">주문자 이름을 입력해주세요.</span></td>
									</tr>
									<tr>
										<th class="tableNumber">수령자 명</th>
										<td class="tableTitle"><label for="checkName"><input
												type="text" id="checkName" class="inputBox" /></label><span
											class="text">수령자 이름을 입력해주세요.</span></td>
									</tr>
									<tr>
										<th class="tableNumber">수령자 연락처</th>
										<td class="tableTitle"><label for="checkTel"> <input
												type="text" id="checkTel" class="inputBox" /> </lable><span
												class="text">핸드폰 번호를 입력해주세요. (예시: 010-1111-1111)</span></td>
									</tr>
									<tr>
										<th class="tableNumber">우편번호</th>
										<td class="tableTitle"><label for="PostalCode"><input
												type="text" id="postcode" placeholder="우편번호"
												class="inputBox2" readonly> <input type="button"
												onclick="execDaumPostcode()" value="우편번호 찾기"
												readonly><br></td>
									</tr>
									<tr class="address">
										<th class="tableNumber">주소</th>
										<td class="tableTitle"><label for="address1"> <input
												type="text" id="roadAddress" placeholder="도로명 주소"
												class="inputBox" readonly><br> 
												<input type="text"
												id="detailAddress" placeholder="상세주소"
												class="inputBox">
										</label></td>
									</tr>

								</tbody>
							</table>


							
						</div>
					</div>
				</div>
				<div class="spacing2">
					<hr>
				</div>

				<!-- 주문 내역 표 시작 -->
				<div class="orderform">
					<div class="header">
						<img alt="" src="http://www.dwcreative.uk/invoice/invoice1.png" />
					</div>
					<br> <br>

					<div class="thanks2">
						<p>주문한 상품</p>
					</div>
					<div class="spacing"></div>
					<div class="order2"></div>
					<!-- 주문 내역 표 끝 -->
					<br>

					<div class="table-responsive">
						<table class="orderProduct" id="ProductLog" cellspacing="0">
							<thead>
								<tr>
									<th>상품명</th>
									<th>수량</th>
									<th>옵션</th>
									<th>금액</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>${dto.product_name}</td>
									<td>2개</td>
									<td>없음</td>
									<td>3,800원</td>
								</tr>
								
								<tr>
									<td>삑삑이</td>
									<td>2개</td>
									<td>파랑</td>
									<td>5,000원</td>
								</tr>
							</tbody>

						</table>
						<div class="payment">
							<br /> <strong>배송비 : 무료</strong><br /> <strong> 
							총 결제금액: </strong><strong>8,800원</strong><br />
						</div>

					</div>
					<a href="main.html"><button class="homeBtn">결제하기</button></a>
				</div>
			  </div>
			</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_mapApi_js.jsp"%>
	
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>

</body>
</html>