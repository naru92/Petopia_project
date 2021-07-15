<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=decice-width" initial-scale="1">
<title>Petstagram</title>
<!-- CSS here -->
<link rel="stylesheet" href="/petopia/css/petstagram_style.css">
<!-- default_css -->
<%@include file="../include/default_css.jsp"%>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>

	<content>
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">
            <div class="container">
                <div class="row product-btn justify-content-between">

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
                                <li><a href="petstagram.html"><span class="profile-stat-count">954</span> posts</a></li>
                                <li><a href="#"><span class="profile-stat-count">188</span> new posts</a></li>
                                <li><a href="#"><span class="profile-stat-count">50</span> hot posts</a></li>
                                <li><a href="#"><span class="profile-stat-count">+</span> posting</a></li>
                            </ul>
                        </div>
            
                        <div class="profile-bio">
                            <p><span class="profile-real-name">Petopia_</span> 반려동물의 이야기를 남겨주세요 🐶🐱</p>
                        </div>

                    </div>
                    <!-- End of profile section -->
            
                </div>
                <!-- End of container -->         
                <div class="container">
            
                    <div class="gallery">
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1511765224389-37f0e77cf0eb?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 56</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 2</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1497445462247-4330a224fdb1?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 89</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 5</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 42</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 1</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1502630859934-b3b41d18206c?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 38</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 0</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1498471731312-b6d2b8280c61?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 47</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 1</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1515023115689-589c33041d3c?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 94</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 3</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1504214208698-ea1916a2195a?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 52</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 4</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1515814472071-4d632dbc5d4a?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 66</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 2</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1511407397940-d57f68e81203?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 45</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 0</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1518481612222-68bbe828ecd1?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 34</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 1</li>
                                </ul>
                            </div>
                        </div>

                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1505058707965-09a4469a87e4?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 41</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 0</li>
                                </ul>
                            </div>
                        </div>
            
                        <div class="gallery-item" tabindex="0">
                            <img src="https://images.unsplash.com/photo-1423012373122-fff0a5d28cc9?w=500&h=500&fit=crop" class="gallery-image" alt="">
                            <div class="gallery-item-info">
                                <ul>
                                    <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 30</li>
                                    <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 2</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End of gallery -->
                    <div class="loader"></div>
                </div>
            <!-- End of container -->  
                </div>
            </div>   
        </section>   
	</content>

	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

</body>
</html>