<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<title>배송내역 조회</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%@include file="../include/default_css.jsp"%>


<style type="text/css">

footer {
 
   position:absolute;
   bottom:0;
width: 100%;
  color: white;
}
.board {
	margin-left: 230px;
	padding-right: 10px;
	padding-top: 0px;
}

.boardbody {
	padding-top: 3px;
	margin-left: 10px;
	padding-right: 20px;
}

.card-title {
	
}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>




	<!-- 게시글 리스트 -->
	<div class="container col-10 board" style="margin-top: 120px">
		<div class="col-2">
			<%@include file="../include/default_sidebar.jsp"%>
		</div>
		
		<div class="n-table-filter">
					<div class="n-radio-tab">
						<input type="radio" id="radioTabGuide0" name="radioTabGuide" onClick="setPeriod(this,'1week');" >
						<label for="radioTabGuide0">1주일</label>

						<input type="radio" id="radioTabGuide1" name="radioTabGuide" onClick="setPeriod(this,'1month');" >
						<label for="radioTabGuide1">1개월</label>

						<input type="radio" id="radioTabGuide2" name="radioTabGuide" onClick="setPeriod(this,'3month');" >
						<label for="radioTabGuide2">3개월</label>

						<input type="radio" id="radioTabGuide3" name="radioTabGuide" onClick="setPeriod(this,'');" checked>
						<label for="radioTabGuide3">전체 시기</label>
					</div>

					<div class="n-datepicker sb">
						<input type="text" class="n-input" name="dt_fr_input" value="" placeholder="-" onblur="checkDateFormat(this);">
					</div>
					<div class="n-datepicker">
						<input type="text" class="n-input" name="dt_to_input" value="" placeholder="-" onblur="checkDateFormat(this);">
					</div>

					<div class="n-select">
						<select style="visibility:hidden" id="sel_ord_state">
						<option value="ord_3|40" selected="selected">배송 완료</option>
																																																							</select>
					</div>

					<button type="button" class="n-btn btn-sm btn-accent" onclick="search();">조회</button>
				</div>
		<div class="card-body boardbody">
			<h4 class="card-title">${board_name}</h4>
			<table class="table table-hover" id=''>
				<thead>
					<tr>
					<th class="text-center d-none d-md-table-cell">상품정보</th>
						<th class="text-center d-none d-md-table-cell">주문일자</th>
						<th class="text-center d-none d-md-table-cell">주문번호</th>
						<th class="text-center d-none d-md-table-cell">주문금액(수량)</th>
						<th class="text-center d-none d-md-table-cell">배송상태</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach var='obj' items="${contentList }">
						<tr>
							<td class="text-center d-none d-md-table-cell">${obj.content_date}</td>
							<td class="text-center d-none d-md-table-cell">${obj.content_idx}</td>
							<td><a href='/notice/get?board_id=1&content_idx=${obj.content_idx}'>${obj.content_title}</a></td>
							<td class="text-center d-none d-md-table-cell">관리자</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

	
			<input type="hidden" id="size" value="${fn:length(contentList)}" />
			<div class="row">
				<div class="col-sm-12 col-md-5 paginationdiv">
					<div id="masterDiv" class="d-none d-md-block page-div">
						<ul class="pagination justify-content-center">
							<li class="page-item"><c:if test="${pageMaker.prev}">
									<li class="page-item"><a href="${root }notice?board_id=${board_id}&pageNum=${(pageMaker.startPage - 1)}&amount=${pageMaker.cri.amount}"
										class="page-link">이전</a></li>
								</c:if></li>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage }">
								<li
									class='page-item numberitem ${pageMaker.cri.pageNum == num ? "active" : "" }'><a
									href="${root }notice?board_id=${board_id}&pageNum=${num}&amount=${pageMaker.cri.amount}" class="page-link">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a href="${root }notice?board_id=${board_id}&pageNum=${(pageMaker.endPage +1)}&amount=${pageMaker.cri.amount}"
									class="page-link">다음</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		<sec:authorize access="hasRole('ROLE_USER')">
			 <div class="text-right">
				<a href="${root}/notice/register?board_id=1" class="btn btn-defalut">글작성</a>
			</div> 
			</sec:authorize>

		</div>
	</div>
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<script type="text/javascript">
		$(document).ready(function() {
			
			// 페이징 버튼 이벤트
			var actionForm = $("#pageActionForm");
			
			var _isSubmit = false;

			function goList(type) {
				var dt_fr = $('#f1 [name=dt_fr]').val();
				var dt_to = $('#f1 [name=dt_to]').val();
				var period = $('#f1 [name=period]').val();
				var param = '&period='+ period +'&dt_fr='+ dt_fr +'&dt_to='+ dt_to;
				switch(type) {
					case 'ord_1' :
						document.location = '/app/mypage/order_list_opt?state_type=ord_1&ord_state=1^5^10'+ param;
						break;
					case 'ord_2' :
						document.location = '/app/mypage/order_list_opt?state_type=ord_1&ord_state=20^30^35'+ param;
						break;
					case 'ord_3' :
						document.location = '/app/mypage/order_list_opt?state_type=ord_1&ord_state=40'+ param;
						break;
					case 'ord_4' :
						document.location = '/app/mypage/order_list_opt?state_type=ord_1&ord_state=50'+ param;
						break;
					case 'exchange' :
						document.location = '/app/mypage/order_list_opt?state_type=exchange&ord_state=40^50'+ param;
						break;
					case 'clm_2' :
						document.location = '/app/mypage/order_list_opt?state_type=clm_2&ord_state=60^26'+ param;
						break;
					case 'clm_3' :
						document.location = '/app/mypage/order_list_opt?state_type=clm_3&ord_state=41^51'+ param;
						break;
					case 'clm_4' :
						document.location = '/app/mypage/order_list_opt?state_type=clm_4&ord_state=61'+ param;
						break;
				}
			}

			// 날짜 선택 후 호출 함수
			function selDatePicker(obj, chg_val) {
				var $dt_fr_input = $("#orderListSearchForm input[name='dt_fr_input']");
				var $dt_to_input = $("#orderListSearchForm input[name='dt_to_input']");

				str_chg_val = chg_val.replace(".", "");
				hidden_chg_val = chg_val.replace(/\./g, "-");
				str_fr = $dt_fr_input.val().replace(".", "");
				str_to = $dt_to_input.val().replace(".", "");

				if($(obj).attr("name") == "dt_fr_input") {
					// 선택시 To값이 없거나 To보다 크면 To값을 동일하게 세팅
					if($dt_to_input.val() == "" || str_chg_val > str_to) {
						$dt_to_input.val(chg_val);
						$("#orderListSearchForm input[name='dt_to']").val(hidden_chg_val);
					}

					$("#orderListSearchForm input[name='dt_fr']").val(hidden_chg_val);
				} else if($(obj).attr("name") == "dt_to_input") {
					// 선택시 From값이 없거나 From보다 작으면 From값을 동일하게 세팅
					if($dt_fr_input.val() == "" || str_chg_val < str_fr) {
						$dt_fr_input.val(chg_val);
						$("#orderListSearchForm input[name='dt_fr']").val(hidden_chg_val);
					}

					$("#orderListSearchForm input[name='dt_to']").val(hidden_chg_val);
				}

				$("#orderListSearchForm input[name='radioTabGuide']").attr("checked", false);
			}

			// 날짜 형식 체크 및 변경
			function checkDateFormat(obj) {
				$("#orderListSearchForm input[name='radioTabGuide']").attr("checked", false);
				$("#orderListSearchForm input[name='period']").val("input");

				var input_value = $(obj).val();
				if(input_value != "") {
					var only_nos = input_value.replace(/[^0-9]/g, '');

					if (only_nos.length == 8) {
						var year = only_nos.substr(0, 4);
						var month = only_nos.substr(4, 2);
						var day = only_nos.substr(6, 2);
						var chg_value = year + "." + month + "." + day;
						var hidden_chg_value = year + "-" + month + "-" + day;

						if (month > 12 || day > 31) {
							alert("날짜 형식을 잘못 입력하셨습니다.");
							chg_value = "";
						}

						$(obj).val(chg_value);

						if($(obj).attr("name") == "dt_fr_input") {
							$("#orderListSearchForm input[name='dt_fr']").val(hidden_chg_value);
						} else if($(obj).attr("name") == "dt_to_input") {
							$("#orderListSearchForm input[name='dt_to']").val(hidden_chg_value);
						}
					} else {
						alert("날짜 형식을 잘못 입력하셨습니다.");
						$(obj).val("");
					}
				}
			}


			function search(){
				var ff = document.orderListSearchForm;
				var $dt_fr_input = $("#orderListSearchForm input[name='dt_fr_input']");
				var $dt_to_input = $("#orderListSearchForm input[name='dt_to_input']");

				var period = $("#orderListSearchForm input[name='period']").val();

				if(period == "input") { // 선택된 기간이 없고 입력했다.
					if($dt_fr_input.val() == "" || $dt_to_input.val() == ""){
						alert("검색 기간을 설정해 주세요");
						return false;
					}
				}

				ff.submit();
			}

	
		
		});
		
	</script>
</body>
</html>






