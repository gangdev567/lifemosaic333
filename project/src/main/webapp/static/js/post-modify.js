/**
 * post-modify.js
 * modify.jsp에 포함됨
 * 포스트 삭제, 업데이트 기능
 */

  document.addEventListener('DOMContentLoaded', () => {
    //form 요소를 찾음.
    const form = document.querySelector('form#postModifyform');
    //포스트 번호(id)를 가지고 있는 요소를 찾음.
    const inputId = document.querySelector('input#post_id');
    
    const cId = document.querySelector('input#sub_category_id');
    
    //포스트 제목(title)을 가지고 있는 요소를 찾음
    const inputTitle = document.querySelector('input#title');
    //포스트 내용(content)를 가지고 있는 요소를 찾음.
    const textareaContent = document.querySelector('textarea#content');
    //삭제 버튼 찾기
    const btnDelete = document.querySelector('button#btnDelete');
    //수정 버튼 찾기
    const btnUpdate = document.querySelector('button#btnUpdate');
    
    //삭제 버튼에 클릭 이벤트 핸들러(리스너)를 등록
    btnDelete.addEventListener('click', () => {
       const result = confirm('정말 삭제할까요?');
       // console.log(`confirm result = ${result}`); // -> true/false
       if (result) { // result === true: 사용자가 [확인(yes)]을 선택하면
           location.href = `delete?sub_category_id=${cId.value}&post_id=${inputId.value}`; //delete 요청을 보냄
           
       } 
    });
    
    // 수정완료 번트에 클릭 이벤트 리스너를 등록.
    btnUpdate.addEventListener('click', () => {
        // 제목, 내용이 비어있는 지 체크:
        if (inputTitle.value === '' || textareaContent.value === '') {
            alert('제목과 내용을 반드시 입력해야 합니다.');
            return; // 함수를 종료한다.
        }
        
        const result = confirm('정말로 업데이트 할까요?');
        if (result) {
            form.action = 'update'; // 폼(양식)을 제출(submit)할 요청 주소. 기본값은 현재 URL.
            form.method = 'post'; // 폼 요청 방식(get/post). 기본값은 'get'.
            form.submit(); // 폼 제출(서버로 요청 보냄).
        }
    });
    
 });