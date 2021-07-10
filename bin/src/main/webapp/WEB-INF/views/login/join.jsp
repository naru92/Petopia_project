<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<title>join</title>
<!-- CSS here -->
<link rel="stylesheet" href="petopia/css/join_style.css">
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
                        <input type="id" placeholder="아이디를 입력하세요.">
                        <button class="doublecheck">중복확인</button><br>
                        <input type="email"> @ <input type="email">
                        <select size="1">
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hanmail.net</option>
                        <option>hotmail.com</option>
                        <option>nate.com</option>
                        </select>
                        <button class="doublecheck">중복확인</button><br>
                        <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
                        <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
                        <input type="text" placeholder="이름을 입력하세요."><br>
                        <input type="tel" placeholder="예) 010-1234-5678">
                        <button class="doublecheck">중복확인</button><br>
                        <input type="address" placeholder="우편번호" class="address1">
                        <button class="address-btn">주소검색</button><br>
                        <input type="address" placeholder="도로명주소"><br>
                        <input type="address" placeholder="상세주소"><br>
                        <br>
                    </div>
                </div>

                <a href="welcome"><button class="join-btn">가입하기</button></a>
                </section>
                </div>
            </article>
            </article>
        </div>
	</main>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
</body>
</html>