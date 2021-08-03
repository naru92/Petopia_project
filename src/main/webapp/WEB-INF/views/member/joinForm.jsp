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
									<p class = emailP>* 이메일</p>
									<p>* 비밀번호</p>
									<p>* 비밀번호 확인</p>
									<p>* 이름</p>
									<p>* 휴대전화</p>
									<p>* 주소</p>
								</div>

								<div>
									<form class="inputAll">
										<input type="text" class="memberId" placeholder="아이디를 입력하세요.">
										<div class="eheck_font" id="id_check"></div>

										<br> <input type="text" class="email01"> @ <input type="text" class="email02"> <select size="1"
											id="selectEmail">
											<option value="self">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="nate.com">nate.com</option>
										</select>
										<br> <input type="text"	class="checkCode" placeholder="인증번호전송 버튼을 누르세요." disabled="disabled"> 
										<button type="button" class="sendMail">인증번호전송</button>
										<div class="eheck_font" id="email_check"></div>

										<br> <input type="password" class="password01" placeholder="영문+숫자+(!,@,#,$,%,^,&,*)조합 8~12자">
										<div class="eheck_font" id="pw01_check"></div>

										<br> <input type="password" class="password02" placeholder="비밀번호를 다시 한번 입력하세요.">
										<div class="eheck_font" id="pw02_check"></div> 
										
										<br> <input type="text"	class="memberName" placeholder="이름을 입력하세요."> 
										<div class="eheck_font" id="name_check"></div>

										<br> <input type="tel" class="memberPhoneNumber" placeholder="예) 010-1234-5678">
										<div class="eheck_font" id="phone_check"></div>

										<br> <input type="text" placeholder="우편번호" name="member_address" class="address1" id="postcode" readonly>
										<button type="button" class="address-btn" onClick="execDaumPostcode()">주소검색</button>
										<br> <input type="text" placeholder="도로명주소" name="member_address" class="address2" id="roadAddress" readonly> 
										<br> <input	type="text" placeholder="상세주소" name="member_address" class="address3" id="detailAddress">
										<div class="eheck_font" id="address_check"></div>
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
	
	
	
	<script>
	/*
	 * 유효성 검사
	 */
	 
	//모든 공백 체크 정규식 
	var empJ = /\s/g; 
	//아이디 정규식 
	var idJ = /^[a-z0-9]{6,12}$/; 
	// 비밀번호 정규식 
	var pwJ =/^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).*$/;
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,6}$/; 
	// 이메일 검사 정규식 
	var mailJ1 = /^[0-9a-zA-Z][-_.]?[0-9a-zA-Z]{5,12}$/;
	var mailJ2 = /^[0-9a-zA-Z][-_.]?[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식 
	var phoneJ = /^010-?([0-9]{4})-?([0-9]{4})$/; 

	$(document).ready(function() {
	
		var mailCertification = false;
		
		// ----- 아이디 중복 확인 -----
		$(".memberId").blur(function() {
			if($('.memberId').val()==''){ 
				$('#id_check').text('아이디를 입력하세요.'); 
				$('#id_check').css('color', 'red'); 
			} else if(idJ.test($('.memberId').val())!=true){ 
				$('#id_check').text('6~12자의 영문+숫자의 조합 사용 가능합니다.'); 
				$('#id_check').css('color', 'red'); 
			} else if($('.memberId').val()!=''){ 
				var member_id=$('.memberId').val(); 
				$.ajax({ 
					async : true, 
					type : 'GET', 
					data : member_id,  
					url : 'idCheck?memberId='+member_id, 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8", 
					success : function(data) { 
						if(data == 1){ 
							$('#id_check').text('중복된 아이디 입니다.'); 
							$('#id_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						}else if(idJ.test(member_id)){ 
							$('#id_check').text('사용가능한 아이디 입니다.'); 
							$('#id_check').css('color', '#2AC1BC'); 
							$(".inputAll").attr("disabled", false); 
						} else if(member_id==''){ 
							$('#id_check').text('아이디를 입력해주세요.'); 
							$('#id_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						} else{ 
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다."); 
							$('#id_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						}
					} 
				});//ajax
			}//else if 
		});//blur
		
		// ----- 휴대폰 번호 중복 확인 -----
		$(".memberPhoneNumber").blur(function() {
			if($('.memberPhoneNumber').val()==''){ 
				$('#phone_check').text('휴대폰 번호를 입력하세요.'); 
				$('#phone_check').css('color', 'red'); 
			} else if(phoneJ.test($('.memberPhoneNumber').val())!=true){ 
				$('#phone_check').text('010-_ _ _ _-_ _ _ _형식에 맞춰 입력하세요.'); 
				$('#phone_check').css('color', 'red'); 
			} else if($('.memberPhoneNumber').val()!=''){ 
				var member_phoneNumber=$('.memberPhoneNumber').val(); 
				$.ajax({ 
					async : true, 
					type : 'GET', 
					data : member_phoneNumber,  
					url : 'pnCheck?memberPN='+member_phoneNumber, 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8", 
					success : function(data) { 
						if(data > 0){ 
							$('#phone_check').text('중복된 휴대폰 번호 입니다.'); 
							$('#phone_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						}else if(phoneJ.test(member_phoneNumber)){ 
							$('#phone_check').text('사용가능한 휴대폰 번호 입니다.'); 
							$('#phone_check').css('color', '#2AC1BC'); 
							$(".inputAll").attr("disabled", false); 
						}else if(member_phoneNumber==''){ 
							$('#phone_check').text('휴대폰 번호를 입력해주세요.'); 
							$('#phone_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						}else{ 
							$('#phone_check').text("010-_ _ _ _-_ _ _ _형식에 맞춰 입력하세요."); 
							$('#phone_check').css('color', 'red'); 
							$(".inputAll").attr("disabled", true); 
						}
					} 
				});//ajax
			}//else if 
		});//blur
		
		// ----- 비밀번호 검사 -----
		$(".password01").blur(function() {
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
		$(".password02").blur(function() {
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
		
		// ----- 이름 확인 -----
		$(".memberName").blur(function() {
			if($('.memberName').val()==''){ 
				$('#name_check').text('이름을 입력하세요.'); 
				$('#name_check').css('color', 'red'); 
			} else if(nameJ.test($('.memberName').val())!=true){ 
				$('#name_check').text('한글 2~6자만 입력 가능합니다.'); 
				$('#name_check').css('color', 'red'); 
			} else if(nameJ.test($('.memberName').val())){ 
				$('#name_check').text(' '); 
				$('#name_check').css('color', '#2AC1BC'); 
			}
		});//blur
		
		// ----- 주소 확인 -----
		$(".address3").blur(function() {
			if($('.address3').val()==''){ 
				$('#address_check').text('상세주소를 입력하세요.'); 
				$('#address_check').css('color', 'red'); 
			} else { 
				$('#address_check').text(' '); 
				$('#address_check').css('color', '#2AC1BC'); 
			}
		});//blur
		
		// ----- 이메일 아이디 확인 -----
		$(".email01").blur(function() {
			if($('.email01').val()==''){ 
				$('#email_check').text('메일을 입력하세요.'); 
				$('#email_check').css('color', 'red'); 
			} else if(mailJ1.test($('.email01').val())!=true){ 
				$('#email_check').text('메일 아이디를 확인하세요.'); 
				$('#email_check').css('color', 'red'); 
			} else if(mailJ1.test($('.email01').val())){ 
				$('#email_check').text(' '); 
				$('#email_check').css('color', '#2AC1BC'); 
			}
		});//blur
		
		// ----- 이메일 주소 확인 -----
		$(".email02").blur(function() {
			if($('.email02').val()==''){ 
				$('#email_check').text('메일을 입력하세요.'); 
				$('#email_check').css('color', 'red'); 
			} else if(mailJ2.test($('.email02').val())!=true){ 
				$('#email_check').text('메일 주소를 확인하세요.'); 
				$('#email_check').css('color', 'red'); 
			} else if(mailJ2.test($('.email02').val())){ 
				$('#email_check').text(' '); 
				$('#email_check').css('color', '#2AC1BC'); 
			}
		});//blur
		
		
		<!----- 이메일 인증 번호 보내기 ----->
		var key = "";
		$(".sendMail").on("click",function() {	//메일 입력 유효성 검사
			
			$('.checkCode').prop('disabled', false);
			$('.checkCode').prop('placeholder', '인증번호를 입력해주세요.');
		
			var mail = $(".email01").val(); //사용자의 이메일 입력값 
			
			if ($('.email01').val()=='' || mailJ1.test($('.email01').val())!=true ||
				$('.email02').val()=='' || mailJ2.test($('.email02').val())!=true) {
				alert("메일을 확인해주세요.");
			} else if (mailJ1.test($('.email01').val())==true &&
					   mailJ2.test($('.email02').val())==true){
				mail = mail+"@"+$(".email02").val(); //셀렉트 박스에 @뒤 값들을 더함
				console.log(mail);
				
				$.ajax({
					async : false, 
					type : 'POST',
					url : 'CheckMail',
					data : {mail:mail},
					dataType :'json',
					success : function(data) { 
						key=data;
						console.log(key);
						alert("인증번호가 전송되었습니다.");
					},  error:function(request,status,error){
                        alert("code = "+ request.status + 
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
				} else {
					$("#email_check").text("인증번호가 일치하지 않습니다.")
					$("#email_check").css("color", "red");
					isCertification = false; //인증 실패
				}
			});
		});
		
		
		
				
		
	 
		
		/*
		 * 버튼 눌렀을 때 정규식 & 모두 true일 때 Ajax로 데이터 전송
		 */
		$('.join-btn').click(function(){
			var inval_Arr = new Array(7).fill(false);

			// ----- 아이디 확인 -----
			if (idJ.test($('.memberId').val())) {
				var member_id=$('.memberId').val(); 
				$.ajax({ 
					async : false, 
					type : 'GET', 
					data : member_id,  
					url : 'idCheck?memberId='+member_id, 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8", 
					success : function(data) { 
						if(data == 0){ 
							inval_Arr[0] = true; 
						}else { 
							inval_Arr[0] = false; 
							alert('아이디를 확인하세요.'); 
							return false;
						} 
					} 
				});//ajax
			}
		
			// ----- 비밀번호가 같은 경우 && 비밀번호 정규식 확인 -----
			if (($('.password01').val() == ($('.password02').val())) && pwJ.test($('.password01').val())) { 
				inval_Arr[1] = true; 
			} else { 
				inval_Arr[1] = false; 
				alert('비밀번호를 확인하세요.'); 
				return false; 
			} 
			// ----- 이름 확인 -----
			if (nameJ.test($('.memberName').val())) { 
				inval_Arr[2] = true; 
			} else { 
				inval_Arr[2] = false; 
				alert('이름을 확인하세요.'); 
				return false; 
			} 
			// ----- 이메일 확인 1 ------
			if (mailJ1.test($('.email01').val())){ 
				inval_Arr[3] = true; 
			} else { 
				inval_Arr[3] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
			} 
			// ----- 이메일 확인 2 -----
			if (mailJ2.test($('.email02').val())){ 
				inval_Arr[4] = true; 
			} else { 
				inval_Arr[4] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
			} 
			
			// ----- 휴대폰번호 확인 -----
			if (phoneJ.test($('.memberPhoneNumber').val())) { 
				var member_phoneNumber=$('.memberPhoneNumber').val(); 
				$.ajax({ 
					async : false, 
					type : 'GET', 
					data : member_phoneNumber,  
					url : 'pnCheck?memberPN='+member_phoneNumber, 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8", 
					success : function(data) { 
						if(data == 0){ 
							inval_Arr[5] = true;
							return true;
						} else { 
							inval_Arr[5] = false; 
							alert('휴대폰 번호를 확인하세요.'); 
							return false; 
						}
					}
				});
			}
			// ----- 주소 확인 -----
			if ($('.address3').val()!='') { 
				inval_Arr[6] = true; 
			} else { 
				inval_Arr[6] = false; 
				alert('주소를 확인하세요.'); 
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
			
			/*
			 * inval_Arr가 모두 true일 경우 ajax로 데이터 전송
			 */
			if(validAll == true && mailCertification == true){
				$.ajax({
					type: "POST",
					url: "/joinProcess",
					data: { "member_id": $('.memberId').val(),
							"member_email": $(".email01").val()+"@"+$(".email02").val(),
							"member_password": $('.password01').val(),
							"member_name": $('.memberName').val(),
							"member_phoneNumber": $('.memberPhoneNumber').val(),
							"member_address" : $(".address1").val()+" "+$(".address2").val()+" "+$(".address3").val(),
							"memberAuth_id" : $('.memberId').val(),
							"member_oauth" : null},
					success: function(result){
						alert('회원가입이 완료되었습니다.');
						console.log(result)
						location.href = "/welcome";
					}, error: function(result){
						alert('회원가입에 실패했습니다.');
						console.log(result)
					}
				});
			} else if (mailCertification == false){
				alert('이메일 인증을 해주세요.');
			}
		});
	}); // 회원가입 끝!
	</script>
	
	<!----- input check 해서 button 활성화/비활성화 하는 js ----->
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

	<!----- option을 통한 email 주소값 입력 ----->
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
	
	</script>
	
	<!-- <script src="/petopia/js/member.js"></script> -->

</body>
</html>