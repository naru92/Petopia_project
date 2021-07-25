<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
		
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
					<canvas id="userChart" width="1200" height="600"></canvas>
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



$(document).ready(
		$("#item1").hide();
		$("#item2").hide();
		$("#item3").hide();
$(function() {
	function randomColor(labels) {
		var colors = [];
		for (let i = 0; i < labels.length; i++) {
			colors.push("#" + Math.round(Math.random() * 0xffffff).toString(16));
		}
		return colors;
	}
	function makeChart(ctx, type, labels, data) {
		var myChart = new Chart(ctx, {
		    type: type,
		    data: {
		        labels: labels,
		        datasets: [{
		            label: '날짜별 게시글 등록 수',
		            data: data,
		            backgroundColor: randomColor(labels)
		        }]
		    },
		    options: {
			    responsive: false,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
	}
	
	$.ajax({
		
		
		
		type: "GET",
		url: "/admin/statistics",
		dataType : "json",
		success: function(data, status, xhr) {
			
			console.log(data);
			
			
			var labels = [];
			var myData = [];
			
			//맵안에 list 였으니 for문으로 돌린다
			$.each(data.list,function (k,v){
				
				labels.push(v.reg_date);
				myData.push(v.count);
			});

			var newLabels = labels.slice(-5);
			var newMyData = myData.slice(-5);
			// Chart.js 막대그래프 그리기
			var ctx = $('#myChart');
			makeChart(ctx, 'bar', newLabels, newMyData);
			// Chart.js 선그래프 그리기
			ctx = $('#myChart2');
			makeChart(ctx, 'line', newLabels, newMyData);
			// Chart.js 원그래프 그리기
			ctx = $('#myChart3');
			makeChart(ctx, 'pie', newLabels, newMyData);
			ctx = $('#myChart4');
			makeChart(ctx, 'doughnut', newLabels, newMyData);
		}
	});
	
});
	var test1 = ${"test1"};
	var test2 = ${"test2"};
	console.log(test1);
	console.log(test2);
	
	//통계 회원
	var context1 = document.getElementById('userChart').getContext('2d');
	var userChart = new Chart(context1, {
		type : 'bar',
		data : {
		labels : ["Red" , "Blue", "Yellow", "Green", "Orange"],
		datasets : [ {
			 backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
		hoverBackgroundColor :["#2AC1BC", "#FDD272"],
		data : [10, 23, 20, 30, 50]
		} ]
		},
			options : {
				responsive : false
			}
	});

	//통계 기부
	var context2 = document.getElementById('donationChart').getContext('2d');
	var userChart = new Chart(context2, {
		type : 'bar',
		data : {
		labels : ["Red" , "Blue", "Yellow", "Green", "Orange"],
		datasets : [ {
			 backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
		hoverBackgroundColor :["#2AC1BC", "#FDD272"],
		data : [10, 23, 20, 30, 50]
		} ]
		},
			options : {
				responsive : false
			}
	});
	//통계 주문
	var context3 = document.getElementById('orderChart').getContext('2d');
	var userChart = new Chart(context3, {
		type : 'bar',
		data : {
		labels : ["Red" , "Blue", "Yellow", "Green", "Orange"],
		datasets : [ {
			 backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
		hoverBackgroundColor :["#2AC1BC", "#FDD272"],
		data : [10, 23, 20, 30, 50]
		} ]
		},
			options : {
				responsive : false
			}
	});
	
	
	
	
	
	   $('#item1').on('click', function(event) { 
			  console.log('click')
          
			
			 

   });
	
	   });

</script>
	<c:import url="/WEB-INF/views/include/admin_list_js.jsp" />
	





</body>

</html>
