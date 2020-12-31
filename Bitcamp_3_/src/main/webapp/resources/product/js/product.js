$(function() {
	//상품상세 이미지 변경
	var $productPictures = $('.product_pictures'),
		$bigImg = $productPictures.find('.big_img'),
		$subImgList = $productPictures.find('.sub_img li');

	$subImgList.click(function() {
		$(this).addClass('active').siblings().removeClass('active');
		var targetImgPath = 'images/' + $(this).find('img').attr('data-target');

		$bigImg.attr('src', targetImgPath);
	});

	//상품 수량 가격 변경하기
	var $quantity = $('.quantity'),
		$unitprice = $quantity.attr('data-unitprice'),
		$qtyBtn = $quantity.find('span'),
		$qytInput = $quantity.find('input'),
		$tagetTotal = $('.total_price .price');

	$qtyBtn.click(function() {
		var currentCount = $qytInput.val();

		if ($(this).hasClass('plus')) {
			$qytInput.val(++currentCount);
		} else {
			if (currentCount > 1) {
				$qytInput.val(--currentCount);
			}
		}
		var total = (currentCount * $unitprice).toLocaleString('en');

		// toLocaleString('en') : 천단위로 , 찍어주는 기능

		$tagetTotal.text(total + '원');

	});
});

//class가 menu인 a요소를 선택후 click이벤트리스너를 붙입니다.
$(".menu").click(function() {
	//우리가 클릭한 그 요소의 글자를 얻어옵니다.
	var txt = $(this).text();
	//우리가 클릭한 그 요소의 data-index라는 속성의 값을 얻어옵니다.
	var index = $(this).attr("data-index"); ///this.dataset.index  <- HTML5의 api로 얻어올때는
	//index에 135를 곱한 후 그 값을 left에 대입
	var left = 135 * index;
	$(".active-tab").css("left", left).text(txt);
	//.show에서  show를 제거
	$(".show").fadeOut(400).removeClass("show");
	//우리가 클릭한 그 요소를 선택후 그 다음요소(next)를 선택한 후
	//addClass를 주면 됩니다.
	$(this).next().fadeIn(500).addClass("show");

});