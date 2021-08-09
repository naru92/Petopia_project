<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



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
										<a href="${root }notice?board_id=2">공지사항</a>
										<a href="${root }board/qna?board_id=2">문의하기</a>
									</div>

								</div>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MEMBER')">
								<a href="/member/mypage" class="link_text">마이페이지</a>
								<a href="/login/logoutProcess" class="link_text">로그아웃</a>
								<div class="dropdown">
									<a href="#" class="link_text dropbtn">고객센터</a>
									<div class="dropdown-content">
										<a href="${root }notice?board_id=2">공지사항</a>
										<a href="${root }board/qna?board_id=2">문의하기</a>
									</div>
								</div>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<a href="/admin/main" class="link_text">관리자페이지</a>
								<a href="/logout" class="link_text">로그아웃</a>
								<div class="dropdown">
									<a href="#" class="link_text dropbtn">고객센터</a>
									<div class="dropdown-content">
										<a href="${root }notice?board_id=2">공지사항</a>
										<a href="${root }board/qna?board_id=2">문의하기</a>
									</div>
								</div>
							</sec:authorize>
						</div>
				
				<nav class="header-nav">
					<div id="leftmenuToggle" class="leftmenuToggle">
						<input type="checkbox" /> <span></span> <span></span> <span></span>
						<ul id="leftmenu" class="hoverEvent">
						<div class="adiv">
								<li><a href="/petstagram">펫★그램</a></li>
								<li><a href="/main">펫shop</a></li>
								<li><a href="/donation">기부</a></li>
								<li><a href="/member/mypage"><i class="fas fa-paw"></i> MY</a></li>
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
							<li><a href="/member/mypage"><i class="fas fa-paw"></i> MY</a></li>
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
