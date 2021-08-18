// insert Modal 불러오기
$('#insertBtn').click(function(){

	$("#insertMemberId").val($(this).data('member_id'));

	var modal = document.getElementById('insertModal');

	var btn = document.getElementById("insertBtn");
 
	var span = document.getElementsByClassName("close")[0];                                          

	modal.style.display = "block";

	span.onclick = function() {
		modal.style.display = "none";
	}
 
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
});


 
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
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
	
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
	});  // $.ajax
});
        

/* 게시물 등록 */
var formObj = $("#insertSubmit");

$('#insertSubmit').click(function(){

	var str = "";

	$(".uploadResult ul li").each(function(i, obj) {

		var jobj = $(obj);

		console.dir(jobj);
		console.log(jobj.data("filename"));

		str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data('filename') + "'>";
		str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data('uuid') + "'>";
		str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data('path') + "'>";
		str += "<input type='hidden' name='attachList[" + i + "].imageType' value='" + jobj.data('type') + "'>";
	});
	
	console.log(str);
	formObj.append(str).submit();
	console.log(formObj);
	alert("게시물이 등록되었습니다.");
	location.reload();
	
});
       
/*----------------게시물 보기 Modal----------------------*/

$('.contentGetImg').click(function(){

	$("#getMemberId").val("작성자: " + $(this).data('member_id'));
	$("#getContentDate").val("작성일자: " + $(this).data('content_date'));
	$("#getContentTitle").val("제목: " + $(this).data('content_title'));
	$("#getContentText").val($(this).data('content_text'));
	$("#getContentIdx").val("글번호: " + $(this).data('content_idx'));
	
	var modal = document.getElementById('contentModal');
	var img = document.getElementById("contentGetImg");
	var span = document.getElementsByClassName("close")[1];                                          

	modal.style.display = "block";

	span.onclick = function() {
		modal.style.display = "none";
	}
 
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	var content_idx = $(this).data('content_idx');
	
	$('#replySubmit').click(function(){

	var reply_text =  $("#replyRegister").val();
	console.log(content_idx);
	
	var reply= {
		reply_text : reply_text, 
		content_idx : content_idx
	}
	
	/* 댓글달기 */
	$.ajax({
		url: '/replies/new',
		data : JSON.stringify(reply),
		type: 'POST',
		contentType: "application/json; charset=utf-8",
		success: function(result) {
			alert('댓글이 등록되었습니다.')
		}, error: function(result){
			console.log(result)
		}
	});  // $.ajax
});
	
});

