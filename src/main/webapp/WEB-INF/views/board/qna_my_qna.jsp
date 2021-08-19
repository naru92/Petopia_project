<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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

body, main{
	position: relative; 
	z-index: -100;
	background-color: #fff;
	height: 1300px;
}

@import
	url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400');

@import
	url('https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean')
	;

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/*
# font-family: 'MapoFlowerIsland';
강조: font-family: 'Black Han Sans', sans-serif;
보통: font-family: 'NEXON Lv1 Gothic OTF';

*/
.button_div{
margin: 0 auto;
margin-top: 10px;
text-align: center; 
}
.qnaContent{
background : rgb(249,249,249);
width: 97.5%;
border : 0;
resize:none;
text-align: left;
}
.qnaAnswer{
background : #eeeeee55;
width: 97.5%;
border : 0;
resize:none;
}
.ssss {
	position: relative;
	z-index
	=-1;
}
.ps_button{
background : none;
border: none !important;
padding: 0 !important;
}

* {
	box-sizing: inherit !important;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	border: 0px solid silver;
}

.main {
	position: relative;
}

body {
	font-family: 'NEXON Lv1 Gothic OTF Light';
	font-size: 1rem;
	line-height: 1.2rem;
	color: #181818;
	letter-spacing: 0.1px;
}
.updateBtn{
color : #385663;
padding-top: 15px;
padding-bottom: 0px;
}
h1 {
   text-align : center;
	font-family: 'S-CoreDream-9Black';
	font-size: 2.3rem;
	line-height: 3rem;
	letter-spacing: 0.5rem;
	text-transform: uppercase;
}

h2 {
	font-family: 'NEXON Lv1 Gothic OTF';
	font-size: 2.4rem;
	line-height: 2.4rem;
}

h3 {
	font-size: 1.4rem;
	line-height: 1.4rem;
}

h4 {
	font-size: 1rem;
	line-height: 1rem;
}

h5 {
	font-size: 0.7rem;
	line-height: 0.7rem;
}

a {
	color: black;
	text-decoration: none;
}
/*
화살표
주요 색       네이버          카카오톡
c80a1e       1ec800          f5e14b,333333

바 색         톡톡
fcf8ed        23c545
dda4ab        ffffff
b89c87
*/
/*<body style="overflow-x:hidden; overflow-y:auto;">*/

/*  start */
#header {
	width: 100%;
	min-width: 1200px;
	text-transform: uppercase;
	cursor: pointer;
	background: #fff;
	height: 120px;
	overflow: hidden;
	position: relative;
	top: 0;
	display: block;
	transition: top 0.4s;
	z-index: 9999;
	padding-top: 2rem;
}

#header section {
	width: 1200px;
	margin: 0 auto;
	display: flex;
}

#header section>:first-child {
	float: left;
	transition: 0.5s;
}

#header section>:first-child:hover {
	opacity: 0.8;
}

#header section>:first-child img {
	width: 7rem;
	margin-top: 1.3rem;
}

.lap-nav {
	display: inline-block;
	cursor: pointer;
	margin-left: 2rem;
}

.lap-nav>ul>li {
	float: right;
	width: 6rem;
	height: 23rem;
	line-height: 3rem;
	font-size: 0.9rem;
	text-align: center;
	list-style: none;
}

.lap-nav>ul>li>a {
	width: 10rem;
	padding: 0.5rem 0.7rem;
	line-height: 4.5rem;
	font-size: 1.2rem;
	color: #222222;
	transition: 0.6s;
	border-bottom: 2px solid #fff;
	font-family: 'NEXON Lv1 Gothic OTF';
}

.lap-nav>ul>li ul {
	width: 100%;
	height: 100%;
	background: #fff;
}

.clearfix>li>ul>li {
	display: block;
	color: #222222aa;
	border-bottom: 2px solid #fff;
	transition: 0.4s;
}

.lap-nav>ul>li>a:hover {
	border-bottom: 2px solid #c80a1e;
}

.lap-nav>ul>li>a:hover, .lap-nav>ul>li>ul>li:hover {
	color: #c80a1e;
}

.sample input {
	border-bottom: 1px solid #ccc;
	font-size: 1rem;
	height: 3rem;
	padding: 0 0.4rem;
	position: absolute;
	width: 50%;
}

.sample input:focus { ``
	outline: none;
}

