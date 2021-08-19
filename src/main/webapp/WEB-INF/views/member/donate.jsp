<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
					<p style="text-align: center;">따뜻한 손길이 필요한 동물,</br> 동물 복지 개선을 위한 토대 마련 등에</br> 펫토피아가 더 뛰겠습니다.</p>
				</div>
				
				<div style="text-align: center; padding:10px; margin-bottom: 10px;">
					<div>현재 보유 포인트 2345278 포인트</div>
				</div>
				<div class="form-group">
					<input type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' placeholder="기부하실 포인트를 입력해주세요.">
				</div>
				<a href="myDonation">
					<input class="withdrawal-btn" type="submit" onclick="handleOnClick()" value="기부하기"/>
				</a>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	<%@include file="../include/default_sidebar_js.jsp"%>

	<script>
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
	</script>

	<script>
		function handleOnClick() {
			alert('소중한 기부 감사합니다.');
		}
	</script>



</body>

</html>