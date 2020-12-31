<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join</title>
    <link rel="stylesheet" href="/resources/member/join.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

	<script>
		// 이미지 업로드하기
        function uploadImg() {
        	var imgFormData = new FormData();
        	
        	var inputImg = $("#profile_pt");
        	
        	var files = inputImg[0].files;
        	
        	console.log(files);
        	
        	for(var i = 0; i < files.length; i++){
        		imgFormData.append('uploadFile', files[i]);
        	}
        	
        	var result = "";
        	$.ajax({
        		url : '/member/uploadImg',
        		processData : false,
        		contentType : false,
        		data : imgFormData,
        		type : 'post',
        		async : false,
        		success : function(fileName) {
        			finalResult = "t_" + fileName;
        			$("#p_img").val(finalResult);
        	
        			var str = '<img src="/member/display?fileName=' + finalResult + '">';
        	
		        	if($("#image_container").html()) {
		        		$("#image_container").empty();
		        	}
		        	
		        	$("#image_container").html(str);
		        	$("#image_container").find("img").css("width", "100%");
		        	$("#image_container").find("img").css("height", "100%");
        		}
        	});
    		
        }
		
        //fieldset 프로필 이미지 올리기
        function previewImage(targetObj, image_container) {
            var preview = document.getElementById(image_container); //div id
            var ua = window.navigator.userAgent;
            var files = targetObj.files;
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
                if (!file.type.match(imageType))
                    continue;
                var prevImg = document.getElementById("prev_" + image_container); //이전에 미리보기가 있다면 삭제
                if (prevImg) {
                    preview.removeChild(prevImg);
                }
                var img = document.createElement("img");
                img.id = "prev_" + image_container;
                img.classList.add("obj");
                img.file = file;
                img.style.width = '100%';
                img.style.height = '100%';
                preview.appendChild(img);
                if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                    var reader = new FileReader();
                    reader.onloadend = (function (aImg) {
                        return function (e) {
                            aImg.src = e.target.result;
                        }; F
                    })(img);
                    reader.readAsDataURL(file);
                }
            }
        }

    </script>

</head>

