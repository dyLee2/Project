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
<script src="js/product.js"></script>

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

	<section class="product_info">
		<h2 class="hidden">제품 상세보기</h2>
		<div class="container">
			<div class="row">
				<div class="product_pictures col-md-8">
					<img class="big_img" src="resources/product/images/product1_main1.jpg">
					<ul class="sub_img" style="padding-left: 0px;">
						<li class="active">
							<img class="sub_img" src="resources/product/images/product1_sub1.jpg" data-target="product1_main1.jpg">
						</li>
						<li>
							<img class="sub_img" src="resources/product/images/product1_sub2.jpg" data-target="product1_main2.jpg">
						</li>
						<li>
							<img class="sub_img" src="resources/product/images/product1_sub3.jpg" data-target="product1_main3.jpg">
						</li>
						<!-- 사이즈 안맞으면 이미지 크기를 줄여야됨-->
					</ul>
				</div>
				<div class="product_specs col-md-4">
					<h2>스투키</h2>
					<h3>#전자파차단 #음이온배출</h3>
					<p>기르기 쉽고 작고 이쁜 스투키를 한번 키워보세요!</p>
					<form action="">
						<hr />
						<div class="option row justify-content-center">
							<div class="quantity" data-unitprice="15000">
								<h4>수량</h4>
								<span class="minus">-</span>
								<input type="text" readonly value="1">
								<span class="plus">+</span>
							</div>
						</div>
						<hr />
						<div class="option order_summary">
							<div class="total_price row justify-content-center">
								<h4>가격</h4>
								<span class="price">15,000원</span>
							</div>
							<hr />
							<div class="order_later row justify-content-center">
								<ul>
									<li>
										<a href="" class="sprites share">share</a>
									</li>
									<li>
										<a href="" class="sprites addcart">addcart</a>
									</li>
									<li>
										<a href="" class="sprites wishlist">wishlist</a>
									</li>
								</ul>
							</div>
							<div class="order_now row justify-content-center">
								<button type="submit">구매하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-details-tab" data-toggle="tab" href="#nav-details" role="tab" aria-controls="nav-details" aria-selected="true">상세정보</a>
						<a class="nav-item nav-link" id="nav-care-tab" data-toggle="tab" href="#nav-care" role="tab" aria-controls="nav-care" aria-selected="false">식물관리법</a>
						<a class="nav-item nav-link" id="nav-shipping-tab" data-toggle="tab" href="#nav-shipping" role="tab" aria-controls="nav-shipping" aria-selected="false">배송정보</a>
						<a class="nav-item nav-link" id="nav-return-tab" data-toggle="tab" href="#nav-return" role="tab" aria-controls="nav-return" aria-selected="false">반품/교환정보</a>
					</div>
				</nav>
				<div class="tab-content py-5 px-5 px-sm-0" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-details" role="tabpanel" aria-labelledby="nav-details-tab">
					<img class="big_img" src="resources/product/images/product1_detail1.jpg"> <br> <br>
					<img class="big_img" src="resources/product/images/product1_detail2.jpg"> <br>
					<h2>공기정화 스투키화분</h2>
					시원하게 쭉 뻗어 아름답고 <br>
					미세먼지 전자파 차단에 탁월한 식물 스투키에요. <br>
					다육식물로 키우기가 어렵지 않아요. <br>
					화분을 따로 살 필요없이 세트로 구매해보세요. <br>
					<br> <br> <br>
					※시장 상황에 따라서 식물의 모양과 색이 다를 수 있습니다. <br>
					사진과 다른 식물이 배송되더라도 양해 부탁드립니다. <br> 
					<br> <br>
					<img class="big_img" src="resources/product/images/product1_detail3.jpg"> <br>
					<br> <br>
					구성 : 스투키(소)+사각화분(소)+마사토+거름망 <br>
					사이즈 : [W] 8cm x [H] 13.5cm <br>
					<br> <br>
					<img class="big_img" src="resources/product/images/product1_detail4.jpg"> <br> <br>
					<img class="big_img" src="resources/product/images/product1_detail5.jpg"> <br>
					</div>
					<div class="tab-pane fade" id="nav-care" role="tabpanel" aria-labelledby="nav-care-tab">
					<img class="big_img" src="resources/product/images/product1_care.jpg">
					</div>
					<div class="tab-pane fade left" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
					- PLAN:T는 CJ대한통운택배를 사용합니다. <br>
					- 주문하신 상품은 대금 지급일로부터 3~4일 이내에 발송됩니다 <br>
					- 상품의 재고나 배송상황, 지역에 따라 배송이 지연될 수 있습니다. <br>
					- 화원에서의 입고사정에 따라 배송이 지연될 수 있습니다. <br>
					- 배송지 정보 기입 오류로 인한 반송시, 왕복 운임비를 지불 하셔야 합니다. <br>
					- 도서, 산간, 제주도 등 일부지역은 배송비가 추가될 수 있습니다. <br>
					</div>
					<div class="tab-pane fade left" id="nav-return" role="tabpanel" aria-labelledby="nav-return-tab">
					- 식물 상품 구매시 단순 변심에 의한 교환 및 환불이 불가하오니 주문시 신중하게 결정하시길 바랍니다. <br>
					- 식물을 제외한 상품은 수령하신 날부터 7일이내 교환 및 환불이 가능하며, 단순 변심에 따른 왕복배송비는 고객님께서 부담하셔야 합니다. <br>
					- 상품에 하자가 있는 경우, 수령하신 날부터 7일이내 교환 및 환불이 가능하며, 왕복배송비는 PLAN:T가 부담합니다. <br>
					- 보내주신 상품이 훼손 되었거나 상품의 가치가 없어진 경우 교환 또는 환불이 불가능 합니다. <br>
					<br>
					- 교환 및 환불에 관한 내용은 Q&A 게시판 또는 1:1문의를 남겨주시면 최대한 빠르게 답변드리겠습니다. <br>
					- 반품 상품 제외한 나머지 상품구매 금액이 5만원 이상일 경우 3,000원 반품비 / 5만원 미만일 경우 6,000원 <br>
					   (전체반품시에 최초 배송비 결제하셨던 경우 전체취소 환불되시기 때문에 6,000원 동봉 해주셔야 합니다.) <br>
					- 교환배송비 왕복택배비 6,000원 / 반품, 교환시 배송비는 무료배송쿠폰 사용불가 <br>
					</div>
				</div>

			</div>
		</div>
	</div>


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