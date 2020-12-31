<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    
    <link rel="stylesheet" href="/resources/board/assets/css/bootstrap.css">

	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	
	<!-- include summernote-ko-KR -->
	<script src="/resources/board/assets/js/summernote-ko-KR.js"></script>

    <link rel="stylesheet" href="/resources/board/assets/css/app.css">

    <!-- custom css -->
    <link rel="stylesheet" href="/resources/board/style.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


</head>
<body>

    <!-- HEADER -->
    <header>
        <ul class="header_subList">
        	<c:if test="${member.mId != null }">
	            <li><a href="/member/logout">Logout</a></li>
        	</c:if>
        	<c:if test="${member.mId == null }">
	            <li><a href="/member/login">Login</a></li>
        	</c:if>
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
            <li><a href="#">About</a></li>
            <li><a href="/board/b1/list">Community</a></li>
            <li><a href="#">Shop</a></li>
    </div>
    
    <hr style="margin-bottom:40px;">

    <div id="content">
        <div id="title">
            <p><h4 id="title_sub">자유롭게 글을 올려보세요.</h4></p>
            <p><h2 id="title_category">Community</h2></p>
        </div>

        

        <div class="main-content container-fluid">
            
            <section id="content-types">

                <!-- 글 내용 -->
                <div class="row">

                    <!-- 프로필 -->
                    <div class="col-xl-3 content_profile_wrap">
                        <div>
                            <img src="/resources/board/images/plants/28.jpg" alt="">
                            <h4 class="item_title profile_writer">
                            	<c:out value="${member.mName }" />
                            </h4>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">이름</span>
                            <span id="plant_name" class="profile_2">
                            	<c:out value="${member.p_name }"></c:out>
                            </span>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">품종</span>
                            <span id="plant_jong" class="profile_2">
                            	<c:out value="${member.p_kind }" />
                            </span>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">나이</span>
                            <span id="plant_jong" class="profile_2">
                            	<c:out value="${member.p_age }"/>
                            </span>
                        </div>
                        <hr>
                    </div>
                    <!-- /프로필 -->

                    <!-- 글쓰기 form -->
                    <div class="col-xl-9 content_wraper">
                        <div class="d-flex justify-content-between">
                            <span class="content_title">초록이이야기</span>
                            <span class="content_title"><button id="submit" class="btn btn-success round">수정</button></span>
                        </div>
                        <hr>

                        <form method="post" action="/board2/update">
                            <div style="margin-bottom: 15px;">
                                <input type="text" name="gTitle" class="form-control" id="input_title"  
                                value='<c:out value="${update.gTitle }"/>' >
                            </div>

                            <textarea id="summernote" name="gContents" id="input_content">
                                <c:out value="${update.gContents }"></c:out>
                            </textarea> 

                            <input type="hidden" name="gNo" value='<c:out value="${update.gNo}"/>'>
                        </form>
                        
                        <hr style="margin: 40px 0;">
                    </div>
                </div>
            </section>


        </div>

        
    </div>

    <!-- FOOTER -->
    <hr>
    <footer>
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
                <li><a href="">[ 사이트맵 ]</a></li>
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

    <script src="/resources/board/assets/js/feather-icons/feather.min.js"></script>
    <script src="/resources/board/assets/js/app.js"></script>

    <script src="/resources/board/assets/js/main.js"></script>



    <script>
        $(document).ready(function() {

            // summernote
            $('#summernote').summernote({
                placeholder: '',
                minHeight: 550,
                maxHeight: null,
                focus: true, 
                lang : 'ko-KR',
                toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['picture']]
                ]
            });

            // 서머노트 초기화
            $('#summernote').summernote('editor.insertText', "${summernote.BOARD_CONTENT}");
            $('#summernote').summernote({
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                        for(var i = files.length -1; i>=0; i--) {
                            sendFile(files[i], this);
                        }
                    }
                }
                
            });
            $('#summernote').summernote('justifyLeft');
 
            // 내용 submit
            $("#submit").on('click', function() {

                var titleInput = $("input[name='title']");
                
                var formObj = $("form");
                
                // 제목 비어있으면 alert
                if(titleInput.val() === "") {
                    alert('제목을 입력해주세요');
                    return;
                }

                // 내용 비어있으면 alert
                if ($('#summernote').summernote('isEmpty')) {
                    alert('내용을 입력해주세요');
                    return;
                }

                console.log($("#input_title").val());
                $('#summernote').summernote('codeview.toggle');

                formObj.submit();
            })
            
            
            $("#input_title").on('click', function(e) {
                $(this).val("");
            })




        });

    </script>

</body>
</html>