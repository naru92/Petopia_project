<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/joinAgree_style.css">
<!-- default_css -->
<%@ include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>회원가입</h3>
			<div class="result">
				<span class="blue">서비스 이용약관에 동의</span>해주세요.
			</div>
			<article class="one">

				<div class="taball">
					<div class="tab1">
						<img src="https://image.flaticon.com/icons/svg/126/126486.svg"><br>STEP
						1<br>가입하기<br>
					</div>
					<div class="tab2">
						<img src="https://image.flaticon.com/icons/svg/1159/1159633.svg"><br>STEP
						2<br>약관동의<br>
					</div>
					<div class="tab3">
						<img src="https://image.flaticon.com/icons/svg/839/839860.svg"><br>STEP
						3<br>정보입력<br>
					</div>
					<div class="tab4">
						<img src="https://image.flaticon.com/icons/svg/3064/3064197.svg"><br>STEP
						4<br>가입완료<br>
					</div>
				</div>

				<section>
					<input type="checkbox" class="checkall" id="checkall"> 
					<label for="checkall">약관 전체동의</label>
				</section>
				<section>
					<div class="allcheck">
						<input type="checkbox" class="check01" id="check01" name="must-agree">
						<label for="check01"> [필수] 서비스이용약관</label><br> 
						<input type="checkbox" class="check02" id="check02" name="must-agree">
						<label for="check02"> [필수] 개인정보 처리방침 </label><br>
						<input type="checkbox" class="check03" id="check03" name="must-agree">
						<label for="check03"> [필수] 개인정보 수집/이용 동의 </label><br>
						<input type="checkbox" class="check04" id="check04" name="must-agree"> 
						<label for="check04"> [필수] 만 14세 이상입니다. </label><br>
					</div>
					<div>
						<div class="info">
							약관 전체동의는 필수 정보에 대한 동의로 이루어지며, <br> 필수항목에 대해서 동의 거부시 회원가입이
							어렵습니다.
						</div>
					</div>
				</section>
				<section>
					<a href="main"><button class="btn-main">메인으로</button></a> 
					<a href="joinForm"><button class="btn-next" disabled="disabled">다음으로</button></a> 
				</section>
			</article>
		</div>
	</main>

	<footer>
		<%@ include file="../include/default_footer.jsp"%>
	</footer>

	<script>
    var allcheck = document.querySelector('.checkall'); // 모두 선택 체크박스
    var checkList = document.querySelectorAll('.allcheck input'); // 그 외의 6개의 체크박스
    
    var count = 0; // 가상의 박스에 초기값 0을 넣어줍니다.
    
    allcheck.addEventListener("change", checkboxClick); // 모두 선택 체크박스가 변경되었을때 이벤트 실행

    function checkboxClick() {
       if (allcheck.checked) { // 모두 선택 체크박스의 값이 'true' 일때
          for (var i = 0; i < checkList.length; i++) {
             checkList[i].checked = true; // 하단 체크 박스 4개를 모두 check 시켜줌
             count = checkList.length; // count 값은 ckeckList의 길이값과 동일
          }
     	  // 버튼 활성화
          $('input[type="checkbox"]').each(function() {
        	    $('.btn-next').prop('disabled', false);
        	});
       } else {
          for (var i = 0; i < checkList.length; i++) {
             checkList[i].checked = false; // 하단 체크 박스 4개를 모두 uncheck 시켜줌
             count = 0; // 모든 체크박스가 uncheck 되었으므로 count 값은 0
          }
			// 버튼 비활성화
			$('input[type="checkbox"]').each(function() {
      	    $('.btn-next').prop('disabled', true);
      	});
          
       }
    };

    for (var i = 0; i < checkList.length; i++) {
       checkList[i].addEventListener("change", checkboxChecking); // 하단 체크박스의 i 번째가 체크되었을 때 이벤트 실행
       function checkboxChecking() {
          if (this.checked) { // 클릭한 값이 체크되었을 때
             count++; // 카운트 +
             if (count == checkList.length) { // count 값이 길이값과 동일하게 되었다면
                allcheck.checked = true; // allcheck 버튼도 체크값으로 변경
             	  // 버튼 활성화
                $('input[type="checkbox"]').each(function() {
              	    $('.btn-next').prop('disabled', false);
              	});
             } else {
                allcheck.checked = false; // 4이 아니라면 체크값을 없애줍니다
                // 버튼 비활성화
                $('input[type="checkbox"]').each(function() {
            	    $('.btn-next').prop('disabled', true);
            	});
             }
          } else {
             count--; // 카운트 -
             allcheck.checked = false; // allcheck 버튼 역시 4가 될 수 없으므로 체크값을 없애준다.
             // 버튼 비활성화
             $('input[type="checkbox"]').each(function() {
         	    $('.btn-next').prop('disabled', true);
         	});
          }
       }
       ;
    };


	</script>
</body>
</html>