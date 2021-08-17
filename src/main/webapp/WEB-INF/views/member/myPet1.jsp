<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">

<title>마이펫 등록</title>

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/myPet_insert.css">

<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>
	
	<main>
		<div class="main">
			<h3>함께하는 아이는 어떤 아이인가요?<br>내새꾸를 등록해보세요.</h3><br>
			<div class="result">
				<span class="blue"> * 필수정보를 입력</span>해주세요.
			</div>

			<article class="one">
				<article class="find1">
					<div>
						<section id="content3">
								<div>
									<div class="choice">
									<div class="uploadDiv">
									<td>사진을 등록해주세요. </td>
									<input type="file" id="inputImg" name='inputImg'></div>
									
									<label for="petname">* 이름</label>
									<input type="text" placeholder="이름을 입력해주세요"><br>
									
									<label for="petkind">* 강아지/고양이 선택 후 품종을 입력해주세요. </label>
										<input type="radio" name="kind" onclick="handleClick(this)" value="cat"> 고양이 
										<input type="radio" name="kind" onclick="handleClick(this)" value="dog"> 강아지
										<p class="none">
										<span id='choiceText'></span>
									</p>
									</div>
									<div style='width: 300px'>
										<!-- <span id='choiceText'></span> -->

										<!-- <span style='float:right;font-size: small;'>* 필수 입력 정보</span>
                                    </br> -->
										<input type='text' id='txtKind' style='width: 250px' placeholder="세상에 하나뿐인 시고르사브르종" ></input>
									</div>
									
									<div class="choice">
									<label for="petkind">* 성별을 선택해주세요. </label>
										<input type="radio" name="gender" value="male"> 남아 
										<input type="radio" name="gender" value="female"> 여아
									</div>
									<label>생년월일을 선택해주세요. </label><br> 
									<input type="date"><br> 
									<label>[선택] 몸무게를 입력해주세요. </label><br> 
									<div class="input del t2" data-txt="kg">
									<input type="number" id="weight" name="weight" placeholder="소수점 한자리까지 입력 가능"><br> 
							</div>
								
									<label>[선택] 중성화가 되어 있나요? </label><br> 
									<!-- <input type='button' id='중성화 전' onclick='button1_click();' value="중성화 후"><br> --> 
									<div class="pet-wrap">
										<div class="radiobox">
														<span class="radio"><input type="radio" name="fixingYn" id="fixingYnN" value="N" ><label for="radt_1" class="txt">중성화 전</label></span>
														<span class="radio"><input type="radio" name="fixingYn" id="fixingYnY" value="Y" ><label for="radt_2" class="txt">중성화 완료</label></span>
													</div>
									</div>
									<input type="text" placeholder="염려질환을 입력해주세요"><br>
									<label>[선택] 아이가 혹시 알러지가 있나요? </label><br>
								
								</div>
				
							<section>
								<button type="submit" class="modify-btn">이전</button>
								<button type="submit" class="modify-btn">다음</button>
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