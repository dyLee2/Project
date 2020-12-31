<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLAN:T</title>
    <link rel="shortcut icon" type="image/jpg" href="img/favicon.ico" />
    <link rel="stylesheet" href="/resources/main/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Courgette&family=Great+Vibes&family=Pacifico&family=Poor+Story&display=swap"
        rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   

</head>

<body>
    <!-- HEADER -->
    <header>
        <ul class="header_subList">
            <li><a href="member/login">Login</a></li>
            <li><a href="member/join">Join</a></li>
            <li><a href="">MyPage</a></li>
            <li><a href="">Cart🛒</a></li>
        </ul>
        <ul class="header_logo">
            <img id="logo_img" src="/resources/main/img/logo.jpg" alt="logo">
        </ul>
    </header>

    <div id="header_mainList">
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
            <li><a href="/board/list">Community</a></li>
            <li><a href="/product/list">Shop</a></li>
    </div>

    <div class="container">
        <!-- SECTION 1 -->
        <div id="section_main" class="section">
            <div class="section_main_content">
                <h1>Plan:t Fairy Garden </h1>
                <h3>나의 인생짝궁 반려식물은 무엇일까요?</h3>
                <button class="section_main_btn"><span><a href="plant/test">짝꿍 찾으러 가기</a></span></button>
            </div>
        </div>

        <!-- SECTION 2 -->
        <div id="section_about" class="section">
            <div class="section_about_left">
                <h1>WHY PLAN:T?</h1>
                <p>PLAN:T는 기술을 활용하여 사람과<br><br> 식물의 관계가 더욱 가까워지도록 돕습니다.<br><br> PLAN:T는 단순한 식물 판매가 아닌<br><br> '식물을
                    잘
                    키워가는 과정'에 집중합니다.
                    <br><br>식물 선택부터 키우기까지의 모든 과정을 고객과 함께합니다.<br><br>자연이 주는 즐거움을 모두가 느낄 수 있도록 식물을 경험하는<br><br> 가장 쉽고
                    실용적인
                    서비스를
                    제공하겠습니다.
                </p>
                <button class="section_about_btn"><a href="">자세히 알아보기</a></button>
            </div>
            <div class="section_about_right">
            </div>
        </div>

        <!-- SECTION 3 -->
        <div id="section_community" class="section">
            <h1 id="section_community_h1">COMMUNITY</h1>
            <div class="section_commnuity_container">
                <div class="section_community_1st">
                    <div class="section_community_1st_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_1st_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_1st_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_1st_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                </div>
                <div class="section_community_2nd">
                    <div class="section_community_2nd_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_2nd_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_2nd_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                    <div class="section_community_2nd_list">
                        <img class="section_community_img" src="/resources/main/img/sample.png" alt="">
                        <p>여기는 내용</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- SECTION 4 -->
        <div id="section_shop" class="section">
            <h1 id="section_shop_h1">F i n d Y o u r O w n</h1>
            <button id="section_shop_btn"><a href="product/list">식물 구매하기</a></button>
        </div>
    </div>
    <!-- Top Button -->
    <div id="topButton" style="cursor: pointer">
        <img src="/resources/main/img/topbutton.png" id="topButtonImg">
    </div>
    <!-- FOOTER -->
    <footer class="section">
        <div id="footer_S1" class="footerAll">
            <ul>
                <li>상호명</li>
                <li>대표</li>
                <li>사업자등록번호</li>
                <li>주소</li>
                <li>이메일</li>
            </ul>
        </div>
        <div id="footer_S2 " class="footerAll">
            <ul>
                <li>Plan:t [(주)플랜트]</li>
                <li>김비트</li>
                <li>2020-12-2203</li>
                <li>서울 마포구 백범로 23 구프라자 3층</li>
                <li>bitcamp03@bit.co.kr</li>
            </ul>
        </div>
        <div id="footer_S3" class="footerAll">
            <ul>
                <li>[ 사이트맵 ]</li>
                <li><a href="">회사소개</a></li>
                <li><a href="">이용약관</a></li>
                <li><a href="">공지사항</a></li>
                <li><a href="">Q&A</a></li>
            </ul>
        </div>
        <div id="footer_S4" class="footerAll">
            <ul>
                <li>[ 관련 사이트 ]</li>
                <li><a href="https://greenlab.kr/" target="_blank">식물이야기</a></li>
                <li><a href="https://f-mans.com/main/index" target="_blank">꽃집청년들</a></li>
                <li><a href="https://greenify.co.kr/" target="_blank">그리니파이</a></li>
                <li><a href="http://petplant.co.kr/index.html" target="_blank">펫플랜트</a></li>
            </ul>
        </div>
        <div id="footer_S5" class="footerAll">
            <ul>
                <li>[ CS CENTER ]</li>
                <li>02-3486-9600 </li>
                <li>상담시간:AM10시~PM05시</li>
                <li>점심시간:PM12시~PM01시</li>
                <li>
                    <a href=""><i class="fas fa-phone-alt"></i></a>
                    <a href=""><i class="fas fa-envelope"></i></a>
                    <a href=""><i class="fab fa-facebook"></i></a>
                    <a href="https://www.youtube.com/watch?v=Jh5oX0VRnzk" target="_blank"><i
                            class="fab fa-youtube"></i></a>
                    <a href=""><i class="fab fa-twitter"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                </li>
            </ul>
        </div>
        <div>
            <p id="footerLast">© 2020 All rights reserved. / BITCAMP</p>
        </div>
    </footer>
    <script>

        // Header Fixed
        var lnb = $("#header_mainList").offset().top;
        $(window).scroll(function () {
            var window = $(this).scrollTop();

            if (lnb <= window) {
                $("#header_mainList").addClass("fixed");
            } else {
                $("#header_mainList").removeClass("fixed");
            }
        })

        // TopBtn 
        $(window).scroll(function () {
            // top button controll
            if ($(this).scrollTop() > 500) {
                $('#topButton').fadeIn();
            } else {
                $('#topButton').fadeOut();
            }
        });
        $(document).ready(function () {
            // Top Button click event handler
            $("#topButtonImg").click(function () {
                $('html, body').animate({ scrollTop: 0 }, '300');
            });
        });


    </script>
</body>

</html>