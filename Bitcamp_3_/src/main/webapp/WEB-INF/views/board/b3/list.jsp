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
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/board/assets/css/bootstrap.css">
    
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
                    <div class="category_box active" id="ct_board3">
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
                    <div class="category_box" id="ct_board4">
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

        <div class="main-content container-fluid" style="margin-top:30px;">
           
            <section class="section">
                <div class="card">
                    <!-- <div class="card-header">
                        Simple Datatable
                    </div> -->
                    <div class="card-body">
                        <table class='table' id="table1">
                            <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <c:forEach var="gBoard" items="${list }">
                                	<tr>
                                		<td class="tbl_no">
                                			<c:out value="${gBoard.gNo }" />
                                		</td>
	                                    <td class="tbl_title">
	                                    	<c:out value="${gBoard.gTitle }" />
	                                      	<span class="badge bg-success">
	                                      		<c:out value="${gBoard.replyCnt }" />
	                                      	</span>
	                                    </td>
	                                    <td class="tbl_writer">
	                                    	<c:out value="${gBoard.gWriter }" />
	                                    </td>
	                                    <td class="tbl_regdate">
	                                    	<fmt:formatDate value="${gBoard.gDate }" pattern="yyyy-MM-dd"/>
	                                    </td>
	                                    <td class="tbl_hit">
	                                    	<c:out value="${gBoard.gViews }" />
	                                    </td> 
                                	</tr> 
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div> 

                    <div class="dataTable-bottom mb-5">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <div class="dataTable-info pl-5">
                                    <button id="btn_write" class="btn btn-primary btn-sm">Write</button>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-1">
                                <select class="form-control" id="searchType">
                                    <option>---</option>
                                    <option>제목</option>
                                    <option>내용</option>
                                    <option>작성자</option>
                                </select>
                            </div>
                            <div class="col-md-3 pr-5 text-right">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="keyword">
                                    <button id="btn_search" class="input-group-append btn btn-primary btn-sm">Search!</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- pagenation -->
                        <div class="row">
                            <ul class="pagination pagination-primary float-right dataTable-pagination mr-5">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item pager">
                                    <a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="page-link">&#60;</a>
                                    </li>
                                </c:if>    
                             
                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li class='page-item ${pageMaker.cri.page == idx ? "active" : ""} '>
                                        <a href="list${pageMaker.makeSearch(idx)}" 
                                        	class='page-link'>
                                        	${idx}
                                        </a>
                                    </li>
                                </c:forEach>
                                
                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li class="page-item pager">
                                        <a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" class="page-link">&#62;</a>
                                    </li>
                                </c:if>
                            </ul>
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

        	var loginId = '<c:out value="${member.mId}" />';

            // 제목 클릭 시 해당 get 페이지로 이동
            $('.tbl_title').on('click', function(e) {
                
                var targetGno = $(this).prev().text().trim();
				var targetGwriter = $(this).next().text().trim();
                location.href = '/board3/readView?gNo=' + targetGno + '&gWriter=' + targetGwriter;
            })


            $('#btn_search').on('click', function() {

     	        // 검색어 공백 처리
                var searchType = $("#searchType").val();
                var keyword = $("#keyword").val();
                if(searchType === '---') {
                    alert('검색 주제를 선택해주세요');
                    return;
                } else if(searchType == '내용') {
                	searchType = 'c';
                } else if(searchType == '제목') {
                	searchType = 't';
                } else if(searchType == '작성자') {
                	searchType = 'w';
                }
                
                if(keyword === '') {
                    alert('검색어를 입력하세요');
                    return;
                }
                
                
                

                // 검색어 백엔드로 보내기 처리
                var str = '/board3/list?searchType=' + searchType + '&keyword=' + keyword;
                location.href = str;
                
            })

            // 글쓰기 버튼 처리
            $('#btn_write').on('click', function() {
            	if(loginId == "") {
            		alert('로그인 후 이용해주세요');
            		return;
            	}
            	
                location.href = '/board3/writeView/';
            })
            
            
            // 검색 결과 하나도 없을때 처리
            var failResult = '<c:out value="${fail}"/>';
            
            if(failResult) {
            	location.href = "/board3/list";
            }
            
            

        });


    </script>


</body>
</html>