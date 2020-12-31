<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PwSearch</title>
    <link rel="stylesheet" href="PW.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<body>
    <form id="PW" method="POST" action="member/findPw">
	    <div class="findPW_box">
	        <h1>비밀번호 찾기</h1><br>
	       
	        <div class="findPW_textbox">
	            <input type="text" class="findPW_id" placeholder="ID" name="mId"><br>
	            <input type="text" class="findPW_name" placeholder="NAME" name="mName"><br>
	            <input type="text" class="findPW_email" placeholder="E-MAIL" name="email">  
	        </div>
	        <!-- <input class="btn" type="button" name="" value="임시 비밀번호 발급"><br> -->
	       <input class="findPW_btn" type="button" name="" value="비밀번호 찾기">
	    </div>
	</form>
    

       
<script>

	$(document).ready(function() {
		
		$(".findPW_btn").on('click', function(e) {
			
			var formObj = $("form");
			
			var inputId = formObj.find("input[name=mId]").val();
			var inputname = formObj.find("input[name=mName]").val();
			var inputEmail = formObj.find("input[name=email]").val();
			
			console.log(inputEmail);
			
			var inputEmailArr = inputEmail.split('@');
			
			var jsonData = {
				"mId" : inputId,
				"mName" : inputname,
				"email1" : inputEmailArr[0],
				"email2" : inputEmailArr[1]
			};
			
			
			$.ajax({
				type : 'post',
				url : '/member/findPw',
				contentType : "application/json",
				data : JSON.stringify(jsonData),
				success : function(result) {
					if(result) {
						///////////////////////// 비번 다시 수정하는 페이지로 보낸다.
						location.href = "/member/login";
					}
				},
				error : function(err) {
					alert('일치하는 회원이 없습니다.');
					formObj.find("input[name=mId]").val("");
					formObj.find("input[name=mName]").val("");
					formObj.find("input[name=email]").val("");
				}
			})
			
			
		})
		
		
		
		
	})
	

</script>
   
</body>
</html>