button.btn-search, button.btn-reset {
	background: none;
	border: none;
	height: 3rem;
	font-size: 1.2rem;
	padding: 0.1rem;
	position: absolute;
	width: 3rem;
	cursor: pointer;
}

.sample {
	height: 5rem;
	position: absolute;
	width: 30%;
	margin-top: 0.5rem;
	right: 7rem;
}

.sample.two input {
	right: 0;
	transition: all 0.3s ease-in-out;
	width: 13rem;
}

.sample.two input:focus {
	width: 20rem;
}

.sample.two input:focus ~ button.btn-search {
	color: #000000dd;
	background: none;
}

.sample.two input:focus ~ button.btn-reset {
	right: -2rem;
	opacity: 1;
}

.sample.two button {
	transition: all 0.3s ease-in-out;
}

.sample.two button.btn-search {
	background: none;
	height: 3rem;
	right: 0;
	top: 0.1rem;
	transition: all 0.3s ease-in-out;
	width: 3rem;
}

.sample.two button.btn-reset {
	cursor: pointer;
	background: none;
	border: 1px solid #ccc;
	border-radius: 50%;
	font-size: 1rem;
	height: 1.5rem;
	line-height: 1.2rem;
	padding: 0;
	right: 0;
	top: 0.9rem;
	width: 1.5rem;
	z-index: -1;
	opacity: 0;
}

.fa-shopping-cart {
	position: absolute;
	right: 5.5rem;
	top: 3.3rem;
	font-size:;
	cursor: pointer;
}

.fa-user {
	position: absolute;
	right: 3rem;
	top: 1.5rem;
	font-size: 1.3rem;
	cursor: pointer;
}

#side-menu {
	position: fixed;
	right: 20px;
	bottom: 5rem;
	transition: all .5s;
	z-index: 99;
}

#side-menu ul li {
	list-style: none;
	font-size: 1.2rem;
	opacity: .6;
}

.kaka {
	display: flex;
	padding: 0.7rem 1.5rem;
	background: #222;
	margin-bottom: 1rem;
	color: #fff;
	font-size: 0.8rem;
	line-height: 1.5rem;
	border-radius: 50px;
	transition: .3s;
}

.kaka:hover {
	background: #e3d256;
	cursor: pointer;
	color: #333;
}

.kaka img {
	transition: .3s;
}

.kaka:hover img, .kaka.hover img {
	filter: brightness(0);
}

.kaka p {
	padding-left: 0.5rem;
	font-family: 'NEXON Lv2 Gothic Bold';
}

.tictok {
	display: flex;
	padding: 0.7rem 1.5rem;
	background: #222;
	color: #fff;
	font-size: 0.8rem;
	line-height: 1.5rem;
	border-radius: 50px;
	transition: .3s;
}

.tictok:hover {
	background: #23c545;
	cursor: pointer;
}

.tictok p {
	padding-left: 0.5rem;
	font-family: 'NEXON Lv2 Gothic Bold';
}

.kaka img {
	width: 1.5rem;
	height: 1.5rem;
}

.tictok img {
	width: 1.5rem;
	height: 1.5rem;
}

main h1 {
	padding-left : 0 !important;
	font-size: 3rem;
	text-align: center;
	padding-top: 12rem;
	padding-bottom: 4rem;
}

.chat {
	width: 999px;
	display: flex;
	justify-content: space-between;
	padding-top: 50px;
	margin: 0 auto;
}

.chat section {
	height: 250px;
	width: 28%;
	text-align: center;
	background: #eeeeee77;
	padding: 5rem 1rem;
	cursor: pointer;
}

.bigimg {
	width: 6rem;
	height: 6rem;
	border: 2px solid #222;
	border-radius: 50%;
	margin: 0 auto;
	position: relative;
}

