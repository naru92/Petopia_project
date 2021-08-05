<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<title>회원정보 수정</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/memberModify.css">

<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
<header>
		<%@include file="../include/default_header.jsp"%>
	</header>
	<script>
	    $("document").ready(function() {
	        //해당 페이지의 첫 진입점
	        //ex) 로그인한 사용자의 id 를 display
	        $("#txtId").val('isnana');
	        //해당 페이지의 첫 진입점
	        //ex) 로그인한 사용자의 id 를 display
	        $("#txtMemberName").val('허하나');
	    });
	
	    //테스트용 버튼
	    $("#btnTest").click(function() {
	        $("#txtId").attr('readonly', true);
	        $("#txtId").addClass('disabledInput');
	    });
	</script>
		

	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>
	
<main>
		<div class="main">
			<h3>회원 정보 수정</h3>
			<div class="result">
				<span class="blue">필수정보를 입력</span>해주세요.
			</div>

			<article class="one">
				<article class="find1">
					<div>
						<section id="content3">
							<div class="info">
							</div>
							<div>
								<div>
									<p>아이디</p>
									<p class = emailP>이메일</p>
									<p>새 비밀번호</p>
									<p>비밀번호 확인</p>
									<p>이름</p>
									<p>휴대전화</p>
									<p>주소</p>
								</div>

								<div>
									<form class="inputAll">
										<input type="text" class="memberId" readonly>
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
										
										<br> <input type="text"	class="memberName" readonly> 
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

							<a><button type="submit" class="modify-btn">수정하기</button></a>
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
		$('.modify-btn').click(function(){
			var inval_Arr = new Array(5).fill(false);

			// ----- 비밀번호가 같은 경우 && 비밀번호 정규식 확인 -----
			if (($('.password01').val() == ($('.password02').val())) && pwJ.test($('.password01').val())) { 
				inval_Arr[0] = true; 
			} else { 
				inval_Arr[0] = false; 
				alert('비밀번호를 확인하세요.'); 
				return false; 
			} 

			// ----- 이메일 확인 1 ------
			if (mailJ1.test($('.email01').val())){ 
				inval_Arr[1] = true; 
			} else { 
				inval_Arr[1] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
			} 
			// ----- 이메일 확인 2 -----
			if (mailJ2.test($('.email02').val())){ 
				inval_Arr[2] = true; 
			} else { 
				inval_Arr[2] = false; 
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
							inval_Arr[3] = true;
							return true;
						} else { 
							inval_Arr[3] = false; 
							alert('휴대폰 번호를 확인하세요.'); 
							return false; 
						}
					}
				});
			}
			// ----- 주소 확인 -----
			if ($('.address3').val()!='') { 
				inval_Arr[4] = true; 
			} else { 
				inval_Arr[4] = false; 
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
					url: "/member/modify", // ----------------------수정
					data: { "member_id": $(".memberId").val(), //------------- (세션에 있는 것)수정
							"member_email": $(".email01").val()+"@"+$(".email02").val(),
							"member_password": $('.password01').val(),
							"member_phoneNumber": $('.memberPhoneNumber').val(),
							"member_address" : $(".address1").val()+" "+$(".address2").val()+" "+$(".address3").val()},
					success: function(result){
						alert('회원수정이 완료되었습니다.');
						console.log(result)
						location.href = "/member/mypage"; // --------------수정
					}, error: function(result){
						alert('회원수정에 실패했습니다.');
						console.log(result)
					}
				});
			} else if (mailCertification == false){
				alert('이메일 인증을 해주세요.');
			}
		});
	}); // 회원가입 끝!
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

</body>
</html>