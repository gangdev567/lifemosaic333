/**
 * user.js
 * 회원가입 아이디 중복 체크, 회원가입 버튼 활성화/비활성화.
 */

document.addEventListener('DOMContentLoaded', () => {
    let idChecked = false;
    let pwdChecked = false;
    let emailChecked = false;
    let nicknameChecked = false;
    let code = "";
    const btnRegister = document.querySelector('button#btnRegister');
        
    const inputUserid = document.querySelector('input#user_id');
    inputUserid.addEventListener('change', checkUserid);
    
    const inputNickname = document.querySelector('input#nickname');
    inputNickname.addEventListener('change', checkNickname);
    
    const inputPassword = document.querySelector('input#password');
    inputPassword.addEventListener('change', checkPassword);
    
    const inputEmail = document.getElementById('mail-Check-Btn');
    inputEmail.addEventListener('click', sendEmail);
	
	// 이메일 인증
	function sendEmail(e){
		const email = document.getElementById('userEmail1').value + document.getElementById('userEmail2').value;
		console.log('완성된 이메일 : ' + email);
    const checkInput = document.querySelector('.mail-check-input');

    axios.get(baseUrl = 'mailCheck?email=' + email)
        .then(function(response) {
            console.log("data : " + response.data);
            checkInput.disabled = false;
            code = response.data;
            alert('인증번호가 전송되었습니다.');
        })
        .catch(function(error) {
            console.log('Error on request:', error);
        });
        
	}
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	document.querySelector('.mail-check-input').addEventListener('blur', function() {
		const inputCode = this.value.trim();
		const codeAsString = code.toString().trim();
		
		console.log("code: " + codeAsString, " Type of code: " + typeof codeAsString);
		console.log("inputCode:" + inputCode + " Type of inputCode: " + typeof inputCode);
		console.log("inputCode === code: " + (inputCode === codeAsString));
		
		const resultMsg = document.getElementById('mail-check-warn');

		if (inputCode === codeAsString) {
			emailChecked = true;
			resultMsg.innerHTML = '인증번호가 일치합니다.';
			resultMsg.style.color = 'green';
			document.getElementById('mail-Check-Btn').disabled = true;
			document.getElementById('userEmail1').readOnly = true;
			document.getElementById('userEmail2').readOnly = true;
			document.getElementById('userEmail2').onfocus = function() { this.initialSelect = this.selectedIndex; };
			document.getElementById('userEmail2').onchange = function() { this.selectedIndex = this.initialSelect; };
		} else {
			resultMsg.innerHTML = '인증번호가 불일치 합니다. 다시 확인해주세요!.';
			resultMsg.style.color = 'red';
		}
		
		if (idChecked && nicknameChecked && pwdChecked && emailChecked) {
            btnRegister.classList.remove('disabled');
        } else {
            btnRegister.classList.add('disabled');
        }
	});

    async function checkUserid(e) {
		
        const user_id = e.target.value; // 먼저 nickname 변수를 정의
    	console.log("checkUserid called", user_id); // 그 후에 console.log에서 사용
        
        const uri = `checkid?user_id=${user_id}`;
        const response = await axios.get(uri);
        
        const checkIdResult = document.querySelector('div#checkIdResult');
        if (response.data === 'Y') {
            idChecked = true;
            checkIdResult.innerHTML = '멋진 아이디입니다!';
            checkIdResult.classList.remove('text-danger');
            checkIdResult.classList.add('text-success');
        } else {
            idChecked = false;
            checkIdResult.innerHTML = '사용할 수 없는 아이디입니다.';
            checkIdResult.classList.remove('text-success');
            checkIdResult.classList.add('text-danger');
        }
        
        if (idChecked && nicknameChecked && pwdChecked && emailChecked) {
            btnRegister.classList.remove('disabled');
        } else {
            btnRegister.classList.add('disabled');
        }
    }
    
    async function checkNickname(e) {
		
		
        const nickname = e.target.value; // inputNickname.value
        console.log("checkNickname called", nickname);
        
        const uri = `checknickname?nickname=${nickname}`;
        const response = await axios.get(uri);
        
        const checkNicknameResult = document.querySelector('div#checkNicknameResult');
        if (response.data === 'Y') {
            nicknameChecked = true;
            checkNicknameResult.innerHTML = '멋진 닉네임입니다!';
            checkNicknameResult.classList.remove('text-danger');
            checkNicknameResult.classList.add('text-success');
        } else {
            nicknameChecked = false;
            checkNicknameResult.innerHTML = '사용할 수 없는 닉네임입니다.';
            checkNicknameResult.classList.remove('text-success');
            checkNicknameResult.classList.add('text-danger');
        }
        
        if (idChecked && nicknameChecked && pwdChecked && emailChecked) {
            btnRegister.classList.remove('disabled');
        } else {
            btnRegister.classList.add('disabled');
        }
    }
    
    function checkPassword(e) {
        if (e.target.value === '') {
            pwdChecked = false;
        } else {
            pwdChecked = true;
        }
        
        if (idChecked && pwdChecked && emailChecked) {
            btnRegister.classList.remove('disabled');
        } else {
            btnRegister.classList.add('disabled');
        }
    }
    
});