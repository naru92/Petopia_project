<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/shopProductDetail_style.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<main>
		<!-- 상품 상세 보기 -->
		<div class="article">
			<div class=categorymenu>
			카테고리영역
			</div>
			<!-- 이미지 출력 부분 -->
			<div class="main-img">
				<img id="listAttach" src="https://via.placeholder.com/500x500?text=main img(500x500)" alt="" class="big-img">
				<br>
			</div>
			<!-- 우측 상품명 및 가격 -->
			<div class="product-detail">
				<div class="product-heading">
					<h3>상품명</h3>
					<div class="rating-price">
						<span class="fa fa-star checked"></span> 
						<span class="fa fa-star checked"></span> 
						<span class="fa fa-star checked"></span> 
						<span class="fa fa-star checked"></span> 
						<span class="fa fa-star checked"></span> 
						<span id="review-no">(5.0)</span> 
						<span style="color: #757575">review 250</span>
						<h4>00000원</h4>
					</div>
				</div>
				<div class="product-seller">
					<hr>
					<span class="minititle">상품설명</span>
					<span class="miniinfo">Product detail info</span>
					<hr>
					<span class="minititle">상품컬러</span>
					<span class="miniinfo">Product color</span>
					<hr>
					<span class="minititle">상품수량</span>
					<span class="miniinfo">js로 수량 + - 구현</span>
					<hr>
					<span class="minititle">배송정보</span>
					<i id="footer-2" class="fas fa-truck"></i> 
					<span class="miniinfo">무료배송 (택배 배송 1~2일 소요 예정)</span>
					<hr>
					<br>
				</div>
				<div class="addbtn">
					<br>
					<button id="addcart-btn" type="button" class="btn">장바구니 담기</button>
					<button id="order-btn" type="button" class="btn">바로 구매하기</button>
				</div>
			</div>
				
			<!-- 탭 메뉴 부분 -->
			
			<div class="tabMenu">
				<ul class="ulTab">
					<li><a class="tabBtn" id="productDetail">상품정보</a></li>
					<li><a class="tabBtn" href="#">후기</a></li>
				</ul>
			</div>
			

			<!-- 상품 상세 이미지 영억 -->
	
			<!-- 후기 영역 -->
			<div class="tabMenu">
				<ul class="ulTab">
					<li><a class="tabBtn" href="#">상품정보</a></li>
					<li><a class="tabBtn" id="review">후기</a></li>
				</ul>
			</div>

		</div>
	</main>




	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	<script type="text/javascript">
          var imgSrci = null;
          var uuid = $("#md_uuid" + i).val();
          var uploadPath = $("#md_uploadPath").val();
          var fileName = $("#md_fileName").val();
          if($("#md_filetype").val()) {
             imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
             imgSrci = "/display?fileName=" + imgSrci;
          } else {
             imgSrci = '../../resources/images/attach.png';
          }
       
          
          $("#listAttach").attr("src", imgSrci);
          
	</script>
</body>
</html>