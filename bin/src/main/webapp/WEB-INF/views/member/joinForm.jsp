<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>joinForm</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/joinForm_style.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>회원가입</h3>
			<div class="result">
				<span class="blue">필수정보를 입력</span>해주세요.
			</div>

			<article class="one">
				<div class="taball">
					<div class="tab1">
						<img src="https://image.flaticon.com/icons/svg/126/126486.svg"><br>STEP 1<br>가입하기<br>
					</div>
					<div class="tab2">
						<img src="https://image.flaticon.com/icons/svg/1159/1159633.svg"><br>STEP 2<br>약관동의<br>
					</div>
					<div class="tab3">
						<img src="https://image.flaticon.com/icons/svg/839/839860.svg"><br>STEP 3<br>정보입력<br>
					</div>
					<div class="tab4">
						<img src="https://image.flaticon.com/icons/svg/3064/3064197.svg"><br>STEP 4<br>가입완료<br>
					</div>
				</div>

				<article class="find1">
					<div>
						<section id="content3">
							<div class="info">
								* 모든 항목은 필수 입력 항목입니다. <br>* 필수항목을 작성하지 않을 경우 회원가입이 어렵습니다.
							</div>
							<div>
								<div>
									<p>* 아이디</p>
									<p>* 이메일</p>
									<p>* 비밀번호</p>
									<p>* 비밀번호 확인</p>
									<p>* 이름</p>
									<p>* 휴대전화</p>
									<p>* 주소</p>
								</div>

								<div>
									<form class="inputAll">
										<input type="text" name="member_id" class="id" placeholder="아이디를 입력하세요.">
										<button type="button" class="doublecheck">중복확인</button>
										<br> <input type="text" name="member_email" class="email01"> @ <input type="text" class="email02"> <select size="1"
											id="selectEmail">
											<option value="self">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
										</select>
										<button type="button" class="sendMail">인증하기</button>
										<br> <input type="password" name="member_password" class="password01" placeholder="영문 + 숫자 + (!,@,#,$,%,^,&,*) 조합 8~12자"> <br>
										<input type="password" class="password02" placeholder="비밀번호를 다시 한번 입력하세요."> <br> <input type="text" name="memeber_name"
											class="name" placeholder="이름을 입력하세요."> <br> <input type="tel" name="member_phoneNumber" class="phoneNumber"
											placeholder="예) 010-1234-5678">
										<button type="button" class="doublecheck">중복확인</button>
										<br> <input type="text" placeholder="우편번호" name="member_address" class="address1" id="postcode" readonly>
										<button type="button" class="address-btn" onClick="execDaumPostcode()">주소검색</button>
										<br> <input type="text" placeholder="도로명주소" name="member_address" class="address2" id="roadAddress" readonly> 
										<br> <input	type="text" placeholder="상세주소" name="member_address" class="address3" id="detailAddress"> 
										<br> <br>
									</form>
								</div>
							</div>

							<a><button type="submit" class="join-btn" disabled="disabled">가입하기</button></a>
						</section>
					</div>
				</article>
			</article>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	<%@include file="../include/default_mapApi_js.jsp"%>
	<!-- input check 해서 button 활성화/비활성화 하는 js -->
	<script>
		$('.id').on('input', checkInput);
		$('.email01').on('input', checkInput);
		$('.email02').on('input', checkInput);
		$('.password01').on('input', checkInput);
		$('.password02').on('input', checkInput);
		$('.name').on('input', checkInput);
		$('.phoneNumber').on('input', checkInput);
		$('.address1').on('input', checkInput);
		$('.address2').on('input', checkInput);
		$('.address3').on('input', checkInput);

		function checkInput() {
			var idCheck = $('.id').val();
			var email01Check = $('.email01').val();
			var email02Check = $('.email02').val();
			var password01Check = $('.password01').val();
			var password02Check = $('.password02').val();
			var nameCheck = $('.name').val();
			var phoneNumberCheck = $('.phoneNumber').val();
			var address1Check = $('.address1').val();
			var address2Check = $('.address2').val();
			var address3Check = $('.address3').val();

			if (idCheck === '' || email01Check === '' || email02Check === ''
					|| password01Check === '' || password02Check === ''
					|| nameCheck === '' || phoneNumberCheck === ''
					|| address1Check === ''|| address2Check === ''|| address3Check === '') {
				$('.join-btn').prop('disabled', true);
			} else {
				$('.join-btn').prop('disabled', false);
			}
		}
	</script>

	<!-- option을 통한 email 주소값 입력 -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {
				if ($(this).val() == 'self') { //직접입력일 경우 
					$(".email02").val(''); //값 초기화 
					$(".email02").attr("disabled", false); //활성화 
				} else { //직접입력이 아닐경우 
					$(".email02").val($(this).text()); //선택값 입력 
					$(".email02").attr("disabled", true); //비활성화
				}
			});
		});
	</script>
	
	<script>
	$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var mail = $(".email01").val(); //사용자의 이메일 입력값. 
		
		if (mail == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			mail = mail+"@"+$(".email02").val(); //셀렉트 박스에 @뒤 값들을 더함.
			// console.log(mail);
			
			$.ajax({
				type : 'post',
				url : '/CheckMail',
				data : {
					mail:mail
					},
				dataType :'json',

			});
			alert("인증번호가 전송되었습니다.") 
			isCertification=true; //추후 인증 여부를 알기위한 값
		}
	});
	</script>

	<script src="/petopia/js/member.js"></script>

</body>
</html>