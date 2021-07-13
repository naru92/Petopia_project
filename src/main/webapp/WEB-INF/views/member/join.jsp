<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<title>join</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/join_style.css">
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
            <div class="result"><span class="blue">필수정보를 입력</span>해주세요.</div>

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
                    <div class="info">* 모든 항목은 필수 입력 항목입니다.
                    <br>* 필수항목을 작성하지 않을 경우 회원가입이 어렵습니다.</div>       
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
                        <input type="text" placeholder="아이디를 입력하세요.">
                        <button class="doublecheck">중복확인</button><br>
                        <input type="email"> @ <input type="email">
                        <select size="1">
                        <option>직접입력</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hanmail.net</option>
                        <option>hotmail.com</option>
                        <option>nate.com</option>
                        </select>
                        <button class="doublecheck">중복확인</button><br>
                        <input type="password" placeholder="영문 + 숫자 + (!,@,#,$,%,^,&,*) 조합 8~12자"><br>
                        <input type="password" placeholder="비밀번호를 다시 한번 입력하세요."><br>
                        <input type="text" placeholder="이름을 입력하세요."><br>
                        <input type="tel" placeholder="예) 010-1234-5678">
                        <button class="doublecheck">중복확인</button><br>
                        <input type="text" placeholder="우편번호" class="address1" id="zipNo" readonly>
                        <button class="address-btn" onClick="goPopup();">주소검색</button><br>
                        <input type="text" placeholder="도로명주소" id="roadAddrPart1" readonly><br>
                        <input type="text" placeholder="상세주소" id="addrDetail" readonly><br>
                        <br>
                    </div>
                </div>

                <a href="welcome"><button class="join-btn" disabled="disabled">가입하기</button></a>
                </section>
                </div>
            </article>
            </article>
        </div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
<script>
function goPopup(){
	// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
	window.name="jusoPopup";
	
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/member/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}

</script>
</body>
</html>