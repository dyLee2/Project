<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify</title>
    <link rel="stylesheet" href="membership.css">
    <script src="https://kit.fontawesome.com/ec7ebb898d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
<div class="membership_modify"><h1>회원정보 수정</h1>
    <form id="membership_form" method="POST" action="/member/update">
   
       <p>
           <label>아이디 </label><br>
           <input id="modify_ID" class="modify_ID" type="text" name="mId" width="100%"
           	value='<c:out value="${member.mId }" />' readonly>
           <input id="modify_ID_check" class="modify_ID_check" type="button" value="아이디 중복 체크">
       </p> 
       <p>
            <label>비밀번호</label><br>
            <input id="modify_PW" class="modify_PW" type="password" name="pw"
            	value='<c:out value="${member.pw }" />'>
            <i class="fas fa-unlock"></i>

       </p>
       <p>
           <label>비밀번호 재확인</label><br>
           <input id="modify_PW_check" class="modify_PW_check" type="password"
           	value='<c:out value="${member.pw }" />'>
           <i class="fas fa-lock"></i>

       </p>
       <p>
           <label>이름</label><br>
           <input class="modify_name" id="name" type="text" name="mName"
           	value='<c:out value="${member.mName }" />'>

       </p>
       <p>
           <!-- jqueryui.com -->
           <label for="datepicker">생년월일</label><br>
           <input class="modify_birthdate" type="text" id="datepicker" name="birth"
           	value='<c:out value="${member.birth }" />'>

       </p>
       <p>
           <label for="num">전화번호</label><br>
           <input class="modify_num" id="num" type="text" name="phone"
           	value='<c:out value="${member.phone }" />'>

       </p>
       <!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
        <p>
            <label>우편번호</label> <br>
            <input type="text" name="addr1" class="modify_postcodify_postcode5" 
            	value='<c:out value="${member.addr1 }" />' />
            <button class="postcodify_search_button">검색</button>
        </p>
        <p>
            <label>도로명주소</label>
            <input type="text" name="addr2" class="modify_postcodify_address" 
            	value='<c:out value="${member.addr2 }" />'/>
        </p>
        <p>
            <label>상세주소</label>
            <input type="text" name="addr3" class="modify_postcodify_details"
            	value='<c:out value="${member.addr3 }" />' />
        </p>
         <p>
            <label for="email">이메일</label><br>
            <input class="modify_email1" id="email1" type="text" name="email1"
            		value='<c:out value="${member.email1}"/>' />@
            <input type="text" class="modify_email2"  id="email2" name="email2"
            	 	value='<c:out value="${member.email2}"/>' />
            <select class="modify_email3" name="#" onchange="changeSelect()">
                <option>직접입력</option>
                <option>naver.com</option>
                <option>daum.net</option>
                <option>gmail.com</option>
                <option>nate.com</option>
            </select>
            <input type="hidden" class="sumEmail">
            <br>
       </p>
       <!-- <p> 
           <label for="emailcf">이메일 수신여부</label>
           <input class="emailcf" id="emailcf" type="checkbox" name="#">동의함
           <h5>유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</h5>
       </p> -->

   
        <fieldset>
            <legend><h3>플렌테리어 입력사항</h3></legend>
                <p>
                    <label>반려식물 이름</label><br>
                    <input class="modify_planterior_name" id="Nname" type="text" name="p_name"
                    	value='<c:out value="${member.p_name }" />'><br>

                </p>
                <p>
                    <label for="variety">품종</label><br>
                    <input class="modify_planterior_variety" id="variety" type="text" name="p_kind"
                    	value='<c:out value="${member.p_kind }" />'><br>

                </p>
                <p>
                    <label for="age">나이</label><br>
                    <input class="modify_planterior_age" id="age" type="text" name="p_age"
                    	value='<c:out value="${member.p_age }" />'><br>

                </p>
            
        </fieldset>
        <p>
            <input class="memberModify_btn1" type="submit" name="" value="회원정보 수정"> 
        </p>
    </form>
        <p>
            <input class="delete" type="submit" value="회원탈퇴">
        </p>
    </div>




    <script>
        $(document).ready(function(){
            
        	// 회원탈퇴 delete로 보내기~! (삭제페이지 이벤트 처리)
            $(".delete").on('click', function(e){
            	e.preventDefault();
               	
            	var confirmDelete = confirm('탈퇴하시겠습니까?');
            	
            	if(!confirmDelete) {
            		return;
            	}
            	
            	var formObj = $("#membership_form");
            	
            	$(formObj).attr("action", "/member/memberDelete");
            	
            	$(formObj).submit();

            })
        })

         //이메일 직접입력 포커스 효과주기
        var emailOption = document.querySelector(".modify_email3").options;
        var email2 = document.querySelector(".modify_email2");
        var email3 = document.querySelector(".modify_email3");
        
        //이메일 선택시 이벤트 주기
        function changeSelect(){
            if(emailOption.selectedIndex == 0){
            email2.value ="";
            email2.focus();
        }else{
            email2.value = email3.value;
        }
        }


    </script>

</body>
</html>