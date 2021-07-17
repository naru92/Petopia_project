<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<style>
.content-area {
	margin-bottom: 80px;
}

.row {
	margin-bottom: 80px;
}

#board_file {
	padding-top: 2px;
	padding-left: 2px;
}
</style>

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

					<!-- Content Row -->
					<div class="row">
						<!-- Content Column -->
						<div class="col-xl-12 col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">상품등록</h6>
								</div>

								<div class="row">
									<div class="container" style="margin-top: 100px">
										<div class="row">
											<div class="col-sm-3"></div>
											<div class="col-sm-6">
												<div class="card shadow">
													<div class="card-body content-area">
														<form:form action="${root}admin/product/insert_pro"
															method="post" modelAttribute="insertProductVO"
															enctype="multipart/form-data">

															<div class="form-group">
																<form:label path="product_name">상품명</form:label>
																<form:input path="product_name" class="form-control" />
																<form:errors path="product_name" style='color:red' />
															</div>
															<hr>
															<div class="form-group">
																<select id="product_category_idx"
																	name="product_category_idx">
																	<option value="" selected>--상품분류--</option>
																	<option value="1">사료</option>
																	<option value="2">간식</option>
																	<option value="3">위생/배변</option>
																	<option value="4">미용/목욕</option>
																	<option value="5">급식/급수기</option>
																	<option value="6">장난감/훈련</option>
																	<option value="7">하우스/이동장</option>
																	<option value="8">패션/의류</option>
																	<option value="9">목줄/하네스</option>
																</select>

															</div>
															<hr>

															<div>
																<form:label path="product_colorOption">컬러 옵션</form:label>
																<br> <input type="checkbox" value="red"
																	name="color_option">빨강&nbsp&nbsp <input
																	type="checkbox" value="blue" name="color_option">파랑&nbsp&nbsp
																<input type="checkbox" value="purple"
																	name="color_option">보라&nbsp&nbsp <input
																	type="checkbox" value="black" name="color_option">검정&nbsp&nbsp
																<input type="checkbox" value="white" name="color_option">흰색
															</div>
															<hr>
															<div class="form-group col-6 pl-0">
																<form:label path="product_price">가격</form:label>
																<form:input path="product_price" class='form-control' />
															</div>
															<hr>
															<div class="form-group col-6 pl-0">
																<form:label path="product_stock">재고량</form:label>
																<form:input path="product_stock" class="form-control" />
															</div>
															<div class="form-group">
																<form:label path="product_detail_info">상세정보</form:label>
																<form:textarea path="product_detail_info"
																	class="form-control" rows="10" style="resize: none" />
															</div>

															<div class="form-group">
																<form:label path="product_image">상품 이미지</form:label>
																<input type="file" name='uploadFile' id="uploadInput"
																	multiple>
															</div>

															<div class='uploadResult'>
																<ul>

																</ul>
															</div>
															<div class="form-group">
																<div class="text-right">
																	<form:button type="submit" class="btn btn-primary">작성하기</form:button>
																	<form:button type="submit" class="btn btn-danger">취소</form:button>
																</div>
															</div>

														</form:form>
													</div>
												</div>
											</div>
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
		//파일 업로드 구현 시작
		$(document)
				.ready(
						function(e) {
							var formObj = $("form[role='form']");
							$(".btn-primary[type='submit']").on('click',
									function(e) {
										e.preventDefault();
										console.log("submit_click!!")
									});

							const regex = new RegExp("(.*?)\.(exe\sh\zip\alz)$");//파일 확장자 선언
							const maxSize = 10485760; //10MB로 제한

							function checkExtension(fileName, fileSize) {
								//실패
								if (fileSize >= maxSize) {
									alert("사진 용량이 너무 큽니다.");
									return false;
								}
								//이상한 확장자
								if (regex.test(fileName)) {
									alert("업로드 할 수 없는 파일 입니다.");
									return false;
								}
								//이상없을때
								return true;
							}
							//input 태그 타입인 file에 변경이 일어났을때
							

							// 파일 업로드 결과
							function showUploadResult(uploadResultArr) {

								if (!uploadResultArr
										|| uploadResultArr.length == 0) {
									return;
								}

								var uploadUL = $(".uploadResult ul");

								var str = "";

								$(uploadResultArr)
										.each(
												function(i, obj) {
													if (obj.imageType) {
														var fileCallPath = encodeURIComponent(obj.uploadPath
																+ "/s_"
																+ obj.uuid
																+ "_"
																+ obj.fileName);

														str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.imageType + "' ><div>";
														str += "<span> "
																+ obj.fileName
																+ "</span>";
														str += "<button type='button' data-file=\'" + fileCallPath +
                        "\' data-type='image' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
														str += "<img src='/display?fileName="
																+ fileCallPath
																+ "'>";
														str += "</div>";
														str + "</li>";
													} else {
														var fileCallPath = encodeURIComponent(obj.uploadPath
																+ "/s_"
																+ obj.uuid
																+ "_"
																+ obj.fileName);
														var fileLink = fileCallPath
																.replace(
																		new RegExp(
																				/\\/g),
																		"/");

														str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.imageType + "' ><div>";
														str += "<span> "
																+ obj.fileName
																+ "</span>";
														str += "<button type='button' data-file=\'" + fileCallPath +
                        "\' data-type='file' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
														str += "<img src='../../resources/images/attach.png'>";
														str += "</div>";
														str + "</li>";
													}
												});

								uploadUL.append(str);
							}
							
							$("input[type='file']")
							.change(
									function(e) {
										var formData = new FormData(); // 폼태그
										var inputFile = $("input[name='uploadFile']"); //업로드 속성객체 만듬
										var files = inputFile[0].files;

										for (var i = 0; i < files.length; i++) {
											if (!checkExtension(
													files[i].name,
													files[i].size)) {
												return false;
											}
											formData.append(
													"uploadFile",
													files[i]);
										}

										$.ajax({
											url : '/uploadAjaxAction',
											processData : false,
											contentType : false,
											data : formData,
											type : 'POST',
											dataType : 'json',
											success : function(result) {
												console.log('업로드 성공')
											}
										});

									});

						});
	</script>


</body>

</html>
