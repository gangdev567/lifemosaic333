<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내가 쓴 게시글</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="../css/myPostListStyle.css" rel="stylesheet"> <!-- 외부 스타일시트 링크 -->
</head>
<body>
    <div id="top">
        <c:url var="homePage" value="/" />
        <a href="${homePage}"> <img alt="라이프 모자이크 로고" src="../img/logo.png" style="width: 130px; height: 38px" /></a>
    </div>

    <div id="content" class="container-fluid">
        <div id="left" class="col">
            <%@ include file="../fragments/settingNavigation.jspf"%> <!-- 설정 메뉴 -->
        </div>
        <div id="center" class="col-6">
            <h2 class="text-center my-4">내가 쓴 게시글</h2>
            <c:choose>
                <c:when test="${not empty posts}">
                    <div class="list-group">
                        <c:forEach items="${posts}" var="post">
                            <a href="/project/post/detail?post_id=${post.post_id}" class="list-group-item list-group-item-action">
                                <h5 class="mb-1">${post.title} <small>(조회수: ${post.view_count}, 댓글 수: ${post.comment_count})</small></h5>
                                <p class="mb-1">${post.content}</p>
                                <small>작성일: ${post.created_time}</small>
                            </a>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <p class="text-center">게시글이 없습니다.</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div id="right" class="col">
            <!-- 추가적인 사이드 컨텐츠 -->
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../js/profile-modify.js"></script>
</body>
</html>