<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<%@include file="../include/default_css.jsp"%>


<style type="text/css">

footer {
 

}
.board {
	margin-left: 230px;
	padding-right: 10px;
	padding-top: 0px;
}

.boardbody {
	padding-top: 3px;
	margin-left: 10px;
	padding-right: 20px;
}
.wrap{

margin-bottom: 60px;
}
.write_aria{

width: 600px;
}
.write_aria input{
width:100%;
padding: 0;
}
.write_aria textarea{
width:100%;
padding: 0;
}
.card-title {
	
}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>


<div class="container-fluid wrap">
<div class="col-2">
			<%@include file="../include/default_sidebar.jsp"%>
		</div>
<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow write_aria">
					<div class="card-body ">
						<h3>공지사항 작성</h3>
						<hr>
						<form:form action='${root}/notice/register' method ='post' modelAttribute="noticeContentVO">
						<form:hidden path="board_id"/>
							<div class="form-group">
								<form:label path="content_title">제목</form:label>
								<form:input path="content_title" class="form-control" />
							</div>

							<div class="form-group">
								<form:label path="">작성자</form:label>
								<input value="관리자" disabled="disabled"></input>
							</div>

							<div class="form-group">
								<form:label path="content_text">내용</form:label>
								<form:textarea path="content_text" name="board_content"
									class="form-control" rows="10" style="resize: none" />
							</div>
							
						
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-default">작성하기</form:button>
							</div>
						</div>
						</form:form>

					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	</div>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_sidebar_js.jsp"%>

	
</body>
</html>






