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
    
    <!-- <link rel="stylesheet" href="assets/vendors/chartjs/Chart.min.css"> -->

    <!-- <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css"> -->
    <link rel="stylesheet" href="/resources/board/assets/css/app.css">
    
    <!-- custom css -->
    <link rel="stylesheet" href="/resources/board/style.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    // 이미지 업로드하기
    <script>
        function uploadImg() {
            var imgFormData = new FormData();
            
            var inputImg = $("#inputImg");
            
            var files = inputImg[0].files;
            
            console.log(files);
            
            for(var i = 0; i < files.length; i++){
                imgFormData.append('uploadFile', files[i]);
            }
            
            var result = "";
            $.ajax({
                url : '/board4/uploadImg',
                processData : false,
                contentType : false,
                data : imgFormData,
                type : 'post',
                async : false,
                success : function(fileName) {
                    finalResult = "t_" + fileName;
                    $("#p_img").val(finalResult);
            
                    var str = '<img src="/board4/display?fileName=' + finalResult + '">';
            
                    if($("#image_container").html()) {
                        $("#image_container").empty();
                    }
                    
                    $("#image_container").html(str);
                    $("#image_container").find("img").css("width", "100%");
                    $("#image_container").find("img").css("height", "100%");
                }
            });
            
        }
    </script>
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
            <li><a href="/about">About</a></li>
            <li><a href="/board/b1/list">Community</a></li>
            <li><a href="#">Shop</a></li>
    </div>
    
    <hr style="margin-bottom:40px;">

    <div id="content">
        <div id="title">
            <p><h4 id="title_sub">자유롭게 글을 올려보세요.</h4></p>
            <p><h2 id="title_category">Community</h2></p>
        </div>

        <div id="category">
            <ul class="flex_list">
                <li class="flex_item">
                    <div class="category_box" id="ct_board1">
                        <div class="item_box">
                            <div class="item_img" id="item1">
                            	<a href="/board/list">
                            		<img src="/resources/board/images/category_logo/1.png">
                            	</a>
                            </div>
                            <h4 class="item_title">초록이 이야기</h4>
                        </div>
                    </div>
                </li>
                <li class="flex_item">
                    <div class="category_box" id="ct_board2">
                        <div class="item_box">
                            <div class="item_img" id="item2">
                            	<a href="/board2/list">
                            		<img src="/resources/board/images/category_logo/2.png">
                            	</a>
                            </div>
                            <h4 class="item_title">상품 후기</h4>
                        </div>
                    </div>
                </li>
                <li class="flex_item">
                    <div class="category_box" id="ct_board3">
                        <div class="item_box">
                            <div class="item_img" id="item3">
                            	<a href="/board3/list">
                            		<img src="/resources/board/images/category_logo/3.png">
                            	</a>
                            </div>
                            <h4 class="item_title">QnA</h4>
                        </div>
                    </div>
                </li>
                <li class="flex_item">
                    <div class="category_box active" id="ct_board4">
                        <div class="item_box">
                            <div class="item_img" id="item4">
                            	<a href="/board4/list">
                            		<img src="/resources/board/images/category_logo/4.png">
                            	</a>
                            </div>
                            <h4 class="item_title">플렌테리어</h4>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <div class="main-content container-fluid gallery">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 order-md-1 order-last my-3 text-left">
                        <button class="btn btn-success btn-sm" id="writeModal_btn">나도 자랑하기</button>
                    </div>
                </div>
            </div>

            <section id="content-types">
                <div class="row">

                    <!-- 1번 라인 -->
                    <div class="col-xl-3">
                        <div class="card">
                            <div class="card-content my_card-content">
                                <input type="hidden" name="mId" value="작성자id로 닉네임불러오기">
                                <input type="hidden" name="pUuid" value="사진uuid">
                                <img class="img-fluid" src="/resources/board/images/plants/1.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_content ">제가 키우는식물입니다 이쁘죠?</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/2.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/3.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/4.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/5.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                    </div>
                    <!-- /1번 라인 -->
    
                    <!-- 2번 라인 -->
                    <div class="col-xl-3">
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/6.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/7.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/8.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/9.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/10.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                    </div>
                    <!-- /2번 라인 -->
    
                    <!-- 3번 라인 -->
                    <div class="col-xl-3">
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/11.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/12.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/13.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/14.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/15.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                    </div>
                    <!-- /3번 라인 -->
    
                    <!-- 4번 라인 -->
                    <div class="col-xl-3">
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/16.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/22.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/18.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/19.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content my_card-content">
                                <img class="img-fluid" src="/resources/board/images/plants/20.jpg" style="width: 100%; height: auto;">
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <span class="card_writer">식물조아</span>
                                <span class="badge bg-success">3</span>
                            </div>
                        </div>
                    </div>
                    <!-- /4번 라인 -->
                </div>

            </section>

        </div>
        
    </div>

    <footer>
        <h2>footer</h2>

    </footer>


    <!-- 사진 클릭 모달창 트리거용 숨겨진 버튼 -->
    <div style="display: none;">
        <button type="button" id="modal_trigger" class="btn btn-outline-warning" data-toggle="modal" data-target="#b_modal">
            Warning
        </button>
    </div>
    
    <!-- 글쓰기 모달창 트리거용 숨겨진 버튼 -->
    <div style="display: none;">
        <button type="button" id="modal_trigger2" class="btn btn-outline-warning" data-toggle="modal" data-target="#write_modal">
            Warning
        </button>
    </div>


    <!-- 갤러리 사진 클릭 모달창 -->
    <div class="modal fade" id="b_modal" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- 작성자 -->
            <div class="modal-header bg-warning">
                <h5 class="modal-title white" id="exampleModalLongTitle">Warning Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <!-- 사진 -->
            <div id="modal_body" class="modal-body">
            
            </div>
            <!-- 댓글 -->
            <hr style="margin-top: 40px 16px;">
            <div style="margin: 5px 20px;">
                <h6 style="font-weight: 600;">댓글을 남겨주세요</h6>
            </div>
            
            <div class="modal-body ">
                <div class="row">
                        <div class="col-lg-9">
                            <input type="text" class="form-control">
                        </div>
                        <div class="col-lg-3">
                            <button type="button" class="btn btn-warning">등록</button>
                        </div>

                </div>
            </div>

            <div class="modal-body">
                <div class="row comment">
                    <div class="col-xl-3 comment_modal_img">
                        <img src="/resources/board/images/plants/2.jpg" alt="">
                    </div>
                    <div class="col-xl-9 comment_modal_1">
                        <div class="comment_modal_2">
                            <b>zephyr</b> | <small>2020-12-15</small>
                        </div>
                        <div class="comment_modal_3">
                            굿굿
                        </div>
                    </div>
                </div>
                
                <!--  -->
                
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-light-secondary" data-dismiss="modal">
                <i class="bx bx-x d-block d-sm-none"></i>
                <span class="d-none d-sm-block">닫기</span>
            </button>

            <button type="button" class="btn btn-warning ml-1" data-dismiss="modal">
                <i class="bx bx-check d-block d-sm-none"></i>
                <span class="d-none d-sm-block">삭제</span>
            </button>
            </div>
        </div>
        </div>
    </div>
    
    
    <!-- 글 작성 Modal -->
    <div class="modal fade" id="write_modal" tabindex="-1" role="dialog"
        aria-hidden="true">
    
        <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- 작성자 -->
            <div class="modal-header bg-warning">
                <h5 class="modal-title white write_modal_gWriter" id="exampleModalLongTitle">이름창</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <!-- 사진 -->
            <div id="modal_body" class="modal-body mt-3">
                <input type="text" id="inputTitle" class="form-control" placeholder="제목을 입력해주세요">
            </div>
            <hr style="margin-top: 40px 16px;">
            
            <!-- 사진첨부 -->
            <div class="modal-body">
                
                <div class="modal-body" id="completeBrowseBody">
                    사진을 올려주세요!
                    <input type="file" id="inputImg" class="form-control" onchange="uploadImg()"/><br/>
                    <div id="image_container">

                    </div>
                </div>

            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-light-secondary" data-dismiss="modal">
                <i class="bx bx-x d-block d-sm-none"></i>
                <span class="d-none d-sm-block">닫기</span>
            </button>

            <button type="button" class="btn btn-warning ml-1" data-dismiss="modal">
                <i class="bx bx-check d-block d-sm-none"></i>
                <span class="d-none d-sm-block" id="write_btn">등록</span>
            </button>

            <form action="/board4/write" method="post" class="d-none">
                <input type="text" name="gTitle">
                <input type="text" name="gWriter">
            </form>


            </div>
        </div>
        </div>

        

    </div>



    <script src="/resources/board/assets/js/feather-icons/feather.min.js"></script>
    <script src="/resources/board/assets/js/app.js"></script>

    <script src="/resources/board/assets/js/main.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>



    <script>

        $(document).ready(function() {

            var modalWraper = $("#b_modal");
            var modalTitle = $(".modal-title")
            var modalBody = $("#modal_body");


            // 사진 클릭시 모달창 활성화
            $(".my_card-content").on('click', function(e) {
                
                var mId = $(this).children().eq(0).val();
                var pUuid = $(this).children().eq(1).val();

                console.log(mId);
                console.log(pUuid);

                // 나중에는 ajax, pId로 받아와서 띄운다.
                var str = '<img src="/resources/board/images/plants/9.jpg">';

                modalTitle.html(mId);
                modalBody.html(str);

                $("#modal_trigger").trigger("click");

            });
		
            // 글쓰기 모달창 활성화
            var write_modal = $("#write_modal");
            
			$("#writeModal_btn").on('click', function(e) {
                
                $("#modal_trigger2").trigger("click");

            });

            // 글쓰기 버튼 이벤트
            $("#write_btn").on('click', function() {
            	var inputTitle = $("#inputTitle").val();
            	var inputWriter = '<c:out value="${member.mId}">';
            	
            	var formObj = $("form");
            	
            	formObj.find("input[name=gTitle]").val(inputTitle);
            	formObj.find("input[name=gWriter]").val(inputWriter);
            	
            	formObj.submit();
            	
            });
            

        }); // end of document.ready

    </script>

</body>
</html>