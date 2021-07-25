<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">

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
.marginclass {
	padding-left: 0px;
}

.row {
	margin-bottom: 40px;
}

#board_file {
	padding-top: 2px;
	padding-left: 2px;
}

.inline-text {
display :inline;
}
</style>

</head>

<body id="page-top">
<section>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 좌측 네비게이션 바 -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />



		<!-- 상단 메뉴 바 -->
		<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />




	
    <div class="container">
        <div class="row">


            <div class="col-sm-9 padding-right">
                <div class="product-information">
                    <!--/product-information-->
                    <form id="addForm" action="${root }admin/product/insert_pro" method="post">
                    
                        <h2>상품등록</h2>
                        <hr>
                    
                           
                            <div class="form-group col-sm-2 marginclass">
                                <select id="prodct_category_id" name="product_category_id">
                                    <option value="">카테고리</option>
                                    <option value="1">사료</option>
                                    <option value="2">간식</option>
                                    <option value="3">위생/배변</option>
                                    <option value="4">미용/목욕</option>
                                    <option value="5">급식기/급수기</option>
                                    <option value="6">장난감/훈련</option>
                                    <option value="7">하우스/이동장</option>
                                    <option value="8">패션/의류</option>
                                    <option value="9">목줄/하네스</option>
                                </select>
                            </div>

                       
						   <div class="form-group col-sm-4 marginclass">
                           	  <h5 class= inline-text><b>색상 : </b></h5>
                              black: <input type="checkbox" name="product_coloroption" value="black">
             				  white: <input type="checkbox" name="product_coloroption" value="white">
                			  red: <input type="checkbox" name="product_coloroption" value="red" >
                           </div>
                     	
                     	<br>
                        <div class="form-group">
                            <h2><b>상품명 : </b></h2>
                            <input class="form-control" name='product_name'>
                        </div>

                        <div class="form-group">
                            <h2><b>가격 : </b></h2>
                            <input class="form-control" name='product_price'>
                        </div>
                        <div class="form-group">
                            <h2><b>재고량 : </b></h2>
                            <input class="form-control" name='product_stock'>
                        </div>

                        <div class="form-group">
                            <h2><b>상품 설명</b></h2>
                            <textarea class="form-control" rows="3" name='product_detail_info'></textarea>
                        </div>
                        
                        

                        <button id="addBtn" type="submit" class="btn btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-info">초기화</button>

                    
                    </form>
                </div>
                <!--/product-information-->
            </div>
			
            <div class="col-sm-9 padding-right">
            <hr>
                <div class="panel panel-primary" style="margin-top:5px; border-radius:5px;">
                    <div class="panel-heading">파일 첨부</div>

                    <div class="panel-body">
                        <div class="form-group uploadDiv">
                            <input type="file" name='uploadFile' id="uploadInput" multiple>
                        </div>

                        <div class='uploadResult'>
                            <ul>
							
                            </ul>
                        </div>
                    </div>
                    <!-- ./panel-body -->
                </div>
                <!-- ./panel -->
            </div>

        </div>
    </div>
   </div>
	
   
  
</section>

	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />


	<script type="text/javascript">
		//파일 업로드 구현 시작
		$(document)
				.ready(
						
						//file upload
						function(e) {
							var formObj = $("#addForm");
							
							  $("#addBtn").on("click", function(e) {

						            e.preventDefault();

						            console.log("submit clicked");

						            var str = "";

						            $(".uploadResult ul li").each(function(i, obj) {

						                var jobj = $(obj);

						                console.dir(jobj);
						                console.log(jobj.data("filename"));

						                str += "<input type='hidden' name='productVOList[" + i + "].prdouct_image' value ='" + jobj.data('prdouct_image') + "'>";
						                str += "<input type='hidden' name='productVOList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
						                str += "<input type='hidden' name='productVOList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
						                str += "<input type='hidden' name='productVOList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
						                str += "<input type='hidden' name='productVOList[" + i + "].filetype' value='" + jobj.data('type') + "'>";
						                str += "<input type='hidden' name='product_image' value='" + jobj.data('filename') + "'>";
						            });
						            
						            console.log(str);

						            formObj.append(str).submit();

						            console.log(formObj);
						        });


							const regex = new RegExp("(.*?)\.(exe\sh\zip\alz)$");//파일 확장자 선언
							const maxSize = 20485760; //10MB로 제한

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

            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");

            var str = "";
            
            $(uploadResultArr).each(function(i, obj) {
           	 obj.filetype= true
           	 console.log(obj.uploadPath );
           	console.log(encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName));

            	console.log(obj.filetype);
                if (obj.filetype) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.filetype + "' ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath +
                        "\' data-type='image' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
                    str += "<img src='${pageContext.request.contextPath}/display?fileName=" + fileCallPath + "'>";
                    str += "</div>";
                    str + "</li>";
                } else {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                    var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.filetype + "' ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath +
                        "\' data-type='file' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
                    str += "<img src='/petopia/image/petopia.png'>";
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
											url : '${pageContext.request.contextPath}/uploadAjaxAction',
											processData : false,
											contentType : false,
											data: formData,
											type : 'POST',
											dataType : 'json',
											success : function(result) {
												console.log('업로드 성공');
												console.log(result);
												showUploadResult(result);
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

						});
	</script>


</body>

</html>
