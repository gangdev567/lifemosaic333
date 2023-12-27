

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
		 const uri = `../setting/checkNickname?nickname=${nickname}`;
		 
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
	    // 이 부분이 빠졌었습니다. 닉네임 저장 버튼 클릭 이벤트 핸들러를 추가합니다.
  
        btnUpdateNickname.addEventListener('click', () => {
            if (!nicknameChecked) {
                alert('닉네임 중복 확인을 해주세요.');
                e.preventDefault();
            }else{
				const user_id = inputUserId.value;
		
		const nickname = inputNickname.value;
		 if(nickname ===''){
				 alert('닉네임을 입력해주세요.');
				 return;
			 }
			 
		
	
		const data ={user_id,nickname};
		const response =  axios.post(`../setting/updateNickname`, data)
								.then((response) => {
									console.log(response);
									if(response.data === 1){
										//"닉네임 변경 성공!"이란 모달 창을 보여줌.
										alert('변경 성공');
									}else{
										//
										
									}
								})
								.catch((error) =>{
									alert('변경 실패');
								} );	
			}
            // 여기에 닉네임 저장 로직을 구현하면 됩니다.
        });
    

	 
 });//end Document

   
