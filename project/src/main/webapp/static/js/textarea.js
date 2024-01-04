/**
 *  textarea의 크기를 자동으로 조절하는 자바스크립트 언제까지 쓸지는 잘 모르겠지만 일단 만듬
 */

document.addEventListener('DOMContentLoaded', function() {
  // 동영상이 포함된 태그를 찾습니다.
  const oembedTag = document.querySelector('oembed[url^="https://www.youtube.com"]');

  // 태그가 존재하는 경우
  if (oembedTag) {
    // oembed 태그의 url 속성을 통해 YouTube 동영상의 URL을 가져옵니다.
    const youtubeUrl = oembedTag.getAttribute('url');

    // YouTube 동영상의 ID를 추출합니다.
    const videoId = youtubeUrl.match(/watch\?v=([^&]+)/)[1];
    if (videoId) {
      // YouTube 동영상을 표시할 HTML 코드를 생성합니다.
      const iframeHtml = `<iframe width="560" height="315" src="https://www.youtube.com/embed/${videoId}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>`;

      // 생성한 HTML 코드를 figure 요소 안에 삽입합니다.
      const figureElement = document.getElementById('youtube-video');
      figureElement.innerHTML = iframeHtml;
    }
  }
  
  const wrapperDiv = document.querySelector('.my-4.grow-wrap');
  const contentDiv = document.querySelector('#content');

  // 페이지 로드 시 처음에 DIV의 높이를 CONTENT의 높이로 설정합니다.
  wrapperDiv.style.height = contentDiv.offsetHeight + 'px';
  
  // CONTENT의 내용이 변경될 때마다 DIV의 높이를 동적으로 조정합니다.
  contentDiv.addEventListener('input', function() {
    wrapperDiv.style.height = contentDiv.offsetHeight + 'px';
  });
  
});