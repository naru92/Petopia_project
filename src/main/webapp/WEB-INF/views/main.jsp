<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Petopia</title>


<style type="text/css">





.d-block {
  padding-top: 64px;
  display: block;
}

.register_mypet_banner {
  padding-left: 0;
}

.class-desc {
  margin: 0 auto;
  height: 80PX;
  overflow: hidden;
}

.dropbtn {
  color: white;
  padding: 0px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.ss {
  margin-top: 15px;
  margin-bottom: 15px;
  overflow: visible;
}

.mypet_reg {
  width: 88% !important;
  padding-left: 25px !important;
  padding-right: 25px !important;
}

.girdscc {
  margin-right: 15% !important;
  margin-left: 320px !important;
}

.girdscc2 {
  margin-right: 14% !important;
  padding: 0 !important;
}

.girdscc3 {
  margin-right: 16% !important;
}

.swiper-button-next {
  top: 35% !important
}

.swiper-button-prev {
  top: 35% !important
}

.swiper-container {
  color: black;
  width: 100%;
  height: 100%;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;
  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.page-wrapper {
  min-height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;

  button {
    padding: 20px;
    border: none;
    background: lighten(#292d48, 65);
    position: relative;
    outline: none;
    border-radius: 5px;
    color: #292d48;
    font-size: 18px;

    . cart-item {
      position: absolute;
      height: 24px;
      width: 24px;
      top: -10px;
      right: -10px;

      &: before {
        content: '1';
        display: block;
        line-height: 24px;
        height: 24px;
        width: 24px;
        font-size: 12px;
        font-weight: 600;
        background: #2bd156;
        color: white;
        border-radius: 20px;
        text-align: center;
      }
    }

    & .sendtocart {
      .cart-item {
        display: block;
        animation: xAxis 1s forwards cubic-bezier(1.000, 0.440, 0.840, 0.165);

        &: before {
          animation:
            yAxis 1s alternate forwards cubic-bezier(0.165,
              0.840,
              0.440,
              1.000);
        }
      }
    }
  }
}

.cart {
  position: fixed;
  top: 20px;
  right: 20px;
  width: 50px;
  height: 50px;
  background: #292d48;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 5px;

  i {
    font-size: 25px;
    color: white;
  }

  &:before {
    content: attr(data-totalitems);
    font-size: 12px;
    font-weight: 600;
    position: absolute;
    top: -12px;
    right: -12px;
    background: #2bd156;
    line-height: 24px;
    padding: 0 5px;
    height: 24px;
    min-width: 24px;
    color: white;
    text-align: center;
    border-radius: 24px;
  }

  & .shake {
    animation: shakeCart .4s ease-in-out forwards;
  }
}

@ keyframes xAxis {
  100% {
    transform: translateX(calc(50vw - 105px));
  }
}

@ keyframes yAxis {
  100% {
    transform: translateY(calc(-50vh + 75px));
  }
}

@ keyframes shakeCart {
  25% {
    transform: translateX(6px)
  }

  50 % {
    transform:
      translateX (-4px);
  }

  75 % {
    transform:
      translateX (2px);
  }

  100 % {
    transform:
      translateX (0);
  }
(

2px

)
;
}

#rightSide {
  position: absolute;
  top: 547px;
  left: 50%;
  margin: 0 0 0 510px;
}

#rightSide #right_zzim {
  position: fixed;
  top: 680px;
  left: 65%;
  margin-left: 510px;
  border: 1px solid #B0B5BD;
  width: 120px;
  height: 150px;
}

#rightSide #right_zzim div {
  text-align: center;
}

#rightSide #right_zzim div.recTit {
   
  line-height: 1.5em;
  padding: 5px;
  color: white;
  background-color: #505A69;
}

#right_zzim #recentCnt {
  color: yellow;
}

#rightSide #right_zzim ul {
  min-height: 20px;
}

#rightSide #right_zzim li {
  color: black;
  text-align: center;
  padding: 5px;
  position: relative;
}
#right_zzim ul p {
   color:black;
}

#rightSide #right_zzim ul li img {
  border: 1px solid #ccc
}

#right_zzim .detail {
  display: none;
  position: absolute;
  top: 3px;
  right: 20px;
  xheight: 40px;
  xpadding: 15px 11px 0;
  xbackground: #404a59;
  color: #fff;
  xtext-align: left;
  white-space: nowrap;
}


.cursor-heart{
cursor: pointer;
}
.cursor-heart:hover{
color: : red !important;
}

#right_zzim li:hover .detail {
  display: block
}

#right_zzim li .btn_delete {
  position: absolute;
  top: 3px;
  right: -1px;
  width: 11px;
  height: 11px;
  background: url(/img/sp.png) no-repeat -193px -111px;
  text-indent: -9000px;
}

#right_zzim #currentPage {
  color: #505A69;
  font-weight: bold
}

#right_zzim #totalPageCount {
  color: #CBC8D2;
  font-weight: bold
}

