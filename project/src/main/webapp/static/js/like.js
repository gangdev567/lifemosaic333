/**
 * like.js
 * 
 * 좋아요 
 * 좋아요 취소
 * 싫어요 
 * 싫어요 취소
 * 다른 사람이 누른 좋아요, 싫어요를 취소하지 못하게 한다.
 * 좋아요, 싫어요를 중복으로 하지 못하게 한다. 
 */

 document.addEventListener('DOMContentLoaded', () => {
    
    // like 버튼을 등록
    const likeBtn = document.querySelector('button#likeBtn');
    
    // dislike 버튼을 등록
    const dislikeBtn = document.querySelector('button#dislikeBtn');
    
    // 클릭 이벤트 리스너 등록
    likeBtn.addEventListener('click', postLike());
    
    // 콜백
    function postLike() {
        
        // post_id 등록
        const post_id = document.querySelector('input#post_id').value;
        // 게시글을 보고 있는 사용자의 user_id 등록
        const user_id = document.querySelector('input#writer').value;
        
        // user_id 와 post_id를 json ?(맞는지는 모름) 으로 만듬
        
        const data = {post_id, user_id};
        console.log(data);
        
        // POST 방식의 Ajax 요청을 보냄. 응답/실패 콜백을 등록.
        axios.post('../api/like/increase', data) // post 방식의 Ajax 요청으로 data를 보냄.
            .then((response) => {
                console.log(response);
                if (response.data === 1) {
                // 성공 응답이 왔을 때 실행할 콜백 등록. 
                }
            }) 
            .catch((error) => {
                console.log(error);
                // 실패 응답일 때 실행할 콜백 등록.
            }); 
    }
    
    // 페이지가 로드되면 바로 시작
    dislikeBtn.addEventListener('click', likeCount());
    
    // 좋아요 싫어요 숫자 가져오기
    function likeCount() {
        
        const post_id = document.querySelector('input#post_id');
        
        const uri = `../api/like/get/${post_id}`;
        
        axios.get(uri) // GET 방식의 Ajax 요청으 보냄.
            .then((response) => {
                console.log(response);
                //-> response 객체의 data 속성(property): 서버에서 응답으로 보낸 결과(객체)
                
                // 댓글 목록 HTML을 작성 -> like count를 보여줌
                makeLikeElement(response.data);
                
            }) // 성공 응답이 왔을 때 실행할 콜백 등록
            .catch((error) => {
                console.log(error);
            }); // 요청 실패일 때 실행할 콜백 등록
    }
    
    function makeLikeElement(data) {
        const likeDiv = document.querySelector('div#like');
        
        const htmlStr = `
            <span>${data.like_count}</span>
            <span>${data.dislike_count}</span>`;
            
        likeDiv.innerHTML = htmlStr;
    }
 });