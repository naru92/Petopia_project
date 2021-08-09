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


</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">


	

		<!-- 좌측 네비게이션 바 -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />



		<!-- 상단 메뉴 바 -->
		<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />


	<section>
    <div class="container">
        <div class="row">

            <div class="col-sm-9 padding-right">
                <div class="product-information">
                    <!--/product-information-->
                    <form id='updateForm' action="update" method="post">
                        <div class="form-group">
                            <input type="hidden" class="form-control" id='product_idx' name='product_idx' value='<c:out value="${productVO.product_idx}" /> '>
                        </div>

                        <div class="form-group">
                            <h2>
                                <b>카테고리</b>
                            </h2>
								<div class="form-group col-sm-2 marginclass">
                                <select id="prodct_category_id" name="product_category_id">
                                    <option value="">카테고리</option>
                                    <option value="1"<c:if test='${productVO.product_category_id== "1" }'>selected</c:if>>사료</option>
                                    <option value="2"<c:if test='${productVO.product_category_id== "2" }'>selected</c:if>>간식</option>
                                    <option value="3"<c:if test='${productVO.product_category_id== "3" }'>selected</c:if>>위생/배변</option>
                                    <option value="4"<c:if test='${productVO.product_category_id== "4" }'>selected</c:if>>미용/목욕</option>
                                    <option value="5"<c:if test='${productVO.product_category_id== "5" }'>selected</c:if>>급식기/급수기</option>
                                    <option value="6"<c:if test='${productVO.product_category_id== "6" }'>selected</c:if>>장난감/훈련</option>
                                    <option value="7"<c:if test='${productVO.product_category_id== "7" }'>selected</c:if>>하우스/이동장</option>
                                    <option value="8"<c:if test='${productVO.product_category_id== "8" }'>selected</c:if>>패션/의류</option>
                                    <option value="9"<c:if test='${productVO.product_category_id== "9" }'>selected</c:if>>목줄/하네스</option>
                                </select>
                            </div>

                       
						   <div class="form-group col-sm-4 marginclass">
						   	<c:set var = "color" value = "${productVO.product_coloroption}" />
                           	  <h5 class= inline-text><b>색상 : </b></h5>
                              black: <input type="checkbox" name="product_coloroption" value="black" <c:if test= "${fn:contains(color, 'black')}">checked</c:if>>
             				  white: <input type="checkbox" name="product_coloroption" value="white" <c:if test= "${fn:contains(color, 'white')}">checked</c:if>>
                			  red: <input type="checkbox" name="product_coloroption" value="red" <c:if test= "${fn:contains(color,'red')}">checked</c:if>>
                           </div>
                        </div>

                        <div class="form-group">
                            <h2>
                                <b>상품명 : </b>
                            </h2>
                            <br>
                            <input class="form-control" name='product_name' value='<c:out value="${productVO.product_name}" />'>
                        </div>

                       
                            <div class="form-group">
                            <h2>
                                <b>가격 : </b>
                            </h2>
                            <input class="form-control" name='product_price' value='<c:out value="${productVO.product_category_id}" />'>
                        </div>
                        <div class="form-group">
                            <h2>
                                <b>재고량 : </b>
                            </h2>
                            <input class="form-control" name='product_stock' value='<c:out value="${productVO.product_stock}" />'>
                        </div>

                        <div class="form-group">
                            <h2>
                                <b>상품 설명</b>
                            </h2>
                            <textarea class="form-control" rows="3" name='product_detail_info'>
                            <c:out value="${productVO.product_detail_info}" /> 
                            </textarea>
                        </div>
                        
                        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
					
                        <button data-oper='update' class="btn btn-info">수정</button>
                        <button data-oper='delete' class="btn btn-danger">삭제</button>
                        <button data-oper='list' class="btn btn-warning">목록으로</button>
					
                        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}" />'> 
                        <input type='hidden' name='amount' value='<c:out value="${cri.amount}" />'>
                        <input type='hidden' name='type' value='<c:out value="${cri.type}" />' >
                        <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}" />' >
                        
                    </form>
                </div>
                <!--/product-information-->
            </div>

            <div class="col-sm-9 padding-right">
                <div class="panel panel-default" style="margin-top:5px; border-radius:5px;">
                    <div class="panel-heading">파일 첨부</div>

                    <div class="panel-body">
                        <div class="form-group uploadDiv">
                            <input type="file" name='uploadFile' multiple>
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
</section>
</div>

