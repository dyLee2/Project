// test 결과값 저장할 객체
const testResult = {
    score: 0,
    size: '',
    reason: '',
    ownPet: '',
};


const init = () => {
    const htmlEl = document.getRootNode().lastChild;
    const bodyEl = htmlEl.childNodes[2];
    const startSection = document.getElementById('startPage')
    startSection.style.display = 'flex';
    bodyEl.style.animation = 'fadeIn 1.5s forwards';
    startSection.style.animation = 'fadeIn 1.5s forwards';

};

const moveToTestPage = () => {
    const startBtn = document.getElementById('startBtn');
    startBtn.onclick = () => {
        const startSection = document.getElementById('startPage');
        const testBox = document.getElementById('testBox');
        const imgWrap = document.getElementById('imgWrap');
        const answerWrap = document.getElementById('answerWrap');
        const qnaSection = document.getElementById('qna');

        startSection.style.animation = 'fadeOut .7s forwards';

        setTimeout(() => {
            startSection.style.display = 'none';
            // qnaSection.style.display = 'block';
            console.log('다음페이지 나오기...');
            qnaSection.style.display = 'flex';
            testBox.style.animation = 'fadeIn 1.2s forwards';
            imgWrap.style.animation = 'fadeIn 1.2s forwards';
            answerWrap.style.animation = 'fadeIn 1.2s forwards';
        }, 700);
    }
}

// 객체의 property값 set하는 함수
const setProperty = (targetObj, propertyName, obj) => {

    if (propertyName === 'score') targetObj.score += obj.score;
    else if (propertyName === 'size') targetObj.size = obj.size;
    else if (propertyName === 'reason') targetObj.reason = obj.reason;
    else if (propertyName === 'ownPet') targetObj.ownPet = obj.ownPet;
};

const getPropertyName = (index) => {
    const propertyIndex = index - 1;
    let propertyName = '';
    switch (propertyIndex) {
        case 5: propertyName = 'ownPet'; break;
        case 4: propertyName = 'reason'; break;
        case 3: propertyName = 'size'; break;
        default: propertyName = 'score';
    }
    return propertyName;
};

// 결과 저장용 함수
const saveResult = (btnId) => {
    console.log('saveResult 뽑을 idx는 ?' + i);
    const btnIdx = btnId[1] - 1; // id가 a1, a2, a3니까 유사배열 1번지값으로 불러오기
    // index== i << 0-2 는 score, 3은 size, 4는 reason, 5는 ownPet
    const clickedBtn = qnaList[i - 1].answer[btnIdx];
    const BtnPropertyName = getPropertyName(i);
    console.log(BtnPropertyName);
    setProperty(testResult, BtnPropertyName, clickedBtn);


    console.log('결과물의 score는 ' + testResult.score + ', size는 ' + testResult.size + ', reason은 ' + testResult.reason + ', ownPet은 ' + testResult.ownPet);
};


const addQuestion = (questionTxt) => {
    // console.log('>>> Q. 추가');
    const question = document.getElementById('question');
    question.innerHTML = questionTxt;
};



const makeBtn = (index) => {
    const answerBtn = document.getElementsByTagName('button');

    if (index === 4) {
        const Btn3 = document.getElementById('a3');
        Btn3.style.display = 'none';
    }
    for (let i = 0; i < 3; i++) {
        // 5, 6번문항은 선택지 2개, 마지막 버튼 안보이게 처리하기

        if (index !== 5) {
            answerBtn[i].addEventListener('click', goNext);
            if (index === 4 && i === 2) break;
        } else {
            if (i === 2) break;
        }
        const answerTxt = qnaList[index].answer[i].a;
        answerBtn[i].innerHTML = answerTxt;
    };

    index++;
};

const goNext = (btn) => {
    // 6번까지 돌리고나면 끝내기
    if (i === 6) {
        qnaEnd();
        return;
    }

    fadeoutAll();
    console.log('>>> goNext() 실행');

    setTimeout(() => {
        // const answerListEl = document.getElementsByClassName('aBox');
        // const answerBtn = document.getElementsByTagName('button');
        const leftImg = document.getElementById('leftImg');
        const imgNum = i + 1;
        // 이미지 바꾸기 
        leftImg.setAttribute('src', '/resources/plantTest/images/img' + imgNum + '.png');
        if (imgNum === 6) {
            const imgWrap = document.getElementById('imgWrap');
            const answerWrap = document.getElementById('answerWrap');
            imgWrap.style.paddingRight = '10%';
            // answerWrap.style.paddingRight = '2%'; // * 얘를 나중에 할까말까 고오미이이인
            leftImg.style.width = '110%';
            leftImg.style.height = '100%';
        }
        // 질문/대답 바꾸기
        setTimeout(() => {
            addQuestion(qnaList[i].question);
            makeBtn(i++);
            fadeInAll();
        }, 50);
    }, 600);
};

