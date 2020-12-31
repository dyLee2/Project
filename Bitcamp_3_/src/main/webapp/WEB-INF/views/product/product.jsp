<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Bitcamp</title>

<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="resources/product/css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="resources/product/css/custom.css">

<link rel="preconnect" href="https://fonts.gstatic.com">

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/product/js/product.js"></script>

</head>

<body class="text-center">

	<header>
        <ul class="header_subList">
            <li><a href="">Login</a></li>
            <li><a href="">Join</a></li>
            <li><a href="">MyPage</a></li>
            <li><a href="">Cart🛒</a></li>
        </ul>
        <hr>
        <ul class="header_mainList">
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">🌱</a></li>
            <li><a href="#">Community</a></li>
            <li><a href="index.jsp">Shop</a></li>
        </ul>
    </header>

	<main role="main">
		<div class="container mt-5">
			<div id="myCarousel" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img class="d-block img-fluid" src="resources/product/images/shopmain1.jpg">
						<div class="container">
							<div class="carousel-caption text-right">
								<a href="product.jsp">
									<h1>이달에 제일 잘팔리는 상품1</h1>
								</a>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="resources/product/images/shopmain2.jpg">
						<div class="container">
							<div class="carousel-caption text-left">
								<a href="#">
									<h1>이달에 제일 잘팔리는 상품2</h1>
								</a>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block img-fluid" src="resources/product/images/shopmain1.jpg">
						<div class="container">
							<div class="carousel-caption text-right">
								<a href="#">
									<h1>이달에 제일 잘팔리는 상품3</h1>
								</a>
							</div>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
				</a>
			</div>

			<div class="row">
				<div class="col">
					<ul class="nav justify-content-end">
						<li class="nav-item">
							<a class="nav-link active" href="#">이름순</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">낮은가격</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">높은가격</a>
						</li>
					</ul>
					<hr class="featurette-divider">
					<br>
				</div>
			</div>


			<!-- Page Features -->
			<div class="row text-center">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop1.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">바질트리</h4>
							<h5>#공기정화 #미세먼지</h5>
							<p class="card-text">7,500원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="product.jsp">
							<img class="card-img-top" src="resources/product/images/shop2.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">스투키</h4>
							<h5>#전자파차단 #음이온배출</h5>
							<p class="card-text">5,000원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop3.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">율마</h4>
							<h5>#피톤치드 #모기퇴치</h5>
							<p class="card-text">15,000원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop4.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">마리모</h4>
							<h5>#애완식물 #기분좋으면둥둥뜨는</h5>
							<p class="card-text">17,500원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop1.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">바질트리</h4>
							<h5>#공기정화 #미세먼지</h5>
							<p class="card-text">7,500원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="product.jsp">
							<img class="card-img-top" src="resources/product/images/shop2.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">스투키</h4>
							<h5>#전자파차단 #음이온배출</h5>
							<p class="card-text">5,000원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop3.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">율마</h4>
							<h5>#피톤치드 #모기퇴치</h5>
							<p class="card-text">15,000원</p>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100" style="border-radius: 40px;">
						<a href="#">
							<img class="card-img-top" src="resources/product/images/shop4.jpg" style="border-radius: 40px 40px 0px 0px;">
						</a>
						<div class="card-body">
							<h4 class="card-title">마리모</h4>
							<h5>#애완식물 #기분좋으면둥둥뜨는</h5>
							<p class="card-text">17,500원</p>
						</div>
					</div>
				</div>

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</main>

	<hr class="featurette-divider">
	<footer class="container">
		<div class="row">
			<div class="col-3 col-md">
				<ul class="list-unstyled text-small">
					<li>
						<a class="text-muted" href="#">이용약관</a>
					</li>
				</ul>
			</div>
			<div class="col-3 col-md">
				<ul class="list-unstyled text-small">
					<li>
						<a class="text-muted" href="#">개인정보처리방침</a>
					</li>
				</ul>
			</div>
			<div class="col-3 col-md">
				<ul class="list-unstyled text-small">
					<li>
						<a class="text-muted" href="#">제휴안내</a>
					</li>
				</ul>
			</div>
			<div class="col-3 col-md">
				<ul class="list-unstyled text-small">
					<li>
						<a class="text-muted" href="#">고객센터</a>
					</li>
				</ul>
			</div>
		</div>
		<br>
		<p class="float-right">
			<a href="#">맨위로</a>
		</p>
		<p align=center>Copyright ⓒ 2020 Bitcamp 신촌점 3강의실 All Rights Reserved.</p>
	</footer>

	<!-- 제이쿼리 자바스크립트 추가하기 -->

	<script src="resources/product/js/jquery.min.js"></script>

	<!-- Popper 자바스크립트 추가하기 -->

	<script src="resources/product/js/popper.min.js"></script>

	<!-- 부트스트랩 자바스크립트 추가하기 -->

	<script src="resources/product/js/bootstrap.min.js"></script>

</body>
</html>