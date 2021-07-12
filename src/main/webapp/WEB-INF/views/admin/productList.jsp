<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Petopia - Admin</title>

<c:import url="/WEB-INF/views/include/admin_list_css.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- 좌측 네비게이션 바 -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />



		<!-- 상단 메뉴 바 -->
		<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />


		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->





			<!-- Content Row -->
			<div class="row">

				<!-- Content Column -->
				<div class="col-xl-12 col-lg-12">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상품관리</h6>
						</div>

						<div class="card-body filterBox">
							<div class="boxtr">
								<form action="${contextPath }/admin/product" method="post" id="frm_search" >
								
									<table>




										<tr >
											<td colspan="2">상품 구분&nbsp;&nbsp;</td>
											<td class= "head" colspan="5" class="pleft">
											<input type="radio" value="1" name="product_category_id"checked>1.사료
											<input type="radio" value="2" name="product_category_id" >2.간식
											<input type="radio" value="3" name="product_category_id">3.위생/배변
											<input type="radio" value="4" name="product_category_id">4.미용/목욕
											<input type="radio" value="5" name="product_category_id">5.급식/급슈가
											<input type="radio" value="6" name="product_category_id">6.장난감/훈련
											<input type="radio" value="7" name="product_category_id">7.하우스/이동장
											<input type="radio" value="8" name="product_category_id">8.패션/의류
											<input type="radio" value="9" name="product_category_id">9.목줄/하네스	

											</td>
										</tr>

										<tr>
											<td colspan="2">주문 분류&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft">
											<select id="select1" name="product_price">
													<option value="" selected>--가격--</option>
													<option value="product_price_asc">가격 낮은 순</option>
													<option value="product_price_desc">가격 높은 순</option>
											</select> 
											<select id="select2" name="product_stock">
													<option value="" selected>--재고량--</option>
													<option value="stock_asc">재고량 적은 순</option>
													<option value="stock_desc">재고량 많은 순</option>
											</select></td>
										</tr>



										<tr>
											<td colspan="7"><input type="button" value="검색"
												id="search_option" />&nbsp;&nbsp;
												<input type="reset" value="초기화" /></td>
												
										</tr>
									</table>
								</form>
							</div>
						</div>

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>

											<th>상품번호</th>
											<th>상품명</th>
											<th>상품분류</th>
											<th>가격</th>
											<th>재고량</th>

										</tr>
									</thead>
							
								<c:forEach var='p' items="${productList}">
									<tbody>
										<tr>
											<td>${p.product_idx }</td>
											<td>${p.product_name }</td>
											<td>${p.product_category_id }</td>
											<td>${p.product_price }</td>
											<td>${p.product_stock }</td>



										</tr>
										
									</tbody>
								</c:forEach>
								</table>
							</div>
							<form id='pageActionForm' action="/admin/product" method='get'>
												<input type='hidden' name='pageNum'
													value='${pageMaker.cri.pageNum}' /> <input type='hidden'
													name='amount' value='${pageMaker.cri.amount}' />
							</form>
						</div>
						<input type="hidden" id="size" value="${fn:length(list)}" />
						<div class="row">
							<div class="col-sm-12 col-md-5 paginationdiv">
								<div class="d-none d-md-block page-div">
									<ul class="pagination justify-content-center">
										<li class="page-item"><c:if test="${pageMaker.prev}">
												<li class="page-item"><a
													href="${pageMaker.startPage-1}" class="page-link">이전</a></li>
											</c:if></li>
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage }">
											<li
												class='page-item numberitem ${pageMaker.cri.pageNum == num ? "active" : "" }'><a
												href="${num}" class="page-link">${num}</a></li>
										</c:forEach>

										<c:if test="${pageMaker.next}">
											<li class="page-item"><a href="${pageMaker.endPage +1}"
												class="page-link">다음</a></li>
										</c:if>

									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Your Website 2021</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(
			function() {
				
				// 페이징 버튼 이벤트
				var actionForm = $("#pageActionForm");

				$(".numberitem a").on(
						"click",
						function(e) {

							e.preventDefault();

							console.log('click');

							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});
				
				//필터박스 변경 이벤트
					$('#frm_search').children().children().children('tr')
					.children().children('#search_option').on('click', function(event) {
						
	
				    	
				    	
				    	var product_price = $('#select1').val();
				    	var product_stock = $('#select2').val();
				    	console.log($('#dataTable').html());
				    	console.log($('#select1').val());
				    	console.log($('#select2').val());
				    	
				    	var options = {
				    		product_price : product_price,
				    		product_stock : product_stock
				    	}
						
				    	
				    	$.ajax({
			    			type: 'post',
			    			url: '/admin/product',
			    			cache: false,
			    			data: JSON.stringify(options),
			    			contentType: "application/json; charset=utf-8",
			    			dataType: 'json',
			    			success: function(list, status) {
			    				
			    			  	console.log('먼가여' + list);
			    			  	console.log('#dataTable');
			    				
			    			  	var htmls = "";
								
								$("#dataTable").html("");
								
								$("<tr>" , {
									html : "<td>" + "상품번호" + "</td>"+  // 컬럼명들
											"<td>" + "상품명" + "</td>"+
											"<td>" + "상품분류" + "</td>"+
											"<td>" + "가격" + "</td>"+				
											"<td>" + "재고량" + "</td>"
											
								}).appendTo("#dataTable") // 이것을 테이블에붙임
								
								if(list.length < 1){
									htmls.push("등록된 상품이 없습니다.");
								} else {
									
									$(list).each(function(){
										console.log(this.product_idx);
					                    htmls += '<tr>';
					                    htmls += '<td>'+ this.product_idx + '</td>';
					                    htmls += '<td>'+ this.product_name + '</td>';
						                htmls += '<td>'+ this.product_category_id + '</td>'; 
					                    htmls += '<td>'+ this.product_price + '</td>';
					                    htmls += '<td>'+ this.product_stock + '</td>';	
					                    htmls += '</tr>';
									
				                	});	//each end

				                	htmls+='<tr>';
				                	htmls+='<td colspan="5"> <a href="${pageContext.request.contextPath}/write_view">글작성</a> </td>';		                	
				                	htmls+='</tr>';
									
								}
								$("#dataTable").append(htmls);
			    			  },
			    			     error:function(request,status,error){
			    			         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			    			        }


			    		});
				    	
								   
				});


			});
	

	</script>	

		<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />

</body>

</html>
