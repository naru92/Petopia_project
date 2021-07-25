// content get Modal 불러오기
$('#contentGetImg').click(function(){

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

	$("#modal_product_idx").text("상품번호 : "+ $(this).data('product_idx'));
});
