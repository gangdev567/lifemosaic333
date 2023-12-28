<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>life mosaic</title>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
            crossorigin="anonymous">
            
        <style>
            canvas {
            max-width: 400px;

        }
        /* 좋아요, 싫어요 버튼 스타일링 */
.btn-custom-like,
.btn-custom-dislike {
    font-size: 1.5rem;
    padding: 10px 20px;
    transition: all 0.3s ease;
}

/* 좋아요, 싫어요 버튼에 마우스 호버 시 스타일 변경 */
.btn-custom-like:hover,
.btn-custom-dislike:hover {
    transform: scale(1.1);
}

/* 좋아요, 싫어요 버튼 클릭 시 스타일 변경 */
.btn-custom-like:active,
.btn-custom-dislike:active {
    transform: scale(0.9);
    opacity: 0.7;
}
    </style>
	</head>
	<body>
    
   <div class="my-4">
    <c:url var="returnList" value="/post/list/">
        <c:param name="sub_category_id" value="${post.sub_category_id}"></c:param>
    </c:url>
    <a class="btn btn-primary fs-5 fw-bold me-2" href="${returnList}">게시판 돌아가기</a>
    <a id="bookmark" class="fs-5 fw-bold btn btn-secondary">북마크</a>
</div>

<main class="my-4">
    <div class="card">
        <form class="card-body">
            <div class="mb-3">
                <h2 class="fw-bold mb-3">${post.title}</h2>
                <div class="d-flex justify-content-between">
                    <div class="me-4">
                        <span class="fw-bold">작성일: </span>${post.created_time}
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="my-2">
                <label for="id" class="form-label">번호</label>
                <input class="form-control" id="post_id" type="number" value="${post.post_id}" readonly />
            </div>
            <div class="my-2">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" rows="8" readonly>${post.content}</textarea>
            </div>
            <div class="my-4">
                <label for="author" class="form-label">작성자</label>
                <input class="form-control" id="author" type="text" value="${post.nickname}" readonly />
            </div>
            <div class="my-4">
                <label for="modifiedTime" class="form-label">수정일</label>
                <input class="form-control" id="modifiedTime" type="text" value="${post.modified_time}" readonly />
            </div>
        </form>
    </div>
</main>
                
                
				<div
					style="display: flex; flex-direction: column; align-items: center;">
					<div style="margin-bottom: 20px;">
						<button class="btn btn-custom-like" id="likeBtn" name="likeBtn">
							<i class="far fa-heart fa-2x"></i> 좋아요
						</button>
						<button class="btn btn-custom-dislike" id="dislikeBtn"
							name="dislikeBtn">
							<i class="far fa-sad-tear fa-2x"></i> 싫어요
						</button>
					</div>

					<div id="like"></div>

					<div style="margin-top: 20px;">
						<canvas id="donutChart"></canvas>
					</div>
				</div>
				
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


            <%-- 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 --%>
            <%-- 내 댓글 목록 --%>
            <div class="row mx-5 my-2">
                <div class="col-10">
                    <%-- 댓글 입력창 --%>
                    <textarea class="form-control" id="ctext"
                        placeholder="댓글 입력"></textarea>
                    <%-- 댓글 작성자 아이디 - TODO 로그인 사용자 아이디로 설정 --%>
                    <input class="d-none" id="writer"
                        value="${signedInUser}" />
                </div>
                <div class="col-2">
                    <button class="btn btn-outline-success"
                        id="btnRegisterComment">등록</button>
                </div>
            </div>

            <%-- 포스트에 달려 있는 댓글 목록을 보여줄 영역 --%>
            <div class="my-2" id="comments">
            </div>

        </main>
    </div>
    <div id=pageContainer>
    </div>


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script src="../js/like.js"></script>
    <script src="../js/bookmark.js"></script>
        <script >
        const signedInUser = `${signedInUser}`;
    </script>
    <script src="../js/comment.js"></script>
    <script src="../js/time.js"></script>
</body>
</html>