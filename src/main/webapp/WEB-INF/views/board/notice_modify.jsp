<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<title>Petopia</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="/petopia/css/notice.css">
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<div class="col-2">
		<%@include file="../include/default_sidebar.jsp"%>
	</div>
	<!-- 게시글 리스트 -->
	<div class="container">
		<div class="row">
			<div class="ui_container notice_container">
				<div class="ui_border">
					<h3 class="border_tit">공지사항</h3>
					<form:form action='${root }modify_pro' method='post' modelAttribute="modifyContentVO">
					<div class="border_cont">
						<form:hidden path="content_idx"/>
						<form:hidden path="board_id"/>
						<form:input type="text" path="content_title"  class="inq_field" ></form:input>
						<form:input type="text" path="content_date" value = "작성날짜 : ${modifyContentVO.content_date} " class="inq_field"  readonly="readonly" />
						<form:textarea path="content_text" name="content_text" id="" cols="30" rows="10" ></form:textarea>
					</div>
					
					<div class="form-group">
						
							<div class="text-right">
								<form:button class="btn btn-warning notice_button1">완료</form:button>
								<a class="btn notice_button3" href="${root }notice/get?board_id=1&content_idx=${modifyContentVO.content_idx}">취소</a>
							</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_sidebar_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>






