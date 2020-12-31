
// 동물있으면 안되는 식물 빼주기
const noPet = [
    '칼랑코에', '산세베리아', '스투키', '몬스테라', '아이비',
    '인도고무나무', '싱고니움', '염자', '금전수', '개나리자스민',
    '시클라멘', '홍콩야자', '스킨답서스', '칼라디움'];

const highLv = [
    { L: ['알로카시아', '블루아이스', '아라우카리아', '코로키아', '해피트리', '칼라디움'] },
    { M: ['파키라', '헬리오트로프', '율마', '호접란', '싱고니움', '몬스테라'] },
    { S: ['레몬버베나, 로즈마리, 샤비홍, 시클라멘, 라벤더', '백도선'] }
];

const normalLv = [
    { L: ['해피트리, 율마, 아라우카리아, 인도고무나무, 소코라코, 블루아이스'] },
    { M: ['파키라', '율마', '백량금', '싱고니움', '몬스테라', '수염틸란드시아', '사계귤', '애니시다', '개나리자스민'] },
    { S: ['보스톤고사리', '로즈마리', '부처손', '아이비', '사랑초옵투사'] }
];

const easyLv = [
    { L: ['산세베리아', '인도고무나무', '알로카시아', '해피트리', '바질트리'] },
    { M: ['크루시아', '스킨답서스', '올리브나무', '스투키', '칼랑코에', '몬스테라', '금전수', '홍콩야자', '장미허브'] },
    { S: ['보스톤고사리', '장미허브', '호야', '아프리칸바이올렛', '백도선', '실버부쉬'] }
];


// 4번문항 
const airClean = [
    '알로카시아', '블루아이스', '아라우카리아', '율마',
    '파키라', '호접란', '싱고니움', '레몬버베나', '시클라멘',
    '해피트리', '백량금', '몬스테라', '보스톤고사리', '부처손', '아이비'
];

// 4번문항
const interior = [
    '코로키아', '수염틸란드시아', '사계귤', '몬스테라', '인도고무나무',
    '소코라코', '블루아이스', '해피트리', '바질트리'
];

// const plant = [
//     { "name": "알로카시아", "lv": "difficult", "size": "L", "reason": ["airClean", "interior"] },
//     { "name": "코로키아", "lv": "difficult", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "칼라디움", "lv": "difficult", "size": "M" },
//     { "name": "호접란", "lv": "difficult", "size": "M" },
//     { "name": "헬리오트로프", "lv": "difficult", "size": "M" },
//     { "name": "시클라멘", "lv": "difficult", "size": "S" },
//     { "name": "샤비홍", "lv": "difficult", "size": "S" },
//     { "name": "라벤더", "lv": "difficult", "size": "S" },
//     //normal 난이도
//     { "name": "소코라코", "lv": "normal", "size": "L" },
//     { "name": "블루아이스", "lv": "normal", "size": "L", "reason": ["airClean", "interior"] },
//     { "name": "해피트리", "lv": "normal", "size": "L", "reason": ["airClean", "interior"] },
//     { "name": "아라우카리아", "lv": "normal", "size": "L", "reason": "airClean" },
//     { "name": "율마", "lv": "normal", "size": "M", "reason": "airClean" },
//     { "name": "싱고니움", "lv": "normal", "size": "M", ownPet: "Y" },
//     { "name": "개나리 자스민", "lv": "normal", "size": "M", ownPet: "Y" },
//     { "name": "애니시다", "lv": "normal", "size": "M" },
//     { "name": "틸란드시아", "lv": "normal", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "몬스테라", "lv": "normal", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "사계귤", "lv": "normal", "size": "M", "reason": "interior" },
//     { "name": "로즈마리", "lv": "normal", "size": "S" },
//     { "name": "사랑초 옵투사", "lv": "normal", "size": "S" },
//     //easy 난이도
//     { "name": "인도고무나무", "lv": "easy", "size": "L", "reason": ["airClean", "interior"] },
//     { "name": "크루시아", "lv": "easy", "size": "L", "reason": "airClean" },
//     { "name": "산세베리아", "lv": "easy", "size": "L", "reason": ["airClean", "interior"] },
//     { "name": "장미허브", "lv": "easy", "size": "M", "reason": "airClean" },
//     { "name": "칼랑코에", "lv": "easy", "size": "M", "reason": "airClean" },
//     { "name": "금전수", "lv": "easy", "size": "M", ownPet: "Y" },
//     { "name": "홍콩야자", "lv": "easy", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "스투키", "lv": "easy", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "바질트리", "lv": "easy", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "올리브나무", "lv": "easy", "size": "M", "reason": ["airClean", "interior"] },
//     { "name": "보스톤고사리", "lv": "easy", "size": "S", "reason": "airClean" },
//     { "name": "하월시아 옵투사", "lv": "easy", "size": "S" },
//     { "name": "아프리칸 바이올렛", "lv": "easy", "size": "S" },
//     { "name": "마리모", "lv": "easy", "size": "S" },
//     { "name": "목마가렛", "lv": "easy", "size": "S" }
//// ];