<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
    
        <div>
        
        <main class="my-2">
            <div class="card">
                <form class="card-body" id="postModifyform">
                    <div class="my-2">
                        <c:url var="returnList" value="/post/list/" >
                            <c:param name="sub_category_id" value="${post.sub_category_id}"></c:param>
                        </c:url>
                        <a class="btn btn-primary fs-5 fw-bold" href="${returnList}">게시판 돌아가기</a>
                    </div>
                    <div class="my-2">
                        <input class="d-none" id="sub_category_id" name="sub_category_id" value="${post.sub_category_id}" />
                        <label for="post_id" class="form-label">번호</label> 
                        <input class="form-control" id="post_id" name="post_id"
                            type="number" value="${post.post_id}" readonly />
                    </div>
                    <div class="my-2">
                        <label for="title" class="form-label">제목</label>
                        <input class="form-control" id="title" name="title"
                            type="text" value="${post.title}"/>
                    </div>
                    <div class="my-2">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control" id="content" name="content"
                            rows="5" cols="80" >${post.content}</textarea>
                    </div>
                    
                    <!-- 해시태그 입력 칸 -->
                    <div>
                    	<input id="inputHashTag" class="form-control" type="text" placeholder="#해시태그 입력  #5개 등록 가능 #특수문자 제외" />
                    </div>
                    <!-- 해시태그 보여주는 창 -->
                    <div  class="my-2">
                    	<div id="hashtagList" class="d-flex gap-2 justify-content-start">
                    	</div>
                    </div>
                    
                    <div class="my-2">
                        <label for="author" class="form-label">작성자</label>
                        <input class="form-control" id="nickname"
                            type="text" value="${post.nickname}" readonly />
                    </div>
                </form>
                </div>
                <div class="card-footer">
                    <c:if test="${post.user_id eq signedInUser}">
                    <button class="btn btn-danger" id="btnDelete">삭제</button>
                    <button class="btn btn-success" id="btnUpdate" type="submit">수정완료</button>
                    </c:if>
                </div>
                
        </main>
    </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script>let a=[];</script>
			<c:forEach items="${tags }" var="tag">
				<script>a.push('${tag}');</script>
			</c:forEach>
		<script>const postid = ${post.post_id}</script>              
        <script src="../js/post-modify.js"></script>
    </body>
</html>
