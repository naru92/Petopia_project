<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-----------------------------------------sidebar-------------------------------------->
    <div class="container-side">
        <div class="grid">
            <div class="row">
                <div class="col-3">
                    <!-- category -->
                    <nav class="category">
                        <div class="ctghead">
                            <h3><a href="/main"><i class="ti-list"></i>펫shop</a></h3>
                        </div>

                        <ul class="ctgul">
                            <li class="ctgli">
                                <a href="#" class="ctga"><i class="ti-user"></i>신상품</a>
                            </li>

                            <li class="ctgli">
                                <a href="#" class="ctga"><i class="ti-user"></i>베스트</a>
                            </li>

                            <li class="ctgli">
                                <a href="/event" class="ctga"><i class="ti-user"></i>이벤트</a>
                            </li>

                            <li class="ctgli">
                                <a href="#" class="ctga ">
                                    <i class="ti-write"></i>
                                    카테고리
                                    <i class="ti-angle-down down "></i>
                                </a>
                                <ul class="ctgulChild">
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">사료</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">간식</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">위생/배변</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">미용/목욕</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">급식/급수기</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">장난감/훈련</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">하우스/이동장</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">패션/의류</a>
                                    </li>
                                    <li class="ctgliChild">
                                        <a href="" class="ctgaChild">목줄/하네스</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>


    <script>
	/* sidebar js */
	$(".ctgli:has(.ctgulChild)").click(function(e) {
		e.preventDefault();
		//li_HAVE_Child-hasShowed-hasSlideD
		if ($(this).hasClass('showed')) {
			//-x-hasSlideD
			$(this).children('.ctgulChild');
		} else {
			$('.ctgulChild');
			$('.ctgli').removeClass('showed');
			$(this).addClass('showed');
			$(this).children('.ctgulChild').slideToggle();
		}
	});
	$('.ctgli').click(function() {
		$(this).toggleClass('wtok');
	});
	</script>