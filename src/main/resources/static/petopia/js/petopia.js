

/*몽블랑*/
// 헤드 네비 열리고 닫히는 기능
function openNav() {
 document.getElementById("mobile_navi_ham").style.display ="none";
 document.getElementById("mobile_navi_clo").style.display ="block";
 document.getElementById("bottom_navi").style.width ="110%";

 }

 function closeNav() {
 document.getElementById("mobile_navi_ham").style.display ="block";
 document.getElementById("mobile_navi_clo").style.display ="none";
 document.getElementById("bottom_navi").style.width ="0%";
 }

// 네비 안에 각각 메뉴 열리고 닫히는 기능 + 제이쿼리

 $("p.title").on('click', function() {
     $(this).next(".con").slideToggle(100);
   //슬라이드토글은 안보이는걸 보이게 보이는걸 안보이게함
 });

 $("span.title_").on('click', function() {
     $(this).next(".con").slideToggle(100);
 });

//스와이퍼 자동재생,네비게이션,페이지네이션 메인

   //재생, 일시정지 버튼 함수 제이쿼리
   $('.start').on('click', function () {
     swiper.autoplay.start();
     return false;
   })

   $('.stop').on('click', function () {
     swiper.autoplay.stop();
     return false;
   })

// 4개 아티클 섹션 열고 닫기
function openArticle() {
 document.getElementById("pro_open_bt").style.display ="none";
 document.getElementById("pro_close_bt").style.display ="block";
 document.getElementById("pro_imgs").style.transform ="translatex(-85%)";
 document.getElementById("pro_imgs").style.zIndex ="1";
 document.getElementById("pro_imgs_text").style.display ="block";
 document.getElementById("pro_imgs_text").style.transform ="translatex(10%)";
 document.getElementById("pro_imgs_text").style.zIndex = "0";



 }

 function closeArticle() {
     document.getElementById("pro_close_bt").style.display ="none";
     document.getElementById("pro_open_bt").style.display ="block";
     document.getElementById("pro_imgs").style.transform ="translatex(0%)";
     document.getElementById("pro_imgs_text").style.display ="none";

 }

 function openArticle_2() {
     document.getElementById("pro_open_bt_2").style.display ="none";
     document.getElementById("pro_close_bt_2").style.display ="block";
     document.getElementById("pro_imgs_2").style.transform ="translatex(-85%)";
     document.getElementById("pro_imgs_2").style.zIndex ="1";
     document.getElementById("pro_imgs_text_2").style.display ="block";
     document.getElementById("pro_imgs_text_2").style.transform ="translatex(10%)";
     document.getElementById("pro_imgs_text_2").style.zIndex = "0";


     }

     function closeArticle_2() {
         document.getElementById("pro_close_bt_2").style.display ="none";
         document.getElementById("pro_open_bt_2").style.display ="block";
         document.getElementById("pro_imgs_2").style.transform ="translatex(0%)";
         document.getElementById("pro_imgs_text_2").style.display ="none";

     }

     function openArticle_3() {
         document.getElementById("pro_open_bt_3").style.display ="none";
         document.getElementById("pro_close_bt_3").style.display ="block";
         document.getElementById("pro_imgs_3").style.transform ="translatex(-85%)";
         document.getElementById("pro_imgs_3").style.zIndex ="1";
         document.getElementById("pro_imgs_text_3").style.display ="block";
         document.getElementById("pro_imgs_text_3").style.transform ="translatex(10%)";
         document.getElementById("pro_imgs_text_3").style.zIndex = "0";


         }

         function closeArticle_3() {
             document.getElementById("pro_close_bt_3").style.display ="none";
             document.getElementById("pro_open_bt_3").style.display ="block";
             document.getElementById("pro_imgs_3").style.transform ="translatex(0%)";
             document.getElementById("pro_imgs_text_3").style.display ="none";

         }

         function openArticle_4() {
             document.getElementById("pro_open_bt_4").style.display ="none";
             document.getElementById("pro_close_bt_4").style.display ="block";
             document.getElementById("pro_imgs_4").style.transform ="translatex(-85%)";
             document.getElementById("pro_imgs_4").style.zIndex ="1";
             document.getElementById("pro_imgs_text_4").style.display ="block";
             document.getElementById("pro_imgs_text_4").style.transform ="translatex(10%)";
             document.getElementById("pro_imgs_text_4").style.zIndex = "0";


             }

             function closeArticle_4() {
                 document.getElementById("pro_close_bt_4").style.display ="none";
                 document.getElementById("pro_open_bt_4").style.display ="block";
                 document.getElementById("pro_imgs_4").style.transform ="translatex(0%)";
                 document.getElementById("pro_imgs_text_4").style.display ="none";

             }

            /*몽블랑 엔드*/

            const backToTop = document.getElementById('backtotop');

            const checkScroll = () => {
                /*
                  웹페이지가 수직으로 얼마나 스크롤되었는지를 확인하는 값(픽셀 단위로 반환)
                  https://developer.mozilla.org/ko/docs/Web/API/Window/pageYOffset
                */
                let pageYOffset = window.pageYOffset;

                if (pageYOffset !== 0) {
                    backToTop.classList.add('show');
                } else {
                    backToTop.classList.remove('show');
                }

            }

            const moveBackToTop = () => {
                if (window.pageYOffset > 0) {
                    /*
                    smooth 하게 스크롤하기
                    https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollTo
                    */
                   window.scrollTo({top: 0, behavior: "smooth"})
                }
            }

            window.addEventListener('scroll', checkScroll);
            backToTop.addEventListener('click', moveBackToTop);



//togle Start
var theToggle = document.getElementById('toggle');

// based on Todd Motto functions
// https://toddmotto.com/labs/reusable-js/

// hasClass
function hasClass(elem, className) {
  return new RegExp(' ' + className + ' ').test(' ' + elem.className + ' ');
}
// addClass
function addClass(elem, className) {
    if (!hasClass(elem, className)) {
      elem.className += ' ' + className;
    }
}
// removeClass
function removeClass(elem, className) {
  var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, ' ') + ' ';
  if (hasClass(elem, className)) {
        while (newClass.indexOf(' ' + className + ' ') >= 0 ) {
            newClass = newClass.replace(' ' + className + ' ', ' ');
        }
        elem.className = newClass.replace(/^\s+|\s+$/g, '');
    }
}
// toggleClass
function toggleClass(elem, className) {
  var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, " " ) + ' ';
    if (hasClass(elem, className)) {
        while (newClass.indexOf(" " + className + " ") >= 0 ) {
            newClass = newClass.replace( " " + className + " " , " " );
        }
        elem.className = newClass.replace(/^\s+|\s+$/g, '');
    } else {
        elem.className += ' ' + className;
    }
}