const qnaEnd = () => {
    console.log('qnaEnd() ==> 테스트 끝')
    const qnaSection = document.getElementById('qna')
    console.log('>>> qnaSection FadeOut 시작')
    qnaSection.style.animation = 'fadeOut 1s forwards';
    // headerEl.style.animation = 'fadeOut 1s forwards';
    // 우선 사라지는 효과넣고 다른 페이지 보일 수 있게 display none설정
    setTimeout(() => {
        console.log('>>> qna 사라지게하기')
        qnaSection.style.display = 'none';
        // headerEl.style.display = 'none';
        setTimeout(() => {
            mkResult();
        }, 300);
        setTimeout(() => {
            moveToResultPage(getResult);
        }, 2700);
    }, 800);

};

const mkResult = () => {
    console.log('>>>결과추출중 박스 만들기')
    const bfSection = document.getElementById('beforeResult');
    bfSection.style.display = 'flex' // 새로 추가했음**
    bfSection.style.animation = 'fadeIn 2s forwards';
};

const moveToResultPage = (callback) => {
    console.log('>>> 결과 화면 보여주기')
    const beforeResult = document.getElementById('beforeResult');
    beforeResult.style.animation = 'fadeOut 2.5s';
    setTimeout(() => {
        beforeResult.style.display = 'none';
        const resultPage = document.getElementById('result');
        console.log('결과페이지 fadeIn효과');
        resultPage.style.display = 'flex';
        resultPage.style.animation = 'fadeIn 1s';
    }, 2500);
    // const showResult = callback;
    callback();
};

// 3->4번 넘어갈때 뒤에 그림 겹쳐보이는거..
// 함수 파라미터로 태그 id받아서 다 fadeOut 하는걸로 바꿀가..초도 받아서..
const fadeoutAll = () => {
    console.log('fadeoutAll() 호출');
    const imgBox = document.getElementById('imgWrap');
    const qBox = document.getElementById('answerWrap');

    imgBox.style.animation = "fadeOut 0.5s backwards";
    qBox.style.animation = "fadeOut 0.5s backwards";
}

const fadeInAll = () => {
    console.log('fadeIn() 호출');
    const imgBox = document.getElementById('imgWrap');
    const qBox = document.getElementById('answerWrap');

    imgBox.style.animation = "fadeIn 0.6s forwards";
    qBox.style.animation = "fadeIn 0.6s forwards";
}

const getResult = () => {
    // 새로운 객체에 testResult 복사
    let finalResult = {};
    Object.assign(finalResult, testResult);
    // 객체 property === test결과값 뽑기
    // let num = 0;
    // const resultScore = finalResult.score;
    finalResult.lv = finalResult.score > 21 ? 'high' : finalResult.score > 14 ? 'normal' : 'easy';
    delete finalResult.score; // 점수 프로퍼티 삭제 (lv로 변경하고 나면 필요없으니까)

    $.ajax({
        url: 'result',
        data: finalResult,
        type: 'POST',
        success: function (data) {
            alert('ajax 성공');
            // 성공했을때 여기에서 처리하면 되겠다 대박
            console.log(data);
            const parseData = JSON.parse(data);
            // test용 , 나중에 plantName
            console.log("testPlant: " + parseData.testPlant);
            const resultImg = document.getElementById('resultImg');
            resultImg.setAttribute('src', '/resources/plantTest/images/giphy.gif');
            const resultP = document.getElementById('resultP');
            console.log(typeof parseData.plantName);
            const txt = 'ㅇㅇㅇ님의 반려식물은 ' + parseData.plantName + '입니다.';
            console.log(txt)
            
            resultP.innerHTML = txt;
            console.log(resultP.innerHTML);
        },
        error: function (e) {
            console.log(e);
        }
    });
    console.log(finalResult);

    const testDiv = document.getElementById('testDiv');
    // 이 안에 뭐 넣을 수 있나?

    showResultPage();
};

const showResultPage = () => {
    const resultTitle = document.getElementById('resultTitle');
    setTimeout(() => {
        resultTitle.style.animation = 'fadeIn 1s ease forwards';
    }, 2000);

}

