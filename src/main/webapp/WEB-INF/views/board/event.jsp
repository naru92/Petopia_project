<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
                            <a href="event_detail.html"><img src="/petopia/images/event_img_1.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail.html"><h3>여름맞이 선물이 팡팡! 7월 출석 이벤트</h3></a>
                                <a href="event_detail.html"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>

                        <div class="event-box">
                            <a href="event_detail.html"><img src="/petopia/images/event_img_2.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail.html"><h3>참여만 해도 포인트를 준다??</h3></a>
                                <a href="event_detail.html"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>
                    </div>
                </li>

                <li id="tab2" class="btnCon"><input type="radio" name="event-tab" id="event-tab2">
                    <label for="event-tab2">종료된 이벤트</label>
                    <div class="tabCon">
                        <div class="event-box">
                            <a href="event_detail.html"><img src="/petopia/images/event_img_1.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail.html"><h3>참여만 해도 포인트를 준다??</h3></a>
                                <a href="event_detail.html"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>

                        <div class="event-box">
                            <a href="event_detail.html"><img src="/petopia/images/event_img_2.jpg"></a>
                            <div class="event-caption">
                                <a href="event_detail.html"><h3>여름맞이 선물이 팡팡! 7월 출석 이벤트</h3></a>
                                <a href="event_detail.html"><p>2021.07.01 ~ 2021.07.31</p></a>
                            </div>
                        </div>
                    </div>
                </li>

            </ul>
        </div>
    </main>

	<footer> </footer>

	<script>
		<%@include file="../include/default_sidebar_js.jsp"%>
    </script>
</body>

</html>