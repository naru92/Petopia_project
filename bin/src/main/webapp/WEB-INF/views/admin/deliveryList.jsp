<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:import url="/WEB-INF/views/include/admin_list_css.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 좌측 네비게이션 바 -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />

		<!-- 상단 메뉴 바 -->
		<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />

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
							<h6 class="m-0 font-weight-bold text-primary">배송관리</h6>
						</div>

						<div class="card-body filterBox">
							<div class="boxtr">
								<form action="${contextPath }/admin/delivery"
									method="post" id="frm_search">
									<table>




										<tr>
											<td colspan="2">배송 구분&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft1">
											<input type="radio" name="is_member" value="member_not" >비회원 
											<input type="radio" name="is_member" value="member" >회원
											</td>
												
										</tr>

										<tr>
											<td colspan="2">배송 분류&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft2">
											<select id="select1" name="delivery_state">
											
													<option value="" selected>--배송 분류 선택--</option>
													<option value="delivery_state_all">전체</option>
													<option value="delivery_state_not">배송처리중</option>
													<option value="delivery_state_complete">배송완료</option>
											</select>
											 <select id="select2" name="delivery_refund">
													<option value="" selected>--배송 상태--</option>
													<option value="refund_req">환불요청</option>
													<option value="return_req">반품요청</option>
													<option value="req_complete">완료</option>
											</select>
											</td>
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
											<th>배송번호</th>
											<th>상품이름</th>
											<th>주문자</th>
											<th>수신자</th>
											<th>전화번호</th>
											<th>수신주소</th>
											<th>배송일자</th>
											<th>배송처리상태</th>


										</tr>
									</thead>
											
								<c:forEach var='d' items="${deliveryList}">
							<!-- 배송번호 상품이름  주문자이름 수신자이름 수신자전화번호 수신자주소 배송일자 배송처리상태 -->
										<tbody>
											<tr id = deliveryTr>
											<td id="delivery_idx" >${d.delivery_idx }</td>
											<td>${d.product_name }</td>
											<td>${d.order_name }</td>
											<td>${d.order_receiver_name }</td>
											<td>${d.order_receiver_phonenumber }</td>
											<td>${d.order_receiver_address }</td>
											<td>${d.delivery_date }</td>
											<td id="delivery_process"> 
											<select id='delivery_state' name='delivery_state'>
		                                	<option value="배송준비중" <c:if test='${d.delivery_state == "배송준비중" }'>selected</c:if>>배송준비중</option>
		                                	<option value="배송완료" <c:if test='${d.delivery_state == "배송완료" }'>selected</c:if>>배송완료</option>
                         	   				</select>
                         	   				</td>
											
											
											
											</tr>
										</tbody>
										</c:forEach>
										</table>
									</div>
									
								<form id='pageActionForm' action="/admin/delivery" method='get'>
												<input type='hidden' name='pageNum'
													value='${pageMaker.cri.pageNum}' /> <input type='hidden'
													name='amount' value='${pageMaker.cri.amount}' />
								</form>
								
								</div>
								
								<input type="hidden" id="size" value="${fn:length(list)}" />
								<div class="row">
									<div class="col-sm-12 col-md-5 paginationdiv">
										<div id="masterDiv" class="d-none d-md-block page-div" >
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
					//배송처리변경
					$("#deliveryTr").on('change', function(e){
					e.preventDefault();
					
					var delivery_state = $(this).children().children("#delivery_state").val();
					var delivery_idx =parseInt($(this).children().first().text());
					console.log(delivery_state);
 					console.log(delivery_idx);
					
					var options = {
			    			
							delivery_state : delivery_state,
							delivery_idx : delivery_idx
			    			
			    			
			    	}
					

			        
					if(window.confirm('배송상태를 변경 하시겠습니까?') == true) {
						
						console.log("ajax송신 시작");
						 $.ajax({
						        type:"POST",
						        url: "/admin/delivery/update",
						        cache: false,
						        data: JSON.stringify(options),
						        contentType:"application/json; charset=utf-8",
						        dataType: 'text', 
						        success : function(status) {
						        	alert('변경이 완료 됐습니다.')
						       	}
						       

						 });
					}
					
					});	
					
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
					
					//필터박스 이벤트
					$('#frm_search').children().children().children('tr')
					.children().children('#search_option').on('click', function(event) {

				    	var delivery_state = $('#select1').val();
				    	var delivery_refund = $('#select2').val();
				    	var is_member = $(":input:radio[name=is_member]:checked").val();
				    	
				    	
				    	

				    	
				    	console.log($('#select1').val());
				    	console.log($('#select2').val());
				    	
				    	var options = {
				    			
				    			delivery_state : delivery_state,
				    			delivery_refund : delivery_refund,
				    			is_member : is_member
				    			
				    	}
						
				    	const list= "";
				    	
				    	$.ajax({
			    			type: 'post',
			    			url: '/admin/delivery',
			    			cache: false,
			    			data: JSON.stringify(options),
			    			contentType: "application/json; charset=utf-8",
			    			dataType: 'json',
			    			success: function(list, status) {
			    				list = $(list);
			    			
			    			  	var htmls = "";
								
								$("#dataTable").html("");
								
								$("<tr>" , {
									 // 컬럼명들								
									html : "<td>" + "배송번호" + "</td>"+ 
											"<td>" + "상품이름" + "</td>"+
											"<td>" + "주문자" + "</td>"+
											"<td>" + "수신자" + "</td>"+				
											"<td>" + "전화번호" + "</td>"+
											"<td>" + "수신 주소" + "</td>"+
											"<td>" + "배송일자" + "</td>"+
											"<td>" + "배송처리상태" + "</td>"
											
								}).appendTo("#dataTable") // 이것을 테이블에붙임
								
								if($(list).length < 1){
									alert("등록된 상품이 없습니다.");
								} else {
									
									$(list).each(function(){
										console.log(this.delivery_idx);
					                    htmls += '<tr>';
					                    htmls += '<td>'+ this.delivery_idx + '</td>';
					                    htmls += '<td>'+ this.product_name + '</td>';
						                htmls += '<td>'+ this.order_name + '</td>'; 
					                    htmls += '<td>'+ this.order_receiver_name + '</td>';
					                    htmls += '<td>'+ this.order_receiver_phonenumber + '</td>';
					                    htmls += '<td>'+ this.order_receiver_address + '</td>';
					                    htmls += '<td>'+ this.delivery_date + '</td>';
					                    htmls += '<td>'+ this.delivery_state + '</td>';
					                    htmls += '</tr>';
					                
				                	});	//each end
				                	
				                	var deliveryValue = '<c:out value="${d.delivery_idx}" />';
				                	console.log(deliveryValue);
				                	
				                	
				                	showList(1);
				                	
				                	var pageNum = 1;
				            		var pageDiv = $("#masterDiv");
				                	
				                	// 배달평 페이징
									function showdeliverysPage(deliveryCnt) {
				                		console.log('showdeliverysPage');
										var endNum = Math.ceil(pageNum / 10.0) * 10;
										var startNum = endNum - 9;
										
										var prev = startNum != 1;
										var next = false;
										
										if(endNum * 10 >= deliveryCnt) {
											endNum = Math.ceil(deliveryCnt/10.0);
										}
										
										if(endNum * 10 < deliveryCnt) {
											next = true;
										}
										//일단 부모 div 날리기
										$('#masterDiv').empty();
										
										var str = "<ul class='pagination pull-right'>";
										//이전
										if(prev) {
											str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
										}
										//중단
										for(var i = startNum; i <= endNum; i++) {
											var active = pageNum == i ? "active" : "";
											
											str += "<li class='page-item numberitem" + active + "'> <a class='page-link' href='" + i + "'>" + i +"</a></li>";
										}
										//끝
										if(next) {
											str += "<li class='page-item'> <a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
										}
										
										str +="</ul></div>";
										
										//console.log(str);
										
										//페이지버튼
										pageDiv.appendTo(str);
									} 
									
						 	function showList(page) {
										
										console.log("show reivews list " + page);

										list.get({delivery_idx:deliveryValue, page: page || 1}, function(deliveryCnt, list) {
											console.log("deliveryCnt: " + deliveryCnt);
											
											if(page == -1) {
												pageNum = Math.ceil(deliveryCnt/10.0);
												showList(pageNum);
												
												return
											}
											
											var str = "";
											
										
										});
									} // /showList 

									// 페이지 버튼
									$(".numberitem a").on("click", "li a", function(e) {
										e.preventDefault();
										console.log("page click");
										
										var targetPageNum = $(this).attr("href");
										
										console.log("targetPageNum : " + targetPageNum);
										
										pageNum = targetPageNum;
										
										showList(pageNum);
									}); // /reviewsPageFooter
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
