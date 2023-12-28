/**
 * create.jsp 작성
 * 폼 제출 버튼 이벤트 작성
 * 해시태그 엔터 이벤트 작성
 */

 document.addEventListener('DOMContentLoaded', function(){
	 const formCreate = document.querySelector('form#createForm');
	 const btnFormCreate = document.querySelector('button#btnCreate');
	 
	 const inputHash = document.querySelector('input#inputHashTag');
	
	//엔터 및 스페이스가 눌렸을 때 해시태그를 html 출력
	 inputHash.addEventListener('keydown', function(e){
		 //엔터키가 눌렸을 때
		 if(e.keyCode === 13 || e.keyCode === 32){
			 
			// 특수문자를 허용하지 않을 정규식
    		const regex = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gim;
			 
			 let hashValue = (inputHash.value).trim();	//앞 뒤 공백 제거
		     hashValue = hashValue.replace(regex, '');  //특수문자 삭제
			 
			 console.log("1. input 글자 : ", hashValue);

			 const liValue = document.querySelectorAll('span.tagValue');
			 if(hashValue !== '' && liValue.length<5){
					 //입력된 값 중복 확인하기
					 //이미 입력된 태그를 다시 입력하면 input창을 초기화하고 함수 종료
					 for(let item of liValue){
						 if(hashValue === item.innerHTML	){
							 console.log("2. 똑같은 글자 발견 : ", inputHash.value);
							 alert("동일한 태그가 존재합니다.");
					 		 inputHash.value = '';
							 return;
						 }
					 }
					 //html에 태그 출력
					 htmlTagList(hashValue); 
			 }else if(hashValue === ''){
				 alert('태그 내용을 확인해주세요.');
			 }else{
				 //5개 초과 시 입력할 수 없음.
				 alert("태그는 5개만 입력 가능합니다.");
			 }
		 		inputHash.value = '';
		 }
	 });
	 
	 //글 작성 폼 클릭 이벤트 리스너 등록
	 btnFormCreate.addEventListener('click', async function() {
		 const liValue = document.querySelectorAll('span.tagValue');
		 for (let item of liValue) {
			 //해시태그 테이블에 저장된 해시태그 있는지 검사 - select
			 let result = await axios.get(`../post/checktag?tag=${item.innerHTML}`);
			 
			 //존재하지 않는다면 그 태그를 테이블에 저장
			 if(result.data !== 1){
					 console.log("4. 중복된 글자 없음 : ", item.innerHTML);
				 	 await axios.get(`../post/createtag?tag=${item.innerHTML}`);
				 	 
			 }
		 }

		 formCreate.action = 'create';
		 formCreate.method = 'post';
		 formCreate.submit();
	 });
     
     
//---------------------------------------------------------------------------------------------	 
 //html에 태그 출력
 function htmlTagList(tag){
	 	 let hashtagList = document.querySelector('div#hashtagList');
	 	 
	 	 //해시태그 <ul>에 출력함
	 	  hashtagList.innerHTML += 
	 	  `<span id=${tag} class="badge d-flex p-2 align-items-center text-primary-emphasis bg-light-subtle rounded-pill border  border-dark-subtle">
		    <span class="px-1 tagValue">${tag}</span>
		    <span class="btn-close btnDel"  data-id="${tag}"></span>
            <input class="d-none" name="hashTag" value="${tag}" />
		    </span>`
	 	  
	 	  //x에 클릭이벤트 리스너 등록하기
	 	  const btnDelete = document.querySelectorAll('span.btnDel');
	 	  for(let btnD of btnDelete){
			   btnD.addEventListener('click', function(e){
				   const aTag = 'span#'+ e.target.getAttribute('data-id');
				   const cTag = document.querySelector(aTag);
				   cTag.remove();
			   })
		   }
		 //input 초기화
		 inputHash.value = '';
 };


 });