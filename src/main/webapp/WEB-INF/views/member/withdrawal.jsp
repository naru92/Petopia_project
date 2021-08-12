<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>비밀번호 재확인</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/withdrawal.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="container">
			<div class="withdrawal-form">
				<div class="main">
					<h3>본인 재확인</h3>
					<p>안전한 탈퇴를 위해 비밀번호를 다시 한 번 입력해주세요.</p>
				</div>
				<div class="form-group">
					<input type="password" id="password" name="member_password" placeholder="비밀번호">
				</div>
				<p class="validation-check" id="errorMsg" style="display: none;"> 비밀번호를 다시 확인해주세요.</p>
				<a href=withdrawal_success">
					<button class="withdrawal-btn">확인</button>
				</a>
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
	<script>
	function fn_passwordCheck() {
		console.log("fn_passwordCheck");
		
		var password = $('#password').val();		

		if(!password){
			alert('패스워드를 입력해주세요.');
			$('#password').focus();
			return false;
		}
		
		var data = {'memberPassword' : password
					, 'memberId' : 'dummy84' };
		
		$.ajax({
			type: 'post' //데이터 전송 타입,
			, url : '${pageContext.request.contextPath}/mypet/passwordCheck' //데이터를 주고받을 파일 주소 입력,
			, data: data //보내는 데이터,
			, success: function(obj){ //작업이 성공적으로 발생했을 경우
				console.log('obj :: ' , obj);
				if(!obj){
					alert('패스워드가 틀렸습니다. 패스워드를 확인해주세요.');
					$('#password').focus();
					return false;
				}else{
					location.href="${pageContext.request.contextPath}/member/memberModify";
				}
			}
			, error:function(e){ //에러가 났을 경우 실행시킬 코드
				console.log('e :: ', e)
				alert('서버오류입니다. 잠시 후 다시 시도해주세요.')
			}
		})
		
	}
	</script>
	
</body>

</html>