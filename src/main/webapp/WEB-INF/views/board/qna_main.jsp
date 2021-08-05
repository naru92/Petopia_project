<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<title>Petopia</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<%@include file="../include/default_css.jsp"%>


<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400');
@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean');
@font-face {
    font-family: 'NEXON Lv1 Gothic OTF Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
   font-family: 'NEXON Lv1 Gothic OTF';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
   font-weight: normal;
   font-style: normal;
}
@font-face {
    font-family: 'NEXON Lv2 Gothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*
# font-family: 'MapoFlowerIsland';
강조: font-family: 'Black Han Sans', sans-serif;
보통: font-family: 'NEXON Lv1 Gothic OTF';

*/


.ssss{
position: relative;
z-index=-1;
}

* {
box-sizing: inherit !important;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border: 0px solid silver;

}

.main {
   position: relative; 
}
body {
	


  font-family: 'NEXON Lv1 Gothic OTF Light';
  font-size: 1rem;
  line-height: 1.2rem;
  color: #181818;
  letter-spacing: 0.1px;
}

h1 {
  font-family: 'S-CoreDream-9Black';
  font-size: 2.3rem;
  line-height: 3rem;
  letter-spacing: 0.5rem;
  text-transform: uppercase;
}

h2 {
  font-family: 'NEXON Lv1 Gothic OTF';
  font-size: 2.4rem;
  line-height: 2.4rem;
}

h3 {
  font-size: 1.4rem;
  line-height: 1.4rem;
}


h4 {
  font-size: 1rem;
  line-height: 1rem;
}

h5 {
  font-size: 0.7rem;
  line-height: 0.7rem;
}
a{
  color: black;
  text-decoration: none;

}
/*
화살표
주요 색       네이버          카카오톡
c80a1e       1ec800          f5e14b,333333

바 색         톡톡
fcf8ed        23c545
dda4ab        ffffff
b89c87
*/
/*<body style="overflow-x:hidden; overflow-y:auto;">*/

/*  start */
#header {
  width: 100%;
  min-width: 1200px;
  text-transform: uppercase;
  cursor: pointer;
  background: #fff;
  height: 120px;
  overflow: hidden;
  position: relative;
  top: 0;
  display: block;
  transition: top 0.4s;
  z-index: 9999;
  padding-top: 2rem;
}

#header section {
  width: 1200px;
  margin: 0 auto;
  display: flex;
  
}

#header section> :first-child {
  float: left;
  transition: 0.5s;
}

#header section> :first-child:hover {
  opacity: 0.8;
}

#header section> :first-child img {
  width: 7rem;
  margin-top: 1.3rem;
}

.lap-nav {
  display: inline-block;
  cursor: pointer;
  margin-left: 2rem;
}

.lap-nav>ul>li {
  float: right;
  width: 6rem;
  height: 23rem;
  line-height: 3rem;
  font-size: 0.9rem;
  text-align: center;
  list-style: none;
}

.lap-nav>ul>li>a {
  width: 10rem;
  padding: 0.5rem 0.7rem;
  line-height: 4.5rem;
  font-size: 1.2rem;
  color: #222222;
  transition: 0.6s;
  border-bottom: 2px solid #fff;
  font-family: 'NEXON Lv1 Gothic OTF';
}

.lap-nav>ul>li ul {
  width: 100%;
  height: 100%;
  background: #fff;
}

.clearfix>li>ul>li {
  display: block;
  color: #222222aa;
  border-bottom: 2px solid #fff;
  transition: 0.4s;
}

.lap-nav>ul>li>a:hover {
  border-bottom: 2px solid #c80a1e;
}

.lap-nav>ul>li>a:hover,
.lap-nav>ul>li>ul>li:hover {
  color: #c80a1e;
}