.chat_img svg {
	width: 3.5rem;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.write_img svg {
	width: 3.5rem;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.call svg {
	width: 2rem;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.chat section h2 {
	font-size: 1rem;
	font-family: 'NEXON Lv2 Gothic Bold';
	padding: 1rem 0;
}

.chat section p {
	font-size: 1rem;
	line-height: 1.5rem;
}

.chat_btn {
	font-family: 'NEXON Lv2 Gothic Bold';
	padding-top: 2rem;
}

.chat_btn2 {
	padding-top: 10px;
	font-family: 'NEXON Lv2 Gothic Bold';
	padding-top: 2rem;
}

.fa-arrow-right {
	padding-left: 1rem;
	transition: .4s;
}

.chat section:hover .fa-arrow-right, .chat section.hover .fa-arrow-right
	{
	transform: translateX(1rem);
}

.qus {
	margin-top: 30px;
	padding-top: 3.5rem;
	width: 1000px;
	margin: 0 auto;
	position:;
	z-index: -1;
}

.qus h1 {
	padding-top: 2rem;
	font-size: 2rem;
	letter-spacing: .1rem;
	padding-bottom: 2rem;
	padding-left: 2rem;
}

.qus section {
	width: 100%;
	border-bottom: 1px solid #22222222;
	
}

.qus section ul li {
	list-style: none;
	font-size: 1rem;
	line-height: 2rem;
}

.qus section ul {
	display: flex;
	text-align: center;
}

.qus section ul li:nth-child(1) {
	width: 15%;
}

.qus section ul li:nth-child(2) {
	width: 68%;
}

.qus section ul li:nth-child(3) {
	width: 10%;
}

.qus section ul li:nth-child(4) {
	width: 7%;
}

.qus label {
	width: 100%;
	border-bottom: 1px solid #22222222;
}

.qus label ul li {
	list-style: none;
	font-size: 1rem;
	line-height: 1rem;
}

.qus label ul {
	display: flex;
	padding: 2rem 0;
}

.qus label ul li:nth-child(1) {
	width: 15%;
	text-align: center;
}

.qus label ul li:nth-child(2) {
	width: 68%;
	padding-left: 3rem;
}

.qus label ul li:nth-child(3) {
	width: 10%;
	text-align: center;
}

.qus label ul li:nth-child(4) {
	width: 7%;
	text-align: center;
}

.talk {
	background: #eeeeee55;
}

.talk p {
	padding-bottom: 2rem;
	padding-left: 9rem;
	line-height: 1.7rem;
}

.talk p:nth-child(1) {
	padding-top: 5rem;
}

.talk p:last-child {
	padding-bottom: 5rem;
}

.qus>:nth-child(7) {
	padding-top: 0;
}

.read-more-state {
	display: none;
}

.read-more-target {
	opacity: 0;
	max-height: 0;
	font-size: 0;
	transition: .1s ease;
}

.read-more-state:checked ~ .read-more-target {
	opacity: 1;
	font-size: inherit;
	max-height: 999em;
}

.read-more-trigger {
	cursor: pointer;
	display: inline-block;
	position: relative;
	z-index: 1;
}

.yun {
	opacity: .8;
}

.mainpage {
	margin-top: 1rem;
	text-align: center;
}

.hoya {
	font-size: 1rem;
	font-family: 'NEXON Lv1 Gothic OTF';
	font-weight: 600;
	line-height: 2rem;
}

footer {
	background: #385663;
	padding: 70px 0;
	margin-top: 11rem;
}

footer section {
	width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

footer section>:nth-child(1) {
	width: 200px;
}

footer section>:nth-child(1) img {
	width: 90px;
}

footer section>:nth-child(2) {
	width: 680px;
}

footer section>:nth-child(2) {
	display: flex;
	padding: 0 1% 0 50px;
}

footer section>:nth-child(2) div {
	width: 33%;
}

footer section>:nth-child(2) h5 {
	font-size: 1rem;
	padding-bottom: 1rem;
}

footer section>:nth-child(2) a {
	color: #777;
	display: block;
	font-size: .8rem;
	line-height: 2rem;
}

footer section>:nth-child(2) a:hover {
	text-decoration: underline;
}

footer section>:nth-child(3) {
	width: 400px;
	text-align: right;
	padding: 0 30px;
}

footer section>:nth-child(3) i {
	font-size: 1.5rem;
	padding-left: 20px;
	padding-bottom: 15px;
	padding-top: 15px;
	cursor: pointer;
}

footer section>:nth-child(3) i:hover {
	color: #999;
}

footer section>:nth-child(3)>:nth-child(2) {
	margin-top: 10px;
	color: #777;
}
</style>
</head>
<body>

	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>


		<div class="col-2">
			<%@include file="../include/mypage_sidebar.jsp"%>
		</div>


		<main>
			<article class="qus">
				<h1>문의내역</h1>
				<section>
					<ul class="yun">
						<li>구분</li>
						<li>제목</li>
						<li>등록일</li>
						<li>답변상태</li>
					</ul>
				</section>
			<c:forEach var="myQna" varStatus="status" items="${myQnaList}" >
				<div class="sss" id="${myQna.content_idx}">
					<input type="hidden" id="qnaId" name="content_idx" value="${myQna.content_idx }">
					<input type="checkbox" class="read-more-state" id="post-${status.count }" /> 
					<label for="post-${status.count }" class="ing read-more-trigger" >
				
						<ul class="qna_detail_info" >
							<li>회원/정보</li>
							<li>${myQna.content_title}</li>
							<li>${myQna.content_date}</li>
							<li>완료</li>
						</ul>
					</label>
					<section class="talk read-more-target">
						   <textarea class="form-control qnaContent" rows="3" name='content_text' readonly="readonly">
                            <c:out value="문의내용 : ${myQna.content_text}" /> 
                            </textarea>
							<br>
							<div id="answer_area">
							<textarea class="form-control qnaAnswer" rows="3" name='reply_text' readonly="readonly">
                            <c:out value="" /> 
                            </textarea>
                            </div>
                             <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                             <div id="text_box" class="button_div">
                             <button type="button" class="btn btn-pill btn-dark">+</button>
                             </div>
                             </sec:authorize>
            <sec:authorize access="hasRole('ROLE_MEMBER')">    
						<div class="form-group">
							<div class="text-right">
							<a href="${root }my_qna/update?board_id=${param.board_id}&content_idx=${myQna.content_idx}" class="btn btn-default updateBtn">수정</a>
							<a id="deleteButton" href="#" class="btn btn-default updateBtn del">삭제</a>
							</div>
						</div>	
			</sec:authorize>
			 <sec:authorize access="hasRole('ROLE_ADMIN')">    
						<div class="form-group">
							<div class="text-right">
							
							<a id="replyQuestion" href="#" class="btn btn-default updateBtn">답변등록</a>
							</div>
						</div>	
			</sec:authorize>
					</section>
					
				</div>
			</c:forEach>
			 
			</article>

			</main>
						
		

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script type="text/javascript">
		$(document).ready(function() {

			$('#myModal').on('shown.bs.modal', function() {
				$('#myInput').trigger('focus')
			})
			
			
			//문의 삭제
			$(".del").on("click", function(e) {
				
			e.preventDefault();
			var content_idx = parseInt($(this).parent().parent().parent().parent().attr('id'));
			
			function refreshMemList(){
				location.reload();
			}
	
				$.ajax({
					type: 'delete',
					url: '/board/my_qna/deleteQna',
					data: JSON.stringify(content_idx),
				  	contentType: "application/json; charset=utf-8",
				  	cache : false,
				  	dataType: 'text',
				  	success: function(result, status, xhr) {
				  		
				  		console.log("Delete QnA");
				  		alert('삭제가 완료되었습니다');
				  		refreshMemList();
				  		
				  		/*
				  		var infoForm = $("#infoForm");
				  		infoForm.attr("method", "post");
				  		infoForm.attr("action", "/member/customLogout");
				  		infoForm.submit();
				  		*/
				  	}, error: function() {
				  		 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					} 
				});
								
							
			});
			$("#text_box").on("click", function(e) {
				e.preventDefault();
				console.log("add text Box");
				
				$("#answer_area").append("<textarea class='form-control qnaAnswer' rows='3' id='admin_reply' name='reply_text'>");
				
				
			});
			
			$("#replyQuestion").on("click", function(e) {
				e.preventDefault();
				console.log("add replyQuestion");
				
				var reply_text = $("#admin_reply").val();
				var content_idx = $("#qnaId").val();
				console.log(reply_text);
				var reply= {
						reply_text : reply_text, 
						content_idx : content_idx
				}
				//등록 에이젝스
				$.ajax({
					type: 'POST',
					url : '/replies/new/qnaAnswer',
					data : JSON.stringify(reply),
					contentType : "application/json; charset=utf-8",
					success : function(result , status, xhr){
						
						alert('등록 완료');
						$("#admin_reply").attr("readonly", "readonly");
					},
					error : function(xhr, status, err){
						
						alert('등록 실패');
						
					}
				});
			}); 
			
			$(".qna_detail_info").on("click", function(e) {
				var content_idx = $(this).parent().parent().attr('id');
				console.log("Show detail_info Box");
				
				$.getJSON('http://localhost:8282/replies/QnaAnswer/'+ content_idx , function(data){
					console.log('성공');
					
					console.log(data.reply_text);
					$(".qnaAnswer").val("                            " + data.reply_text);

				});
				
			});
		});
	</script>
</body>
</html>






