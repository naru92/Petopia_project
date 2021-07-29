<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header Start -->
<div class="header-area">
	<div class="main-header header-sticky">
		<div class="container-fluid">
			<div class="menu-wrapper">
			
				<div class="links">
					<c:choose>
						<c:when test="${not empty sessionScope.principal}">
							<a href="/member/mypage" class="link_text">마이페이지</a>
							<a href="/member/logout" class="link_text">로그아웃</a>
							<a href="#" class="link_text">고객센터</a>
						</c:when>
						<c:otherwise>
							<a href="/member/joinAgree" class="link_text">회원가입</a>
							<a href="/member/login" class="link_text">로그인</a>
							<a href="#" class="link_text">고객센터</a>
						</c:otherwise>
					</c:choose>
				</div>

				<nav class="header-nav">
					<div id="leftmenuToggle" class="leftmenuToggle">
						<input type="checkbox" /> <span></span> <span></span> <span></span>
						<ul id="leftmenu" class="hoverEvent">
							<div class="adiv">
								<li><a href="/petstagram">펫★그램</a></li>
								<li><a href="/main">펫shop</a></li>
								<li><a href="/donation">기부</a></li>
								<li><a href="/mypage"><i class="fas fa-paw"></i> MY</a></li>
							</div>
						</ul>
					</div>
					<!-- Logo -->

					<div class="logo">
						<a href="/main"><img src="/petopia/images/petopia_logo.png" alt=""></a>
					</div>
				</nav>

				<!-- Main-menu -->
				<div class="main-menu d-none d-lg-block">
					<nav>
						<ul id="navigation">
							<li><a href="/petstagram">펫★그램</a></li>
							<li><a href="/main">펫shop</a></li>
							<li><a href="/donation">기부</a></li>
							<li><a href="/mypage"><i class="fas fa-paw"></i> MY</a></li>
						</ul>
					</nav>
				</div>
				<!-- Header Right -->
				<div class="search">
					<input type="text" class="searchForm" placeholder="검색어를 입력해주세요."
						aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="searchBtn" type="submit">
						<i class="fas fa-search"></i>
					</button>
					<button class="wishBtn" type="link">
						<i class="fas fa-heart"></i>
					</button>
					<button class="cartBtn" type="link">
						<i class="fas fa-shopping-cart"></i>
					</button>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- Header End -->
