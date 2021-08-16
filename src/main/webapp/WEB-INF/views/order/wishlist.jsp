<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<title>Petopia</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%@include file="../include/default_css.jsp"%>


<style type="text/css">
.thumbnail{
border: 1px solid;
}
.board2{
padding-left: 100px;
}
.board {
padding-left: 200px;
}
#products{
margin-top: 10px;
}
.board{
padding-left: 200px;
}
.item{
 width:30%;
}

.glyphicon { margin-right:5px; }
.thumbnail
{
    margin-bottom: 20px;
    padding: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}
.list-group{
flex-direction: inherit;
}
.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: #fff;
    margin-bottom: 10px;
}
.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
{
    background: #428bca;
}

.item.list-group-item .list-group-image
{
    margin-right: 10px;
}
.item.list-group-item .thumbnail
{
    margin-bottom: 0px;
}
.item.list-group-item .caption
{
    padding: 9px 9px 0px 9px;
}
.item.list-group-item:nth-of-type(odd)
{
    background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after
{
    display: table;
    content: " ";
}

.item.list-group-item img
{
    float: left;
}
.item.list-group-item:after
{
    clear: both;
}
.list-group-item-text
{
    margin: 0 0 11px;
}

footer {
   width:100%;
   height:260px;
   position:absolute;
   bottom:0;
   background:#385663;
  text-align: center;
  color: white;
}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>




	<!-- 게시글 리스트 -->
	<div class="container col-12 board" style="margin-top: 120px">
			<div class=col-2>
			<%@include file="../include/default_sidebar.jsp"%>
			</div>
<div class="container-fluid board2">
<h2 id="wish_title">위시리스트</h2>

    <div class="well well-sm">
   <hr width="95%">
        <strong>Display</strong>
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list">
            </span>List</a> <a href="#" id="grid" class="btn btn-default btn-sm"><span
                class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
        <br>
    </div>
    <div id="products" class="row list-group">
   <c:forEach var="item" items="${wishList}" varStatus="status"> 
        <div class="item col-sm-3 col-lg-4">
            <div class="thumbnail">
                <img id="cartAttach${status.index}" class="group list-group-image" src="#" alt="" />
                <div class="caption">
                    <h4 class="group inner list-group-item-heading">
                        <a href="/product/get?product_idx=${item.productList.get(0).product_idx}"><c:out value="${item.productList.get(0).product_name}"/></a></h4>
                    <p class="group inner list-group-item-text" id="price${status.index}">
                    <c:out value="${item.productList.get(0).product_detail_info}"></c:out></p>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                         <p id="price${status.index}" class="read price"><c:out value="${item.productList.get(0).product_price}"/></p>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <a class="btn btn-success" href="http://www.jquery2dotnet.com">장바구니로</a>
                        </div>
                    </div>
                </div>
                 <div class="wish_delete">
                                    <a class="cart_quantity_delete" href="#">
                                    	<i class="fa fa-times">
                                        </i>
                                        	<input type="hidden" name="cart_id" id="cartNo${status.index}" value="<c:out value='${item.cart_id}'/>">
                                    </a>
                     </div>
            </div>

               
               <input type="hidden" id="imageType${status.index}" value="${item.productList.get(0).productVOList.get(0).filetype}" />
               <input type="hidden" id="uuid${status.index}" value="${item.productList.get(0).productVOList.get(0).uuid}" />
               <input type="hidden" id="uploadPath${status.index}" value="${item.productList.get(0).productVOList.get(0).uploadPath}" />
               <input type="hidden" id="fileName${status.index}" value="${item.productList.get(0).productVOList.get(0).fileName}" />

        </div>
        </c:forEach>
    </div>
    <input type="hidden" id="size" value="${fn:length(wishList)}" />
</div>

	</div>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_sidebar_js.jsp"%>

	<script type="text/javascript">
	$(document).ready(function() {
	    $('#list').click(function(event){
	    	event.preventDefault();
	    	$('#products .item').addClass('list-group-item');
	    	});
	    $('#grid').click(function(event){
	    	event.preventDefault();
	    $('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');
	    });

	    
	  	//위시리스트 이미지
	    for(var i = 0; i < $("#size").val(); i++) {
			var imgSrci = null;
			var uuid = $("#uuid" + i).val();
			var uploadPath = $("#uploadPath" + i).val();
			var fileName = $("#fileName" + i).val();
			var filetype = true
			if(filetype) {
				console.log('true')
				imgSrci = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				imgSrci = "/display?fileName=" + imgSrci;
			} else {
				imgSrci = '../../resources/images/attach.png';
			}
		
			console.log(imgSrci);
			
			$("#cartAttach" + i).attr("src", imgSrci);
		}
		
		
		$(".wish_delete").on("click", "a", function(e) {
		
			var cartNumber = $(this).find("input[name=cart_id]").val();
			
			console.log(cartNumber);
			
			 $.ajax({
				type: 'post',
				url: '/deleteWishItem',
				data: JSON.stringify(cartNumber),
				contentType: "application/json; charset=utf-8",
				dataType: 'text',
				success: function(result, status, xhr) {
				  	console.log('delete cart item ' + result);
				  	alert("상품이 장바구니에서 삭제 되었습니다");
				  	
				  	location.replace("/order/Cart");
				  }
			}); 
		});
		
		//세자리 콤마
		function numberFormat(inputNumber) {
			  return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 가격 콤마삽입
		for(var i = 0; i < $("#size").val(); i++) {
			var price = $(".price").html()
			console.log(price);
			$(".price").html(numberFormat(price) + "원");
		}
	    

	});
		
	</script>
</body>
</html>