.noData {
  color: #ccc;
  text-align: center;
  margin-top: 25px !important;
}
}

#paging {
  display: ;
  position: relative;
  line-height: 1em;
}

#paging .btn_prev {
  position: absolute;
  top: 125px;
  left: 4px;
  width: 13px;
  height: 11px;
  background: url(/petopia/images/btn_arrow_left_web.png) no-repeat;
  background-size : 5px, 5px;
  text-indent: -9000px;
  display: inline-block;
}

#paging .btn_next {
  position: absolute;
  top: 125px;
  right: -5px;
  width: 13px;
  height: 11px;
  background: url(/petopia/images/btn_arrow_right_web.png) no-repeat;
  background-size : 5px, 5px;
  text-indent: -9000px;
  display: inline-block;
}


</style>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
   crossorigin="anonymous">
<link rel="stylesheet" href="/petopia/css/menu_test2.css">
<link rel="stylesheet" href="/petopia/css/nomalize.css">
<link rel="stylesheet" href="/petopia/css/index.css">
<link rel="stylesheet" href="/petopia/css/main-homepage.css">
<!-- Custom styles for this template -->
<script src="https://kit.fontawesome.com/f1def33959.js"
   crossorigin="anonymous"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
   href="/petopia/images/petopia_logomini.png">
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>


</head>

