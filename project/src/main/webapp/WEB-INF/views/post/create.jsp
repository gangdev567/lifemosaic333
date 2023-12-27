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
	</head>
	<body>
    
    <main>
            <div class="card p-2">
                <c:url var="postCreatePage" value="/post/create" />
                <form id="createForm" class="card-body" action="${postCreatePage}" method="post">
                    <div class="my-2">
                        <input class="form-control" type="text" name="title" placeholder="제목" autofocus required />
                    </div>
                    <div class="my-2">
                        <textarea class="form-control" name="content" rows="5" required></textarea>
                    </div>
                    
                    <!-- 해시태그 입력 칸 -->
                    <div>
                    	<input id="inputHashTag" class="form-control" type="text" placeholder="#해시태그 입력  #5개 등록 가능 #특수문자 제외" />
                    </div>
                    
                    <div class="d-none">
                        <input class="form-control" type="text" name="user_id" value="${signedInUser}" readonly/>
                    </div>
                    <div class="d-none">
                        <input class="form-control" type="number" name="sub_category_id" value="${cId}" readonly/>
                    </div>
                    
                    <!-- 해시태그 보여주는 창 -->
                    <div  class="my-2">
                    	<div id="hashtagList" pattern="[A-Za-z0-9\s]+" class="d-flex gap-2 justify-content-start"></div>
                    </div>
                </form>
                <button id="btnCreate" class="btn btn-success">작성 완료</button>
            </div>
        </main>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../js/post-create.js"></script>
	</body>
</html>