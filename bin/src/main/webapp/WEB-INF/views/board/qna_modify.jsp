<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<link rel="/petopia/css/qna_modify.css">

<%@include file="../include/default_css.jsp"%>



</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>




	<!-- 게시글 리스트 -->
	<div class="container col-10 board" style="margin-top: 120px">
		<section id="contact-form">
  <h2>문의사항 수정</h2>
  <form:form id="contact" action='${root}board/my_qna/update_pro?board_id=${param.board_id}' method ='post' modelAttribute="modifyQnaVO">
    <form:label path="member_id" class="label"><span><i class="fas fa-user-tag"></i></span><form:input path="member_id" class="input" readonly="true" /></form:label>
    <form:label path="content_title" class="label"><span></span><form:input path="content_title" class="input" placeholder="문의사항을 입력해주세요."/></form:label>
    <form:label path="content_text" class="lavel"><span></span><form:textarea path="content_text" class="textarea"  placeholder="문의 내용을 입력해주세요."></form:textarea></form:label>
    <input class="input" id="startSubmit"name="submit" type="submit" value="수정하기"/>
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
							if (confirm('수정 하시겠습니까?')) {
								form.submit();
							}else{
								e.preventDefault();
								alert("취소됐습니다.");
							}
	
						});
						
					
		
				

				
				
				</script>
</body>
</html>






