/**
 * 
 */
// 이메일 유효성 검사
function validateEmail(email) {
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return !re.test(email);
}

// 숫자와 대문자, 소문자를 섞어서 6 ~ 16글자
function pass_ck(pwd) {
	var re = /^.*(?=.{6,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	return !re.test(pwd);
}

/* 숫자만 입력받기 */
function only_num(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) 
			|| keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39){
		return;
	}else{
		return false;
	}
}

function nop_han(text) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46)
		return;
	text.value = text.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