<body>

   <header>
      <!-- Header Start -->
      <div class="header-area">
         <div class="main-header header-sticky">
            <div class="container-fluid">
               <div class="menu-wrapper">
                  <div class="links">
                     <sec:authorize access="isAnonymous()">
                        <a href="/joinAgree" class="link_text">회원가입</a>
                        <a href="/login" class="link_text">로그인</a>
                        <div class="dropdown">

                           <a href="#" class="link_text dropbtn">고객센터</a>
                           <div class="dropdown-content">
                              <a href="${root }notice?board_id=${notice_info.board_id}">공지사항</a>
                              <a href="${root }board/qna?board_id=${qna_info.board_id}">문의하기</a>
                           </div>

                        </div>
                     </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_MEMBER')">
                        <a href="/member/mypage" class="link_text">마이페이지</a>
                        <a href="/login/logoutProcess" class="link_text">로그아웃</a>
                        <div class="dropdown">
                           <a href="#" class="link_text dropbtn">고객센터</a>
                           <div class="dropdown-content">
                              <a href="${root }notice?board_id=${notice_info.board_id}">공지사항</a>
                              <a href="${root }board/qna?board_id=${qna_info.board_id}">문의하기</a>
                           </div>
                        </div>
                     </sec:authorize>
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="/admin/main" class="link_text">관리자페이지</a>
                        <a href="/login/logoutProcess" class="link_text">로그아웃</a>
                        <div class="dropdown">
                           <a href="#" class="link_text dropbtn">고객센터</a>
                           <div class="dropdown-content">
                              <a href="${root }notice?board_id=${notice_info.board_id}">공지사항</a>
                              <a href="${root }board/qna?board_id=${qna_info.board_id}">문의하기</a>
                           </div>
                        </div>
                     </sec:authorize>
                  </div>


                  <nav class="header-nav">
                     <div id="leftmenuToggle" class="leftmenuToggle">
                        <input type="checkbox" /> <span></span> <span></span> <span></span>
                        <ul id="leftmenu" class="hoverEvent">
                           <div class="adiv">
                              <li><a href="petstagram?board_id=${petsta_info.board_id}">펫★그램</a></li>
                              <li><a href="main">펫shop</a></li>
                              <li><a href="donation">기부</a></li>
                              <li><a href="mypage"><i class="fas fa-paw"></i> MY</a></li>
                           </div>
                        </ul>
                     </div>
                     <!-- Logo -->
                     <div class="logo">
                        <a href="main"><img src="/petopia/images/petopia_logo.png" alt=""></a>
                     </div>
                  </nav>

                  <!-- Main-menu -->
                  <div class="main-menu d-none d-lg-block">
                     <nav>
                        <ul id="navigation">
                           <li><a href="petstagram?board_id=${petsta_info.board_id}">펫★그램</a></li>
                           <li><a href="main">펫shop</a></li>
                           <li><a href="donation">기부</a></li>
                           <li><a href="mypage"><i class="fas fa-paw"></i> MY</a></li>
                        </ul>
                     </nav>
                  </div>
                  <!-- Header Right -->
                  <div class="search">
                 <form id="searchForm" action="/shop/search" method="get">
                     <input type="text" name="keyword" class="searchForm" placeholder="검색어를 입력해주세요."
                        aria-label="Recipient's username"
                        aria-describedby="button-addon2">
                     <button class="searchBtn" type="submit">
                        <i class="fas fa-search"></i>
                     </button>
                   
                     <button class="wishBtn" onclick="location.href='order/wishList';">
                        <i class="fas fa-heart"></i>
                     </button>
                     <button class="cartBtn" onclick="location.href='order/Cart';">
                        <i class="fas fa-shopping-cart"></i>
                     </button>
                     </form>
                  </div>

                  <!-- Mobile Menu -->
                  <div class="col-12">
                     <div class="mobile_menu d-none d-lg-block"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
            
   </header>
   <!-- Header End -->

   <hr />
   <div class="row">
 	
 
                  <div class="container-side">
                     <div class="grid">
                        <div class="row">
                           <div class="col-3">
                              <!-- category -->
                              <nav class="category">
                                 <div class="ctghead">
                                    <h3>
                                       <i class="ti-list"></i>펫shop
                                 </div>

                                 <ul class="ctgul">
                                    <li class="ctgli"><a href="#" class="ctga"><i
                                          class="ti-user"></i>신상품</a></li>

                                    <li class="ctgli"><a href="#" class="ctga"><i
                                          class="ti-user"></i>베스트</a></li>

                                    <li class="ctgli"><a href="#" class="ctga"><i
                                          class="ti-user"></i>이벤트</a></li>

                                    <li class="ctgli"><a href="#" class="ctga "> <i
                                          class="ti-write"></i> 카테고리 <i class="ti-angle-down down "></i>
                                    </a>
                                       <ul class="ctgulChild">
                                          <li class="ctgliChild"><a href="" class="ctgaChild">사료</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">간식</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">위생/배변</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">미용/목욕</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">급식/급수기</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">장난감/훈련</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">하우스/이동장</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">패션/의류</a></li>
                                          <li class="ctgliChild"><a href="" class="ctgaChild">목줄/하네스</a></li>
                                       </ul></li>
                                 </ul>
                              </nav>
                           </div>
                        </div>
                     </div>
                  </div>
   </div>

   

      <!-- 첫번째 컨테이너 플루이드 끝-->

      <!-- 중단시작 -->

      <div class="container-fluid mypet_resgister_div">
      <div class="col-md-12 ">
         <div class="container-fluid high_banner">
                  <div id="carousel-2" class="carousel slide carousel-fade"
                     data-ride="carousel" data-interval="3000">
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-2" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-2" data-slide-to="1"></li>
                        <li data-target="#carousel-2" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner" role="listbox">

                        <div class="carousel-item active">
                           <a href="https://bootstrapcreative.com/"> <img
                              src="https://dummyimage.com/1000x400/444/"
                              alt="responsive image" class="d-block img-fluid" width="100%">

                              <div class="carousel-caption">
                                 <div>
                                    <h2>Digital Craftsmanship</h2>
                                    <p>We meticously build each site to get results</p>
                                    <span class="btn btn-sm btn-outline-secondary">Learn
                                       More</span>
                                 </div>
                              </div>
                           </a>
                        </div>
                        <!-- 상단 끝 -->


                        <div class="carousel-item">
                           <a href="https://bootstrapcreative.com/"> <img
                              src="https://dummyimage.com/1000x400/444/"
                              alt="responsive image" class="d-block img-fluid" width="100%">

                              <div
                                 class="carousel-caption justify-content-center align-items-center">
                                 <div>
                                    <h2>Every project begins with a sketch</h2>
                                    <p>We work as an extension of your business to explore
                                       solutions</p>
                                    <span class="btn btn-sm btn-outline-secondary">Our
                                       Process</span>
                                 </div>
                              </div>
                           </a>
                        </div>
                        <!-- /.carousel-item -->
                        <div class="carousel-item">
                           <a href="https://bootstrapcreative.com/"> <img
                              src="https://dummyimage.com/1000x400/444/"
                              alt="responsive image" class="d-block img-fluid" width="100%">


                              <div
                                 class="carousel-caption justify-content-center align-items-center">
                                 <div>
                                    <h2>Performance Optimization</h2>
                                    <p>We monitor and optimize your site's long-term
                                       performance</p>
                                    <span class="btn btn-sm btn-secondary">Learn How</span>
                                 </div>
                              </div>
                           </a>
                        </div>
                        <!-- /.carousel-item -->
                     </div>
                     <!-- /.carousel-inner -->
                     <a class="carousel-control-prev" href="#carousel-2" role="button"
                        data-slide="prev"> <span class="carousel-control-prev-icon"
                        aria-hidden="true"></span> <span class="sr-only">Previous</span>
                     </a> <a class="carousel-control-next" href="#carousel-2"
                        role="button" data-slide="next"> <span
                        class="carousel-control-next-icon" aria-hidden="true"></span> <span
                        class="sr-only">Next</span>
                     </a>
                  </div>
         
         </div>
            <div class="row container-fluid mypet_reg ">
               <article class="map_">
                  <section calss="register_mypet_banner">
                     <div>
                        <h6>함께하는 반려 동물이 있으신가요?</h6>
                        <h4>반려동물을 등록해주세요</h4>
                        <button>펫 등록</button>
                     </div>
                  </section>
               </article>
            </div>
            <hr width="88%">
      </div>
      
      


         <div class="container girdscc3">
         
            <div class="col-md-12">
               <p id="product_title">
                  <p>
            
            </div>
            <div class="row">
               <div class="roadmap-title">
                  <p id="product_title">&nbsp이달의 추천상품</p>
                  <a id=allList href="">전체보기</a>
               </div>
               
         <!--반복 돌릴 곳  -->
               <c:forEach var='md' varStatus="status" items="${md_product}">
               <c:choose>
               <c:when test="${!empty md}">
               <div class="col-lg-6 col-md-6 mb-4 nopaddingcard ">
                  <div class="card h-40 itembox1">
                     <a href="product"><img class="card-img-top" id="listAttach${status.index}" src="#" alt="상품이미지"></a>
                        <input type="hidden" name="product_idx" value="${md.product_idx}">
                        <input type="hidden" class="cookiefileName" value="${md.productVOList.get(0).fileName}" />
                        
                           
                        <div class="class-skill">
                              <div class="class-type">${md.product_name}</div>
                              <div class="class-format"><button id="addWish"><i class="fas fa-heart cursor-heart"></i></button></div>

                           </div>
                           <div class="class-desc col-10">
                              <div class="class-title md">${md.product_price } 원</div>
                              <div class="class-detail">${md.product_detail_info }</div>
                           </div>
                           <button class="btn btn-3 btn-3a icon-cart" id="addCart">
                           <i class="fa fa-shopping-cart"></i> 장바구니</button>
                        
                  </div>
                  
               </div>
               
               <form>
               <input type="hidden" id="md_filetype${status.index}"
                        value="${md.productVOList.get(0).filetype}" />
               <input type="hidden" id="md_uuid${status.index}"
                        value="${md.productVOList.get(0).uuid}" />
               <input type="hidden" id="md_uploadPath${status.index}"
                        value="${md.productVOList.get(0).uploadPath}" />
               <input type="hidden" id="md_fileName${status.index}" name="fileName"
                        value="${md.productVOList.get(0).fileName}" />
               </form>
               </c:when>
               </c:choose>
               <c:choose>
               <c:when test="${empty md}">
                  <div class="col-lg-6 col-md-6 mb-4 nopaddingcard ">
                  <div class="card h-40 itembox1">
                  
                           <div class="class-desc col-10">
                              <div class="class-detail">데이터가 없습니다.</div>
                           </div>
                        
                        
                  </div>
               </div>
               </c:when>
               </c:choose>
               </c:forEach>
               
               <input type="hidden" id="size1" value="${fn:length(md_product)}" />
         <!--  -->
         
            </div>

            <div class="row">
               <section>

      
                  <div class="roadmap-title">
                     &nbsp인기제품 <a id=allList href="">전체보기</a>
                  </div>
                  <!-- 인기제품 반복문 돌릴곳 Start -->
                  <div class="swiper-container mySwiper">
                     <div class="swiper-wrapper">
                  <c:forEach var='popular_product' varStatus="status" items="${popular_product}">
                  <c:choose>
                  <c:when test="${!empty popular_product}">
                        <div class="swiper-slide">
                           <div class="card h-40 ss">

                              <input type="hidden" name="product_idx" value="${popular_product.product_idx}"> 
                              <input type="hidden" class="cookiefileName" name="fileName" value="${popular_product.productVOList.get(0).fileName}" />
                                 
                              <img src="#"
                                    alt="테스트 이미지" class="class-image" id="listAttach2${status.index}"  width= />
                              <div class="class-skill">
                                 <div class="class-type">${popular_product.product_name}</div>
                                    <div class="class-format"><button id="addWish"><i class="fas fa-heart cursor-heart"></i></button></div>
                              </div>
                              <div class="class-desc col-10">
                                 <div class="class-title popular">${popular_product.product_price} 원</div>
                                 <div class="class-detail">${popular_product.product_detail_info}</div>
                              </div>
                           <button class="btn btn-3 btn-3a icon-cart" id="addCart">
                                    <i class="fa fa-shopping-cart"></i> 장바구니</button>
                              
                              <div class="page-wrapper"></div>

                           </div>
                        </div>
                        
               <form>
               <input type="hidden" id="p_filetype${status.index}"
                                 value="${popular_product.productVOList.get(0).filetype}" />
               <input type="hidden" id="p_uuid${status.index}"
                                 value="${popular_product.productVOList.get(0).uuid}" />
               <input type="hidden" id="p_uploadPath${status.index}"
                                 value="${popular_product.productVOList.get(0).uploadPath}" />
               <input type="hidden" id="p_fileName${status.index}" name="fileName"
                                 value="${popular_product.productVOList.get(0).fileName}" />
               </form>
               </c:when>
               </c:choose>
               </c:forEach>
               
               <c:choose>
               <c:when test="${empty popular_product}">
                  
                        <p align="center">데이터가 없습니다</p>
                        
               </c:when>
               </c:choose>
               
               
                           <input type="hidden" id="size2" value="${fn:length(popular_product)}" />
                     <!-- 인기제품 반복문 돌릴곳 끝 END -->
                     
                     </div>
                     <br>
                     <div class="swiper-button-next"></div>
                     <div class="swiper-button-prev"></div>
                  </div>
               </section>


            </div>

            <div class="row">
               <!--row end-->
               <div class="roadmap-title">
                  &nbsp신상품 <a id=allList href="">전체보기</a>
               </div>

               <div class="swiper-container mySwiper">
                  <div class="swiper-wrapper">
                  
                  <c:forEach var='new_product' varStatus="status" items="${new_product}">
                  <c:choose>
                  <c:when test="${!empty new_product}">
                     <div class="swiper-slide">
                        <div class="card ss">
                        <input type="hidden" name="product_idx" value="${new_product.product_idx}"> 
                        <input type="hidden" class="cookiefileName" name="fileName" value="${new_product.productVOList.get(0).fileName}" />
                        
                           <img src="/petopia/images/product_1.jpg"
                                 alt="테스트 이미지" class="class-image" id="listAttach3${status.index}" width= />
                           <div class="class-skill">
                              <div class="class-type">${new_product.product_name}</div>
                              <div class="class-format"><button id="addWish"><i class="fas fa-heart cursor-heart"></i></button></div>
                           </div>
                           <div class="class-desc col-10">
                              <div class="class-title new">${new_product.product_price} 원</div>
                              <div class="class-detail">${new_product.product_detail_info}</div>
                           </div>
                           <button class="btn btn-3 btn-3a icon-cart" id="addCart">
                                 <i class="fa fa-shopping-cart"></i> 장바구니</button>
                        </div>
                     </div>
               
               <form>
            
               <input type="hidden" id="n_filetype${status.index}"
                              value="${new_product.productVOList.get(0).filetype}" />
               <input type="hidden" id="n_uuid${status.index}"
                              value="${new_product.productVOList.get(0).uuid}" />
               <input type="hidden" id="n_uploadPath${status.index}"
                              value="${new_product.productVOList.get(0).uploadPath}" />
               <input type="hidden" id="n_fileName${status.index}" name="fileName"
                              value="${new_product.productVOList.get(0).fileName}" />
               </form>
               </c:when>
               </c:choose>
            </c:forEach>
            <c:choose>
               <c:when test="${empty new_product}">
                  
                        <p align="center">데이터가 없습니다</p>
                        
               </c:when>
            </c:choose>
                        <input type="hidden" id="size3" value="${fn:length(new_product)}" />
                  </div>
                  <br>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
               </div>
            </div>
            <div class="row">
               <!--row end-->
               <div class="roadmap-title">
                  &nbsp단독상품 <a id=allList href="">전체보기</a>
               </div>
               <div class="swiper-container mySwiper">
                  <div class="swiper-wrapper">

               <c:forEach var='single_product' varStatus="status"
                        items="${single_product}">
                  <c:choose>
                     <c:when test="${!empty single_product}">
                     <div class="swiper-slide">
                        <div class="card ss">
                        <input type="hidden" name="product_idx" value="${single_product.product_idx}"> 
                        <input type="hidden" class="cookiefileName" name="fileName" value="${single_product.productVOList.get(0).fileName}" />
                        
                           <img src="/petopia/images/11356_originalView_01802971.jpg"
                                 alt="테스트 이미지" class="class-image" id="listAttach4${status.index}" width= />
                           <div class="class-skill">
                              <div class="class-type">${single_product.product_name}</div>
                                <div class="class-format"><button id="addWish"><i class="fas fa-heart cursor-heart"></i></button></div>
                           </div>
                           <div class="class-desc col-10">
                              <div class="class-title single">${single_product.product_price} 원</div>
                              <div class="class-detail">${single_product.product_detail_info}</div>
                           </div>
                              <input type="hidden" id="cart_product_idx"
                                 value="<c:out value='${single_product.product_idx}' />">
                           <button class="btn btn-3 btn-3a icon-cart" id="addCart">
                                 <i class="fa fa-shopping-cart"></i> 장바구니</button>
                        </div>
                     </div>
               <form>
               <input type="hidden" id="s_filetype${status.index}"
                              value="${single_product.productVOList.get(0).filetype}" />
               <input type="hidden" id="s_uuid${status.index}"
                              value="${single_product.productVOList.get(0).uuid}" />
               <input type="hidden" id="s_uploadPath${status.index}"
                              value="${single_product.productVOList.get(0).uploadPath}" />
               <input type="hidden" id="s_fileName${status.index}" name="fileName"
                              value="${single_product.productVOList.get(0).fileName}" />
               </form>
               </c:when>
         </c:choose>      
            </c:forEach>
            <c:choose>
               <c:when test="${empty single_product}">
                  
                        <p align="center">데이터가 없습니다</p>
                        
               </c:when>
            </c:choose>
                        <input type="hidden" id="size4" value="${fn:length(single_product)}" />
                     
                  </div>
                  <br>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
               </div>
            </div>

            

         </div>
      </div>


   


     <!-- 장바구니 모달-->
         <div id="addCartModal" class="modal fade" role="dialog">
     <div class="modal-dialog">
   
       <!-- Modal content-->
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title">장바구니</h4>
         </div>
         <div class="modal-body">
           <p>장바구니에 상품이 추가되었습니다. 장바구니로 이동하시겠습니까?</p>
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-default"
                  data-dismiss="modal">닫기</button>
           <button type="button" class="btn btn-warning">이동</button>
         </div>
       </div>
   
     </div>
   </div>
   
   
      
      <div id="rightSide">
         <div id="right_zzim">

            <div class="recTit">
               최근 본 상품 <span id=recentCnt></span>
            </div>

            <ul></ul>
            <!-- 본 상품이 뿌려질 부분  -->

            <div id="paging">
               <a class="btn_prev" style="cursor: pointer">이전</a><span
               id="currentPage"></span><span id="totalPageCount"></span><a
               class="btn_next" style="cursor: pointer">다음</a>
            </div>

         </div>

      </div>
      <footer>
         <div class="container-fluid">

            <img src="/petopia/images/petopia_logomini.png"> </br>
            <p>PETOPIA</p>
            </br>
            <p>서비스 이용약관 | 개인정보 처리방침 | 입점/제휴 문의</p>
            </br>
            <p>Naru Juhee Ahram Hansol Hana</p>
            <p>Bitcamp Jongno</p>
            </br>
            <p>&copy Creative 2021-08</p>


         </div>
      </footer>



      <a id="backtotop"></a>

      <script type="text/javascript">
		$.cookie('itemList',null);
  
         $(document).ready(function() {
        	   var member_id = "${not_member}";
               var product_no ="";
               var imageName="";
         
               if($.cookie('itemList') == null){
               var itemList = [];   
               }else{
            	var itemList = [];    
                itemList = JSON.parse($.cookie('itemList'));
               
               }
               
               console.log(itemList);
            if($("#noData").length == 0 && itemList == "null" ){
               $("#right_zzim ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');
               $("#paging").hide();
               $("#recentCnt").text('');
               
            }else if(itemList !=  "null") {
               var Cpage;   // 현재 페이지 
               var pagingSize = 1;   // 원하는 페이지 사이즈로 조정하세용 
               function chkRecent(a){
               var itemID = JSON.parse($.cookie('itemList'));
               $("#right_zzim ul").html('');    // 일단 Ul 내용 지우기... 
               if(itemID) {
                  //var list =  itemID.split(',');
                  var totcount = itemID.length ;   //
                  var totpage = Math.ceil(totcount / pagingSize) *1;
                  
                  console.log('totcount = ' +  totcount + "totpage = " + totpage);
                  
                  Cpage = (totpage >= a )? a:1;
                  Cpage = (Cpage <1)? totpage:Cpage;
                  console.log('현재페이지 = ' + Cpage);
                  var start = (Cpage-1) * pagingSize;    
               
                  for (i = start ; i <= start+(pagingSize-1) ;i++){
                  var thisItem = itemID[i];
                     if(thisItem){
                        var itemId = thisItem.product_idx;
                        var itemImg = thisItem.fileName;
                     $("#right_zzim ul").append('<li><a href="#" target="_top"><img src="/petopia/images/'+itemImg+'" width="75" border=1></a><div class="detail"><a href="javascript:removeRecentItem(\''+thisItem+ Cpage +'\')" class="btn_delete">삭제</a></div></li>')
                     
                     }
                  }
                  $("#paging").show();
               }else{
                  $("#right_zzim ul").append('<li class="noData">최근 본 상품이<br> 없습니다.</p>');
                  $("#paging").hide();
                  $("#recentCnt").text('');
               }
               updateRecentPage(totcount, Cpage);
            }
            chkRecent(1);
               function removeRecentItem(itemname){
                  var itemID = getCookie("itemlist"+"["+ Cpage +"]");
                  itemID = itemID.replace(itemname+"&","");         
                  setCookie("itemID",itemID,1);
                  chkRecent(Cpage);
               }
               function updateRecentPage(totcount,Cpage){  
                  console.log('최근본 상품갱신')
                  $("#recentCnt").text(totcount);  
                  $("#totalPageCount").text("/"+Math.ceil((totcount / pagingSize) *1)); 
                  if(Math.ceil((totcount / pagingSize) *1) < Cpage){
                  $("#currentPage").text(Math.ceil((totcount / pagingSize) *1));
                  }else{
                  $("#currentPage").text(Cpage);  //
                  }
               }
               $(".btn_next").on('click',function(){
               chkRecent(Cpage + 1);
               });
               
               $(".btn_prev").on('click',function(){
               chkRecent(Cpage - 1);
               });
               function checkCookie() {
                   var itemList = JSON.parse($.cookie('itemList'));
               
                  if (itemList){
                     if (itemList != "" && itemList != null) {
                        if ( itemList.length < 1 ){ //값이 없으면 
                              itemlist.push(product)
                         }
                     } else {
                        if (itemList == "" || itemList == null) {
                           itemlist.push(product)
   
                        }
                     }
                  }
               }
               checkCookie();
            }
            
         var itemList =[];
         $(".class-detail").on('click', function(e){
               product_no = $(this).parent().parent().children('input').val();
               imageName = $(this).parent().parent().children('.cookiefileName').val();
              
               var product = {
                  "product_idx" : product_no,
                  "fileName" : imageName
               }
               
               itemList.push(product);
               console.log(itemList);
               $.cookie('itemList', JSON.stringify(itemList));
               
               var Cpage;   // 현재 페이지 
               var pagingSize = 1;   // 원하는 페이지 사이즈로 조정하세용 
               function chkRecent(a){
               var itemID = JSON.parse($.cookie('itemList'));
               console.log(itemID.product_idx);
               $("#right_zzim ul").html('');    // 일단 Ul 내용 지우기... 
               if(itemID) {
                  //var list =  itemID.split(',');
                  var totcount = itemList.length ;   //
                  var totpage = Math.ceil(totcount / pagingSize) *1;
                  
                  console.log('totcount = ' +  totcount + "totpage = " + totpage);
                  
                  Cpage = (totpage >= a )? a:1;
                  Cpage = (Cpage <1)? totpage:Cpage;
                  console.log('현재페이지 = ' + Cpage);
                  var start = (Cpage-1) * pagingSize;    
               
                  for (i = start ; i <= start+(pagingSize-1) ;i++){
                  var thisItem = itemID[i];
                     if(thisItem){
                        var itemId = thisItem.product_idx;
                        var itemImg = thisItem.fileName;
                     $("#right_zzim ul").append('<li><a href="#" target="_top"><img src="/petopia/images/'+itemImg+'" width="75" border=1></a><div class="detail"><a href="javascript:removeRecentItem(\''+thisItem+ Cpage +'\')" class="btn_delete">삭제</a></div></li>')
                     }
                  }
                  $("#paging").show();
               }else{
                  $("#right_zzim ul").append('<li class="noData">최근 본 상품이<br> 없습니다.</p>');
                  $("#paging").hide();
                  $("#recentCnt").text('');
               }
               updateRecentPage(totcount, Cpage);
            }
            chkRecent(1);
               function removeRecentItem(itemname){
                  var itemID = getCookie("itemlist"+"["+ Cpage +"]");
                  itemID = itemID.replace(itemname+"&","");         
                  setCookie("itemID",itemID,1);
                  chkRecent(Cpage);
               }
               function updateRecentPage(totcount,Cpage){  
                  console.log('최근본 상품갱신')
                  $("#recentCnt").text(totcount);  
                  $("#totalPageCount").text("/"+Math.ceil((totcount / pagingSize) *1)); 
                  if(Math.ceil((totcount / pagingSize) *1) < Cpage){
                  $("#currentPage").text(Math.ceil((totcount / pagingSize) *1));
                  }else{
                  $("#currentPage").text(Cpage);  //
                  }
               }
               $(".btn_next").on('click',function(){
               chkRecent(Cpage + 1);
               });
               
               $(".btn_prev").on('click',function(){
               chkRecent(Cpage - 1);
               });
               function checkCookie() {
                   var itemList = $.cookie("itemList");
               
                  if (itemList){
                     if (itemList != "" && itemList != null) {
                        if ( itemList.length < 1 ){ //값이 없으면 
                              itemlist.push(product);
                         }
                     } else {
                        if (itemList == "" || itemList == null) {
                           itemlist.push(product);
   
                        }
                     }
                  }
               }
               checkCookie();
            });
   
            //MD 추천 이미지
            for(var i = 0; i < $("#size1").val(); i++) {
               var imgSrci = null;
               var uuid = $("#md_uuid" + i).val();
               var uploadPath = $("#md_uploadPath" + i).val();
               var fileName = $("#md_fileName" + i).val();
               if($("#md_filetype" + i).val()) {
                  imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
                  imgSrci = "/display?fileName=" + imgSrci;
               } else {
                  imgSrci = '../../resources/images/attach.png';
               }
            
               
               $("#listAttach" + i).attr("src", imgSrci);
            }
            //인기 상품이미지
            
            for(var i = 0; i < $("#size2").val(); i++) {
               var imgSrci = null;
               var uuid = $("#p_uuid" + i).val();
               var uploadPath = $("#p_uploadPath" + i).val();
               var fileName = $("#p_fileName" + i).val();
               if($("#p_filetype" + i).val()) {
                  imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
                  imgSrci = "/display?fileName=" + imgSrci;
               } else {
                  imgSrci = '../../resources/images/attach.png';
               }
            
               
               $("#listAttach2" + i).attr("src", imgSrci);
            }
            
            //신상품이미지
            
            for(var i = 0; i < $("#size3").val(); i++) {
               var imgSrci = null;
               var uuid = $("#n_uuid" + i).val();
               var uploadPath = $("#n_uploadPath" + i).val();
               var fileName = $("#n_fileName" + i).val();
               if($("#n_filetype" + i).val()) {
                  imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
                  imgSrci = "/display?fileName=" + imgSrci;
               } else {
                  imgSrci = '../../resources/images/attach.png';
               }
            
               
               $("#listAttach3" + i).attr("src", imgSrci);
            }
            //단독상품 이미지
            
            for(var i = 0; i < $("#size4").val(); i++) {
               var imgSrci = null;
               var uuid = $("#s_uuid" + i).val();
               var uploadPath = $("#s_uploadPath" + i).val();
               var fileName = $("#s_fileName" + i).val();
               if($("#s_filetype" + i).val()) {
                  imgSrci = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
                  imgSrci = "/display?fileName=" + imgSrci;
               } else {
                  imgSrci = '../../resources/images/attach.png';
               }
            
               
               $("#listAttach4" + i).attr("src", imgSrci);
            }
            var swiper = new Swiper(".mySwiper", {
               slidesPerView : 4,
               spaceBetween : 20,
               slidesPerGroup : 4,
               loop : true,
               loopFillGroupWithBlank : true,
               pagination : {
                  el : ".swiper-pagination",
                  clickable : true,
               },
               navigation : {
                  nextEl : ".swiper-button-next",
                  prevEl : ".swiper-button-prev",
               },
            });
            $("#addCart").on("click", function(e) {
               e.preventDefault();
				var cartVO = null;
               if(member_id == null){
               
               var cartVO = {
                  product_idx : $("input[name=product_idx]").val(),
              	  amount : $("#productsAmount").val()
               }
               
               }else{
            	   console.log(member_id);
            	   var cartVO ={
            			product_idx : $("input[name=product_idx]").val(),
            			amount : $("#productsAmount").val(),
            			member_id: member_id
            			   
            	   }
               }
               $.ajax({
                  type : 'post',
                  url : '/addCart',
                  data : JSON.stringify(cartVO),
                  contentType : "application/json; charset=utf-8",
                  dataType : 'text',
                  success : function(result, status, xhr) {
                     console.log('add cart ' + result);
                     alert("상품이 장바구니에 추가되었습니다");
                  }
               });
            });
            
            $("#addWish").on("click", function(e) {
               e.preventDefault();
               var cartVO = {
                  product_idx : $("input[name=product_idx]").val()
               
               }
               $.ajax({
                  type : 'POST',
                  url : '/addWishList',
                  data : JSON.stringify(cartVO),
                  contentType : "application/json; charset=utf-8",
                  dataType : 'text',
                  success : function(result, status, xhr) {
                     console.log('add wish ' + result);
               
                     alert("상품이 위시리스트에 추가되었습니다");
                  },error: function(request, status, error){
                       alert("이미 등록된 상품입니다.");
                    }
               });
            });
            
            //세자리 콤마
            function numberFormat(inputNumber) {
                 return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            
            // 가격 콤마삽입
            for(var i = 0; i < $("#size1").val(); i++) {
               var price = $(".md").html()
               console.log(price);
               $(".md").html(numberFormat(price));
            }
            for(var i = 0; i < $("#size2").val(); i++) {
               var price = $(".popular").html()
               console.log(price);
               $(".popular").html(numberFormat(price));
            }
            for(var i = 0; i < $("#size3").val(); i++) {
               var price = $(".new").html()
               console.log(price);
               $(".new").html(numberFormat(price));
            }
            for(var i = 0; i < $("#size4").val(); i++) {
               var price = $(".single").html()
               console.log(price);
               $(".single").html(numberFormat(price));
            }
			
        	$(".ctgli:has(.ctgulChild)").click(function(e) {
        		e.preventDefault();
        		//li_HAVE_Child-hasShowed-hasSlideD
        		if ($(this).hasClass('showed')) {
        			//-x-hasSlideD
        			$(this).children('.ctgulChild');
        		} else {
        			$('.ctgulChild');
        			$('.ctgli').removeClass('showed');
        			$(this).addClass('showed');
        			$(this).children('.ctgulChild').slideToggle();
        		}
        	});
        	$('.ctgli').click(function() {
        		$(this).toggleClass('wtok');
        	});
        	
        	$("#searchForm .searchBtn").on("click", function(e) {
        		var searchForm = $('#searchForm');

        		if (!searchForm.find("input[name='keyword']").val()) {
        			alert("검색할 제품의 이름을 입력해주세요");
        			return false;
        		}
        		});
         });
      </script>


      <script src="/petopia/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
      <script src="/petopia/js/mainindex.js"></script>
      <script src="/petopia/js/petopia.js"></script>
   </body>

</html>