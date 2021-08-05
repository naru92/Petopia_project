<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<title>비밀번호찾기 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/pwInquiry_style.css">
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
				<div class="find">
					<a href="/help/idInquiry"><button class="idInquiry-btn">아이디 찾기</button></a>
					<a href="/help/pwInquiry"><button class="pwInquiry-btn">비밀번호 찾기</button></a>
				</div>
				<form action="/help/resetpw" method="POST">
					<h3>비밀번호 찾기</h3>
					<div class="info">
					* 가입시 등록한 정보를 입력해 주세요.<br>
                    </div>
					<div class="form-group">
						<input type="text" name="member_id" placeholder="아이디"> 
						<span class="input-icon"><i class="fa fa-user-circle"aria-hidden="true"></i></span>
					</div>
					<div class="form-group">
						<input type="text" name="member_name" placeholder="이름"> 
						<span class="input-icon"><i class="fa fa-user"></i></span>
					</div>
					<div class="form-group">
						<input type="text" name="member_email" class="email" placeholder="이메일"> 
						<span class="input-icon"><i class="fa fa-envelope"></i></span>
						<button type="button" class="sendMail">인증번호전송</button>
					</div>
					<div class="form-group">
						<input type="text" class="checkCode" placeholder="인증번호를 입력해주세요." disabled="disabled"> 
						<span class="input-icon"><i class="fa fa-check-circle"></i></span>
					</div>
					<div class="eheck_font" id="email_check"></div>
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
	//아이디 정규식 
	var idJ = /^[a-z0-9]{6,12}$/; 
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,6}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z][-_.]?[0-9a-zA-Z]*@[0-9a-zA-Z][-_.]?[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i;
	
	var mailCertification = false;
	var key = "";
	
	$(".sendMail").click(function() {	//메일 입력 유효성 검사
		
		$('.checkCode').prop('disabled', false);
		$('.checkCode').prop('placeholder', '인증번호를 입력해주세요.');
	
		var member_email = $('input[name=member_email]').val(); //사용자의 이메일 입력값 
		
		if (member_email=='' || mailJ.test(member_email)!=true) {
			alert("메일을 확인해주세요.");
			$('.checkCode').prop('disabled', true);
		} else if (mailJ.test($('input[name=member_email]').val())==true){

			console.log(member_email);
			
			$.ajax({
				async : false, 
				type : 'POST',
				url : 'CheckMail',
				data : {mail:member_email},
				dataType :'json',
				success : function(data) { 
					key=data;
					console.log(key);
					alert("인증번호가 전송되었습니다.");
				},  error:function(request,status,error){
	                alert("전송에 실패했습니다. 다시 시도해 주세요.")
	                console.log("code = "+ request.status + 
	                	 		" message = " + request.responseText + 
	                	 		" error = " + error); // 실패 시 처리
	            }
			});
			
			console.log(key);
			isCertification=true; //추후 인증 여부를 알기위한 값
		}
		
		$(".checkCode").on("propertychange change keyup paste input", function() {
			if ($(".checkCode").val() == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
				$("#email_check").text("인증에 성공했습니다.")
				$("#email_check").css("color", "#2AC1BC");
				isCertification = true;  //인증 성공여부 check
				mailCertification = true;
			} else if($(".checkCode").val() == '') {
				$('.checkCode').prop('placeholder', '인증번호를 입력해주세요.');
				$("#email_check").text("")
				mailCertification = false;
			} else {
				$("#email_check").text("인증번호가 일치하지 않습니다.")
				$("#email_check").css("color", "red");
				isCertification = false; //인증 실패
				mailCertification = false;
			}
		});
	});
	
	
	/*
	 * 버튼 눌렀을 때 정규식 & 모두 true일 때 데이터 전송
	 */
	
	$('.confirm-btn').click(function(){
		
		var inval_Arr = new Array(4).fill(false); 
		var member_id = $('input[name=member_id]').val();
		var member_name = $('input[name=member_name]').val();
		var member_email = $('input[name=member_email]').val(); 
		
		
		// ----- 아이디 확인 -----
		if (idJ.test(member_id)) { 
			inval_Arr[0] = true; 
		} else { 
			inval_Arr[0] = false; 
			alert('아이디를 확인하세요.'); 
			return false; 
		} 
		
		// ----- 이름 확인 -----
		if (nameJ.test(name=member_name)) { 
			inval_Arr[1] = true;
		} else { 
			inval_Arr[1] = false; 
			alert('이름을 확인하세요.'); 
			return false; 
		} 
		
		// ----- 이메일 확인 ------
		if (mailJ.test(member_email)){ 
			inval_Arr[2] = true; 
		} else { 
			inval_Arr[2] = false; 
			alert('이메일을 확인하세요.'); 
			return false; 
		} 
		
		// ----- 이메일 인증여부 확인 -----
		if (mailCertification === true){ 
			inval_Arr[3] = true; 
		} else { 
			inval_Arr[3] = false; 
			alert('이메일 인증을 완료해주세요.'); 
			return false; 
		} 
		
	
		// inval_Arr와 mailCertification결과 출력
		console.log(inval_Arr);
		console.log(mailCertification);
		
		// inval_Arr가 모두 true인지 검사
		var validAll = true; 
		
		for(var i = 0; i < inval_Arr.length; i++){ 
			if(inval_Arr[i] == false){ 
				validAll = false; 
			}
		} 
		

	});
});

</script>
</body>
</html>