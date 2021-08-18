<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<style type="text/css">
#dataTable {
	width: 65%;
}
</style>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<main>
		<div class="donation-main">
			<h1>기부</h1>
			<div class="content">
				<img class="donation-img"
					src="/petopia/images/98091294681147784_1498568887.jpg">
			</div>


			<div class="content">

				<div class="donation-box">
					<div class="donation-subtitle">
						<h4>오늘 함께한 기부금</h4>
					</div>
					<div class="donation-info">
						<div>
							<h3>${today}</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>${donation.donation_today}</h3>
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
							<h3>${month}</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>${donation.donation_month}</h3>
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
							<h3>${total}</h3>
						</div>
						<div>
							<h5>&nbsp 명이</h5>
						</div>
					</div>
					<div class="donation-info">
						<div>
							<h3>${donation.donation_total}</h3>
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
				<table>
					<tr>
						<td colspan="2">기부 분류&nbsp;&nbsp;</td>
						<td colspan="5" class="pleft"><select
							id="donation_date_month" name="donation_date_month">
								<option value="" selected>--기부 월 선택--</option>
								<option id="option1" value="recent_month"></option>
								<option id="option2" value="before_1month"></option>
								<option id="option3" value="before_2month"></option>
						</select></td>
					</tr>
				</table>
				<input type="hidden" name="member_id" id="memberInfo" value="${member_id}">
				<table class="table table-bordered" id="dataTable" width="80%"
					cellspacing="0">
					<thead>
						<tr>
							<th>아이디</th>
							<th>사용내역</th>
							<th>기부금</th>
							<th>기부날짜</th>

						</tr>
					</thead>

					<c:forEach var='d' items="${donationList}">
						<tbody>
							<tr>
								<td>${member_id }</td>
								<td>${d.donation_idx }</td>
								<td>${d.donation_notused }</td>
								<td>${d.donation_month }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							let today = new Date();

							let year = today.getFullYear(); // 년도
							let month = today.getMonth() + 1; // 월
							let date = today.getDate(); // 날짜
							let day = today.getDay(); // 요일
							
							const member_id = $("#memberInfo").val();
							var todayDate = year + '년 ' + month + '월';
							var beforeOneMonthDate = year + '년 ' + (month - 1)
									+ '월';
							var beforeTwoMonthDate = year + '년 ' + (month - 2)
									+ '월';
							console.log(beforeOneMonthDate);

							$("#option1").text(todayDate);
							$("#option2").text(beforeOneMonthDate);
							$("#option3").text(beforeTwoMonthDate);

							$('#donation_date_month')
									.on(
											'change',
											function(event) {

												console.log('change');

												var donation_date_month = $(
														'#donation_date_month')
														.val();

												console
														.log(donation_date_month);

												var month = {
													member_id : member_id,
													donation_date_month : donation_date_month
												}

												$
														.ajax({
															type : 'post',
															url : '/member/donation_month',
															cache : false,
															data : JSON
																	.stringify(month),
															contentType : "application/json; charset=utf-8",
															dataType : 'json',
															success : function(
																	list,
																	status) {

																var htmls = "";

																$("#dataTable")
																		.html(
																				"");

																$(
																		"<tr>",
																		{
																			// 기부 컬럼명들								
																			html : "<td>"
																				+ "아이디"
																				+ "</td>" 
																				+	"<td>"
																					+ "사용내역"
																					+ "</td>"
																					+ "<td>"
																					+ "기부금"
																					+ "</td>"
																					+ "<td>"
																					+ "기부날짜"
																					+ "</td>"
																					
																		})
																		.appendTo(
																				"#dataTable") // 이것을 테이블에붙임

																if ($(list).length < 1) {
																	alert("등록된 상품이 없습니다.");
																} else {

																	$(list)
																			.each(
																					function() {
																						htmls += '<tr>';
																						htmls += '<td>'
																							+ member_id
																							+ '</td>';
																						htmls += '<td>'
																								+ this.member_point_detail
																								+ '</td>';
																						htmls += '<td>'
																								+ this.member_point_usepoint
																								+ '</td>';
																						htmls += '<td>'
																								+ this.member_point_usedate
																								+ '</td>';
																						htmls += '</tr>';

																					}); //each end

																}

																$("#dataTable")
																		.append(
																				htmls);
															},
															error : function(
																	request,
																	status,
																	error) {
																alert("code = "
																		+ request.status
																		+ " message = "
																		+ request.responseText
																		+ " error = "
																		+ error); // 실패 시 처리
															}
														});
											});

						});
	</script>
</body>

</html>