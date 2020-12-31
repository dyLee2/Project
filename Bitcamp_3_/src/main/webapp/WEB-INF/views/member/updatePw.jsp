<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PwSearch</title>
    <link rel="stylesheet" href="findPw.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

</head>
<body>
    <form id="findPw_form" method="POST" action="member/findPw">
    <div class="findPW_newPWbox">
        <h1>비밀번호 재설정</h1><br>
       
        <div class="findPW_textbox">
            <input type="text" class="findPW_newPW" placeholder="새로운 비밀번호" name=""><br>
            <input type="text" class="findPW_rePW" placeholder="비밀번호 재입력" name="">  
        </div>
        <!-- <input class="btn" type="button" name="" value="임시 비밀번호 발급"><br> -->
        <input class="findPW_newPWbtn" type="button" name="" value="로그인">
    </div>
</form>
    

       

   
</body>
</html>