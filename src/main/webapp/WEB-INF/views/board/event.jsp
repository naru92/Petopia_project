<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>이벤트 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/event.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>

<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
		<%@include file="../include/default_sidebar.jsp"%>
	</header>

	<main>
        <div class="event-tab">
            <ul>
                <li id="tab1" class="btnCon"> <input type="radio" checked name="event-tab" id="event-tab1">
                    <label for="event-tab1">진행중인 이벤트</label>
                    <div class="tabCon">
                    	<div class="event-box">
                            <a href="/member/gameplay"><img src="/petopia/images/event_img_4.png"></a>
                            <div class="event-caption">
                            	<br>
                                <a href="event_detail"><h3>포인트 쏟아진다😜 하루 한번! 맞추면 포인트!!</h3></a>
                                <a href="event_detail"><p>2021.08.01 ~ 2021.08.31</p></a>
                            </div>
                        </div>
                        
                        <div class="event-box">
                            <a href="event_detail"><img src="/petopia/images/event_img_1.jpg"></a>
                            <div class="event-caption">
                            	<br>
                                <a href="event_detail"><h3>#더위비켜 여름용품 할인 이벤트</h3></a>
                                <a href="event_detail"><p>2021.08.01 ~ 2021.08.31</p></a>
                            </div>
                        </div>

                        <div class="event-box">
                            <a href="event_detail"><img src="/petopia/images/event_img_2.jpg"></a>
                            <div class="event-caption">
                            	<br>
                                <a href="event_detail"><h3>금요일마다 버프 받자! 버디 프라이스 혜택</h3></a>
                                <a href="event_detail"><p>2021.08.01 ~ 2021.08.31</p></a>
                            </div>
                        </div>
                    </div>
                </li>

                <li id="tab2" class="btnCon"><input type="radio" name="event-tab" id="event-tab2">
                    <label for="event-tab2">종료된 이벤트</label>
                    <div class="tabCon">
                        <div class="event-box">
                            <a href="event_detail"><img src="/petopia/images/event_img_3.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail"><h3>요즘 대세는 홈캉스! 집콕 필수템 할인전</h3></a>
                                <a href="event_detail"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>

                        <div class="event-box">
                            <a href="event_detail"><img src="/petopia/images/event_img_2.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail"><h3>금요일마다 버프 받자! 버디 프라이스 혜택</h3></a>
                                <a href="event_detail"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </main>

	<footer> </footer>

</body>

</html>