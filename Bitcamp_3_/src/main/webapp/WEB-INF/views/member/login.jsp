<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="Login.css">
        <script src="https://kit.fontawesome.com/ec7ebb898d.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    </head>

    <body>
        <form id="login_form" method="POST" action="/member/login">
            <div class="login_box">
                <h1>Login</h1>
                <div class="login_textbox">
                    <input id="username" type="text" placeholder="username" name="mId" value="">
                    <i class="fas fa-user-circle"></i>
                </div>

                <div class="login_textbox">
                    <input id="password" type="password" placeholder="password" name="pw" value="">
                    <i class="fas fa-unlock"></i>
                </div>

                <a href=""><input class="login_btn1" type="submit" name="" value="로그인"></a>
                <a href="/회원가입/join.html"><input class="login_btn2" type="button" name="" value="회원가입"></a>
                <div class="search">
                    <h5 class="h5"><a href="/아이디찾기/findID.html">아이디 찾기 |</a> <a href="/비밀번호찾기/Pw.html">비밀번호 찾기</a></h5>
                </div>
            </div>
        </form>
        <!--//login-box-->

        <script>
            $(document).ready(function () {
                var username = $("#username");
                var password = $("#password");



                $(username).on('click', function () {
                    $(username).attr('placeholder', "");
                })

                $(password).on('click', function () {
                    $(password).attr('placeholder', "");
                })
            })





        </script>
    </body>

    </html>