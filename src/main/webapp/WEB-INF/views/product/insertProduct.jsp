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

.button_div{
display: flex;
flex-direction: row-reverse;
}

.button_div button{
margin-left: 5px;

}

.detail_info{
margin-top: 10px;
}
.detail_info strong{
 position: relative;
    bottom: 65px;
}

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
                        <label>
						  <strong class="label-txt">상품명 &nbsp;&nbsp;</strong>
						   <input type="text" class="input" name="product_name">
						   <div class="line-box">
						   <div class="line"></div>
						    </div>
						    <strong class="pull-left" id="checkProductName"></strong>
						  </label>
                        </div>

                        <div class="form-group">
                          <label>
						  <strong class="label-txt">상품가격</strong>
						   <input type="text" class="input" name="product_price">
						   <div class="line-box">
						   <div class="line"></div>
						    </div>
						    <strong class="pull-left" id="checkProductPrice"></strong>
						  </label>
                        </div>
                         <label>
						  <strong class="label-txt">재고량 &nbsp;&nbsp;</strong>
						   <input type="text" class="input" name="product_stock">
						   <div class="line-box">
						   <div class="line"></div>
						    </div>
						    <strong class="pull-left" id="checkProductStock"></strong>
						  </label>
						<br>
                        <div class="form-group detail_info">
                           <label>
                           <strong class="label-txt product_detail_text">상품설명</strong>
						  <textarea class="input" rows="3"  name='product_detail_info'></textarea>
						
						    <strong class="pull-left" id="checkProductDetailInfo"></strong>
						     <div class="line-box">
						   <div class="line"></div>
						    </div>
						  </label>
                        </div>
                        
                            
                        
						<div class=button_div>
                        <button id="addBtn" type="submit" class="btn btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-info">초기화</button>
						</div>
                    
                    </form>
                </div>
                <!--/product-information-->
            </div>
			
            <div class="col-sm-9 padding-right">
                <div class="panel panel-default" style="margin-top:5px; border-radius:5px;">
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
						function(e) {
							//input 활성화 시키기
							 $('.input').focus(function(){
		                            $(this).parent().find(".label-txt").addClass('label-active');
		                       });

		                     $(".input").focusout(function(){
		                        if ($(this).val() == '') {
		                              $(this).parent().find(".label-txt").removeClass('label-active');
		                         };
		                     });
		                     
							//검사변수(간단하게 유효성 검사)
		                    var product_name = 0; //상품
		                    var produt_price = 0;//가격
		                    var product_stock = 0; //재고량
		                    var product_detail_info = 0; //상품설명
		                    
		                  
		                  
		                  
		                   // 상품 이름 검사
		                    $("input[name=product_name]").blur(function() {
		                       
		                       console.log("product_name check");
		                       
		                       var product_name = $("input[name=product_name]").val();
		                       // 비밀번호 정규식
		                        // 공백 정규식

		                        if($("input[name=product_name]").val().length >= 1) {
		                          $("#checkProductName").text("입력완료");
		                         $("#checkProductName").css("color", "black");
		                         product_name = 1;
		                        } else if($("input[name=product_name]").val().length == 0) {
		                          $("#checkProductName").text("상품명을 입력하세요");
		                         $("#checkProductName").css("color", "red");
		                         product_name = 0;
		                        }
		                        
		                    });
		                 
		                    
							
		                    $("input[name=product_price]").blur(function() {
			                       
			                       console.log("product_stock check");
			                       
			                       var product_price = $("input[name=product_price]").val();
			                       // 비밀번호 정규식
			                        var reg_product_price = /^[0-9]/g;
			                        // 공백 정규식
			                        var reg_space = /\s/g;

			                        if(reg_product_price.test(product_price) == true) {
			                          $("#checkProductPrice").text("입력완료");
			                         $("#checkProductPrice").css("color", "black");
			                         product_price = 1;
			                     
			                        } else {
			                          $("#checkProductPrice").text("숫자만 입력하세요");
			                         $("#checkProductPrice").css("color", "red");
			                         product_price = 0;
			                        }
			                        
			                    });
		                    
		                    $("input[name=product_stock]").blur(function() {
			                       
			                       console.log("product_stock check");
			                       
			                       var product_stock = $("input[name=product_stock]").val();
			                       // 비밀번호 정규식
			                        var reg_product_stock = /^[0-9]/g;
			                        // 공백 정규식
			                        var reg_space = /\s/g;

			                        if(reg_product_stock.test(product_stock) == true) {
			                          $("#checkProductStock").text("입력완료");
			                         $("#checkProductStock").css("color", "black");
			                         product_stock = 1;
			                     
			                        } else {
			                          $("#checkProductStock").text("숫자만 입력하세요");
			                         $("#checkProductStock").css("color", "red");
			                         product_stock = 0;
			                        }
			                        
			                    });
		                    
		                    $("textarea[name=product_detail_info]").blur(function() {
			                       
			                       console.log("product_detail_info check");
			                       
			                       var product_detail_info = $("textarea[name=product_detail_info]").val();
			                       // 비밀번호 정규식
			                        // 공백 정규식
			                        var reg_space = /\s/g;

			                        if($("textarea[name=product_detail_info]").val().length >= 1) {
				                          $("#checkProductDetailInfo").text("입력완료");
				                         $("#checkProductDetailInfo").css("color", "black");
				                         product_name = 1;
				                        } else if($("textarea[name=product_detail_info]").val().length == 0) {
				                          $("#checkProductDetailInfo").text("상품설명을 입력하세요");
				                         $("#checkProductDetailInfo").css("color", "red");
				                         product_name = 0;
				                        }
			                        
			                        if($("#prodct_category_id").val().length == 0){
				                    	alert('상품분류를 선택하세요.')
				                    }
			                    });
		                    
		                  
							
		            		//file upload
							var formObj = $("#addForm");

					        $("#addBtn").on("click", function(e) {

					            e.preventDefault();

					            console.log("submit clicked");

					            var str = "";

					            $(".uploadResult ul li").each(function(i, obj) {

					                var jobj = $(obj);

					                console.dir(jobj);
					                console.log(jobj.data("filename"));

					                str += "<input type='hidden' name='productVOList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
					                str += "<input type='hidden' name='productVOList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
					                str += "<input type='hidden' name='productVOList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
					                str += "<input type='hidden' name='productVOList[" + i + "].imageType' value='" + jobj.data('type') + "'>";
					            });
						            
						            console.log(str);

						            formObj.append(str).submit();

						            console.log(formObj);
						        });

					        // 파일 용량, 확장자 체크
					        var regex = new RegExp("(.*?)\.(exe\sh\zip\alz)$");
					        var maxSize = 5424880; //5MB

					        function checkExtension(fileName, fileSize) {

					            if (fileSize >= maxSize) {
					                alert("파일 사이즈 초과");

					                return false;
					            }

					            if (regex.test(fileName)) {
					                alert("해당 종류의 파일은 업로드 할 수 없습니다");

					                return false;
					            }

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
                    alert('삭제 되었습니다.');
                    targetLi.remove();
                    $("#uploadInput").val("");
                }
            });
            // $.ajax
        });
	//검사변수
							
        $("input[type='file']").change(function(e) {

            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            console.log(files);

            for (var i = 0; i < files.length; i++) {

                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }

                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    console.log("success" + result);
                    showUploadResult(result);
                }
            });

        });

    });
	</script>


</body>

</html>
