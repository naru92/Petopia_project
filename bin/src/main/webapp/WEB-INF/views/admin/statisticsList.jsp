<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Petopia - Admin</title>

<!-- css -->
<script

	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script

	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
		
<c:import url="/WEB-INF/views/include/admin_list_css.jsp" />

<style type="text/css">

#statistics{
  display: flex;
  justify-content: center;
  line-height: 200px;
  vertical-align: middle;
  margin-top: 0px;
  margin-bottom: 10px;
}

.statistics_select_box{
margin-left: 10px;
margin-top: 10px;
}

</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- 좌측 네비게이션 바 -->
		<c:import url="/WEB-INF/views/include/admin_left_side_bar.jsp" />

		<!-- 상단 메뉴 바 -->
		<c:import url="/WEB-INF/views/include/admin_top_menu.jsp" />






		<!-- Content Row -->
		<div class="container-fluid">

			<!-- Content Column -->

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">통계</h6>
				</div>
				
			<div class="dropdown show statistics_select_box ">
		  <a class="btn btn-info dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		   펫토피아 통계
		  </a>
		
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		    <a class="dropdown-item" id=item1 href="#">회원 통계</a>
		    <a class="dropdown-item" id=item2 href="#">기부 통계</a>
		    <a class="dropdown-item" id=item3 href="#">주문 통계</a>
		  </div>
		</div>

				<div class="col-xl-12" id= statistics>
					<canvas id="chart" width="1200" height="600"></canvas>
				</div>
				
			


				<!-- /.container-fluid -->

			</div>
		</div>
		<!-- End of Main Content -->

		<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2021</span>
				</div>
			</div>
		</footer>
		<!-- End of Footer -->


		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

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
	</div>
	
	
	
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );








$("#item1").on('click' ,function(){
	var chartLabels1 = [];
	var chartData1 = [];
	if($('#chart').val() != null) {
		console.log('차트 제거 작업 실행')
	$('#chart').remove();
	console.log($('#chart').val());
	$('#statistics').eq(0).append('<canvas id ="chart"  width="1200" height="600"> </canvas>');
	
	}
	
	var lineChartData1 = {

			labels : chartLabels1,

			datasets : [

				{

					label : "회원수",

					fillColor : "rbga(151,187,205,0.2)",

					strokeColor : "rbga(151,187,205,1)",

					pointColor : "rbga(151,187,205,1)",

					pointStrokeColor : "#fff",

					pointHighlightFill : "#fff",

					pointHighlightStroke : "rbga(151,187,205,1)",

					data : chartData1


			}

				]

	}

	
	$.getJSON("http://localhost:8282/admin/getStatistics1", function(data){

		

		$.each(data, function(inx, obj){

			chartLabels1.push(obj.member_joindate);
			chartData1.push(obj.member_joincount);
			console.log(obj.member_joindate);

		});

		createChart();

		console.log("create Chart1")

	});




	function createChart(){

		var ctx = document.getElementById("chart").getContext("2d");

		LineChartDemo = Chart.Line(ctx,{

			data : lineChartData1,

			options :{

				scales : {

					yAxes : [{

						ticks :{

							beginAtZero : true

						}

					}]

				}

			}

		})



	}

});

$("#item2").on('click' ,function(){
	console.log('item2');
	var chartLabels2 = [];
	var chartData2 = [];
	var lineChartData2 = {

			labels : chartLabels2,

			datasets : [

				{

					label : "기부액",

					fillColor : "rbga(151,187,205,0.2)",

					strokeColor : "rbga(151,187,205,1)",

					pointColor : "rbga(151,187,205,1)",

					pointStrokeColor : "#fff",

					pointHighlightFill : "#fff",

					pointHighlightStroke : "rbga(151,187,205,1)",

					data : chartData2

				

			}

				]

	}
	
	$("#chart").remove();
	$('#statistics').eq(0).append('<canvas id ="chart"> </canvas>');
	
	$.getJSON("http://localhost:8282/admin/getStatistics2", function(data){

		console.log(data)

		$.each(data, function(inx, obj){

			chartLabels2.push(obj.member_point_usedate);
			chartData2.push(obj.member_point_usepoint);

		});

		createChart();

		console.log("create Chart2")

	});




	function createChart(){

		var ctx = document.getElementById("chart").getContext("2d");

		LineChartDemo = Chart.Line(ctx,{

			data : lineChartData2,

			options :{

				scales : {

					yAxes : [{

						ticks :{

							beginAtZero : true

						}

					}]

				}

			}

		})



	}

});

$("#item3").on('click' ,function(){
	//상품
	var chartLabels3 = [];
	var chartData3 = [];

	console.log('item3');
	console.log($("#chart").remove());

	
	$("#chart").remove();
	$('#statistics').eq(0).append('<canvas id ="chart"> </canvas>');
	
	var barChartData3 = {

			labels : chartLabels3,

			datasets : [

				{

					label : '상품',

					fillColor : "rbga(151,187,205,0.2)",

					strokeColor : "rbga(151,187,205,1)",

					pointColor : "rbga(151,187,205,1)",

					pointStrokeColor : "#fff",

					pointHighlightFill : "#fff",

					pointHighlightStroke : "rbga(151,187,205,1)",

					data : chartData3

				

			}

				]

	}
	
	
	$.getJSON("http://localhost:8282/admin/getStatistics3", function(data){

		

		$.each(data, function(inx, obj){

			chartLabels3.push(obj.product_name);
			chartData3.push(obj.sales);
			
			console.log(obj.product_name);

		});

		createChart();

		console.log("create Chart3")

	});




	function createChart(){

		var ctx = document.getElementById("chart").getContext("2d");

		LineChartDemo = Chart.Bar(ctx,{

			data : barChartData3,

			options :{

				scales : {

					yAxes : [{

						ticks :{

							beginAtZero : true

						}

					}]

				}

			}

		})



	}

});



});
</script>
	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />
	





</body>

</html>
