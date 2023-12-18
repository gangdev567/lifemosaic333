/**
 * user.js
 * 회원가입 아이디 중복 체크, 회원가입 버튼 활성화/비활성화.
 */

document.addEventListener('DOMContentLoaded', () => {
    let idChecked = false;
    let pwdChecked = false;
    let emailChecked = false;
    let nicknameChecked = false;
    
    const btnRegister = document.querySelector('button#btnRegister');
        
    const inputUserid = document.querySelector('input#user_id');
    inputUserid.addEventListener('change', checkUserid);
    
    const inputNickname = document.querySelector('input#nickname');
    inputNickname.addEventListener('change', checkNickname);
    
    const inputPassword = document.querySelector('input#password');
    inputPassword.addEventListener('change', checkPassword);
    
    const inputEmail = document.querySelector('input#email');
    inputEmail.addEventListener('change', checkEmail);
    
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
    
    function checkEmail(e) {
        if (e.target.value === '') {
            emailChecked = false;
        } else {
            emailChecked = true;
        }
        
        if (idChecked && pwdChecked && emailChecked) {
            btnRegister.classList.remove('disabled');
        } else {
            btnRegister.classList.add('disabled');
        }
    }
    
});