// insert Modal 불러오기
$('#insertBtn').click(function(){

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


// Ajax로 데이터 전송 
$(document).ready(function() { 
	$('#insertSubmit').click(function(){

		$.ajax({
			type: "POST",
			url: "/petstagram/register",
			data: { "board_id" : $('#inserBoardId').val(),
					"member_id" : $('#insertMemberId').val(),
					"content_title" : $('#insertContentTitle').val(),
					"content_text" : $('#insertContentText').val()},
			success: function(){
				alert('게시글이 등록되었습니다.');
				location.reload();
			}, error: function(){
				alert('게시글 등록에 실패했습니다.');
			}
		});
	});
});


