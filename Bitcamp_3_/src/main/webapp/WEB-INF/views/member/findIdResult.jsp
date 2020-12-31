<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IdSearch</title>
    <link rel="stylesheet" href="findID.css">
</head>
<body>
    <form action="/로그인/Login.html">
        <c:if test="${result eq 'success'}">
	        <div class="findID_newbox" >
	            <h1>아이디 찾기</h1>
	            <h5>고객님의 정보와 일치하는 아이디 입니다.</h5>
	            <!-- 일치하는 아이디 불러오기 -->
	            
	            <div class="findID_textbox">
	                <input type="text" class="findID_name" 
	                	value='<c:out value="${member.mId }"/>'><br>
	            </div>
	            <input class="findID_newbtn" type="submit" name="" value="로그인" >
	        </div>
        </c:if>
        
        <c:if test="${result eq 'fail' }">
        	<div class="findID_newbox" >
	            <h1>아이디 찾기</h1>
	            <h5>고객님의 정보와 일치하는 아이디가 없습니다.</h5>
	        </div>
        </c:if>
        
    </form>
</body>
</html>