.sample input {
  border-bottom: 1px solid #ccc;
  font-size: 1rem;
  height: 3rem;
  padding: 0 0.4rem;
  position: absolute;
  width: 50%;
}
.sample input:focus {``
  outline: none;
}
button.btn-search, button.btn-reset {
  background: none;
  border: none;
  height: 3rem;
  font-size: 1.2rem;
  padding: 0.1rem;
  position: absolute;
  width: 3rem;
  cursor:pointer;
}
.sample {
  height: 5rem;
  position: absolute;
  width: 30%;
  margin-top: 0.5rem;
  right: 7rem;
}
.sample.two input {
  right: 0;
  transition: all 0.3s ease-in-out;
  width: 13rem;
}
.sample.two input:focus {
  width: 20rem;
}
.sample.two input:focus ~ button.btn-search {
  color: #000000dd;
  background: none;
}
.sample.two input:focus ~ button.btn-reset {
  right: -2rem;
  opacity: 1;
}
.sample.two button {
  transition: all 0.3s ease-in-out;
}
.sample.two button.btn-search {
  background:none;
  height: 3rem;
  right: 0;
  top: 0.1rem;
  transition: all 0.3s ease-in-out;
  width: 3rem;
}
.sample.two button.btn-reset {
  cursor:pointer;
  background: none;
  border: 1px solid #ccc;
  border-radius: 50%;
  font-size: 1rem;
  height: 1.5rem;
  line-height: 1.2rem;
  padding: 0;
  right: 0;
  top: 0.9rem;
  width: 1.5rem;
  z-index: -1;
  opacity: 0;
}
.fa-shopping-cart{
  position: absolute;
  right: 5.5rem;
  top: 3.3rem;
  font-size: ;
  cursor: pointer;
}
.fa-user{
  position: absolute;
  right: 3rem;
  top: 1.5rem;
  font-size: 1.3rem;
  cursor: pointer;
}
#side-menu{
    position: fixed;
    right: 20px;
    bottom: 5rem;
    transition: all .5s;
    z-index: 99;
  }

  #side-menu ul li{
    list-style: none;
    font-size: 1.2rem;
    opacity: .6;
  }
.kaka{
display: flex;
padding: 0.7rem 1.5rem;
background: #222;
margin-bottom: 1rem;
color: #fff;
font-size: 0.8rem;
line-height: 1.5rem;
border-radius: 50px;
transition: .3s;
}
.kaka:hover{
background: #e3d256;
cursor: pointer;
color: #333;
}
.kaka img{
transition: .3s;
}
.kaka:hover img,
.kaka.hover img{
filter: brightness(0);
}
.kaka p{
padding-left: 0.5rem;
font-family: 'NEXON Lv2 Gothic Bold';
}
.tictok{
display: flex;
padding: 0.7rem 1.5rem;
background: #222;
color: #fff;
font-size: 0.8rem;
line-height: 1.5rem;
border-radius: 50px;
transition: .3s;
}
.tictok:hover{
background: #23c545;
cursor: pointer;
}
.tictok p{
padding-left: 0.5rem;
font-family: 'NEXON Lv2 Gothic Bold';
}
.kaka img{
width: 1.5rem;
height: 1.5rem;
}
.tictok img{
width: 1.5rem;
height: 1.5rem;
}

main h1{
  font-size: 3rem;
  text-align: center;
  padding-top: 12rem;
  padding-bottom: 4rem;
}

.chat{
  width: 999px;
  display: flex;
  justify-content: space-between;
  padding-top : 50px;
  margin: 0 auto;
}

