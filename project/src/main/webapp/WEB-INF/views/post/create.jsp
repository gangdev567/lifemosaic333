<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>life mosaic</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
          crossorigin="anonymous">
          
    <style>
      .ck.ck-editor {
        width: 100%; /* 에디터의 너비를 조정합니다. */
        max-width: 100%; /* 최대 너비를 설정합니다. */
        margin: 0 auto;
      }

      .ck-editor__editable {
        min-height: 300px; /* 최소 높이를 설정합니다. */
      }

      form {
        text-align: center;
      }

      main {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .card {
        width: 90%; /* 카드의 너비를 조정합니다. */
        max-width: 800px; /* 최대 너비를 설정합니다. */
        margin: auto; /* 가운데 정렬을 위한 추가 */
      }

      #editor {
        height: 300px; /* 에디터 높이 설정 */
        border: 1px solid #ced4da; /* 테두리 추가 */
        padding: 5px; /* 내부 여백 추가 */
      }
    </style>
</head>
<body>
    <main>
        <div class="card p-2">
            <form id="createForm" class="card-body" action="${postCreatePage}" method="post">
                <div class="my-2">
                    <input class="form-control" type="text" name="title" placeholder="제목" autofocus required />
                </div>
                <div class="my-2">
                    <div id="editor"></div> <!-- 에디터 div로 변경 -->
                    <textarea id="editorTextarea" class="form-control d-none" name="content" rows="5" required></textarea>
                </div>
                    
                <!-- 해시태그 입력 칸 -->
                <div class="my-2">
                    <input id="inputHashTag" class="form-control" type="text" placeholder="#해시태그 입력  #5개 등록 가능 #특수문자 제외" />
                </div>
                    
                <div class="d-none">
                    <input class="form-control" type="text" name="user_id" value="${signedInUser}" readonly/>
                </div>
                <div class="d-none">
                    <input class="form-control" type="number" name="sub_category_id" value="${cId}" readonly/>
                </div>
                    
                <!-- 해시태그 보여주는 창 -->
                <div class="my-2">
                    <div id="hashtagList" class="d-flex gap-2 justify-content-start"></div>
                </div>
            </form>
            <button id="btnCreate" class="btn btn-success">작성 완료</button>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
    <script src="../js/post-create.js"></script>
    <script>		
        ClassicEditor
            .create(document.querySelector('#editor'))
            .then(editor => {
                console.log('Editor was initialized');
                const form = document.getElementById('createForm');
                const editorTextarea = document.getElementById('editorTextarea');
                
                document.getElementById('btnCreate').addEventListener('click', function() {
                    editorTextarea.value = editor.getData();
                    form.submit();
                });
            })
            .catch(error => {
                console.error(error);
            });
    </script>
</body>
</html>