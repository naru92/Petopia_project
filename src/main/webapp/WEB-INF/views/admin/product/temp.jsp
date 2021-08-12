<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
var productValue = '<c:out value="${p.product_idx}" />';
																	var productCnt = list.length;
																	showProductPage(productCnt);
												                	console.log(productValue);
												               
												                	showList(1);
												                	var pageNum = 1;
												                	
												                	// 상품평 페이징
																	function showProductPage(productCnt) {
																		var pageNum = 1;
																		var pageDiv = $("#masterDiv");
												                		console.log(pageDiv);
												                		
												                		console.log('pageNum'+pageNum);
																		var endNum = Math.ceil(pageNum / 10.0) * 10;
																		var startNum = endNum - 9;
																		
																	
																		
																		var prev = startNum != 1;
																		var next = false;
																		
																		if(endNum * 10 >= productCnt) {
																			endNum = Math.ceil(productCnt/10.0);
																		}
																		
																		if(endNum * 10 < productCnt) {
																			next = true;
																		}
																		//일단 부모 div 날리기
																		$('#masterDiv').empty();
																		
																		var str = "<ul class='pagination pull-right'>";
																		//이전
																		if(prev) {
																			str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
																		}
																		//중단
																		for(var i = startNum; i <= endNum; i++) {
																			var active = pageNum == i ? "active" : "";
																			str += "<li class='page-item numberitem" + active + "'> <a class='page-link' href='" + i + "'>" + i +"</a></li>";
																		}
																		//끝
																		if(next) {
																			str += "<li class='page-item'> <a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
																		}
																		
																		str +="</ul></div>";
																		
																		console.log(str);
																		
																		//페이지버튼
																		pageDiv.html(str);
																	} 
																	
																	function showList(page) {
																		
																		console.log("show reivews list " + page);

																		list.get({product_idx:productValue, page: page || 1}, function(productCnt, list) {
																			console.log("productCnt: " + productCnt);
																			
																			if(page == -1) {
																				pageNum = Math.ceil(productCnt/10.0);
																				showList(pageNum);
																				
																				return
																			}
																		
																			showProductPage(productCnt);
																		
																		});
																	} // /showList

																	// 페이지 버튼
																	$(".numberitem a").on("click", "li a", function(e) {
																		e.preventDefault();
																		console.log("page click");
																		
																		var targetPageNum = $(this).attr("href");
																		
																		console.log("targetPageNum : " + targetPageNum);
																		
																		pageNum = targetPageNum;
																		
																		showList(pageNum);
																	}); // /reviewsPageFooter
</body>
</html>