.chat section {
  height: 250px;
  width: 28%;
  text-align: center;
  background: #eeeeee77;
  padding: 5rem 1rem;
  cursor: pointer;
}
.bigimg {
  width: 6rem;
  height: 6rem;
  border: 2px solid #222;
  border-radius: 50%;
  margin: 0 auto;
  position: relative;
}
.chat_img svg{
  width: 3.5rem;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.write_img svg{
  width: 3.5rem;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.call svg{
  width: 2rem;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.chat section h2{
  font-size: 1rem;
    font-family: 'NEXON Lv2 Gothic Bold';
    padding:1rem 0;
}
.chat section p{
  font-size: 1rem;
  line-height: 1.5rem;
}

.chat_btn{
    font-family: 'NEXON Lv2 Gothic Bold';
  padding-top: 2rem;
}

 .chat_btn2{
 padding-top: 10px;
   font-family: 'NEXON Lv2 Gothic Bold';
  padding-top: 2rem;
}
.fa-arrow-right{
  padding-left: 1rem;
  transition: .4s;
}

.chat section:hover .fa-arrow-right,
.chat section.hover .fa-arrow-right{
  transform: translateX(1rem);
}

.qus{
  margin-top: 30px;
  padding-top: 3.5rem;
  width: 1000px;
  margin: 0 auto;
  position:; 
z-index:-1;
}
.qus h1{
  padding-top: 2rem;
  font-size: 2rem;
  letter-spacing: .1rem;
  padding-bottom: 2rem;
  padding-left: 2rem;
}
.qus section {
	
  width: 100%;
  border-bottom: 1px solid #22222222;
}
.qus section ul li{

  list-style: none;
  font-size: 1rem;
  line-height: 2rem;
}
.qus section ul{

  display: flex;
  text-align: center;
}
.qus section ul li:nth-child(1){
  width: 15%;
}
.qus section ul li:nth-child(2){
  width: 68%;
}
.qus section ul li:nth-child(3){
  width: 10%;
}
.qus section ul li:nth-child(4){
  width: 7%;

}


.qus label {
  width: 100%;
  border-bottom: 1px solid #22222222;
}
.qus label ul li{
  list-style: none;
  font-size: 1rem;
  line-height: 1rem;
}
.qus label ul{
  display: flex;
  padding: 2rem 0;
}
.qus label ul li:nth-child(1){
  width: 15%;
  text-align: center;
}
.qus label ul li:nth-child(2){
  width: 68%;
  padding-left: 3rem;
}
.qus label ul li:nth-child(3){
  width: 10%;
  text-align: center;
}
.qus label ul li:nth-child(4){
  width: 7%;
  text-align: center;
}
.talk{
  background: #eeeeee55;
}
.talk p{
  padding-bottom: 2rem;
  padding-left: 9rem;
  line-height: 1.7rem;
}
.talk p:nth-child(1){
  padding-top: 5rem;
}
.talk p:last-child{
  padding-bottom: 5rem;
}

.qus >:nth-child(7){
  padding-top: 0;
}
.read-more-state {
  display: none;
}

.read-more-target {
  opacity: 0;
  max-height: 0;
  font-size: 0;
  transition: .1s ease;
}

.read-more-state:checked ~  .read-more-target {
  opacity: 1;
  font-size: inherit;
  max-height: 999em;
}


.read-more-trigger {
  cursor: pointer;
  display: inline-block;
  position: relative;
  z-index: 1;
}
.yun{
  opacity: .8;
}
.mainpage{
  margin-top: 1rem;
  text-align: center;
}
.hoya{
  font-size: 1rem;
  font-family: 'NEXON Lv1 Gothic OTF';
  font-weight: 600;
  line-height: 2rem;
}
footer {
  background : #385663;
  padding : 70px 0;
  margin-top: 11rem;
}

footer section {
  width : 1200px;
  margin : 0 auto;
  display : flex;
  justify-content : space-between;
}

footer section >:nth-child(1) {
  width : 200px;
}

footer section >:nth-child(1) img {
  width : 90px;
}

footer section >:nth-child(2) {
  width : 680px;
}

footer section >:nth-child(2) {
 display : flex;
  padding : 0 1% 0 50px;
}

footer section >:nth-child(2) div {
  width : 33%;
}

footer section >:nth-child(2) h5 {
  font-size : 1rem;
    padding-bottom: 1rem; 
}

footer section >:nth-child(2) a {
  color : #777;
  display : block;
  font-size: .8rem;
  line-height : 2rem;
}
footer section >:nth-child(2) a:hover{
    text-decoration: underline;
}
footer section >:nth-child(3) {
  width : 400px;
  text-align : right;
  padding : 0 30px;
}

footer section >:nth-child(3) i {
  font-size : 1.5rem;
  padding-left: 20px;
    padding-bottom: 15px;
    padding-top: 15px;
  cursor : pointer;
}

footer section >:nth-child(3) i:hover {
  color : #999;
}

footer section >:nth-child(3) >:nth-child(2) {
  margin-top : 10px;
  color : #777;
}
</style>
</head>
<body>
	<header>
		<%@include file="../include/default_header.jsp"%>
	</header>


<div>
<div class="col-2">
			<%@include file="../include/default_sidebar.jsp"%>
	</div>
	
	

	
<main>
  <article class="qus">
  <h1>FAQ</h1>
  <section>
    <ul class="yun">
      <li>구분</li>
      <li>제목</li>
      <li>등록일</li>
      <li>조회수</li>
    </ul>
  </section>
<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-1" />
  <label for="post-1" class="ing read-more-trigger">
    <ul>
      <li>회원</li>
      <li>회원/정보 아이디와 비밀번호가 생각나지 않아요. 어떻게 찾을 수 있나요?</li>
      <li>2018.03.13</li>
      <li>7890</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>고객님의 아이디 찾기 또는 비밀번호 찾기를 확인할 수 있는 방법은 아래와 같습니다.<br></p>
<p>---- 아이디 찾기 ----.<br>
(1)로그인 페이지 하단에 [아이디찾기] 선택<br></p>
<p>(2)본인인증으로 찾기 또는 이메일로 찾기로 확인 가능</p>
<p>---- 비밀번호 찾기 ----<br>
  (1)로그인 페이지 하단에 [비밀번호 찾기] 선택<br></p>
  <p>(2)아이디 입력 및 본인인증으로 찾기 또는 아이디 입력 및 이메일로 찾기로 확인 가능<br></p>
<p>*본인인증을 하지 않은 기존 회원의 경우 , 본인인증(휴대폰 인증번호 받기)으로 비밀번호 찾기는 불가합니다. <br>
 -> 해당 경우 이메일로 비밀번호 찾기 시도 부탁드립니다. </p>
  </section>
</div>

<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-2" />
  <label for="post-2" class="ing read-more-trigger">
    <ul>
      <li>포인트문의</li>
      <li>펫토피아</li>
      <li>2018.03.14</li>
      <li>7497</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>안녕하세요. 고객님</p>
  <p>현재 일룸에서는 해체/포장,재조립만 가능합니다.<br>
  (이사 전 해체 및 포장 , 이삿짐 운반 , 이사 당일 또는 이사 후 조립)</p>
  <p>일룸가구에 대해서는 이사전 분해 후 포장이 가능하니 이삿짐 업체에 운반만 요청하시고 재조립은<br>
  이사 당일 또는 그 이후에 이루어 집니다.</p>
  <p>비용은 제품의 종류와 수량에 따라 다르게 책정되므로,<br>
고객센터 직원(1577-5670)과 상세히 상담하시고 일정과 비용을 확인 하신 후 접수하여 주십시오.</p>
  <p>쇼핑몰 내 고객센터> 분해/설치 안내 로도 접수가 가능합니다. </p>
  </section>
 
</div>

<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-3" />
  <label for="post-3" class="ing read-more-trigger">
    <ul>
      <li>교환/반품</li>
      <li>펫토피아</li>
      <li>2018.03.14</li>
      <li>6025</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>일룸 제품의 무상보증기간은 1년 입니다.</p>
  <p>단종된 제품이라 하더라도 A/S용 비축자재(약 3년)가 있으므로, 서비스를 받으실 수 있습니다.<br>
  일부 사양이 변경되었다면 구사양으로는 A/S가 불가능하며, 비슷한 형태의 신사양부품으로 교체가 가능합니다.</p>
  </section>
</div>

<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-4" />
  <label for="post-4" class="ing read-more-trigger">
    <ul>
      <li>배송/시공</li>
      <li>펫토피아</li>
      <li>2018.03.06</li>
      <li>4895</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>대부분의 가구업체의 경우 폐가구 서비스를 하고 있지 않으며, 부득이 할 경우 유상으로 진행하고 있습니다.</p>
  <p>일부 사제가구업체는 일룸과 달리 판매가격에 폐가구를 수거하고 처리하는 비용을 포함하고 있습니다.<br>
원칙적으로 폐기물의 처리는 폐기물처리 운반법에서 지정하는 자만이 가능합니다. </p>
  <p>일룸은 합리적인 가격의 책정을 위해 폐기물 수거-처리 비용을 포함하고 있지 않습니다.<br>
  폐기물의 수거 및 폐기 절차는 지역내 구청이나 해당구 지역 중고품 수거센터 혹은 재활용 센터에 문의해주시기 바랍니다.</p>
  <p>또한, 이사 및 이동으로 인해 일룸제품을 분해/설치하기 위해서는 품목별, 거리별 등에 따라 비용이 발생하며,<br>
자세한 사항은 고객센터 1577-5670으로 연락 또는 고객센터>분해/설치 안내를 참조해주시기 바랍니다.</p>
  </section>
</div>

<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-5" />
  <label for="post-5" class="ing read-more-trigger">
    <ul>
      <li>상품</li>
      <li>펫토피아</li>
      <li>2018.03.13</li>
      <li>3755</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>일룸 의자는 대부분 오염방지가공이 된 천소재로 되어 쉽게 오염이 되지는 않지만,<br>
    실수로 인하여 천오염이 되었을 경우에는 가급적 전문 세탁 업체에 의뢰하시는 것이 좋습니다.</p>
  <p>의자 등판에 있는 지퍼의 경우 의자 제작 공정상 부착되는 것이어서,<br>
지퍼를 열어 커버를 벗겨 낸 후 세탁을 할 수는 있지만 세탁 후에 다시 커버를 씌우는 것이 불가능 합니다.</p>
  <p>따라서 전문 세탁업체에 의뢰하여 천을 벗겨내지 않고 세탁을 하시거나<br>
  그렇지 않으실 경우에는 등,좌판을 교체하시는것이 바람직 합니다.</p>
  <p>※ 등좌판 교체 등좌판을 판매하는 경우에는 대리점을 통하여 구매하실수 있습니다.</p>
  </section>
</div>


<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-6" />
  <label for="post-6" class="ing read-more-trigger">
    <ul>
      <li>상품</li>
      <li>펫토피아</li>
      <li>2018.03.15</li>
      <li>3313</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>일룸은 정직한 가격으로 정찰제를 고수합니다.
    언뜻, 많은 세일을 통해서 소비자분들이 싸게 구입했다는 만족감을 드릴수 있을지는 몰라도,<br>
    한편으로는 동시에 ’그렇다면 원가는 얼마일까, 남는게 없다는 장사꾼의 말은 거짓말’ 이라는 의심을 들게 합니다.
 </p>
  <p>일룸은 세일이나 재고를 예상하고 정가를 높이 책정하지도, 가격을 낮추려 부자재의 질을 떨어뜨리지도 않습니다. <br>
합리적인 신뢰가 있는 가격으로, 1년 내내 어느 대리점에서든지 같은 가격으로 제품을 구입하실수 있습니다.</p>
  </section>
</div>

<div class="">
  <input type="checkbox" class="read-more-state" id="post-7" />
  <label for="post-7" class="ing read-more-trigger">
    <ul>
      <li>교환/반품</li>
      <li>펫토피아</li>
      <li>2018.03.14</li>
      <li>3275</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>배송전 이나 조립전에 취소를 요청하시면 최대한 반품을 수용하고 있습니다.</p>
  <p>단, 설치시공 후에는 목재가구 특성상 반품이 불가능합니다.</p>
  <p>한 번이라도 조립이 되어졌던 제품은 재조립이 일부 불가능하며(끼워 맞춤형), <br>
  재조립한다 하더라도 미관상 좋지 못한 부분이 발생하므로 반품을 해 드리지 않고 있습니다.</p>
  <p>이 점 양해해 주시길 바랍니다.</p>
  </section>
</div>

<div class="sss">
  <input type="checkbox" class="read-more-state" id="post-8" />
  <label for="post-8" class="ing read-more-trigger">
    <ul>
      <li>교환/반품</li>
      <li>펫토피아</li>
      <li>2018.03.13</li>
      <li>3229</li>
    </ul>
  </label>
  <section class="talk read-more-target">
    <p>그렇지 않습니다.</p>
  <p>현재 일룸 제품에 표시된 모든 가격은 일체의 배송 설치비가 포함된 것입니다.<br>
(그러나 제주도, 울릉도 등 산간지역은 배송비가 추가발생할수 있습니다.)</p>
  <p>저희 일룸은 퍼시스 그룹의 물류 시스템을 같이 사용하고 있어 <br>
  고객님들께 타사에 비해 훨씬 경쟁력 있는 배송 설치 서비스가 가능합니다.</p>
  </section>
</div>
</article>

  <div class="chat">
    <section>
      <div class="bigimg chat_img">
        <svg viewBox="0 0 56 44" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M2 2H33V8H35V2C35 0.895431 34.1046 0 33 0H2C0.895431 0 0 0.89543 0 2V22C0 23.1046 0.89543 24 2 24H5.5C5.77614 24 6 24.2239 6 24.5V29.8759V30.1985V31.2023V31.619C6 32.0866 6.58473 32.2983 6.88411 31.9391L7.15085 31.619L7.7935 30.8478L8 30.6L13.2002 24.3598C13.3901 24.1318 13.6716 24 13.9684 24H33C34.1046 24 35 23.1046 35 22V16H33V22H13.9684C13.078 22 12.2337 22.3955 11.6637 23.0794L8 27.4759V24.5C8 23.1193 6.88071 22 5.5 22H2V2Z" fill="black"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M54 13H23V19H21V13C21 11.8954 21.8954 11 23 11H54C55.1046 11 56 11.8954 56 13V33C56 34.1046 55.1046 35 54 35H50.5C50.2239 35 50 35.2239 50 35.5V40.8759V41.1985V42.2023V42.619C50 43.0866 49.4153 43.2983 49.1159 42.9391L48.8491 42.619L48.2065 41.8478L48 41.6L42.7998 35.3598C42.6099 35.1318 42.3284 35 42.0316 35H23C21.8954 35 21 34.1046 21 33V27H23V33H42.0316C42.922 33 43.7663 33.3955 44.3363 34.0794L48 38.4759V35.5C48 34.1193 49.1193 33 50.5 33H54V13Z" fill="black"/>
  </svg>
      </div>

      <h2>문의하기</h2>
      <p>질문, 문의사항을 남겨주시면<br>신속하게 답변 해드립니다.</p>
      <div class="chat_btn">
        <p><a href="${root}qna_register?board_id=${param.board_id}">작성하기</a><i class="fas fa-arrow-right"></i></p>

      </div>
    </section>
    <section>
      <div class="bigimg write_img">
       
      <svg id="Layer_1" height="512" viewBox="0 0 128 128" width="512" xmlns="http://www.w3.org/2000/svg" data-name="Layer 1">
      <path d="m112.655 4.75h-97.31a1.75 1.75 0 0 0 -1.745 1.75v115a1.75 1.75 0 0 0 1.75 1.75h97.31a1.75 1.75 0 0 0 1.75-1.75v-115a1.75 1.75 0 0 0 -1.755-1.75zm-1.75 115h-93.805v-111.5h93.81z"/>
      <path d="m35.25 34.942h57.5a1.75 1.75 0 0 0 1.75-1.75v-9a1.751 1.751 0 0 0 -1.75-1.75h-57.5a1.751 1.751 0 0 0 -1.75 1.75v9a1.75 1.75 0 0 0 1.75 1.75zm1.75-9h54v5.5h-54z"/><path d="m35.25 52.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/>
      <path d="m35.25 61.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/>
      <path d="m35.25 70.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/><path d="m35.25 79.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/><path d="m35.25 88.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/><path d="m35.25 97.594h57.5a1.75 1.75 0 0 0 0-3.5h-57.5a1.75 1.75 0 0 0 0 3.5z"/>
      <path d="m81.985 103.094h-35.97a1.75 1.75 0 1 0 0 3.5h35.97a1.75 1.75 0 1 0 0-3.5z"/></svg>
  </svg>
      </div>

      <h2>문의내역</h2>
      <p>회원님의 문의하신 내용을<br>확인 할 수 있습니다.</p>
      <div class="chat_btn">
        <p><a href="${root}my_qna?board_id=${param.board_id}">바로가기</a><i class="fas fa-arrow-right"></i></p>

      </div>
    </section>
    <section>
      <div class="bigimg call">
        <svg viewBox="0 0 34 60" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M3 2H31C31.5523 2 32 2.44772 32 3V57C32 57.5523 31.5523 58 31 58H3C2.44772 58 2 57.5523 2 57V3C2 2.44772 2.44772 2 3 2ZM0 3C0 1.34315 1.34315 0 3 0H31C32.6569 0 34 1.34315 34 3V57C34 58.6569 32.6569 60 31 60H3C1.34315 60 0 58.6569 0 57V3ZM6 7C5.44772 7 5 7.44772 5 8C5 8.55229 5.44772 9 6 9H28C28.5523 9 29 8.55229 29 8C29 7.44772 28.5523 7 28 7H6ZM5 45C5 44.4477 5.44772 44 6 44H28C28.5523 44 29 44.4477 29 45C29 45.5523 28.5523 46 28 46H6C5.44772 46 5 45.5523 5 45ZM17 54C18.1046 54 19 53.1046 19 52C19 50.8954 18.1046 50 17 50C15.8954 50 15 50.8954 15 52C15 53.1046 15.8954 54 17 54Z" fill="black"/>
  </svg>
      </div>


      <h2>고객센터</h2>
      <p>질문, 요청사항을 신속하게 <br>전화로 답변 해드립니다.</p>
      <div class="chat_btn">
        <p>번호안내<i class="fas fa-arrow-right"></i></p>

      </div>
    </section>
  </div>
</main>
</div>

<!-- ps modal -->
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
				
	<footer>
		<%@include file="../include/default_footer.jsp"%>
	</footer>

	<%@include file="../include/default_sidebar_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
		
			$('#myModal').on('shown.bs.modal', function () {
				  $('#myInput').trigger('focus')
				})
	
		
		});
		
	</script>
</body>
</html>






