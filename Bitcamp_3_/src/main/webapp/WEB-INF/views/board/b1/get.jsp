<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><a href="/board/list">Community</a></li>
            <li><a href="#">Shop</a></li>
    </div>
    
    <hr style="margin-bottom:40px;">
    

    <div id="content">
        
        <div class="main-content container-fluid" style="margin-top:30px;">
            
            <section id="content-types">

                <!-- 글 내용 -->
                <div class="row">

                    <div class="col-xl-3 content_profile_wrap">
                        <div>
                            
                            <c:if test="${writer.p_img == null }">
	                            <img src="/resources/board/images/plants/28.jpg" alt="">
                            </c:if>
                            <c:if test="${writer.p_img != null}">
                            	<img src='/resources/uploadImg/${writer.p_img }' >
                            </c:if>
                            
                            <h4 class="item_title profile_writer">
                            	<c:out value="${writer.mId }" />
                            </h4>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">이름</span>
                            <span id="plant_name" class="profile_2">
                            	<c:out value="${writer.p_name }" />
                            </span>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">품종</span>
                            <span id="plant_jong" class="profile_2">
                            	<c:out value="${writer.p_kind }" />
                            </span>
                        </div>
                        <hr>
                        <div>
                            <span class="profile_1">나이</span>
                            <span id="plant_jong" class="profile_2">
                            	<c:out value="${writer.p_age }" />
                            </span>
                        </div>
                        <hr>
                    </div>

                    <div class="col-xl-9 content_wraper">
                        <p class="content_title text-left">
                        	<c:out value="${read.gTitle }" />
                        </p>
                        <div class="d-flex justify-content-between">
                            <div>
                                <span class="content_regdate">
                                	<fmt:formatDate value="${read.gDate }" pattern="yyyy-MM-dd"/>
                                </span>
                                <span class="content_hits badge bg-success"><c:out value="${replyCnt }" /></span>
                            </div>
                            <div>
                            	<c:if test="${member.mId eq read.gWriter}">
	                                <button id="modify" class="btn btn-success round">수정</button>
	                                <button id="remove" class="btn btn-success round">삭제</button>
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="content_text_box" style="min-height: 500px;">  
	                        <!-- <img src="/resources/board/images/plants/23.jpg"> -->
	                        <!-- <p class="content_text text-left">
	                            <c:out value="${read.gContents }" />
                            </p> -->
                            <textarea id="summernote">
                                <c:out value="${read.gContents }" />
                            </textarea>
                        </div>

                        <hr style="margin-top: 40px;">

                        <!-- 댓글 작성창 -->
                        
                        <div style="margin: 15px 0;">
                            <h6 style="font-weight: 600;">댓글을 남겨주세요</h6>
                        </div>

                        <div class="row" style="margin-bottom: 20px;">
                            <div class="col-xl-2 text-right" id="gcWriter">
                                <button type="button" class="btn btn-outline-secondary btn-sm w-100">
	                                <c:out value="${member.mId}" />
                                </button>
                            </div>
                            <div class="col-xl-8">
                                <input id="gcContents" type="text" class="form-control">
                            </div>
                            <div class="col-xl-2">
                                <button id="btn_gcWrite" type="button" class="btn btn-outline-secondary">등록</button>
                            </div>
                        </div>
                        
                        <!-- 댓글 등록 || 삭제 form -->
                        <div style="display: none;">
                            <form action="/board/commentWrite" method="post"></form>
                        </div>
                        
                        <hr style="margin-bottom: 0;">

                        <!-- 여기부터 댓글들 -->
                        <div class="comment_wrap" style="margin-bottom: 50px;">
                            
                            <c:forEach var="gComment" items="${commentList }">
	                            <div class="row comment">
	                                <div class="col-xl-1 comment_img border-bottom">
	                                    <img src="/resources/board/images/plants/6.jpg" alt="">
	                                </div>
	                                <div class="col-xl-11 comment_1 border-bottom row">
                                        <div class="col-xl-10">
                                            <div class="comment_2">
                                                <b>${gComment.gcWriter }</b> | <small><fmt:formatDate value="${gComment.gcDate }" pattern="yyyy-MM-dd"/></small>
                                            </div>
                                            <div class="comment_3">
                                                <c:out value="${gComment.gcContents }"/>
                                            </div>
                                        </div>
                                        <div class="col-xl-2 d-flex align-items-center justify-content-center">
                                            <c:if test="${member.mId eq gComment.gcWriter}">
                                            	<input type="hidden" name="gcNo" value="${gComment.gcNo }">
                                                <button class="btn btn-outline-secondary btn-sm btn_gcRemove">삭제</button>
                                            </c:if>
                                            
                                        </div>
	                                </div>
	                            </div> 
                            </c:forEach>
                            
                        </div>
                    

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
			
			// header
	        var lnb = $("#header_mainList").offset().top;
	        $(window).scroll(function () {
	            var window = $(this).scrollTop();

	            if (lnb <= window) {
	                $("#header_mainList").addClass("fixed");
	            } else {
	                $("#header_mainList").removeClass("fixed");
	            }
	        })
	        
	        // 댓글창 로그인,비로그인 차이 두기
	        var loginId = '<c:out value="${member.mId}" />';
	        console.log(loginId);
	        
	        if(loginId == "") {
	        	$("#gcContents").val("로그인 후 작성 가능합니다");
	        	$("#gcContents").attr("readonly", "");
	        	$("#gcWriter button").addClass("d-none");
	        }
	        
	        

            var gNo = '<c:out value="${read.gNo}"/>';

	        // 수정 버튼 클릭
            $("#modify").on('click', function() {
                location.href = '/board/updateView?gNo=' + gNo;

            })
	        
            // 삭제 버튼 클릭
            $("#remove").on('click', function() {
                var confirm_remove = confirm('삭제 하시겠습니까?');
                
                if(!confirm_remove) {
                    return;
                }

                location.href = '/board/delete?gNo=' + gNo;

            })

            // summernote
            $('#summernote').summernote({
                minHeight: 550,
                maxHeight: null,
                lang : 'ko-KR',
                toolbar : []
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
            // 서머노트 쓰기 비활성화
            $('#summernote').summernote('disable');
            $('.note-editable').css('background', 'white');
	        
	        
            // 댓글 등록 버튼 처리
            $('#btn_gcWrite').on('click', function() {
                var gcWriter = $('#gcWriter').find('button').text();
                var gcContents = $('#gcContents').val();

                var str = '<input type="text", name="gNo", value="${read.gNo}">';
                str += '<input type="text", name="gcContents", value="' + gcContents + '">';
                str += '<input type="text", name="gcWriter", value="' + '<c:out value="${member.mId}" />' + '">';
                

                var formObj = $('form');
                formObj.append(str);
                formObj.submit();
            })
            
            // 댓글 삭제 버튼 처리
            $(".btn_gcRemove").on('click', function() {
            	
            	if(!confirm('댓글을 삭제하시겠습니까?')) {
            		return;
            	}
            	
            	var target_gcNo = $(this).prev().val();
            	var query_gWriter = '<c:out value="${read.gWriter}" />';
            	var query_gNo = '<c:out value="${read.gNo}" />';
            	
            	location.href = '/board/commentDelete?gcNo=' + target_gcNo 
            			+ '&gNo=' + query_gNo;
            	
            })
			
            var isImg = '<c:out value="${img}" />';
            alert(isImg);
            if(isImg) {
            	var str = '<img src="/resources/uploadImgs/board/' + isImg + '">';
            	$(".note-editable").prepend(str);
            }
            
            
			
		}); // document.ready
		
		
	
	</script>

</body>
</html>