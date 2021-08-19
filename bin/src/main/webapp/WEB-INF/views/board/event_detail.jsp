<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>이벤트 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/event_detail.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
		<%@include file="../include/default_sidebar.jsp"%>
	</header>

	<main>
		<div class="content">
			<div>
				<div class="subtitle">
					<h3>여름맞이 선물이 팡팡! 7월 출석 이벤트</h3>
					<p>2021.07.01 ~ 2021.07.31</p>
				</div>
				<div class="row">
					<div class="event-box">
						<img src="images/bc47d9f1-0878-4d88-b4f3-4d39d1dda1bc.jpg">
					</div>
				</div>
				<div>여기 이벤트 내용 이미지~~</div>
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