<body>
    <div class="join_box">
        <h1>Join Us</h1>
        <h3>* 는 필수입력사항입니다.</h3>
        <form id="join_form" method="POST" action="/member/join">
            <p>
                <label> * 아이디 </label><br>
                <input id="join_id" class="join_id" type="text" width="100%"
                    onchange="checkDuplicationId()"></br>
                <span id=checkmsg></span><br>
            </p>
            <p>
                <label> * 비밀번호</label><br>
                <input id="join_pw" class="join_pw" type="password" >
                <i class="fas fa-unlock"></i>
            </p>
            <p>
                <label> * 비밀번호 재확인</label><br>
                <input id="join_PW_confirm" class="join_PW_confirm" type="password" >
                <i class="fas fa-lock"></i>

            </p>
            <p>
                <label> * 이름</label><br>
                <input class="join_name" id="join_name" type="text" ></br>
                <!-- <span id=checkmsgName></span><br> -->
            </p>
            <p>
                <!-- jqueryui.com -->
                <label> * 생년월일</label><br>
                <input class="join_birthdate" type="text" id="join_birthdate">
            </p>
            <p>
                <label> * 전화번호</label><br>
                <input class="join_num" id="join_num" type="text" >
            </p>

            <!-- 주소 -->
            <p>
                <label> * 우편번호</label> <br>
                <input type="text" class="postcodify_postcode5" id="addr1" />
            </p>
            <p>
                <label> * 도로명주소</label>
                <input type="text" class="postcodify_address" id="addr2" />
            </p>
            <p>
                <label> * 상세주소</label>
                <input type="text" class="postcodify_details" id="addr3" />
            </p>

            <p>
                <label> * 이메일</label><br>
                <input class="join_email1" id="join_email1" type="text" >@
                <input class="join_email2" id="join_email2" type="text" >
                <select class="join_email3" id="join_email3" onchange="changeMail()">
                    <option>직접입력</option>
                    <option>naver.com</option>
                    <option>daum.net</option>
                    <option>gmail.com</option>
                    <option>nate.com</option>
                </select>
                <input type="hidden" class="sumEmail">
                <br>

            </p>

            <fieldset>
                <legend>
                    <h3>플렌테리어 입력 선택사항</h3>
                </legend>
                <div class="fieldset_left">
                    <div class="fieldset_left_content">
                        <h4>[ 프로필 식물 사진 ]</h4>
                        <div id="image_container">
                        </div>
                        <input type="file"  id="profile_pt" onchange="uploadImg()">
                        <input type="hidden" id="p_img">
                    </div>
                </div>
                <div class="fieldset_right">
                    <div class="fieldset_right_content">
                        <label>반려식물 이름</label><br>
                        <input id="fieldset_name" type="text" >
                    </div>
                    <div class="fieldset_right_content">
                        <label>품종</label><br>
                        <input id="fieldset_variety" type="text" >
                    </div>
                    <div class="fieldset_right_content">
                        <label>나이</label><br>
                        <input id="fieldset_age" type="text" >
                    </div>
                </div>
            </fieldset>
        </form>
        <p>
            <input class="join_btn" type="button" name="" value="회원가입" id="join_btn" onclick="formChk()">
        </p>
        
        
    </div>

    <script>
        const id = document.getElementById('join_id');
        const name = document.getElementById('join_name');
        const msg = document.getElementById('checkmsg');
        const msgName = document.getElementById('checkmsgName');
        const joinBtn = document.getElementById('join_btn');
        id.addEventListener('keyup', async () => await checkDuplicationId(id.value));
        name.addEventListener('keyup', async () => await checkDuplicationName(name.value));

        //회원가입 버튼 클릭시 폼을 체크하는 함수
        async function formChk() {
            if (await checkId() && checkPassword() && checkName() && checkBirth() && checkNum() && checkAddr() && checkMail()) {
                //비밀번호 검증이 성공했을시
                console.log('varified');
                //서버에 데이터를 보내줄것을 요청한다.
                const sendResult = await sendSimple();
                console.log('sendResult', sendResult);

                // 서버에 데이터를 정상적으로 보냈을때
                if (sendResult) {
                    //submit을 하게되면 form태그의 action으로 동작한다
                    alert("회원가입 성공");
                    /* document.getElementById('join_form').submit(); */
                    location.href = "/";
                    return;
                };
                // 서버에 데이터를 보냈을때 뭔가 문제가 있을때
                alert("서버 통신에러 발생");
                return;
            }
            //검증로직이 실패시 
            console.log('formChk called');
        }

        async function sendSimple() {
            console.log('sendSimple called');
            const response = await fetch('/member/join', {
                method: 'POST',
                body: makeFormData() // string or object
            });

            console.log('response', response);
            if (response.status === 200) {
            	
                return true;
            }
            return false;
        }

        //폼 데이터를 만들어 주는 함수
        function makeFormData() {
            //서버에 보낼 데이터 들을 담은 그릇(객체)
            const mId = document.getElementById('join_id').value;
            const pw = document.getElementById('join_pw').value;
            const checkPassword = document.getElementById('join_PW_confirm').value;
            const mName = document.getElementById('join_name').value;
            const birth = document.getElementById('join_birthdate').value;
            const phone = document.getElementById('join_num').value;
            const addr1 = document.getElementById('addr1').value;
            const addr2 = document.getElementById('addr2').value;
            const addr3 = document.getElementById('addr3').value;
            const email1 = document.getElementById('join_email1').value;
            const email2 = document.getElementById('join_email2').value;
			const p_name = document.getElementById('fieldset_name').value;
			const p_kind = document.getElementById('fieldset_variety').value;
			const p_age = document.getElementById('fieldset_age').value;
			var p_img = document.getElementById('p_img').value;
				

            //서버에 보낼 데이터 들을 formdata에 추가 하게되면 form형식으로 바꿔주는 객체
            var formData = new FormData();
            formData.append('mId', mId);
            formData.append('pw', pw);

            formData.append('mName', mName);
            formData.append('birth', birth)

            formData.append('phone', phone)
            formData.append('addr1', addr1)
            formData.append('addr2', addr2)
            formData.append('addr3', addr3)
            formData.append('email1', email1)
            formData.append('email2', email2)
            formData.append('p_name', p_name)
            formData.append('p_kind', p_kind)
            formData.append('p_age', p_age)
            formData.append('p_img', p_img);
            
            return formData;
        }

        //비밀번호 검증함수
        function checkPassword() {
            const passwordEl = document.getElementById('join_pw');
            const checkPasswordEl = document.getElementById('join_PW_confirm');

            //비밀번호값과 비밀번호 확인 값이 일치하는지 비교
            if (passwordEl.value !== checkPasswordEl.value) {
                alert('비밀번호가 일치하지 않습니다.');
                passwordEl.focus();
                return false;
            }

            if (!(passwordEl.value.length > 4 && passwordEl.value.length < 10)) {
                alert('비밀번호는 5자리 - 9자리 까지만 가능합니다.');
                passwordEl.focus();
                return false;
            }

            return true;
        }

        //ID 입력 체크
        async function checkId() {
            const id = document.getElementById('join_id');
            if (!id.value.length) {
                alert("ID를 입력해주세요");
                id.focus();
                return false;
            }
            return true;
        }

        //ID 중복 체크
        async function checkDuplicationId(id) {
            console.log('sendSimple called');
            const response = await fetch('/member/idCheck', {
                method: 'POST',
                body: JSON.stringify({ mId: id }),
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            console.log('response', response);
            if (response.status === 200) {
                msg.innerHTML = '<span style="color:blue">사용 가능한 아이디 입니다.</span>';
                joinBtn.disabled = false;
                return;
            }
            msg.innerHTML = '<span style="color:red">현재 사용중인 아이디 입니다.</span>';
            joinBtn.disabled = true;
            return;
        }

        //이름 중복 체크
        /* async function checkDuplicationName(name) {
            console.log('sendSimple called');
            const response = await fetch('http://localhost:3000/member/nameCheck', {
                method: 'POST',
                body: JSON.stringify({ mName: name }),
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            console.log('response', response);
            if (response.status === 200) {
                msgName.innerHTML = '<span style="color:blue">사용 가능한 이름 입니다.</span>';
                joinBtn.disabled = false;
                return;
            }
            msgName.innerHTML = '<span style="color:red">현재 사용중인 이름 입니다.</span>';
            joinBtn.disabled = true;
            return;
        } */

        //이름 입력 체크
        function checkName() {
            const name = document.getElementById('join_name');
            if (!name.value.length) {
                alert('이름을 입력해주세요');
                name.focus();
                return false;
            }
            return true;
        }

        //생년월일 입력 체크
        function checkBirth() {
            const birth = document.getElementById('join_birthdate');
            if (!birth.value.length) {
                alert("생년월일을 입력해주세요");
                birth.focus();
                return false;
            }
            return true;
        }

        //전화 번호 입력 체크
        function checkNum() {
            const num = document.getElementById('join_num');
            if (!num.value.length) {
                alert("전화번호를 입력해주세요");
                num.focus();
                return false;
            }
            return true;
        }

        //주소 입력 체크
        function checkAddr() {
            const addr1 = document.getElementById('addr1');
            const addr2 = document.getElementById('addr2');
            const addr3 = document.getElementById('addr3');
            if (!addr1.value.length) {
                alert("우편번호를 입력해주세요");
                addr1.focus();
                return false;
            }
            if (!addr2.value.length) {
                alert("도로명주소를 입력해주세요");
                addr2.focus();
                return false;
            }
            if (!addr3.value.length) {
                alert("상세주소를 입력해주세요");
                addr3.focus();
                return false;
            }
            return true;
        }
        //이메일 입력 체크
        function checkMail() {
            const mail1 = document.getElementById('join_email1');
            const mail2 = document.getElementById('join_email2');
            if (!mail1.value.length) {
                alert("이메일을 입력해주세요");
                mail1.focus();
                return false;
            }
            if (!mail2.value.length) {
                alert("이메일을 입력해주세요");
                mail2.focus();
                return false;
            }
            return true;
        }

        //이메일 체크 박스 선택시 넣어주기
        function changeMail() {
            const mailSelector = document.getElementById('join_email3').value;
            if (mailSelector !== '직접입력') {
                document.getElementById('join_email2').value = mailSelector;
                return;
            }
            return;
        }
		
        

    </script>
    
    

</body>

</html>