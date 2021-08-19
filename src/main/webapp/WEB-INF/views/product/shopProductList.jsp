<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 | Petopia</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/menu_test.css">
<link rel="stylesheet" href="/petopia/css/shopProductList_style.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<%@include file="../include/default_sidebar.jsp"%>

	<main>
		<div class="article">
			<div class="filter">필터부분</div>
			<c:forEach var='p' items="${productList}" varStatus="status">
				<div class="product-card">
				<input name="product_idx" type="hidden" value="${p.product_idx }">
					<!--<div class="badge">Hot</div>-->
					<div class="product-links">
						<a href=""><i class="fa fa-heart addWish"></i></a> 
						<a href=""><i class="fa fa-shopping-cart addCart"></i></a>
					</div>
					<div class="product-tumb">
						<a href="/shopDetail?product_idx=${p.product_idx }"><img id="listAttach${status.index}" src="/petopia/images/product_43.jpg" alt=""></a>
					</div>
					<div class="product-details">
						<h5>
							<a href="/shopDetail?product_idx=${p.product_idx }">${p.product_name}</a>
						</h5>
						<div class="product-bottom-details">
							<div id="price${status.index}"class="product-price">${p.product_price}원</div>
						</div>
					</div>
				</div>
				   <form>
               <input type="hidden" id="s_filetype${status.index}"
                              value="${p.productVOList.get(0).filetype}" />
               <input type="hidden" id="s_uuid${status.index}"
                              value="${p.productVOList.get(0).uuid}" />
               <input type="hidden" id="s_uploadPath${status.index}"
                              value="${p.productVOList.get(0).uploadPath}" />
               <input type="hidden" id="s_fileName${status.index}" name="fileName" value="${p.productVOList.get(0).fileName}" />
                </form>        
			</c:forEach>
			 <input type="hidden" id="size" value="${fn:length(productList)}" />
		</div>
	</main>




	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	<script type="text/javascript">
	
	$(document).ready(function() {
		 for(var i = 0; i < $("#size").val(); i++) {
             var imgSrci = null;
             var uuid = $("#s_uuid" + i).val();
             var uploadPath = $("#s_uploadPath" + i).val();
             var fileName = $("#s_fileName" + i).val();
             var fileType = true;
             if(fileType == true) {
                imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
                imgSrci = "/display?fileName=" + imgSrci;
             } else {
                imgSrci = '../../resources/images/attach.png';
             }
          
             
             $("#listAttach" + i).attr("src", imgSrci);
          }
	
		    //세자리 콤마
         function numberFormat(inputNumber) {
              return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         }
         
         // 가격 콤마삽입
         for(var i = 0; i < $("#size").val(); i++) {
            var price = $("#price" + i).html()
            console.log(price);
            $("#price" + i).html(numberFormat(price));
         }
         $(".addCart").on("click", function(e) {

             e.preventDefault();

             var cartVO = {
                product_idx : $("input[name=product_idx]").val(),
             /* amount : $("#productsAmount").val() */
             }

             $.ajax({
                type : 'post',
                url : '/addCart',
                data : JSON.stringify(cartVO),
                contentType : "application/json; charset=utf-8",
                dataType : 'text',
                success : function(result, status, xhr) {
                   console.log('add cart ' + result);

                   alert("상품이 장바구니에 추가되었습니다");
                }
             });

          });
          
          $(".addWish").on("click", function(e) {

             e.preventDefault();

             var cartVO = {
                product_idx : $("input[name=product_idx]").val()
             
             }

             $.ajax({
                type : 'POST',
                url : '/addWishList',
                data : JSON.stringify(cartVO),
                contentType : "application/json; charset=utf-8",
                dataType : 'text',
                success : function(result, status, xhr) {
                   console.log('add wish ' + result);
             

                   alert("상품이 위시리스트에 추가되었습니다");
                },error: function(request, status, error){
                     alert("이미 등록된 상품입니다.");
                  }
             });

          });


	
	});
	</script>
</body>
</html>