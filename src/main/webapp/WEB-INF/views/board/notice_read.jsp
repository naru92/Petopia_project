<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
	<script src="https://kit.fontawesome.com/c529000005.js" crossorigin="anonymous"></script>
<%@include file="../include/default_css.jsp"%>


<style type="text/css">
.notice_button1{
margin-top: 10px;
color: white;
}
.notice_button2{
margin-top: 10px;
}
.notice_button3{
margin-top: 10px;
background-color: #2AC1BC; 
color: white;
}

.notice_container{
margin-top : 95px;
margin-bottom: 50px;
}
.ui_border .border_tit {
	font-size: 28px;
	line-height: 57px;
	color: #333;
	font-weight: bold;
	text-align: center
}

.ui_border .border_cont {
	border-top: 1px solid #8b8b8b;
	border-bottom: 1px solid #8b8b8b
}

.ui_border .border_cont input[type="text"], textarea {
	padding: 0 30px;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	display: block;
	width: 100%;
	border: 0;
	text-align: left
}

.ui_border .border_cont textarea {
	padding: 38px 20px;
	font-size: 24px;
	line-height: 36px;
	color: #666
}

.ui_border .border_cont .inq_field {
	line-height: 57px;
	border-bottom: 1px solid #dedede !important
}

.btn_area {
	margin-top: 30px;
	text-align: center
}

/* 버튼 공통 */
button, input {
	margin: 0;
	padding: 0;
	border: 0
}

.ui_btn {
	display: block;
	padding: 10px 0;
	cursor: pointer;
	color: #8f8f8f;
	text-align: center;
	font-size: 13px;
	line-height: 1.5em;
	font-weight: bold;
	background: 0 0;
	border: 1px solid #a8a8a8;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	text-decoration: none;
	box-sizing: border-box
}

.ui_btn.btn_inline {
	display: inline-block !important;
	padding: 10px 0;
	width: 48%
}

.ui_btn.btn_emph {
	color: #fff;
	background-color: #2078d2;
	border-color: #2078d2
}
</style>
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
					<div class="border_cont">
					
						<input type="text" value="제목 : ${board.content_title} " class="inq_field" readonly="readonly" />
					
						<input type="text" value="작성날짜 : ${board.content_date} " class="inq_field"  readonly="readonly" ></input>
							
						<textarea name="content_text" id="" cols="30" rows="10" readonly="readonly">${board.content_text}</textarea>
						
					</div>
					
					<div class="form-group">
						
							<div class="text-right">
								
								<a href="${root }notice/modify?board_id=1&content_idx=${board.content_idx}"><button class="btn btn-warning notice_button1">수정</button></a>
								<a id=removeButton href="${root}notice/remove?board_id=1&content_idx=${board.content_idx}">
								<button class="btn btn-danger notice_button2">삭제</button></a>
								<a href="/notice?board_id=1"><button class="btn notice_button3">목록으로</button></a>
							</div>
					</div>
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






