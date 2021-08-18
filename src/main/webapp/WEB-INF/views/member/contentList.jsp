<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>작성 글 내역 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/contentList.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header> </header>
	<%@include file="../include/default_header.jsp"%>
	<%@include file="../include/mypage_sidebar.jsp"%>
	<main>
		<div class="review-main">
			<div class="content" style="border-bottom: 1px solid black;">
				<h2>작성 글 내역</h2>
			</div>

			<div class="content">
				<c:forEach var="c" items="${contentList}">
					<div class="box">
						<div class="post" style="display: flex;">
							<div>
								<a href="#"> <img class="p-img"
									src="/petopia/images/cat2.jpg">
								</a>
							</div>
							<div>
								<a href="#">
									<h4>${c.content_title }</h4>
									<p>${c.content_date }</p>
								</a>
							</div>

							<div class="u-d" style="display: flex;">
								<div class="modify">
									<a href="#">
										<p>수정</p>
									</a>
								</div>
								<div>
									<a href="#">
										<p>삭제</p>
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>






			</div>





			<div class="content"></div>

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