<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<form action="${contextPath }/admin/membmer/listMembers.do"
									method="post" id="frm_search">
									<table>




										<tr>
											<td colspan="2">배송 구분&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft"><input type="radio"
												value="all" name="member_gender" checked>비회원 <input
												type="radio" value="dog" name="member_gender">회원</td>
										</tr>

										<tr>
											<td colspan="2">배송 분류&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft"><select
												id="order_lately_date" name="order_lately_date">
													<option value="" selected>--배송 분류 선택--</option>
													<option value="lately_login_desc">전체</option>
													<option value="lately_login_desc">미처리</option>
													<option value="lately_login_asc">처리</option>
											</select> <select id="order_total_buy" name="order_total_buy">
													<option value="" selected>--배송 상태--</option>
													<option value="total_buy_desc">환불요청</option>
													<option value="total_buy_asc">반품요청</option>
													<option value="total_buy_asc">완료</option>
											</select></td>
										</tr>



										<tr>
											<td colspan="7"><input type="button" value="검색"
												onClick="member_search()" />&nbsp;&nbsp;<input type="reset"
												value="초기화" /></td>
										</tr>
									</table>
							</div>
						</div>
						</form>

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>배송번호</th>
											<th>상품이름</th>
											<th>주문자 이름</th>
											<th>수신자 이름</th>
											<th>수신자 전화번호</th>
											<th>수신자 주소</th>
											<th>배송일자</th>
											<th>배송처리상태</th>


										</tr>
									</thead>
									<tfoot>

									</tfoot>
									<tbody>
										<tr>
											<td>Tiger Nixon</td>
											<td>System Architect</td>
											<td>Edinburgh</td>
											<td>61</td>
											<td>2011/04/25</td>
											<td>2011/04/25</td>
											<td>$320,800</td>
											<td><select id="delivery_state" name="delivery_state">

													<option value="delivery_not">미처리</option>
													<option value="delivery_complete">처리완료</option>
											</select></td>

										</tr>
										</tr>

									</tbody>
								</table>
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

</body>

</html>