<script type="text/javascript">


    $(document).ready(function() {

        var updateForm = $("#updateForm");

        $('button').on("click", function(e) {
			
        	console.log('click');
            e.preventDefault();

            var operation = $(this).data("oper");

            console.log(operation);

            if(operation === 'delete') {
                updateForm.attr("action", "/admin/product/delete");
                alert('삭제되었습니다.');
            } else if(operation === 'list') {
                updateForm.attr("action", "/admin/product").attr("method", "get");
                var pageNumTag = $("input[name='pageNum']").clone();
                var amountTag = $("input[name='amount']").clone();
                
                updateForm.empty();
                updateForm.append(pageNumTag);
                updateForm.append(amountTag);
            } else if(operation === 'update') {
            	
            	var str = "";
            	
            	$(".uploadResult ul li").each(function(i, obj) {
            		
            		var jobj = $(obj);
            		
            		console.dir("jobj : " + jobj);
            		
            		 str += "<input type='hidden' name='productVOList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
                     str += "<input type='hidden' name='productVOList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
                     str += "<input type='hidden' name='productVOList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
                     str += "<input type='hidden' name='productVOList[" + i + "].imageType' value='" + jobj.data('type') + "'>";
                     str += "<input type='hidden' name='productVOList[" + i + "].filetype' value='" + jobj.data('type') + "'>";
                 });
            	
            	console.log("str = " + str);
								
            	updateForm.append(str).submit();

            }

            updateForm.submit();

        });
        
     	// getAttachList
     	(function() {
     		
     		var product_idx = '<c:out value="${productVO.product_idx}" />';
     		
     		$.getJSON("/admin/getAttachList", {product_idx: product_idx}, function(obj) {

     			console.log(obj);
     			
     			var str = "";
     			
     			$(obj).each(function(i, obj) {
     				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
     				obj.filetype = true;
     			
     				if(obj.filetype ) {
     					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        	"' data-type='" + obj.filetype + "' ><div>";
                    	str += "<span> " + obj.fileName + "</span>";
                    	str += "<button type='button' data-file=\'" + fileCallPath +
                        	"\' data-type='image' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
                    	str += "<img src='/display?fileName=" + fileCallPath + "'>";
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
                        str += "<img src='/petopia/images/petopia_logo.png'>";
                        str += "</div>";
                        str + "</li>";
                    }
     			});
     			
     			$(".uploadResult ul").html(str);
     		});
     		
     	})();
     	// .getAttachList

     	// delete file
     	$(".uploadResult").on("click", "button", function(e) {

            console.log("delete file");

            if(confirm("이 파일을 삭제할까요?")) {
            	var targetLi = $(this).closest("li");
            	targetLi.remove();
            	$("#uploadInput").val("");
            }
        });
     	// .delete file
     	
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
        
     	// show upload result
        function showUploadResult(uploadResultArr) {

            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");

            var str = "";

            $(uploadResultArr).each(function(i, obj) {
            	
                if (obj.filetype == false) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                    str += "<li data-path='" + obj.uploadPath + "' data-uuid='" +
                        obj.uuid + "' data-filename='" + obj.fileName +
                        "' data-type='" + obj.filetype + "' ><div>";
                    str += "<span> " + obj.fileName + "</span>";
                    str += "<button type='button' data-file=\'" + fileCallPath +
                        "\' data-type='image' class='btn btn-warning btm-circle'> <i class='fa fa-times'></i></button><br>";
                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
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
                    str += "<img src='../../resources/images/attach.png'>";
                    str += "</div>";
                    str + "</li>";
                }
            });

            uploadUL.append(str);
        }
     	// .show upload result
     	
   /*   csrf 지금 비활성화인 상태	
   		var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}); */
        
     	// file upload
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
     	// .file upload

    });
</script>

	

	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />

</body>

</html>
