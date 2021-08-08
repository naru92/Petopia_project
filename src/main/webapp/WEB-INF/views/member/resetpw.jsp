<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/resetpw_style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="container">
			<div class="login-form">
				<form action="/help/resetpw/success" method="POST">
					<h3>비밀번호 재설정</h3>
					<div class="info">
					* 새로운 비밀번호를 입력해 주세요.<br>
					* 비밀번호는 영문+숫자+(!,@,#,$,%,^,&,*)조합 8~12자 입니다.<br>
                    </div>
                    
					<div class="form-group">
						<input type="password" class="password01" name="member_password" placeholder="새로운 비밀번호 입력"> 
						<span class="input-icon"><i class="fa fa-lock"aria-hidden="true"></i></span>
					</div>
					<div class="check_font" id="pw01_check"></div>
					
					<div class="form-group" id="form2">
						<input type="password" class="password02" placeholder="새로운 비밀번호 확인"> 
						<span class="input-icon"><i class="fa fa-check-circle"></i></span>
					</div>
					<div class="check_font" id="pw02_check"></div>
					
					<button id ="confirm-button" class="confirm-btn" type="submit" name="submit" >확인</button>
				</form>	
			</div>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
<script>	
<!----- 이메일 인증 번호 보내기 ----->
$(document).ready(function() {
	// 비밀번호 정규식 
	var pwJ =/^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).*$/;
	
	// ----- 비밀번호 검사 -----
	$('.password01').blur(function() {
		if($('.password01').val()==''){ 
			$('#pw01_check').text('비밀번호를 입력하세요.'); 
			$('#pw01_check').css('color', 'red'); 
		} else if(pwJ.test($('.password01').val())!=true){ 
			$('#pw01_check').text('영문+숫자+(!,@,#,$,%,^,&,*)조합 8~12자'); 
			$('#pw01_check').css('color', 'red'); 
		} else if(pwJ.test($('.password01').val())){ 
			$('#pw01_check').text('사용 가능한 비밀번호 입니다.'); 
			$('#pw01_check').css('color', '#2AC1BC'); 
		}
	});//blur
	
	// ----- 비밀번호 확인 / 일치 여부 -----
	$('.password02').blur(function() {
		if($('.password02').val()==''){ 
			$('#pw02_check').text('비밀번호를 확인하세요.'); 
			$('#pw02_check').css('color', 'red'); 
		} else if($('.password01').val()!=$('.password02').val()){ 
			$('#pw02_check').text('비밀번호가 일치하지 않습니다.'); 
			$('#pw02_check').css('color', 'red'); 
		} else if($('.password01').val()==$('.password02').val()){ 
			$('#pw02_check').text('비밀번호가 확인되었습니다.'); 
			$('#pw02_check').css('color', '#2AC1BC'); 
		}
	});//blur
	
	/*
	 * 버튼 눌렀을 때 정규식 & 모두 true일 때 데이터 전송
	 */
	
	$('.confirm-btn').click(function(){
		
		var inval = false; 
		
		// ----- 비밀번호가 같은 경우 && 비밀번호 정규식 확인 -----
		if (($('.password01').val() == ($('.password02').val())) && pwJ.test($('.password01').val())) { 
			inval = true; 
		} else { 
			inval = false; 
			alert('비밀번호를 확인하세요.'); 
			return false; 
		} 

	});
	
});	
</script>
</body>
</html>