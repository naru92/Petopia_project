<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 확인</title>
	
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=decice-width" initial-scale="1">
	
	<!-- CSS here -->
	<link rel="stylesheet" href="/petopia/css/join_style.css">
	<link rel="stylesheet" href="/petopia/css/memberModify.css">
	<link rel="stylesheet" href="/petopia/css/passwordConfirm.css">
	
	<!-- 추후에 수정 -->
	<link rel="shortcut icon" type="image/x-icon" href="images/petopia_logomini.png">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>	
	
	<!-- default_css -->
	<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<script>
		$("document").ready(function() {
			//해당 페이지의 첫 진입점
			//ex) 로그인한 사용자의 id 를 display
			$('#txtId').val('isnana');
			//해당 페이지의 첫 진입점
			//ex) 로그인한 사용자의 id 를 display
			$('#txtMemberName').val('허하나');
		});

		$("#btnTest").click(function() {
			$('#txtId').attr('readonly', true);
			$("#txtId").addClass('disabledInput');
		});
		/* 
		로그인 유저와 입력 비밀번호가 동일한지
		button class="join-btn">확인</button> 
		
		확인할때는 자바단에서 세션 유저 비밀번호와, 입력 비밀번호 확인
		
		맞을경우 개인정보 화면으로 이동 
		2시간
		*/
	</script>

	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>비밀번호 확인</h3>
			<div class="result">
				<p class="sub">
					회원님의 소중한 개인정보 보호를 위해 <br> 비밀번호 확인 후 변경이 가능합니다.
				</p>
			</div>

			<article class="one">
				<!-- article 기능이 뭔지 (두개 다)? -->
				<article class="find1">
					<div>
						<section id="content3">
							<div>
								<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요." maxlength="20">
							</div>
							<p class="validation-check" id="errorMsg" style="display: none;" >비밀번호를 다시 확인해주세요.</p>

							<a href="javascript:void(0);">
								<button class="join-btn" onclick="fn_passwordCheck()">확인</button>
							</a>
						</section>
					</div>
				</article>
			</article>
		</div>
	</main>
	<!-- footer -->
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
	
	/* 
	$.ajax({
		type: 'post',
		url: '/member/passwordConfirm',
		data: data,
		dataType: 'json',
	});
	  		
		console.log("passwordConfirm");
  		alert('비밀번호를 입력해주세요.');
  		
		});
 */	</script>
	

</body>
</html>