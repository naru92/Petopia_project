<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Petopia</title>

  <!-- Bootstrap core CSS -->
  <link href="/petopia/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/petopia/css/nomalize.css">
  <link rel="stylesheet" href="/petopia/css/index.css">
  <link href="/petopia/css/shop-homepage.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <script src="https://kit.fontawesome.com/f1def33959.js" crossorigin="anonymous"></script>
<%@include file="include/default_css.jsp"%>


</head>

<body>

	<header>
		<%@include file="include/default_header.jsp"%>
	</header>

<hr />

  <div class="container-fluid">


	



    <div class="container-fluid maginContainer">
	
 <%@include file="include/default_sidebar.jsp"%>


        <div class="container">
          <div class="col-md-12">
            <div id="carousel-2" class="carousel slide carousel-fade" data-ride="carousel" data-interval="3000">
              <ol class="carousel-indicators">
                <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-2" data-slide-to="1"></li>
                <li data-target="#carousel-2" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">

                <div class="carousel-item active">
                  <a href="https://bootstrapcreative.com/">

                    <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid" width="100%">

                    <div class="carousel-caption">
                      <div>
                        <h2>Digital Craftsmanship</h2>
                        <p>We meticously build each site to get results</p>
                        <span class="btn btn-sm btn-outline-secondary">Learn More</span>
                      </div>
                    </div>
                  </a>
                </div>
                <!-- 상단 끝 -->


                <div class="carousel-item">
                  <a href="https://bootstrapcreative.com/">
                    <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid" width="100%">

                    <div class="carousel-caption justify-content-center align-items-center">
                      <div>
                        <h2>Every project begins with a sketch</h2>
                        <p>We work as an extension of your business to explore solutions</p>
                        <span class="btn btn-sm btn-outline-secondary">Our Process</span>
                      </div>
                    </div>
                  </a>
                </div>
                <!-- /.carousel-item -->
                <div class="carousel-item">
                  <a href="https://bootstrapcreative.com/">

                    <img src="https://dummyimage.com/1000x400/444/" alt="responsive image" class="d-block img-fluid" width="100%">


                    <div class="carousel-caption justify-content-center align-items-center">
                      <div>
                        <h2>Performance Optimization</h2>
                        <p>We monitor and optimize your site's long-term performance</p>
                        <span class="btn btn-sm btn-secondary">Learn How</span>
                      </div>
                    </div>
                  </a>
                </div>
                <!-- /.carousel-item -->
                
              </div>
              <!-- /.carousel-inner -->
              <a class="carousel-control-prev" href="#carousel-2" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carousel-2" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>

          </div>
        </div>
      </div>
      <!-- 첫번째 컨테이너 플루이드 끝-->

      <!-- 중단시작 -->

      <div class="container-fluid">
        <div class="container">
          <div class="row col-sm-12">
            <article class="map_">
              <section>
                <div>
                  <h6>함께하는 반려 동물이 있으신가요?</h6>
                  <h4>반려동물을 등록해주세요</h4>
                  <button>펫 등록</button>
                </div>
              </section>
            </article>
          </div>
        </div>



        <div class="container">
          <div class="row">

            <div class="col-md-12">이번주 신상
            
            </div>


            <div class="col-lg-6 col-md-6 mb-4 ">
              <div class="card h-40 itembox1">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              </div>
            </div>

            <div class="col-lg-6 col-md-6 mb-4">
              <div class="card h-40 itembox1">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              </div>
            </div>


          </div>


          <div class="row">
            <section>
              <div class="inner">
                <div class="roadmap-container">
                  <div class="roadmap-title-container">
                    <div class="roadmap-title">인기제품
                      <a>전체보기</a>
                    </div>
                    <div class="arrow-container">
                      <i class="fas fa-chevron-circle-left slide-prev"></i>
                      <i class="fas fa-chevron-circle-right slide-next"></i>
                    </div>
                  </div>
                  <ul class="class-list">
                    <li class="class-card">
                      <a href="http://school.fastcampus.co.kr/blog/all/113/" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/blog.jpg" alt="잔재미코딩 블로그" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">핫 신상</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">상품1</div>
                            <div class="class-detail">상품입니다</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/60212672?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/broadIT3.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">누구나 쓱 읽고, 싹 이해하는 IT 핵심 기술</div>
                            <div class="class-detail">입문자를 위한 IT 큰 그림 이해하기</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="hhttp://www.yes24.com/Product/Goods/43504370?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/pythonbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리스트1</div>
                            <div class="class-detail">리스트1</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/1461768?OzSrank=8" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">리스트1</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 커널 프로그래밍</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/3369009" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook2.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 운영 체제의 이해와 개발</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </section>


          </div>

          <div class="row">
            <section>
              <div class="inner">
                <div class="roadmap-container">
                  <div class="roadmap-title-container">
                    <div class="roadmap-title">MD추천
                      <a>전체보기</a>
                    </div>
                    <div class="arrow-container">
                      <i class="fas fa-chevron-circle-left slide-prev"></i>
                      <i class="fas fa-chevron-circle-right slide-next"></i>
                    </div>
                  </div>
                  <ul class="class-list">
                    <li class="class-card">
                      <a href="http://school.fastcampus.co.kr/blog/all/113/" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/blog.jpg" alt="잔재미코딩 블로그" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">핫 신상</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">상품1</div>
                            <div class="class-detail">입문자를 위한 IT 큰 그림 이해하기</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/60212672?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/broadIT3.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">누구나 쓱 읽고, 싹 이해하는 IT 핵심 기술</div>
                            <div class="class-detail">입문자를 위한 IT 큰 그림 이해하기</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="hhttp://www.yes24.com/Product/Goods/43504370?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/pythonbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리스트1</div>
                            <div class="class-detail">리스트1</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/1461768?OzSrank=8" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">리스트1</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 커널 프로그래밍</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/3369009" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook2.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 운영 체제의 이해와 개발</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </section>
          </div>

          <!--row end-->

          <div class="row">
            <section>
              <div class="inner">
                <div class="roadmap-container">
                  <div class="roadmap-title-container">
                    <div class="roadmap-title">재고임박
                      <a>전체보기</a>
                    </div>
                    <div class="arrow-container">
                      <i class="fas fa-chevron-circle-left slide-prev"></i>
                      <i class="fas fa-chevron-circle-right slide-next"></i>
                    </div>
                  </div>
                  <ul class="class-list">
                    <li class="class-card">
                      <a href="http://school.fastcampus.co.kr/blog/all/113/" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/blog.jpg" alt="잔재미코딩 블로그" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">학습방법</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">IT는 배우는 방법을 익혀야합니다</div>
                            <div class="class-detail">비전공자가 IT를 배우는 전략</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/60212672?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/broadIT3.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">누구나 쓱 읽고, 싹 이해하는 IT 핵심 기술</div>
                            <div class="class-detail">입문자를 위한 IT 큰 그림 이해하기</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="hhttp://www.yes24.com/Product/Goods/43504370?OzSrank=1" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/pythonbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">왕초보를 위한 파이썬</div>
                            <div class="class-detail">입문자를 위한 파이썬 프로그래밍</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/1461768?OzSrank=8" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 커널 프로그래밍</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/3369009" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook2.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 운영 체제의 이해와 개발</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li class="class-card">
                      <a href="http://www.yes24.com/Product/Goods/3369009" target="_blank">
                        <img src="https://www.fun-coding.org/style/images/linuxbook2.png" alt="잔재미코딩 서적" class="class-image" />
                        <div class="class-container">
                          <div class="class-skill">
                            <div class="class-type">출판서적</div>
                            <div class="class-format">♡</div>
                          </div>
                          <div class="class-desc">
                            <div class="class-title">리눅스 운영 체제의 이해와 개발</div>
                            <div class="class-detail">고급 개발자를 위한 리눅스 커널 분석과 개발</div>
                          </div>
                        </div>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>


      <div class="quick">

        <div class="icon4">
          <span>장바구니</span>
          <span><a href="#">0</a></span>
        </div>
        <div class="icon5">
          <span>최근 본 상품</span>
          <br>
          <a href="#"><img src="http://vivienne.kr/web/upload/goodymall40/layout/btn_recent_prev.gif" alt=""><img src="http://vivienne.kr/web/upload/goodymall40/layout/btn_recent_next.gif" alt=""></a>
        </div>

      </div>
    </div>



    <div class="container-fluid footercontainer">


     <footer>
		<%@include file="include/default_footer.jsp"%>
	</footer>
    </div>






    <a id="backtotop"></a>

    <!-- Bootstrap core JavaScript -->
    <script src="/petopia/vendor/jquery/jquery.min.js"></script>
    <script src="/petopia/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/petopia/js/index.js"></script>
    <script src="/petopia/js/petopia.js"></script>


</body>

</html>
