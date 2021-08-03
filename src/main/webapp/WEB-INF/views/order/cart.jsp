<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<head>

<title>Petopia</title>


<style type="text/css">
.check_out{
background-color:  #2AC1BC !important;
color: white !important;
}
#cart_title{
color: black !important;
margin-left: 13px;
margin-bottom: 20px;
}
.pull-right{
margin-left : 75%;
color: black !important;
}
.cart_menu{
color: black !important;
}
.ss {
	margin-top: 15px;
	margin-bottom: 15px;
}

.girdscc {
	margin-right: 15% !important;
}

.girdscc2 {
	margin-right: 14% !important;
}

.girdscc3 {
	margin-right: 16% !important;
}

.swiper-button-next {
	top: 35% !important
}

.swiper-button-prev {
	top: 35% !important
}

.swiper-container {
	color: black;
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.page-wrapper {
	min-height: 100%;
	display: flex;
	align-items: center;
	justify-content: center; button { padding : 20px;
	border: none;
	background: lighten(#292d48, 65);
	position: relative;
	outline: none;
	border-radius: 5px;
	color: #292d48;
	font-size: 18px; . cart-item { position : absolute;
	height: 24px;
	width: 24px;
	top: -10px;
	right: -10px; &: before { content : '1';
	display: block;
	line-height: 24px;
	height: 24px;
	width: 24px;
	font-size: 12px;
	font-weight: 600;
	background: #2bd156;
	color: white;
	border-radius: 20px;
	text-align: center;
}

}
&
.sendtocart { .cart-item { display:block;
	animation: xAxis 1s forwards cubic-bezier(1.000, 0.440, 0.840, 0.165);
	&:
	before
	{
	animation
	:
	yAxis
	1s
	alternate
	forwards
	cubic-bezier(
	0.165
	,
	0.840
	,
	0.440
	,
	1.000
	);
}

}
}
}
}
.cart {
	position: fixed;
	top: 20px;
	right: 20px;
	width: 50px;
	height: 50px;
	background: #292d48;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 5px; i { font-size : 25px;
	color: white;
}

&
:before {
	content: attr(data-totalitems);
	font-size: 12px;
	font-weight: 600;
	position: absolute;
	top: -12px;
	right: -12px;
	background: #2bd156;
	line-height: 24px;
	padding: 0 5px;
	height: 24px;
	min-width: 24px;
	color: white;
	text-align: center;
	border-radius: 24px;
}

&
.shake {
	animation: shakeCart .4s ease-in-out forwards;
}

}
@
keyframes xAxis { 100% {
	transform: translateX(calc(50vw - 105px));
}

}
@
keyframes yAxis { 100% {
	transform: translateY(calc(-50vh + 75px));
}

}
@
keyframes shakeCart { 25% {
	transform: translateX(6px)
}
50


%
{
transform


:


translateX
(


-4px


)
;


}
75


%
{
transform


:


translateX
(


2px


)
;


}
100


%
{
transform


:


translateX
(


0


)
;


}
}
</style>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/petopia/css/menu_test2.css">
<link rel="stylesheet" href="/petopia/css/nomalize.css">
<link rel="stylesheet" href="/petopia/css/index.css">
<link rel="stylesheet" href="/petopia/css/main-homepage.css">
<!-- Custom styles for this template -->
<script src="https://kit.fontawesome.com/f1def33959.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="/petopia/images/petopia_logomini.png">

</head>

<body>

	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<div class="links">
							<c:choose>
								<c:when test="${empty sessionScope.principal}">
									<a href="/member/joinAgree" class="link_text">회원가입</a>
									<a href="/member/login" class="link_text">로그인</a>
									<a href="#" class="link_text">고객센터</a>
								</c:when>
								<c:otherwise>
									<a href="/member/mypage" class="link_text">마이페이지</a>
									<a href="/member/logout" class="link_text">로그아웃</a>
									<a href="#" class="link_text">고객센터</a>
								</c:otherwise>
							</c:choose>
						</div>

						<nav class="header-nav">
							<div id="leftmenuToggle" class="leftmenuToggle">
								<input type="checkbox" /> <span></span> <span></span> <span></span>
								<ul id="leftmenu" class="hoverEvent">
									<div class="adiv">
										<li><a href="petstagram">펫★그램</a></li>
										<li><a href="main">펫shop</a></li>
										<li><a href="donation">기부</a></li>
										<li><a href="mypage"><i class="fas fa-paw"></i> MY</a></li>
									</div>
								</ul>
							</div>
							<!-- Logo -->
							<div class="logo">
								<a href="main"><img src="/petopia/images/petopia_logo.png"
									alt=""></a>
							</div>
						</nav>

						<!-- Main-menu -->
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="petstagram">펫★그램</a></li>
									<li><a href="main">펫shop</a></li>
									<li><a href="donation">기부</a></li>
									<li><a href="mypage"><i class="fas fa-paw"></i> MY</a></li>
								</ul>
							</nav>
						</div>
						<!-- Header Right -->
						<div class="search">
							<input type="text" class="searchForm" placeholder="검색어를 입력해주세요."
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<button class="searchBtn" type="submit">
								<i class="fas fa-search"></i>
							</button>
							<button class="wishBtn" type="link">
								<i class="fas fa-heart"></i>
							</button>
							<button class="cartBtn" type="link">
								<i class="fas fa-shopping-cart"></i>
							</button>
						</div>

						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-none d-lg-block"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<hr />
	<div class="container-fluid">

		<div class="container-fluid maginContainer">


			<div class="row">
				<div class="container-side">
					<div class="grid">
						<div class="row">
							<div class="col-3">
								<!-- category -->
								<nav class="category">
									<div class="ctghead">
										<h3>
											<i class="ti-list"></i>펫shop
										</h3>
									</div>

									<ul class="ctgul">
										<li class="ctgli"><a href="#" class="ctga"><i
												class="ti-user"></i>신상품</a></li>

										<li class="ctgli"><a href="#" class="ctga"><i
												class="ti-user"></i>베스트</a></li>

										<li class="ctgli"><a href="#" class="ctga"><i
												class="ti-user"></i>이벤트</a></li>

										<li class="ctgli"><a href="#" class="ctga "> <i
												class="ti-write"></i> 카테고리 <i class="ti-angle-down down "></i>
										</a>
											<ul class="ctgulChild">
												<li class="ctgliChild"><a href="" class="ctgaChild">사료</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">간식</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">위생/배변</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">미용/목욕</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">급식/급수기</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">장난감/훈련</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">하우스/이동장</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">패션/의류</a></li>
												<li class="ctgliChild"><a href="" class="ctgaChild">목줄/하네스</a></li>
											</ul></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>




			</div>

		


							
		<!-- 첫번째 컨테이너 플루이드 끝-->

		<!-- 중단시작 -->

		<div class="container-fluid">
			<div class="container girdscc2">
				<div class="row col-sm-12">
					
<section id="cart_items">
		<h2 id="cart_title">장바구니</h2>
		<div class="container">
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">품목</td>
							<td class="description"></td>
							<td class="price">가격</td>
							<td class="quantity">개수</td>
							<td class="total">총 가격</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${cart}" varStatus="status"> 
							<tr>
								<td class="cart_product">
									<div id="img-side">
										<a href="#"><img src="#" id="cartAttach${status.index}"></a>
									</div>
								</td>
                                <td class="cart_description">
                                    <h4><a href="/product/get?product_idx=${item.productList.get(0).product_idx}"><c:out value="${item.productList.get(0).product_name}"/></a></h4> 
                                        <p id="pno${status.index}"><c:out value="${item.productList.get(0).product_idx}"/></p>
                                </td>
                                <td class="cart_price">
                                    <p id="price${status.index}"><c:out value="${item.productList.get(0).product_price}"/></p>
                                </td>
                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                       <h2 id="quantity${status.index}">${item.amount}</h2>
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price" id="amountPrice${status.index}"></p>
                                </td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete" href="#">
                                    	<i class="fa fa-times">
                                        </i>
                                        	<input type="hidden" name="cart_id" id="cartNo${status.index}" value="<c:out value='${item.cart_id}'/>">
                                    </a>
                                </td>
                           </tr>
                           <input type="hidden" id="imageType${status.index}" value="${item.productList.get(0).productVOList.get(0).filetype}" />
                           <input type="hidden" id="uuid${status.index}" value="${item.productList.get(0).productVOList.get(0).uuid}" />
                           <input type="hidden" id="uploadPath${status.index}" value="${item.productList.get(0).productVOList.get(0).uploadPath}" />
                           <input type="hidden" id="fileName${status.index}" value="${item.productList.get(0).productVOList.get(0).fileName}" />
                       </c:forEach>
                       <tr>
                       	   <td class="pull-right">
                       	   		<p>총 가격 : <p id="totalPrice"></p></p>
                       	   </td>
                       </tr>
					</tbody>
				</table>
				 <div>
				 	<input type="hidden" id="size" value="${fn:length(cart)}" />
				 	<input type="hidden" id=member_id value="${memberVO.member_id}" />
                    <input type="hidden" id="name" value="${memberVO.member_name}" />
                    <input type="hidden" id="address" value="${memberVO.member_address}" />
                    <input type="hidden" id="email" value="${memberVO.member_email}" />
                    <input type="hidden" id="point" value="${memberVO.member_point}" />        	
                 </div>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="row">
				<div class="pull-right" align="right">
					<a class="btn btn-info check_out" href="#" id="checkOut">주문서 작성</a>
				</div>
			</div>
		</div>
	</section>
			


				</div>
			</div>
		</div>

<!-- 
		<div class="quick">

			<div class="icon4">
				<span>장바구니</span> <span><a href="#">0</a></span>
				<div "class=cart_item"></div>
			</div>
			<div class="icon5">
				<span>최근 본 상품</span> <br> <a href="#"><img
					src="http://vivienne.kr/web/upload/goodymall40/layout/btn_recent_prev.gif"
					alt=""><img
					src="http://vivienne.kr/web/upload/goodymall40/layout/btn_recent_next.gif"
					alt=""></a>
			</div>

		</div> -->
	</div>
</div>


	<div class="container-fluid footercontainer">



		<!-- footer -->

		<!--// footer -->

	</div>
	<footer>
		<div class="container-fluid">

			<img src="/petopia/images/petopia_logomini.png"> </br>
			<p>PETOPIA</p>
			</br>
			<p>서비스 이용약관 | 개인정보 처리방침 | 입점/제휴 문의</p>
			</br>
			<p>Naru Juhee Gunwoo Ahram Hansol Hana</p>
			<p>Bitcamp Jongno</p>
			</br>
			<p>&copy Creative 2021-08</p>


		</div>
	</footer>



	<a id="backtotop"></a>

	<!-- Bootstrap core JavaScript -->
	


	<script src="/petopia/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="/petopia/js/mainindex.js"></script>
	<script src="/petopia/js/petopia.js"></script>


<script type="text/javascript">

$(document).ready(function() {

/* 	var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";
    
    $(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
	 */
	// 장바구니 상품 이미지
	for(var i = 0; i < $("#size").val(); i++) {
		var imgSrci = null;
		var uuid = $("#uuid" + i).val();
		var uploadPath = $("#uploadPath" + i).val();
		var fileName = $("#fileName" + i).val();
		
		if($("#imageType" + i).val()) {
			imgSrci = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			imgSrci = "/display?fileName=" + imgSrci;
		} else {
			imgSrci = '../../resources/images/attach.png';
		}
	
		console.log(imgSrci);
		
		$("#cartAttach" + i).attr("src", imgSrci);
	}
	
	function numberFormat(inputNumber) {
		  return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	// 각 항목 합계 가격
	for(var i = 0; i < $("#size").val(); i++) {
		var price = $("#price" + i).html();
		var amount = $("#quantity" + i).html();
		
		var amountPrice = price*amount;
		
		$("#amountPrice" + i).html(amountPrice);
	}
	
	$(".cart_delete").on("click", "a", function(e) {
	
		var cartNumber = $(this).find("input[name=cart_id]").val();
		
		console.log(cartNumber);
		
		 $.ajax({
			type: 'post',
			url: '/deleteCartItem',
			data: JSON.stringify(cartNumber),
			contentType: "application/json; charset=utf-8",
			dataType: 'text',
			success: function(result, status, xhr) {
			  	console.log('delete cart item ' + result);

			  	alert("상품이 장바구니에서 삭제 되었습니다");
			  	
			  	location.replace("order/Cart");
			  }
		}); 
	});
	
	// price comma
	for(var i = 0; i < $("#size").val(); i++) {
		var price = $("#price" + i).html()
		console.log(price);
		$("#price" + i).html(numberFormat(price));
	}
	
	// total price
	var totalPrice = 0;
	
	for(var i = 0; i < $("#size").val(); i++) {
		totalPrice += Number($("#amountPrice" + i).html());
	}
	
	$("#totalPrice").html(numberFormat(totalPrice));
	
	console.log($("#totalPrice").html());
	
	//amount price comma
	for(var i = 0; i < $("#size").val(); i++) {
		$("#amountPrice" + i).html(numberFormat($("#amountPrice" + i).html()));
	}
	
	
	


});
</script>

</body>

</html>
