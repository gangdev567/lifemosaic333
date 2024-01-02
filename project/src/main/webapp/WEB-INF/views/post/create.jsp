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
option:hover,  .active{
  background-color: #F3F1F5;
}
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <form id="createForm" action="${postCreatePage}" method="post" class="border p-4 rounded" >
              <div class="mb-3">
			    <label for="postTitle" class="form-label">제목</label>
			    <input id="postTitle" class="form-control" type="text" name="title" placeholder="제목을 입력해주세요." autofocus required>
			    <div id="titleError"></div>
			</div>
			<div class="mb-3">
			    <label for="postContent" class="form-label">본문</label>
			    <textarea id="postContent" class="form-control" name="content" rows="12" placeholder="내용을 입력해주세요." required></textarea>
			    <div id="contentError"></div>
			</div>
                <div class="mb-3">
                    <label for="inputHashTag" class="form-label">태그 - 내용을 대표하는 태그 5개 정도 입력해주세요.</label>
                    <input id="inputHashTag" class="form-control" type="text" placeholder="#특수문자 제외" list="searchOptions">
<!-- 자동완성 기능 ------------------------------------------------------------------------ -->                    	
                    <datalist id="searchOptions">
                    	<option value="키워드 준비 중 ..." />
                    </datalist>
<!-- ------------------------------------------------------------------------------------------ -->
                </div>
                <div class="d-none">
                    <input class="form-control" type="text" name="user_id" value="${signedInUser}" readonly>
                </div>
                <div class="d-none">
                    <input class="form-control" type="number" name="sub_category_id" value="${cId}" readonly>
                </div>
                <div id="hashtagList" class="d-flex gap-2 justify-content-start"></div>
                <div class="mb-3">
                </div>
            </form>
                    <button id="btnCreate" class="btn btn-primary me-2">등록</button>
                    <button id="btnCancel" class="btn btn-outline-secondary text-dark">취소</button>
        </div>
    </div>
</div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.2.0/classic/ckeditor.js"></script>
    <script src="https://kit.fontawesome.com/1306328925.js" crossorigin="anonymous"></script>
    <script src="../js/post-create.js"></script> 
</body>
</html>
