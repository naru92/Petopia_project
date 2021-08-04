<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Petstagram</title>
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/petstagram_style.css">
<link rel="stylesheet" href="/petopia/css/contentInsertModal.css">


</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<section> <!-- Latest Products Start -->
	<div class="container">

		<!-- Nav Card -->
		<div class="container">
			<div class="profile">

				<div class="profile-image">
					<img src="/petopia/images/petstagram_profile1.jpg" alt="">
				</div>

				<div class="profile-user-settings">
					<h1 class="profile-user-name">Petstagram</h1>
				</div>

				<div class="profile-stats">
					<ul>
						<li><a href="petstagram"><span class="profile-stat-count">954</span> posts</a></li>
						<li><a href=""><span class="profile-stat-count">188</span> new posts</a></li>
						<li><a href=""><span class="profile-stat-count">50</span> hot posts</a></li>
						<li><button id="insertBtn" class="profile-stat-count">+ New posting</button></li>
					</ul>
				</div>

				<div class="profile-bio">
					<p>
						<span class="profile-real-name">Petopia_</span> 반려동물의 이야기를 남겨주세요 🐶🐱
					</p>
				</div>

			</div>
			<!-- End of profile section -->

		</div>
		<!-- End of container -->
		<div class="container">

			<div class="gallery">
				<c:forEach items="${contentList}" var="petstagram">
				<div class="gallery-item" id="contentGetImg" tabindex="0">
					<img src="https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb?w=500&h=500&fit=crop" class="gallery-image">
					<div class="gallery-item-info">
						<ul>
							<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 56</li>
							<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 2</li>
						</ul>
					</div>
				</div>
				</c:forEach>

			</div>
			<!-- End of gallery -->
		</div>
		<!-- End of container -->
	</div>
	</section>
	<br />
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>
	
	<!-- content insert Modal -->
	<div id="insertModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<h3 class="modal-title" id="insertModalLabel">새 게시물 작성</h3>
        	<span class="close">&times;</span>
		</div>
		<div class="modal-body">
			<form action="/petstagram/register" method="post" id="insertForm">
				<input type="hidden" id="inserBoardId" name="board_id" value="4">
				<input type="hidden" id="insertMemberId" name="member_id" value="dummy91">
				<div class="img-group">
					<div class="img_wrap">
						<img id="contentImg">
					</div>
					<div class="uploadDiv">
					<input type="file" id="inputImg" name='inputImg'>
					</div>
				</div>
				<div class="form-group">
					<label for="recipient-name" class="control-label">제목</label>
					<input type="text" class="form-control" id="insertContentTitle" name="content_title">
					<br>
					<label for="message-text" class="control-label">내용</label>
					<textarea class="form-control" id="insertContentText" name="content_text"></textarea>
					<br>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="submit" id="insertSubmit" class="btn btn-insert">게시하기</button>
		</div>
 	</div>
    </div>

    <script src="/petopia/js/contentInsertModal.js"></script>

  
    
    <!-- content get Modal -->
    <div id="contentModal" class="modal">
	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<h3 class="modal-title" id="contentModalLabel">게시물 보기</h3>
        	<span class="close">&times;</span>
		</div>
		<div class="modal-body">
			<form>
				<div class="img-group">
					<div class="img_wrap">
						<img id="contentGetImg">
					</div>
				</div>
				<div class="form-group">
					<label for="recipient-name" class="control-label">제목</label>
					<input type="text" class="form-control" id="insetGetTitle" name="content_title" readonly="readonly" value='<c:out value="${board.content_title}"/>'>
					<br>
					<label for="message-text" class="control-label">내용</label>
					<textarea class="form-control" id="insertGetText" name="content_text" readonly="readonly"><c:out value="${board.content_text}"/></textarea>
					<br>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="submit" id="insertSubmit" class="btn btn-success">게시하기</button>
		</div>
 	</div>
    </div>
    <script src="/petopia/js/contentGetModal.js"></script>
    

	
	
</body>
</html>