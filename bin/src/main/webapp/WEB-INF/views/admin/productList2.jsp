<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

<style type="text/css">
.footerdiv {
	height: 100%;
}

.logo {
	margin-bottom: 5px;
}

#modal_product_idx {
	margin-left:;
	font-size: 70%;
}

<
style>.uploadResult {
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
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	background-color: rgba(255, 255, 255, 0.5);
	z-index: 100;
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

#animalType, #productsType, #brand {
	width: auto;
}

showCloseButton ::before {
	height: 10px;
}
</style>
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- ?????? ??????????????? ??? -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />



		<!-- ?????? ?????? ??? -->
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
							<h6 class="m-0 font-weight-bold text-primary">????????????</h6>
						</div>

						<div class="card-body filterBox">
							<div class="boxtr">
								<form action="${contextPath }admin/product" method="post"
									id="frm_search">

									<table>




										<tr>
											<td colspan="2">?????? ??????&nbsp;&nbsp;</td>
											<td class="head" colspan="5" class="pleft"><input
												type="radio" value="??????" name="select_category_id">1.??????
												<input type="radio" value="??????" name="select_category_id">2.??????
												<input type="radio" value="??????" name="select_category_id">3.??????/??????
												<input type="radio" value="??????" name="select_category_id">4.??????/??????
												<input type="radio" value="?????????" name="select_category_id">5.?????????/?????????
												<input type="radio" value="?????????" name="select_category_id">6.?????????/??????
												<input type="radio" value="?????????" name="select_category_id">7.?????????/?????????
												<input type="radio" value="??????" name="select_category_id">8.??????/??????
												<input type="radio" value="??????" name="select_category_id">9.??????/?????????

											</td>
										</tr>

										<tr>
											<td colspan="2">?????? ??????&nbsp;&nbsp;</td>
											<td colspan="5" class="pleft"><select id="select1"
												name="product_price">
													<option value="" selected>--??????--</option>
													<option value="product_price_asc">?????? ?????? ???</option>
													<option value="product_price_desc">?????? ?????? ???</option>
											</select> <select id="select2" name="product_stock">
													<option value="" selected>--?????????--</option>
													<option value="stock_asc">????????? ?????? ???</option>
													<option value="stock_desc">????????? ?????? ???</option>
											</select></td>
										</tr>



										<tr>
											<td colspan="7"><input type="button" value="??????"
												id="search_option" />&nbsp;&nbsp; <input type="reset"
												value="?????????" /></td>

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

											<th>????????????</th>
											<th>?????????</th>
											<th>????????????</th>
											<th>??????</th>
											<th>?????????</th>
											<th>????????????</th>

										</tr>
									</thead>

									<c:forEach var='p' varStatus="status" items="${productList}">
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
														data-product_name="${p.product_name }"
														data-product_category_id="${p.product_category_id }"
														data-product_price="${p.product_price}"
														data-product_detail_info="${p.product_detail_info }"
														data-product_coloroption="${p.product_coloroption}"
														data-product_image="${p.product_image }"
														data-pageNum="${pageMaker.cri.pageNum}"
														data-amount="${pageMaker.cri.amount}"
														data-target="#largeModal" value="${p.product_idx }">
														????????????</button>
												</td>

											</tr>
										</tbody>


									</c:forEach>
								</table>
							</div>
							<form id='pageActionForm' action="/admin/product" method='get'>
								<input type='hidden' id='currentPageNum' name='pageNum'
									value='${pageMaker.cri.pageNum}' /> <input type='hidden'
									id='currentAmount' name='amount'
									value='${pageMaker.cri.amount}' />
							</form>
						</div>
						<input type="hidden" id="size" value="${fn:length(list)}" />
						<div class="row">
							<div class="col-sm-12 col-md-5 paginationdiv">
								<div id="masterDiv" class="d-none d-md-block page-div">
									<ul class="pagination justify-content-center">
										<li class="page-item"><c:if test="${pageMaker.prev}">
												<li class="page-item"><a
													href="${pageMaker.startPage-1}" class="page-link">??????</a></li>
											</c:if></li>
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage }">
											<li
												class='page-item numberitem ${pageMaker.cri.pageNum == num ? "active" : "" }'
												value="${num}"><a href="${num}" class="page-link">${num}</a></li>
										</c:forEach>

										<c:if test="${pageMaker.next}">
											<li class="page-item"><a href="${pageMaker.endPage +1}"
												class="page-link">??????</a></li>
										</c:if>

									</ul>
								</div>
							</div>
							<table class="tbl paginated" id="tbl">
							</table>
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

					<p>????????? ???????????? | ???????????? ???????????? | ??????/?????? ??????</p>
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
						<h4 class="modal-title" id="myModalLabel">?????? ??????</h4>

						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>

						</button>

					</div>

					<div class="modal-body">
						<h5 id=modal_product_idx></h5>
						<div class="card-body">


							<div class="form-group">
								<label for="board_writer_name">?????????</label> <input type="text"
									id="modal_product_name" name="product_name"
									class="form-control"></input>
							</div>
							<div class="form-group">
								<label for="board_date">????????????</label> <input type="text"
									id="modal_product_price" name="product_price"
									class="form-control" value="123"></input>
							</div>
							<div class="form-group">
								<label for="product_coloropiton">??????</label> <input type="text"
									id="modal_product_coloropiton" name="product_coloropiton"
									class="form-control" value="" />
							</div>

							<div class="form-group">

								<label for="product_detail_info">????????????</label>
								<textarea id="modal_product_detail_info"
									name="product_detail_info" class="form-control" rows="10"
									style="resize: none"></textarea>
							</div>


							<div class="form-group uploadDiv">
								<label for="board_file">?????? ?????????</label><br> <img src=""
									width="100%" /> <input type="file" name='uploadFile'
									id="product_image" multiple>
							</div>


							<form id='operForm' action="product/update" method="get">
								<input type="hidden" id=idx name='product_idx' value="" /> <input
									type="hidden" id=hiddenPageNum name='pageNum' value="" /> <input
									type="hidden" id=hiddenAmount name='amount' value="" />
							</form>


							<!-- ????????????????????? -->
							<div class="row">
								<div class='uploadResult'>
									<ul>
									
									</ul>
								</div>


							</div>

							<!-- ?????? ????????? ?????? ?????? -->
							<div class="bigPicturePlace">
								<div class='bigPictureWrapper'>
									<div class="bigPicture"></div>
								</div>
							</div>


						</div>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary" data-dismiss="modal">??????</button>
						<button data-oper='update' class="btn btn-default"
							style="margin: 10px;">??????</button>
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
						<span aria-hidden="true">??</span>
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
					<div class="modal-body">?????? ???????????????.</div>
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
						
						function () {
							var url = "${pageContext.request.contextPath}/rest/after.json";

						
						//??????
							
							   $('.btn-info').on('click', function(event) { 

								   var product_idx = parseInt($(this).data('product_idx'));
								   
						            $("#modal_product_idx").text("???????????? : "+ $(this).data('product_idx'));
						            $("#modal_product_name").val($(this).data('product_name'));
						            $("#modal_product_category_id").val($(this).data('product_category_id'));
						            $("#modal_product_price").val($(this).data('product_price'));
						            $("#modal_product_coloropiton").val($(this).data('product_coloroption'));
						            $("#modal_product_detail_info").val($(this).data('product_detail_info'));
						        	  /*   $("#modal_product_image").val($(this).data('product_image')); */
						          
						         	
						          	$('input[name=product_idx]').attr('value', $(this).data('product_idx'));
						         	$("#hiddenPageNum").val($("#currentPageNum").val());
						         	$("#hiddenAmount").val($("#currentAmount").val());
						         	
						        	// ?????? ??????
						    		var operForm = $("#operForm");
						    		
						    		$("button[data-oper = 'update']").on("click", function(e) {
						    			
						    			operForm.attr("action", "/admin/product/update").submit();
						    			
						    		}); 
						    		
						          

									$.getJSON("/admin/getAttachList", {product_idx: product_idx}, function(arr){
									
									  console.log(arr);
									  
									  var str = "";
									  
									  $(arr).each(function(i, attach){
										  
										  console.log(attach.filetype);
										  attach.filetype=true;
										  //????????? ?????????
										  if(attach.filetype){

											  var fileCallPathT = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						    				  var fileCallPathBT = encodeURIComponent(attach.uploadPath + "/bs_" + attach.uuid + "_" + attach.fileName);
						    				  
						    				  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						    		           str += "<img src='/display?fileName="+fileCallPathT+"'>";
						    		           str += "</div>";
						    		           str +"</li>";
										  }else{
											  var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
							                   var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
							                    
											   str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.filetype+"' ><div>";
									           str += "<span> "+ attach.fileName+"</span><br/>";
									           str += "<button type='button' data-file=\'" +
						                        "\' data-type='image' class='btn btn-warning btm-circle showCloseButton'> <i class='fa fa-times '></i></button><br>";
									           str += "<img src='/petopia/image/petopia.png'></a>";
									           str += "</div>";
									           str +"</li>";
											
										  }
									  });//each end
									  
									  $(".uploadResult ul").html(str);
									}); ///end getjson
									//??????
								  $(".uploadResult").on("click", "button", function(e) {

						            console.log("delete file");
						
						            var targetFile = $(this).data("file");
						            var type = $(this).data("type");
						
						            var targetLi = $(this).closest("li");

						            $.ajax({
						                url: '/deleteFile',
						                data: {
						                    fileName: targetFile,
						                    type: type
						                },
						                dataType: 'text',
						                type: 'POST',
						                success: function(result) {
						                    alert('?????? ???????????????.');
						                    targetLi.remove();
						                    $("#uploadInput").val("");
						                }
						            });
						            // $.ajax
						        });
							        });
					   });
						
						
							// ?????? ????????? ??????
					    		function showImage(fileCallPath) {
					    			
					    			console.log(fileCallPath);
					    			
					    			$(".bigPictureWrapper").css("display", "flex").show();
					    			
					    			$(".bigPicture")
					    			.html("<img src='${pageContext.request.contextPath}/display?fileName="+fileCallPath+"'>")
					    			.animate({width:'100%', height:'100%'}, 1000);
					    		}
					    		
					      // ?????? ????????? ??????
					      $(".bigPicturePlace").on("click", function(e) {
					        	$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
					    	       setTimeout(function() {
					    		     $('.bigPictureWrapper').hide();
					    	                               }, 1000);
					      });  
							// ????????? ?????? ?????????
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

							//???????????? ?????????
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
												var select_category_id = $(":input:radio[name=select_category_id]:checked").val();
												console.log( $(":input:radio[name=select_category_id]:checked").val());
												console
														.log($('#select1')
																.val());
												console
														.log($('#select2')
																.val());

												var options = {
													product_price : product_price,
													product_stock : product_stock,
													select_category_id : select_category_id
												}
													const list="";
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
																list = $(list);
																console.log(list);
																var htmls = "";

																$("#dataTable")
																		.html("");
																				
																$("#masterDiv").empty();

																$(
																		"<tr>",
																		{
																			html : "<td>"
																					+ "????????????"
																					+ "</td>"
																					+ // ????????????
																					"<td>"
																					+ "?????????"
																					+ "</td>"
																					+ "<td>"
																					+ "????????????"
																					+ "</td>"
																					+ "<td>"
																					+ "??????"
																					+ "</td>"
																					+ "<td>"
																					+ "?????????"
																					+ "</td>"
													
																		})
																		.appendTo(
																				"#dataTable") // ????????? ??????????????????

																if (list.length < 1) {
																	$("#dataTable").html("<p>????????? ????????? ????????????.</p>");
																			
																} else {

																	$(list)
																			.each(
																					function() {
																						
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
																
																$("#currnetPageNum").val(1);//1?????????
																$("#currnetAmonut").val(list.lenght);
																$("#dataTable").append(htmls);
											    			  },
											    			     error:function(request,status,error){
											    			         alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ?????? ??? ??????
											    			        }
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

							
								 var updateForm = $("#updateForm");
						        $('#updateButton').on("click", function(e) {
						        	
						        	

						            e.preventDefault();

						            var operation = $(this).data("oper");
									
									
						            console.log(operation);

						            if(operation === 'delete') {
						                updateForm.attr("action", "/product/delete");
						            } else if(operation === 'list') {
						                updateForm.attr("action", "/products/list").attr("method", "get");
						                var pageNumTag = $("input[name='pageNum']").clone();
						                var amountTag = $("input[name='amount']").clone();
						                var typeTag = $("input[name='type']").clone();
										var keywordTag = $("input[name='keyword']").clone();
						                
						                updateForm.empty();
						                updateForm.append(pageNumTag);
						                updateForm.append(amountTag);
						                updateForm.append(typeTag);
						                updateForm.append(keywordTag);
						            } else if(operation === 'update') {
						            	
						            	var str = "";
						            	
						            	$(".uploadResult ul li").each(function(i, obj) {
						            		
						            		var jobj = $(obj);
						            		
						            		console.dir("jobj : " + jobj);
						            		
						            		 str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
						                     str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
						                     str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
						                     str += "<input type='hidden' name='attachList[" + i + "].imageType' value='" + jobj.data('type') + "'>";
						                 });
						            	
						            	console.log("str = " + str);
														
						            	updateForm.append(str).submit();

						            }

						            updateForm.submit();

						        });
						        
						     	// getAttachList
						     	
							
						});
	</script>

	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />

</body>

</html>
