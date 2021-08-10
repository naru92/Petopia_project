<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>회원 탈퇴 | 내 정보</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/withdrawal_agree.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<h5>[필수] 게시판형 서비스에 등록한 게시글 삭제 불가 안내</h5>
	<p>삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다. 탈퇴 후에는 회원정보가
		삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
	<main>
		<div class="main">
			<h3>회원탈퇴</h3>
			<div class="result">
				회원 탈퇴에 앞서 <span class="blue">유의사항</span> 및 <span class="blue">안내</span> 
			</div>

			<article class="one">
				<section>

					<div class="box">
						<h5>[필수] Petopia 아이디는 복구 불가 안내</h5>
						<p>
							회원탈퇴 진행 시 아이디 복구가 불가능합니다.<br>
							신중히 선택하신 후결정해주세요.
						</p>
						<input type="checkbox" class="check01" id="check01"
							name="must-agree"> <label for="check01">동의</label><br>
					</div>

					<div class="box">
						<h5>[필수] 내 정보 및 개인형 서비스 이용 기록 삭제 안내</h5>
						<p>
							내 정보 및 개인형 서비스 이용기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
							삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.
						</p>
						<table class="t-list">
							<tr>
								<td>개인정보</td>
								<td>&nbsp&nbsp</td>
								<td>저장된 이름, 휴대전화, 주소록 삭제</td>
							</tr>
							<tr>
								<td>주소록</td>
								<td>&nbsp&nbsp</td>
								<td>저장된 주소 삭제</td>
							</tr>
							<tr>
								<td>포인트</td>
								<td>&nbsp&nbsp</td>
								<td>적립된 포인트 정보 삭제</td>
							</tr>
						</table>
						<input type="checkbox" class="check02" id="check02"
							name="must-agree"> <label for="check02">동의</label><br>
					</div>

					<div class="box">
						<h5>[필수] 게시판형 서비스에 등록한 게시글 삭제 불가 안내</h5>
						<p>
							삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 삭제하시기 바랍니다. <br>
							탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
						</p>
						<table class="t-list">
							<tr>
								<td>MY발자국</td>
								<td>&nbsp&nbsp</td>
								<td>질문, 나의 후기 등</td>
							</tr>
							<tr>
								<td>펫★그램</td>
								<td>&nbsp&nbsp</td>
								<td>게시물 및 댓글</td>
							</tr>
							<tr>
								<td>기타</td>
								<td>&nbsp&nbsp</td>
								<td>공적인 영역의 게시물과 댓글, 의견 등</td>
							</tr>
						</table>
						<input type="checkbox" class="check03" id="check03"
							name="must-agree"> <label for="check03">동의</label><br>
					</div>

					<div>
						<div class="info">필수항목에 대해서 동의 거부시 회원탈퇴가 불가능합니다.</div>
					</div>
				</section>
				<section>
					<div class="w-bt">
						<a href="mypage.html"><button class="bnt-main">탈퇴취소</button></a>
						<a href="withdrawal"><button class="bnt-next">다음단계</button></a>
					</div>
		</div>
		</section>
		</article>
		</div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script>
		var allcheck = document.querySelector('.checkall'); // 모두 선택 체크박스
		var checkList = document.querySelectorAll('.allcheck input'); // 그 외의 6개의 체크박스 (전부 선택해주려면 document.querySelectorAll 뿐인듯 해 이것으로 적용해주었습니다)

		var count = 0; // 가상의 박스에 초기값 0을 넣어줍니다.

		allcheck.addEventListener("change", checkboxClick); // 모두 선택 체크박스가 변경되었을때 이벤트 실행

		function checkboxClick() {
			if (allcheck.checked) { // 모두 선택 체크박스의 값이 'true' 일때
				for (var i = 0; i < checkList.length; i++) {
					checkList[i].checked = true; // 하단 체크 박스 6개를 모두 check 시켜줌
					count = checkList.length; // count 값은 ckeckList의 길이값과 동일
				}
				;
			} else {
				for (var i = 0; i < checkList.length; i++) {
					checkList[i].checked = false; // 하단 체크 박스 6개를 모두 uncheck 시켜줌
					count = 0; // 모든 체크박스가 uncheck 되었으므로 count 값은 0
				}
				;
			}
		};

		for (var i = 0; i < checkList.length; i++) {
			checkList[i].addEventListener("change", checkboxChecking); // 하단 체크박스의 i 번째가 체크되었을 때 이벤트 실행

			function checkboxChecking() {
				if (this.checked) { // 클릭한 값이 체크되었을 때

					count++; // 카운트 +
					if (count == checkList.length) { // count 값이 길이값과 동일하게 되었다면
						allcheck.checked = true; // allcheck 버튼도 체크값으로 변경
					} else {
						allcheck.checked = false; // 6이 아니라면 체크값을 없애줍니다
					}
				} else {
					count--; // 카운트 -
					allcheck.checked = false; // allcheck 버튼 역시 6이 될 수 없으므로 체크값을 없애줍니다.
				}
			}
			;
		};
	</script>
</body>

</html>