

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

/*----------------------------------------------------------------------*/
function transformNext(event) {
    const slideNext = event.target;
    const slidePrev = slideNext.previousElementSibling;

    const classList = slideNext.parentElement.parentElement.nextElementSibling;
    let activeLi = classList.getAttribute('data-position');
    const liList = classList.getElementsByTagName('li');

    // 하나의 카드라도 왼쪽으로 이동했다면, 오른쪽으로 갈 수 있음
    if (Number(activeLi) < 0) {
        activeLi = Number(activeLi) + 260;

        // 왼쪽에 있던 카드가 오른쪽으로 갔다면, 다시 왼쪽으로 갈 수 있으므로 PREV 버튼 활성화
        slidePrev.style.color = '#2f3059';
        slidePrev.classList.add('slide-prev-hover');
        slidePrev.addEventListener('click', transformPrev);

        // 맨 왼쪽에 현재 보이는 카드가, 맨 첫번째 카드라면, 오른쪽 즉, NEXT 로 갈 수 없으므로 NEXT 버튼 비활성화
        if (Number(activeLi) === 0) {
            slideNext.style.color = '#cfd8dc';
            slideNext.classList.remove('slide-next-hover');
            slideNext.removeEventListener('click', transformNext);
        }
    }

    classList.style.transition = 'transform 1s';
    classList.style.transform = 'translateX(' + String(activeLi) + 'px)';
    classList.setAttribute('data-position', activeLi);
}

function transformPrev(event) {
    // 현재 클릭 이벤트를 받은 요소, 즉 slide-prev 클래스를 가진 요소를 나타냄
    const slidePrev = event.target;
    // slide-prev 클래스를 가진 요소 다음 요소는 slide-next 클래스를 가진 요소임
    const slideNext = slidePrev.nextElementSibling;

    // ul 태그 선택
    const classList = slidePrev.parentElement.parentElement.nextElementSibling;
    let activeLi = classList.getAttribute('data-position');
    const liList = classList.getElementsByTagName('li');

  /* classList.clientWidth 는 ul 태그의 실질적인 너비
   * liList.length * 260 에서 260 은 각 li 요소의 실질 너비(margin 포함)
   * activeLi 는 data-position 에 있는 현재 위치
   * 즉, liList.length * 260 + Number(activeLi) 는 현재 위치부터 오른쪽으로 나열되야 하는 나머지 카드들의 너비
   */

  /* classList.clientWidth < (liList.length * 260 + Number(activeLi)) 의미는
   * 오른쪽으로 나열될 카드들이 넘친 상태이므로, 왼쪽으로 이동이 가능함
   */

   if (classList.clientWidth < (liList.length * 260 + Number(activeLi))) {
       // 위치를 왼쪽으로 260 이동 (-260px)
       activeLi = Number(activeLi) - 260;

       /* 위치를 왼쪽으로 260 이동 (-260px)
       * 해당 위치는 변경된 activeLi 값이 적용된 liList.length * 260 + Number(activeLi) 값임
       * 이 값보다, classList.clientWidth (ul 태그의 너비)가 크다는 것은
       * 넘치는 li 가 없다는 뜻으로, NEXT 버튼은 활성화되면 안됨
       */
      if (classList.clientWidth > (liList.length * 260 + Number(activeLi))) {
        slidePrev.style.color = '#cfd8dc';
        slidePrev.classList.remove('slide-prev-hover');
        slidePrev.removeEventListener('click', transformPrev);
      }

       slideNext.style.color = '#2f3059';
       slideNext.classList.add('slide-next-hover');
       slideNext.addEventListener('click', transformNext);
   }

   classList.style.transition = 'transform 1s';
   classList.style.transform = 'translateX(' + String(activeLi) + 'px)';
   classList.setAttribute('data-position', activeLi);
}

const slidePrevList = document.getElementsByClassName('slide-prev');

for (let i = 0; i < slidePrevList.length; i++) {
    // ul 태그 선택
    let classList = slidePrevList[i].parentElement.parentElement.nextElementSibling;
    let liList = classList.getElementsByTagName('li');

    // 카드가 ul 태그 너비보다 넘치면, 왼쪽(PREV) 버튼은 활성화하고, 오른쪽(NEXT)는 현재 맨 첫카드 위치이므로 비활성화
    if (classList.clientWidth < (liList.length * 260)) {
        slidePrevList[i].classList.add('slide-prev-hover');
        slidePrevList[i].addEventListener('click', transformPrev);
    } else {
        /* 카드가 ul 태그 너비보다 넘치지 않으면, PREV, NEXT 버튼 불필요하므로, 아예 삭제함
        태그 삭제시, 부모 요소에서 removeChild 를 통해 삭제해야 함
           따라서, 1. 먼저 부모 요소를 찾아서,
                 2. 부모 요소의 자식 요소로 있는 PREV 와 NEXT 요소를 삭제함
        */
       const arrowContainer = slidePrevList[i].parentElement;
       arrowContainer.removeChild(slidePrevList[i].nextElementSibling);
       arrowContainer.removeChild(slidePrevList[i]);
    }
}

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
