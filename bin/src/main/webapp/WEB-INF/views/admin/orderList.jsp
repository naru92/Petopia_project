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




		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->





					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-xl-12 col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">주문관리</h6>
								</div>

								<div class="card-body filterBox">
									<div class="boxtr">
										<form action="${contextPath }/admin/order"
											method="post" id="frm_search">
											<table>




												<tr>
													<td colspan="2">주문 구분&nbsp;&nbsp;</td>
													<td colspan="5" class="pleft"><input type="radio"
														value="all" name="deposit" checked>전체 <input
														type="radio" value="deposit_not" name="deposit" >입금
														대기중 <input type="radio" value="deposit_ok" name="deposit">입금완료

													</td>
												</tr>

												<tr>
													<td colspan="2">주문 분류&nbsp;&nbsp;</td>
													<td colspan="5" class="pleft"><select
														id="select1" name="order_date">
															<option value="" selected>--주문 분류 선택--</option>
															<option value="order_date_desc">최근 주문 순</option>
															<option value="order_date_asc">오래된 주문 순</option>
													</select></td>
												</tr>



												<tr>
													<td colspan="7"><input type="button" value="검색"
														id="search_option" />&nbsp;&nbsp;<input
														type="reset" value="초기화" /></td>
												</tr>
											</table>
								</form>
									</div>
								</div>

								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										
											<thead>
												<tr>
													<th>주문번호</th>
													<th>주문자 이름</th>
													<th>주소</th>
													<th>주문량</th>
													<th>결제금액</th>
													<th>주문일자</th>
													<th>결제방법</th>
													
												</tr>
											</thead>
											
								<c:forEach var='o' items="${orderList}">
							
										<tbody>
											<tr>
											<td>${o.order_idx }</td>
											<td>${o.order_receiver_name }</td>
											<td>${o.order_receiver_address }</td>
											<td>${o.order_quantity }</td>
											<td>${o.order_price }</td>
											<td>${o.order_date }</td>
											<td>
											<c:if test="${o.payment_method == 1}" >무통장입금</c:if>
											<c:if test="${o.payment_method == 2}" >카드결제</c:if>
											</td>
											</tr>
										</tbody>
								</c:forEach>
										</table>
									</div>
									
									
									<form id='pageActionForm' action="/admin/order" method='get'>
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

		<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />


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
			
				
				console.log($('#frm_search').children().children().children('tr')
						.children().children('#search_option'));
				
				//필터박스 이벤트
				$('#frm_search').children().children().children('tr')
				.children().children('#search_option').on('click', function(event) {
			
			    	var order_date = $('#select1').val();
			    	var deposit = $(":input:radio[name=deposit]:checked").val();
			    	
			    	
					console.log($(":input:radio[name=deposit]:checked").val());
			    	console.log($('#select1').val());
			    	
			    	var options = {
			    			order_date : order_date,
			    			deposit : deposit
			    	}
					
			    	$.ajax({
		    			type: 'post',
		    			url: '/admin/order',
		    			cache: false,
		    			data: JSON.stringify(options),
		    			contentType: "application/json; charset=utf-8",
		    			dataType: 'json',
		    			success: function(list, status) {
		    				
		    			  	var htmls = "";
							
							$("#dataTable").html("");
							
							$("<tr>" , {
								 // 컬럼명들								
								html : "<td>" + "주문번호" + "</td>"+ 
										"<td>" + "주문자 이름" + "</td>"+
										"<td>" + "주소" + "</td>"+
										"<td>" + "주문량" + "</td>"+				
										"<td>" + "결제금액" + "</td>"+
										"<td>" + "주문일자" + "</td>"+
										"<td>" + "결제방법" + "</td>"
										
							}).appendTo("#dataTable") // 이것을 테이블에붙임
							
							if($(list).length < 1){
								alert("등록된 상품이 없습니다.");
							} else {
								
								$(list).each(function(){
									console.log(this.order_idx);
				                    htmls += '<tr>';
				                    htmls += '<td>'+ this.order_idx + '</td>';
				                    htmls += '<td>'+ this.order_name + '</td>';
				                    htmls += '<td>'+ this.order_receiver_address + '</td>';
				                    htmls += '<td>'+ this.order_quantity + '</td>';
				                    htmls += '<td>'+ this.order_price + '</td>';
				                    htmls += '<td>'+ this.order_date + '</td>';
				                    htmls += '<td>'+ this.payment_method+ '</td>';
				                    htmls += '</tr>';
				                
			                	});	//each end

								
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
</body>

</html>
