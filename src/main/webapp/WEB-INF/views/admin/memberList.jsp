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

<!-- Custom fonts for this template-->
<link href="/petopia/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link href="/petopia/vendor/boorstrap/css/bootstrap.min.css"></link>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/petopia/css/list.css" rel="stylesheet"></link>
<!-- Custom styles for this template-->
<link href="/petopia/css/sb-admin-2.min.css" rel="stylesheet">
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
							<h6 class="m-0 font-weight-bold text-primary">유저관리</h6>
						</div>

						<div class="frameBox"></div>
						
						<div class="card-body">
						
							<div class="table-responsive justify-content-center">
							
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>전화번호</th>
											<th>주소</th>
											<th>이메일</th>
											<th>가입일자</th>
											<th>등급</th>
											<th>포인트</th>
											<th>기부액</th>
											<th>삭제</th>
										</tr>
									</thead>



								<c:forEach var='m' items="${memberList}">
									<tbody>
										

											<tr>
												<td><a id="member_detail" href="#">${m.member_id}</a></td>
												<td>${m.member_name}</td>
												<td>${m.member_phoneNumber}</td>
												<td>${m.member_address}</td>
												<td>${m.member_email}</td>
												<td>${m.member_joindate}</td>
												<td>${m.member_grade}</td>
												<td>${m.member_point}</td>
												<td>${m.member_donation}</td>
												<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">상세보기</button></td>
											</tr>


									
									</tbody>
								</c:forEach>



								</table>
											

							</div>
							<form id='pageActionForm' action="/admin/member" method='get'>
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
											end="${pageMaker.endPage}">
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
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃을 하시려면 로그아웃 버튼을 누르세요.</div>
				<div class="modal-foot
					<button class="btn btn-secondary" type="buttoner">"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="/main">로그아웃</a>
				</div>
			</div>
		</div>
		
		
	
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" name='modalReviews' value=''>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="email" class="form-control" name='modalReviewer' value=''>
					</div>
					<div class="form-group">
						<label>작성날짜</label>
						<input class="form-control" name='reviewDate' value=''>
					</div>
					<br>
					<strong>상품평을 고치실려면 내용을 바꾸시고 수정버튼을 눌러주세요</strong>
				</div>
      <div class="modal-footer">
       <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
		<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
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
				
						console.log($('#dataTable').children().children().children('td'));
					
					// 모달 호출
				$('#exampleModal').on('show.bs.modal', function (event) {
						  var button = $(event.relatedTarget) // Button that triggered the modal
						  var recipient = button.data('whoever') // Extract info from data-* attributes
						  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
						  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
						  var modal = $(this)
						  modal.find('.modal-title').text('Hello message to sadsa')
						  modal.find('.modal-body input').val('sdsd')
					});
						
						
					
					});

				});
		
		
	</script>

	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />




</body>

</html>
