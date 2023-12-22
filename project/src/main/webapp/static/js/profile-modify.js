/**
 * userProfile.jsp -> 프로필 수정 기능 
 */

 document.addEventListener('DOMContentLoaded',() => {
	 
	 let nicknameChecked = false;
	 
	 const btnCheckNickname = document.querySelector('button#btnCheckNickname');
	 
	 const inputNickname = document.querySelector('input#nickname');
	 
	 const profile = document.querySelector('input#profile_url');
	 
	 const inputProfileImg = document.querySelector('input#profile');
	 
	const inputUserId = document.querySelector('input#user_id');
	
	const inputEmail = document.querySelector('input#email');
	
	const limitUserId = document.querySelector('div#limitUserId');
	
	const limitEmail = document.querySelector('div#limitEmail');
	
	const btnUpdateNickname = document.querySelector('button#btnUpdateNickname');
	
	
	btnUpdateNickname.addEventListener('click', () =>{
		
		const user_id = inputUserId.value;
		
		const nickname = inputNickname.value;
		
	
		const data ={user_id,nickname};
		const response =  axios.post(`../setting/updateNickname`, data)
								.then((response) => {
									console.log(response);
									if(response.data === 1){
										//"닉네임 변경 성공!"이란 모달 창을 보여줌.
										alert('변경 성공');
									}else{
										//
										alert('변경 실패');
									}
								})
								.catch((error) =>{
									console.log(error);
								} );
								
		
		
		
		
		
	});
	 
	inputUserId.addEventListener('click', ()=> {
	
		       limitUserId.innerHTML = '* 아이디는 변경하실 수 없습니다.';
            limitUserId.classList.add('text-danger');
            limitUserId.classList.add('fw-bold');
            
	});
	inputEmail.addEventListener('click', ()=>{
		limitEmail.innerHTML = '* 이메일은 변경하실 수 없습니다.';
		limitEmail.classList.add('text-danger');
		limitEmail.classList.add('fw-bold');
		
	});
	 
	 btnCheckNickname.addEventListener('click', checkNickname);//end btnNicknameModify
	 
	async function checkNickname(e){
		console.log("click");
		const nickname = inputNickname.value;
		
		console.log(nickname);
		 const uri = `checkNickname?nickname=${nickname}`;
		 
		 const response = await axios.get(uri);
		 
		 if(response.data === 'YYY'){
			 
			 nicknameChecked = false;
			 alert('이미 사용 중인 닉네임입니다.');
		 }else{
			 if(nickname ===''){
				 alert('닉네임을 입력해주세요.');
				 return;
			 }
			 nicknameChecked = true;
			 alert('사용 가능한 닉네임입니다.');
			 
		 }
		
	 }
	 
	 
	 
 });//end Document