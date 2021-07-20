<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>

<head>



<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Petopia - Admin</title>

<c:import url="/WEB-INF/views/include/admin_list_css.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
.footerdiv {height:100%;}
.logo{margin-bottom:5px;}
#modal_product_idx{margin-left: ; font-size:70%;}
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul span {
	display: inline-block;
	width: 100px;
	overflow: hidden; 
	white-space: nowrap;
	text-overflow: ellipsis; 
}

.view-product {
	width: 100%;
}

.view-product ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.view-product ul li {
	list-style: none;
	padding: 10px;
}

.view-product ul li img {
	width: 100px;
}

.item {
	width: 100%;
}

.item ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.item ul li {
	list-style: none;
	padding: 10px;
}
.item ul li img {
	width: 100px;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray;
  background-color: rgba( 255, 255, 255, 0.5 );
  z-index: 100;
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
#animalType, #productsType, #brand {
  width: auto;
}
</style>
</style>

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
								<form action="${contextPath }admin/product" method="post"
									id="frm_search">

									<table>




										<tr>
											<td colspan="2">상품 구분&nbsp;&nbsp;</td>
											<td class="head" colspan="5" class="pleft"><input
												type="radio" value="1" name="product_category_id" checked>1.사료
												<input type="radio" value="2" name="product_category_id">2.간식
												<input type="radio" value="3" name="product_category_id">3.위생/배변
												<input type="radio" value="4" name="product_category_id">4.미용/목욕
												<input type="radio" value="5" name="product_category_id">5.급식기/급수기
												<input type="radio" value="6" name="product_category_id">6.장난감/훈련
												<input type="radio" value="7" name="product_category_id">7.하우스/이동장
												<input type="radio" value="8" name="product_category_id">8.패션/의류
												<input type="radio" value="9" name="product_category_id">9.목줄/하네스

											</td>
										</tr>

										<tr>
											<td colspan="2">주문 분류&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft"><select id="select1"
												name="product_price">
													<option value="" selected>--가격--</option>
													<option value="product_price_asc">가격 낮은 순</option>
													<option value="product_price_desc">가격 높은 순</option>
											</select> <select id="select2" name="product_stock">
													<option value="" selected>--재고량--</option>
													<option value="stock_asc">재고량 적은 순</option>
													<option value="stock_desc">재고량 많은 순</option>
											</select></td>
										</tr>



										<tr>
											<td colspan="7"><input type="button" value="검색"
												id="search_option" />&nbsp;&nbsp; <input type="reset"
												value="초기화" /></td>

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
											<th>상세보기</th>

										</tr>
									</thead>

									<c:forEach var='p' varStatus="status" items="${productList}" >
									<div>
										<input type="hidden" value="${p.product_detail_info }"></input>
										<input type="hidden" value="${p.product_image }"></input>
										<%-- <input type="hidden" id="imageType${status.index}" value="${p.productVOList.get(0).imageType}" />
										<input type="hidden" id="uuid${status.index}" value="${p.productVOList.get(0).uuid}" />
										<input type="hidden" id="uploadPath${status.index}" value="${p.productVOList.get(0).uploadPath}" />
										<input type="hidden" id="fileName${status.index}" value="${p.productVOList.get(0).fileName}" /> --%>
									</div>
										<tbody>
											<tr>
												<td id="productidxTd">${p.product_idx }</td>
												<td id="product_name">${p.product_name }</td>
												<td>${p.product_category_id }</td>
												<td>${p.product_price }</td>
												<td>${p.product_stock }</td>
												<td width="150" align="center">
												<button class="btn btn-lg btn-info" data-toggle="modal" 
												data-product_idx="${p.product_idx}"
												data-product_name ="${p.product_name }" 
												data-product_category_id = "${p.product_category_id }"
												data-product_price = "${p.product_price}"
												data-product_detail_info ="${p.product_detail_info }" 
												data-product_coloroption = "${p.product_coloroption}"
												data-product_image = "${p.product_image }"
												data-target="#largeModal" value="${p.product_idx }">
													상세보기</button></td>
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
				  <div class="container-fluid footerdiv">
        <img class="logo" src="/petopia/images/petopia_logomini.png">
      
        <p>PETOPIA</p>
        
        <p>서비스 이용약관 | 개인정보 처리방침 | 입점/제휴 문의</p>
        <p>Created by Naru Juhee Gunwoo Ahram Hansol Hana</p>
        <p>Bitcamp Jongno</p>
        <p>&copy Creative 2021-08</p>     
    </div>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->



	<!-- large modal -->
	<div class="container">
		<div class="modal fade" id="largeModal" tabindex="-1" role="dialog"
			aria-labelledby="basicModal" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">상품 정보</h4>
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
							
						</button>
						
					</div>
					
					<div class="modal-body">
						
						<h5 id= modal_product_idx></h5>
						<div class="card-body">
							<form action="board_modify.html" method="post">
								<div class="form-group">
									<label for="board_writer_name">상품명</label> <input type="text"
										id="modal_product_name" name="product_name"
										class="form-control"  readonly="readonly" ></input>
								</div>
								<div class="form-group">
									<label for="board_date">상품가격</label> <input type="text"
										id="modal_product_price" name="board_date" class="form-control"
										value="123" readonly="readonly" ></input>
								</div>
								<div class="form-group">
									<label for="product_coloropiton">컬러</label> <input type="text"
										id="modal_product_coloropiton" name="modal_product_coloropiton" class="form-control"
										value="" />
								</div>
									
								<div class="form-group">
									<label for="product_detail_info">내용</label>
									<textarea id="modal_product_detail_info" name="modal_product_detail_info"
										class="form-control" rows="10" style="resize: none"></textarea>
								</div>
								
								
								<div class="form-group uploadDiv">
								<label for="board_file">첨부 이미지</label> <img src="" width="100%" />
                            		<input type="file" name='uploadFile' id="modal_product_image" multiple>
                        		</div>
                        		
								
								<div class="bigPicture">
									<div class='uploadResult'>
					                        <ul>
		
		        		                   </ul>
		                    	    </div>
										
									
								</div>
		                       

							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger">삭제</button>
						<button type="button" class="btn btn-info">수정</button>
						<button type="button" class="btn btn-primary">완료</button>
					</div>
				</div>
			</div>
		</div>
	</div>

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



		<!-- Modal -->
		<div class="modal fade" id="myInfoModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">처리 되었습니다.</div>
					<div class="modal-footer">
						<button id='modalCloseBtn' type="button" class="btn btn-info">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>


	<!-- Button trigger modal -->




	<script type="text/javascript">
	
		$(document)
				.ready(
						
						function getList() {
							var url = "${pageContext.request.contextPath}/rest/after.json";

						
						//모달
							
							   $('.btn-info').on('click', function(event) { 
								  
						            $("#modal_product_idx").text("상품번호 : "+ $(this).data('product_idx'));
						            $("#modal_product_name").val($(this).data('product_name'));
						            $("#modal_product_category_id").val($(this).data('product_category_id'));
						            $("#modal_product_price").val($(this).data('product_price'));
						            $("#modal_product_coloropiton").val($(this).data('product_coloroption'));
						            $("#modal_product_detail_info").val($(this).data('product_detail_info'));
						          /*   $("#modal_product_image").val($(this).data('product_image')); */
						            
						        	var product_idx = $(this).data('product_idx');
									console.log(product_idx);

									$.getJSON("/admin/getAttachList", {product_idx: product_idx}, function(arr){
									
									  console.log(arr);
									  
									  var str = "";
									  
									  $(arr).each(function(i, attach){
										  
										  //이미지 타입만
										  if(attach.fileType){
											  var fileCallPathT = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						    				  var fileCallPathBT = encodeURIComponent(obj.uploadPath + "/bs_" + obj.uuid + "_" + obj.fileName);
						    				  
						    				  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						    		           str += "<img src='/display?fileName="+fileCallPath+"'>";
						    		           str += "</div>";
						    		           str +"</li>";
										  }else{
											  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
									           str += "<span> "+ attach.fileName+"</span><br/>";
									           str += "<img src='/petopia/image/petopia.png'></a>";
									           str += "</div>";
									           str +"</li>";
											
										  }
									  });//each end
									  
									  $(".uploadResult ul").html(str);
									}); ///end getjson
									

						        });
							   
							// 페이징 버튼 이벤트
							var actionForm = $("#pageActionForm");

							$(".numberitem a").on(
									"click",
									function(e) {

										e.preventDefault();

										console.log('click');

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							//필터박스 이벤트
							$('#frm_search')
									.children()
									.children()
									.children('tr')
									.children()
									.children('#search_option')
									.on(
											'click',
											function(event) {

												var product_price = $(
														'#select1').val();
												var product_stock = $(
														'#select2').val();
												console.log($('#dataTable')
														.html());
												console
														.log($('#select1')
																.val());
												console
														.log($('#select2')
																.val());

												var options = {
													product_price : product_price,
													product_stock : product_stock
												}

												$
														.ajax({
															type : 'post',
															url : '/admin/product',
															cache : false,
															data : JSON
																	.stringify(options),
															contentType : "application/json; charset=utf-8",
															dataType : 'json',
															success : function(
																	list,
																	status) {

																var htmls = "";

																$("#dataTable")
																		.html(
																				"");

																$(
																		"<tr>",
																		{
																			html : "<td>"
																					+ "상품번호"
																					+ "</td>"
																					+ // 컬럼명들
																					"<td>"
																					+ "상품명"
																					+ "</td>"
																					+ "<td>"
																					+ "상품분류"
																					+ "</td>"
																					+ "<td>"
																					+ "가격"
																					+ "</td>"
																					+ "<td>"
																					+ "재고량"
																					+ "</td>"

																		})
																		.appendTo(
																				"#dataTable") // 이것을 테이블에붙임

																if (list.length < 1) {
																	htmls
																			.push("등록된 상품이 없습니다.");
																} else {

																	$(list)
																			.each(
																					function() {
																						console
																								.log(this.product_idx);
																						htmls += '<tr>';
																						htmls += '<td>'
																								+ this.product_idx
																								+ '</td>';
																						htmls += '<td>'
																								+ this.product_name
																								+ '</td>';
																						htmls += '<td>'
																								+ this.product_category_id
																								+ '</td>';
																						htmls += '<td>'
																								+ this.product_price
																								+ '</td>';
																						htmls += '<td>'
																								+ this.product_stock
																								+ '</td>';
																						htmls += '</tr>';

																					}); //each end

																}
																$("#dataTable")
																		.append(
																				htmls);
															},
															error : function(
																	request,
																	status,
																	error) {
																alert("code = "
																		+ request.status
																		+ " message = "
																		+ request.responseText
																		+ " error = "
																		+ error); // 실패 시 처리
															}
														});

											});

							$(".uploadResult").on("click", "button",
									function(e) {

										console.log("delete file");

										var targetFile = $(this).data("file");
										var type = $(this).data("type");

										var targetLi = $(this).closest("li");

										$.ajax({
											url : '/deleteFile',
											data : {
												fileName : targetFile,
												type : type
											},
											dataType : 'text',
											type : 'POST',
											success : function(result) {
												alert(result);
												targetLi.remove();
												$("#uploadInput").val("");
											}
										});
										// $.ajax
									});

						});
	</script>

	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />

</body>

</html>
