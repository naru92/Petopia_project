<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>펫★그램 | Petopia</title>
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>

<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/petstagram_style.css">

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
				<sec:authorize access="isAnonymous()">
				<div class="profile-stats">
					<ul>
						<li><a href="petstagram"><span class="profile-stat-count">954</span> posts</a></li>
						<li><a href=""><span class="profile-stat-count">188</span> new posts</a></li>
						<li><a href=""><span class="profile-stat-count">50</span> hot posts</a></li>
						<li><a href="/login"><button id="loginInfoBtn" class="profile-stat-count">+ New posting</button></a></li>
					</ul>
				</div>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<div class="profile-stats">
					<ul>
						<li><a href="petstagram"><span class="profile-stat-count">954</span> posts</a></li>
						<li><a href=""><span class="profile-stat-count">188</span> new posts</a></li>
						<li><a href=""><span class="profile-stat-count">50</span> hot posts</a></li>
						<li><button id="insertBtn" class="profile-stat-count" 
							data-toggle="modal" data-member_id="${member_id}" data-target="#insertModalLabel">+ New posting</button></li>
					</ul>
				</div>
				</sec:authorize>
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
				<c:forEach items="${contentList}" var="c" varStatus="status">
				<div class="gallery-item contentGetImg"
						data-toggle="modal" 
						data-member_id="${c.member_id}" 
						data-content_title="${c.content_title}"
						data-content_text="${c.content_text}"
						data-content_date="${c.content_date}"
						data-content_idx="${c.content_idx}"
						data-attachList="${c.attachList[0].fileName}"
						data-target="contentModalLabel">
					<ul class="gallery-ul">	
					<li><img src="/petopia/images/${c.attachList[0].fileName}" class="gallery-image"></li>
					</ul>
					<div class="gallery-item-info">
						<ul>
							<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 56</li>
							<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 18</li>
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
	<div id="insertModal" class="modal" aria-hidden="true">
	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<h3 class="modal-title" id="insertModalLabel">새 게시물 작성</h3>
        	<span class="close">&times;</span>
		</div>
		<div class="modal-body">
			<form id="insertForm" action="/petstagram/register" method="post">
				<div class="img-group">
				
					<!--썸네일 영역-->
					<div class="uploadResult" name="attachList">
						<ul>
                        </ul>
					</div> 
					
					<div class="uploadFile">
					<input type="file" id="uploadFile" name='uploadFile' multiple>
					</div>
					<br>
					<p>* 사진은 1:1 비율로 수정됩니다.</p>
				</div>
				
				<div class="form-group">
					<label for="insertMemberId" class="control-label">작성자</label>
					<input type="text" class="form-control" name="member_id" id="insertMemberId" readonly="readonly">
					<br>
					<label for="insertContentTitle" class="control-label">제목</label>
					<input type="text" class="form-control" name="content_title" id="insertContentTitle"  placeholder="제목을 입력해주세요.">
					<br>
					<label for="message-text" class="control-label">내용</label>
					<textarea class="form-control" name="content_text" id="insertContentText" placeholder="200자 이내로 작성 가능합니다." style="resize: none" maxlength="200"></textarea>
					<br>
				</div>
				<div class="modal-footer">
					<button type="submit" id="insertSubmit">게시하기</button>
				</div>
			</form>
		</div>
		
 	</div>
    </div>

  
    
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
						<img src="/petopia/images/${c.attachList[0].fileName}" id="getContentImg">
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="getMemberId" readonly="readonly">
					<input type="text" class="form-control" id="getContentIdx" readonly="readonly">
					<input type="text" class="form-control" id="getContentDate" readonly="readonly">
					<input type="text" class="form-control" id="getContentTitle" readonly="readonly" >
					<textarea class="form-control" id="getContentText" readonly="readonly" style="resize: none"></textarea>
					<hr>
					<i class="fa fa-comments fa-fw"></i> 댓글
					<c:forEach items="${replyList}" var="r" varStatus="status">
						<ul class="reply">
							<li class="left clearfix">
						</ul>
					</c:forEach>
					<br>
					<input type="text" class="form-control" id="replyRegister">
					<input type="hidden" id="replyContentIdx">
					<button type="submit" id="replySubmit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="submit" id="modifySubmit">삭제하기</button>
			<button type="submit" id="deleteSubmit">수정하기</button>
		</div>
 	</div>
    </div>
    <script src="/petopia/js/petstagramModal.js"></script>
    
   

	
	
</body>
</html>