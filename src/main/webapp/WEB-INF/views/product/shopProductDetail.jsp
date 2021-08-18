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
						<h4 class="price">3</h4>
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
					<span class="miniinfo">
						<span class="qt-plus">+</span>
						<span class="qt">0</span>
						<span class="qt-minus">-</span>
					</span>
					<hr style="width: 100%">					
					<span class="minititle">배송정보</span>
					<i id="footer-2" class="fas fa-truck"></i> 
					<span class="miniinfo">무료배송 (택배 배송 1~2일 소요 예정)</span>
					<hr>
					<br>
				</div>
				<div class="content">
					<h2 class="full-price">
						3원
					</h2>
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
			<div id="productDetailMain">

			</div>
			
			<!-- 후기 영역 -->
			<div class="tabMenu">
				<ul class="ulTab">
					<li><a class="tabBtn" href="#productDetail">상품정보</a></li>
					<li><a class="tabBtn" id="review">후기</a></li>

				</ul>
			</div>


		</div>
	</main>


	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
	<script type="text/javascript">
	<!-- 스크롤 -->
	$(document).ready(function($) {

        $(".tabBtn").click(function(event){         
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });
	});
	
	<!-- 수량 버튼 및 합계 부분 -->
	
	var check = false;

	function changeVal(el) {
	  var qt = parseFloat(el.parent().children(".qt").html());
	  var price = parseFloat(el.parent().children(".price").html());
	  var eq = Math.round(price * qt * 100) / 100;
	  
	  el.parent().children(".full-price").html( eq + "€" );
	  
	  changeTotal();			
	}

	function changeTotal() {
	  
	  var price = 0;
	  
	  $(".full-price").each(function(index){
	    price += parseFloat($(".full-price").eq(index).html());
	  });
	  
	  price = Math.round(price * 100) / 100;

	  var fullPrice = Math.round((price + tax + shipping) *100) / 100;
	  
	  if(price == 0) {
	    fullPrice = 0;
	  }
	  

	}

	$(document).ready(function(){
	  
	  $(".remove").click(function(){
	    var el = $(this);
	    el.parent().parent().addClass("removed");
	    window.setTimeout(
	      function(){
	        el.parent().parent().slideUp('fast', function() { 
	          el.parent().parent().remove(); 
	          changeTotal(); 
	        });
	      }, 200);
	  });
	  
	  $(".qt-plus").click(function(){
	    $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);
	    
	    $(this).parent().children(".full-price").addClass("added");
	    
	    var el = $(this);
	    window.setTimeout(function(){el.parent().children(".full-price").removeClass("added"); changeVal(el);}, 150);
	  });
	  
	  $(".qt-minus").click(function(){
	    
	    child = $(this).parent().children(".qt");
	    
	    if(parseInt(child.html()) > 1) {
	      child.html(parseInt(child.html()) - 1);
	    }
	    
	    $(this).parent().children(".full-price").addClass("minused");
	    
	    var el = $(this);
	    window.setTimeout(function(){el.parent().children(".full-price").removeClass("minused"); changeVal(el);}, 150);
	  });


	});
	
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