<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>	
<c:set var='board_id' value='${param.board_id}'/>	
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
h2 {
  margin: 0;
  color: black;
  font-size: 2.5em;
  font-weight: 300;
}
#contact-form {
  max-width: 1208px;
  max-width: 75.5rem;
  margin: 0 auto;
}
#contact, .label, .input[name="submit"] {
  position: relative;
}
label > span, input, textarea, button {
  box-sizing: border-box;
}
label {
  display: block;
}
label > span {
  padding-top: 8px !important;
  color: #385663;
  display: none;
}
.searchBtn{
margin-left: 0;
}
.input, .textarea, .button {
  width: 100%;
  padding: 0.5em;
  border: none;
  
}
input[type="text"], input[type="email"], textarea {
  margin: 0 0 1em;
  border: 1px solid #ccc !important;
  outline: none;
}
input.invalid, textarea.invalid {
  border-color: #d5144d;
}
textarea {
  height: 6em;
  position: relative;
}
input[type="submit"], button {
  background: #2AC1BC ;
  color: white;
}
input[type="submit"]:hover, button:hover {
  background: #385663;
}
@media screen and (min-width: 30em) {
  #contact-form h2 {
    margin-left: 26.3736%;
    font-size: 2em;
    line-height: 1.5;
  }
  label > span {
    vertical-align: top;
    display: inline-block;
    width: 26.3736%;
    padding: 0.5em;
    border: 1px solid transparent;
    text-align: right;
  }
  .input, .textarea, .button {
    width: 73.6263%;
    line-height: 1.5;
  }
  textarea {
    height: 10em;
  }
  input[type="submit"], button {
    margin-left: 26.3736%;
  }
}
@media screen and (min-width: 48em) {
  #contact-form {
  	padding-top: 30px;
    text-align: justify;
    line-height: 0;
  }
  #contact-form:after {
    content: '';
    display: inline-block;
    width: 100%;
  }
  #contact-form h2 {
    margin-left: 17.2661%;
    margin-bottom: 50px;
  }
  #contact-form form, #contact-form aside {
    vertical-align: top;
    display: inline-block;
    width: 65.4676%;
    text-align: left;
    line-height: 1.5;
  }
  #contact-form aside {
    width: 30.9353%;
  }
}


<!-- -->
.container-side {
	padding-top: 10px;
}

.paginationRow {
	justify-content: center;
}

footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	color: white;
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

.card-title {
	font-weight: bold;
	margin-bottom: 24px;
}

.warningText{
font-weight: bold;
color: red;

}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>




	<!-- 게시글 리스트 -->
	<div class="container col-10 board" style="margin-top: 120px">
		<section id="contact-form">
  <h2>문의하기</h2>
  <form:form id="contact"  action='${root }board/qna_register?board_id=${param.board_id }' method ='post' modelAttribute="qnaContentVO">
    <form:label path="member_id" class="label"><span><i class="fas fa-user-tag"></i></span><form:input path="member_id" class="input"/></form:label>
    <form:label path="content_title" class="label"><span></span><form:input path="content_title" class="input" placeholder="문의사항을 입력해주세요."/></form:label>
    <form:label path="content_text" class="lavel"><span></span><form:textarea path="content_text" class="textarea"  placeholder="문의 내용을 입력해주세요."></form:textarea></form:label>
    <input class="input" " id="startSubmit"name="submit" type="submit" value="작성하기"/>
  </form:form>
  <aside>
    <p class= "warningText">유의사항</p>
	<p>개인정보가 포함된 문의 시 비공개로 문의해 주시기 바랍니다.
	저작권 침해, 음락, 욕설, 비방글, 판매, 광고 및 홍보성의 글은 임의로 삭제 처리 될 수 있습니다</p>
    
  </aside>
  </section>
</div>
			<footer>
				<%@include file="../include/default_footer.jsp"%>
			</footer>

			<%@include file="../include/default_sidebar_js.jsp"%>

			<script type="text/javascript">
			
					
						var form = $('#contact')
						$('#startSubmit').on('click',function(e){
							if (confirm('등록하시겠습니까?')) {
								form.submit();
							}else{
								e.preventDefault();
								alert("취소됐습니다.");
							}
	
						});
						
					
		
				

				
				
				</script>
</body>
</html>






