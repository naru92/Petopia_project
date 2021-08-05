<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이펫 등록</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/myPet_insert.css">

<!-- 추후에 수정 -->
<link rel="shortcut icon" type="image/x-icon"
	href="images/petopia_logomini.png">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://wagtrung.github.io/store/themify-icons/themify-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<div class="main">
			<h3>내새꾸를 등록해보세요!</h3>
			<div class="result">
				<span class="blue">필수정보를 입력</span>해주세요.
			</div>

			<article class="one">
				<!-- article 기능이 뭔지 (두개 다)? -->
				<article class="find1">
					<div>
						<section id="content3">
							<div>
							<div class="pb0">
								어떤 반려동물과 함께 하시나요?<br>
							</div>
							<div class="info">
								* 항목은 필수 입력 항목입니다.<br>
							</div>
							</div>

							<div>
								<div>
									<p class="none">
										<span id='choiceText'> &nbsp;</span>
									</p>
									<p>이름 *</p>
									<p>성별 *</p>
									<p>&nbsp</p>
									<p>생년월일 *</p>
									<p>몸무게</p>
									<p>중성화 여부</p>
									<p>염려질환</p>
									<p>&nbsp</p>
								</div>

								<div>
									<div class="choice">
										<input type="radio" name="kind" onclick="handleClick(this)" value="cat"> 고양이 
										<input type="radio" name="kind" onclick="handleClick(this)" value="dog"> 강아지
									</div>
									<div style='width: 300px'>
										<!-- <span id='choiceText'></span> -->

										<!-- <span style='float:right;font-size: small;'>* 필수 입력 정보</span>
                                    </br> -->
										<input type='text' id='txtKind' style='width: 250px' placeholder="세상에 하나뿐인 시고르사브르종" ></input>
									</div>
									<input type="text" placeholder="아이의 이름을 입력해주세요"><br>
									<div class="choice">
										<input type="radio" name="gender" value="male"> 남아 
										<input type="radio" name="gender" value="female"> 여아
									</div>
									<label>생년월일을 선택해주세요. </label><br> 
									<input type="date"><br> 
									<input type="number" step="0.1" value="kg"><br> 
									<input type='button' id='중성화 전' onclick='button1_click();' value="중성화 후"><br> 
									<input type="text" placeholder="염려질환을 입력해주세요"><br>
								</div>
							</div>
							<section>
								<a href="welcome.html"><button class="next-btn">이전</button></a>
								<a href="welcome.html"><button class="next-btn">다음</button></a>
							</section>
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
		var curKind = '';

		function fnClick() {
			var kind = document.getElementById('txtKind').value;

			document.getElementsByName('rstText').innerHTML = kind;
			document.getElementsByName('txtGetKind').value = kind;
		}

		function handleClick(objKind) {
			curKind = objKind.value;
			var lblKind = curKind == 'cat' ? '묘종' : '견종';

			document.getElementById('choiceText').innerHTML = lblKind;
		}

		function button1_click() {
			console.log("버튼1을 누르셨습니다.");
		}
	</script>

</body>
</html>