<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>기부</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/donate.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
		<%@include file="../include/mypage_sidebar.jsp"%>
	</header>

	<main>
		<div class="container">
			<div class="withdrawal-form">
				<div class="main">
					<h3>기부</h3>
					<p style="text-align: center;">
						따뜻한 손길이 필요한 동물,</br> 동물 복지 개선을 위한 토대 마련 등에</br> 펫토피아가 더 뛰겠습니다.
					</p>
				</div>

				<form action="reviewSuccess" method="POST">
					<table class="tbl_edit01">
						<colgroup>
							<col width="90px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th></th>
								<td>사용가능 포인트 : <span name="left_pnt">${member.member_point }</span>포인트
									<span></td>
							</tr>
							<tr>
								<td></td>
								<td><span> <input type="number" name="use_pnt"
										id="use_pnt" min="0" max="65000" onchange="changePoint"></span>
									포인트 <span name="left_pnt" id="left_pnt"></span></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<button type="submit" class="withdrawal-btn"
										onclick="handleonClick()">기부하기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>


	<!-- 	<script>
		function onlyNumber(event){
    		event = event || window.event;
    		var keyID = (event.which) ? event.which : event.keyCode;
    		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
    				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        		return;
    		else
        		return false;
		}
 
		function removeChar(event) {
    		event = event || window.event;
    		var keyID = (event.which) ? event.which : event.keyCode;
    		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        		return;
    		else
        		event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}
	</script> -->



	<script>
		function chkPoint(pnt, min, unit) {
			//input값을 전체 마일리지로 설정 > minusPoint 
			// pnt : 사용가능,남은 포인트 / min : 사용 가능 최소 포인트 / unit : 사용단위
			var v_point = 0; //사용할 포인트 (input 입력값)

			if (document.getElementById("chk_use").checked) {
				if (pnt < min) //최소 사용 단위보다 작을 때
				{
					v_point = 0;
				} else {
					v_point = pnt - pnt % unit; //사용할 포인트 = 전체 마일리지 중 최소단위 이하 마일리지를 뺀 포인트
				}
			}
			document.getElementById("use_pnt").value = v_point; //input 값 설정
			changePoint(pnt, min, unit);
		}
	</script>



</body>

</html>