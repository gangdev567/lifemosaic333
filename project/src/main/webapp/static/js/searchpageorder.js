/**
 * searchlist.jsp 사용
 */

document.addEventListener('DOMContentLoaded', function(){
	
	//기본 정렬 조건 설정
	//정렬 방법
	let orderStatus = 'upto';  // upto 면 최신순, good 면 좋아요 순
	//서브 카테고리 구분
	let  subcategory=0;

	//검색 키워드와 검색 카테고리 가져오기
	const keyword = document.querySelector('strong#keyword').innerHTML;
	const search_category = document.querySelector('div#search_category').innerHTML;
	
	const count_per_page = 10;
	let currentPage = 1;
	let searchData ='';

	//맨 처음 검색될 시 화면에 띄워줌
	workPost();



	
	// 정렬 버튼 이벤트 리스너 등록하기
	const btnOrder = document.querySelector('span#orderSearchList');
	btnOrder.addEventListener('click', function(){
		if(btnOrder.innerHTML === '좋아요순'){
			
			btnOrder.innerHTML = "최신순"
			orderStatus = 'good';
		}else{
			btnOrder.innerHTML = "좋아요순"
			orderStatus = 'upto';
		}
		
		workPost();
	});
	
	
	
	//카테고리 버튼 이벤트 리스너 등록하기
	const ulSubCatogoryList = document.querySelector('ul#sub_category');
	ulSubCatogoryList.addEventListener('click', selectByCategory);
	function selectByCategory(e){
		subcategory = e.target.name;
		
		let btnSelectCategory = document.querySelector('button#btnSelectCategory');
		
		btnSelectCategory.innerHTML = e.target.innerHTML;
		
		workPost();
	};
	



// 비동기 데이터 전송 함수 ---------------------------------------------------------------------------
	async function workPost(){
		try{
			const uri = `../api/sort/category`;
			const data = {orderStatus, subcategory , keyword, search_category};
			const response = await axios.post(uri,data);
			
			searchData = response.data;

			makePostHtmlTemplet(currentPage);
			makePageHtmlTemplet();
		}catch(error){
			console.log(error);
		}
	}



// html 템플릿 만들기 -------------------------------------------------------------------------------
	function makePageHtmlTemplet(){
		//페이지 템플릿
		const divPage = document.querySelector('div#pageTemplate');
		
		divPage.innerHTML='';
		let htmlStrPage ='';
		
		//한 페이지 당 보여줄 포스트 개수
		const totalPageCount = Math.ceil(searchData.length/count_per_page);
		console.log("totalPageCount = " ,totalPageCount);
		
		//페이지 번호 동적으로 생성
		htmlStrPage += `<nav><ul class="pagination pagination-sm">`;
		for(let num=1; num<=totalPageCount ; num++){
			htmlStrPage += 
			`<li class="page-item"  >
	    	<span class="liPageSelect page-link text-secondary" data-id="${num}">${num}</span>
		</li>`;
		}
		
		divPage.innerHTML=htmlStrPage;
		
		//페이지에 클릭 이벤트 리스너 등록
		const selectPage = document.querySelectorAll('span.liPageSelect');
		console.log("selectPage : ", selectPage);
		for(let pageSelect of selectPage){
			pageSelect.addEventListener('click', changecurrentPage);
		}	
	}
	
	function changecurrentPage(e){
				const aPage = e.target.getAttribute('data-id');
				makePostHtmlTemplet(aPage);
	}
	
	
	function makePostHtmlTemplet(pageNumber){
		console.log("makePostHtmlTemplet 실행");
		console.log("현재 선택된 페이지는?" , pageNumber);

		//검색 결과 템플릿
		const divPost = document.querySelector('div#postTemplate')

		divPost.innerHTML='';
		
		let htmlStr ='';
		
		if(searchData === null){
			console.log("데이터가 널임");
			htmlStr += `<div class="my-3 ms-2">
			<h4>검색되는 결과가 없습니다.</h4></div>`;
		}else{
			console.log("데이터가 널 아님");
			for(
					let i = count_per_page * (pageNumber -1) +1;
					i<=count_per_page * (pageNumber -1) + count_per_page && i<= searchData.length;
					i++
			){
				
				htmlStr +=`
				<div class="my-3 ms-2">
					<div class="my-2">
						<span class="badge text-bg-light text-secondary">
						${searchData[i-1].sub_category_name }
						</span>
					</div>
					
					<div>
						<div class="mb-4">
							<h5><strong>
								<a class="nav-link" href="detail?post_id=${searchData[i-1].post_id}">							
									${searchData[i-1].title }
								</a>
							</strong></h5>
						</div>
						<div class="mb-4" style="font-size:15px">
							<a class="nav-link" href="detail?post_id=${searchData[i-1].post_id}">
								${searchData[i-1].content }
							</a>
						</div>
					</div>
					
					<div>
						<p class="fw-bold" style="margin-bottom: 8px;font-size:12px">${searchData[i-1].nickname }</p>
					</div>
					
					<div class="row text-secondary"  style="font-size:12px;">
					
						<div class="col-4">
							<div>
								<span class="me-4">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
								<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
								</svg>
								${searchData[i-1].view_count }
								</span>
								<span class="me-4">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
									<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
									</svg>
									${searchData[i-1].like_point }
								</span>
								<span class="me-4">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-dots" viewBox="0 0 16 16">
								<path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
								<path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
								</svg>
								${searchData[i-1].comment_cnt }
								</span>
							</div>
						</div>
						<div class="col">${searchData[i-1].created_time}</div>
						
					</div><!-- end of post footer -->
					<hr/>
					</div>
				`;
			}
		}

		divPost.innerHTML = htmlStr;

	};
});
