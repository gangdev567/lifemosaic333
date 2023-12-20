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
    
        <div class="my-2">
            <c:url var="returnList" value="/post/list/" >
                <c:param name="sub_category_id" value="${post.sub_category_id}"></c:param>
            </c:url>
            <a class="btn btn-primary fs-5 fw-bold" href="${returnList}">게시판 돌아가기</a>
        </div>
        <div>
        <main class="my-2">
            <div class="card">
                <form class="card-body">
                    <div class="my-2">
                        <label for="id" class="form-label">번호</label> <input
                            class="form-control" id="id" type="number"
                            value="${post.post_id}" readonly />
                    </div>
                    <div class="my-2">
                        <label for="title" class="form-label">제목</label>
                        <input class="form-control" id="title"
                            type="text" value="${post.title}" readonly />
                    </div>
                    <div class="my-2">
                        <label for="content" class="form-label">내용</label>
                        <textarea class="form-control" id="content"
                            rows="5" cols="80" readonly>${post.content}</textarea>
                    </div>
                    <div class="my-2">
                        <label for="author" class="form-label">작성자</label>
                        <input class="form-control" id="author"
                            type="text" value="${post.nickname}" readonly />
                    </div>
                    <div class="my-2">
                        <label for="createdTime" class="form-label">작성일</label>
                        <input class="form-control" id="createdTime"
                            type="text" value="${post.created_time}"
                            readonly />
                    </div>
                    <div class="my-2">
                        <label for="modifiedTime" class="form-label">수정일</label>
                        <input class="form-control" id="modifiedTime"
                            type="text" value="${post.modified_time}"
                            readonly />
                    </div>
                </form>
                <div class="card-footer">
                <%-- 작성자 아이디와 로그인 사용자 아이디가 같을 때만 [수정하기] 버튼을 보여줌. --%>
                <c:if test="${signedInUser eq post.user_id}">
                    <c:url var="postmodify" value="/post/modify">
                        <c:param name="post_id" value="${post.post_id}"></c:param>
                    </c:url>
                    <a class="btn btn-primary" href="${postmodify}">수정</a>
                </c:if>
                </div>
            </div>

            
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
	</body>
</html>