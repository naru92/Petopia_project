<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/join_style.css">
<link rel="stylesheet" href="/petopia/css/memberModify.css">
    
    <link rel="shortcut icon" type="image/x-icon" href="images/petopia_logomini.png">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
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
            <h3>회원정보 수정</h3>
            <div class="result">
                <span class="blue">필수정보를 입력</span>해주세요.
            </div>

            <article class="one">
                <article class="find1">
                    <div>
                        <section id="content3">
                        <div class="info">
                            * 모든 항목은 필수 입력 항목입니다.
                        </div>       
                        <div>
                            <div>
                                <p>아이디</p>
                                <p>이름</p>
                                <p>기존 비밀번호</p>
                                <p>변경할 비밀번호</p>
                                <p>비밀번호 확인</p>
                                <p>휴대전화 번호</p>
                                <p>주소</p>
                                <p>&nbsp</p>
                                <p>&nbsp</p>
                                <p>이메일 주소</p>
                            </div>
                       
                            <div>
                                <input type="text" id="txtId"  class="txt_readonly" /> 
                                <input type="text" id="txtMemberName"  readonly="readonly" class="txt_readonly"><br>
                                <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
                                <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
                                <input type="password" placeholder="영문, 숫자 조합 6~12자"><br>
                                <input type="tel" placeholder="예) 010-1234-5678">
                                <button class="doublecheck">중복확인</button><br>
                                <input type="address" placeholder="우편번호" class="address1">
                                <button class="address-btn">주소검색</button><br>
                                <input type="address" placeholder="도로명주소"><br>
                                <input type="address" placeholder="상세주소"><br>
                                
                                <input type="email"> @ <input type="email">
                                <select size="1">
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>hanmail.net</option>
                                <option>hotmail.com</option>
                                <option>nate.com</option>
                                <button class="doublecheck">중복확인</button><br>
                                </select>
                            </div>
                        </div>
    
                        <a href="welcome.html"><button class="join-btn">수정하기</button></a>
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

</body>
</html>