/**
 * userProfile.jsp -> 프로필 수정 기능 
 */

 document.addEventListener('DOMContentLoaded',() => {
	 
	 let nicknameChecked = false;
	 
	 const btnCheckNickname = document.querySelector('button#btnCheckNickname');
	 
	 const inputNickname = document.querySelector('input#nickname');
	 
	 const profile = document.querySelector('input#profile_url');
	 
	 const inputProfileImg = document.querySelector('input#profileImg');
	 
	 

	 
	 console.log(btnCheckNickname);
	 
	 btnCheckNickname.addEventListener('click', checkNickname);//end btnNicknameModify
	 
	async function checkNickname(e){
		console.log("click");
		const nickname = e.target.value;
		console.log(nickname);
		 const uri = `checkNickname?nickname=${nickname}`;
		 
		 const response = await axios.get(uri);
		 
		 if(response.data === 'YYY'){
			 nicknameChecked = false;
			 alert('이미 사용 중인 닉네임입니다.');
		 }else{
			 nicknameChecked = true;
			 alert('사용 가능한 닉네임입니다.');
		 }
		
	 }
	 
	 
	 
 });//end Document