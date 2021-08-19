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

<c:import url="/WEB-INF/views/include/admin_list_css.jsp" />

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
							<h6 class="m-0 font-weight-bold text-primary">기부내역 관리</h6>
						</div>

						<div class="card-body filterBox">
							<div class="boxtr">
								<form action="${contextPath }/admin/membmer/listMembers.do"
									method="post" id="frm_search">
									<table>
										<tr>
											<td colspan="2">처리 상태&nbsp;&nbsp;</td>
									           <td colspan="5" class="pleft"><input type="radio" value="not" name="donation_state">미처리
												 <input type="radio" value="complete" name="donation_state">처리
											</td>
										</tr>

										<tr>
											<td colspan="2">기부 분류&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft">
											<select id="donation_date_year" name="donation_date_year">
													<option value="" selected>--기부내역 년도 선택--</option>
													<option value="donation_21year">2021</option>
													<option value="donation_20year">2020</option>
													<option value="donation_19year">2019</option>
													<option value="donation_18year">2018</option>
													<option value="donation_17year">2017</option>
											</select>
										
											</td>
										</tr>


										<tr>
										  <td colspan="7"><input type="button" value="검색" id="search_option" />
										  &nbsp;&nbsp;<input type="reset" value="초기화" /></td>
											   
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
											<th>기부번호</th>
											<th>미처리기부금</th>
											<th>연 기부금</th>
											<th>월 기부금</th>
											<th>일 기부금</th>
											<th>총 기부금</th>
											<th>처리 상태</th>
										</tr>
									</thead>
									
								<c:forEach var='d' items="${donationList}">
									<tbody>
										<tr>
											<td>${d.donation_idx }</td>
											<td>${d.donation_notused }</td>
								            <td>${d.donation_month }</td>
								            <td>${d.donation_year }</td>
								            <td>${d.donation_today }</td>
								            <td>${d.donation_total }</td>
											<td><select id="qna_state" name="qna_state">
													<option value="qna_not">미처리</option>
													<option value="qna_complete">처리완료</option>
											</select></td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					
					<form id='pageActionForm' action="/admin/delivery" method='get'>
						<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
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

				$(".numberitem a").on("click", function(e) {
						
						

							e.preventDefault();

							console.log('click');

							actionForm.find("input[name='pageNum']").val(
							$(this).attr("href"));
							actionForm.submit();
				});
				
				
				//필터박스 이벤트
				$('#frm_search').children().children().children('tr')
				.children().children('#search_option').on('click', function(event) {

			    	var donation_date_year = $('#donation_date_year').val();
			    	var donation_state = $(":input:radio[name=donation_state]:checked").val();
			    	
			    	console.log($(":input:radio[name=donation_state]:checked").val());
			    	console.log($('#donation_date_year').val());
			    	
			    	var options = {
			    			
			    			donation_state : donation_state,
			    			donation_date_year : donation_date_year
			    	}
					
			    	$.ajax({
		    			type: 'post',
		    			url: '/admin/donation',
		    			cache: false,
		    			data: JSON.stringify(options),
		    			contentType: "application/json; charset=utf-8",
		    			dataType: 'json',
		    			success: function(list, status) {
		    				
		    			  	var htmls = "";
							
							$("#dataTable").html("");
						
							$("<tr>" , {
								// 기부 컬럼명들								
								html : "<td>" + "기부번호" + "</td>"+ 
										"<td>" + "미처리기부금" + "</td>"+
										"<td>" + "연 기부금" + "</td>"+
										"<td>" + "월 기부금" + "</td>"+				
										"<td>" + "일 기부금" + "</td>"+
										"<td>" + "총 기부금" + "</td>"+
										"<td>" + "처리 상태" + "</td>"
										
										
							}).appendTo("#dataTable") // 이것을 테이블에붙임
							
							if($(list).length < 1){
								alert("등록된 상품이 없습니다.");
							} else {
						
								$(list).each(function(){
									console.log(this.product_idx);
				                    htmls += '<tr>';
				                    htmls += '<td>'+ this.donation_idx + '</td>';
				                    htmls += '<td>'+ this.donation_notused + '</td>';
					                htmls += '<td>'+ this.donation_month + '</td>'; 
				                    htmls += '<td>'+ this.donation_year + '</td>';
				                    htmls += '<td>'+ this.donation_today + '</td>';
				                    htmls += '<td>'+ this.donation_total + '</td>';
				                    htmls += "<td>"+"<select id='qna_state' name='qna_state'>"+
											 "<option value='qna_not'>" + "미처리" + "</option>" +
											 "<option value='qna_complete'>" + "처리완료" + "</option>" + "</td>";
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
