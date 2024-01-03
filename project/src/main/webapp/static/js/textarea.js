/**
 *  textarea의 크기를 자동으로 조절하는 자바스크립트 언제까지 쓸지는 잘 모르겠지만 일단 만듬
 */

 document.addEventListener('DOMContentLoaded', () => {
     
     adjustTextareaHeight();
     
    function adjustTextareaHeight() {
      const textarea = document.getElementById('content');
      textarea.style.height = 'auto';
      textarea.style.height = `${textarea.scrollHeight}px`;
    }
     
 });