<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IdSearch</title>
    <link rel="stylesheet" href="ID.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
    <form id="findId_form" method="POST" action="/member/findIdResult">
	    <div class="findID_box">
	        <h1>아이디 찾기</h1>
	        <h5>회원가입시, 입력하신 이름+이메일로 아이디를 확인하 실 수 있습니다.</h5>
	        <div class="findID_textbox">
	            <input type="text" class="findID_name" placeholder="NAME" name="mName"><br>
	            <input type="text" class="findID_email" placeholder="E-MAIL" name="email">  
	        	<input type="hidden" id="email1" name="email1">
	        	<input type="hidden" id="email2" name="email2">
	        </div>
	        <input class="findID_btn1" type="button" value="아이디 찾기"><br>
	    </div>
    </form>
    
    
    <script>
    
    	$(document).ready(function() {
    		
			// 아이디 찾기 버튼 이벤트 핸들러    		
    		$(".findID_btn1").on('click', function(e) {
    			var inputName = $("form").find("input[name=mName]").val();
    			
    			e.preventDefault();
    			
    			var formObj = $("form");
    			
    			var inputEmail = formObj.find("input[name=email]").val();
    			
    			var emailArr = inputEmail.split('@');
    			
    			$("#email1").attr("value", emailArr[0]);
    			$("#email2").attr("value", emailArr[1]);
    			$(".findID_name").attr("value", inputName);
    			
    			formObj.find("input[name=email]").remove();
    			formObj.submit();
    			
    		});
    		
    	})
    	
    
    </script>
    
    
</body>
</html>