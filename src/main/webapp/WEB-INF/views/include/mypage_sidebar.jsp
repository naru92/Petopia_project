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
						<h3><i class="ti-list"></i>마이페이지</h3>
					</div>

					<ul class="ctgul">
						<li class="ctgli">
							<a href="#" class="ctga ">
								<i class="ti-write"></i>
								마이펫 관리
								<i class="ti-angle-down down "></i>
							</a>
						</li>

						<li class="ctgli">
							<a href="myOrderList" class="ctga ">
								<i class="ti-write"></i>
								주문/배송 조회
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="exchange_refund" class="ctga ">
								<i class="ti-write"></i>
								취소/반품 조회
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="point" class="ctga ">
								<i class="ti-write"></i>
								내 포인트 조회
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="myDonation" class="ctga ">
								<i class="ti-write"></i>
								나의 기부 내역
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="contentList" class="ctga ">
								<i class="ti-write"></i>
								나의 게시물 관리
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="reviewList" class="ctga ">
								<i class="ti-write"></i>
								나의 후기 관리
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="qna_my_qna" class="ctga ">
								<i class="ti-write"></i>
								나의 문의 내역
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="passwordConfirm" class="ctga ">
								<i class="ti-write"></i>
								회원정보 수정
								<i class="ti-angle-down down "></i>
							</a>
						</li>
						
						<li class="ctgli">
							<a href="withdrawal_agree" class="ctga ">
								<i class="ti-write"></i>
								회원탈퇴
								<i class="ti-angle-down down "></i>
							</a>
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
