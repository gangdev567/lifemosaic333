<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>life mosaic</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style>
/* 캔버스 요소의 최대 너비 설정 */
canvas {
	max-width: 200px;
}

/* 좋아요, 싫어요 버튼 스타일링 */
.btn-custom-like, .btn-custom-dislike {
	font-size: 1.5rem;
	padding: 10px 20px;
	transition: all 0.3s ease;
}

/* 좋아요, 싫어요 버튼에 마우스 호버 시 스타일 변경 */
.btn-custom-like:hover, .btn-custom-dislike:hover {
	transform: scale(1.1);
}
</style>
</head>
<body>

	<div class="my-4 d-flex justify-content-center">
		<%-- 게시판 돌아가기 및 북마크 버튼 --%>
		<c:url var="returnList" value="/post/list/">
			<c:param name="sub_category_id" value="${post.sub_category_id}"></c:param>
		</c:url>
		<a class="btn fs-5 fw-bold me-2" href="${returnList}"
			style="background-color: #3498db;"> <i
			class="fas fa-arrow-left me-1"></i> <!-- 화살표 아이콘 --> 게시판 돌아가기
		</a> <a id="bookmark" class="fs-5 fw-bold btn"
			style="background-color: #3498db;"> <i
			class="fas fa-bookmark me-1"></i> <!-- 북마크 아이콘 --> 북마크
		</a>
	</div>

	<main class="my-4">
		<div class="card">
			<form class="card-body">
				<div class="mb-3">
					<div>
						<%-- 게시글 정보 --%>
						<i class="fas fa-user me-1"></i>
						<!-- 사용자 아이콘 -->
						${post.nickname}
						<!-- 작성자 -->
						<span class="mx-2">|</span> <i class="far fa-thumbs-up me-1"></i>
						<!-- 좋아요 아이콘 -->
						포인트??
						<!-- 포인트??-->
						<span class="mx-2">|</span> <i class="far fa-eye me-1"></i>
						<!-- 조회수 아이콘 -->
						${post.view_count}
						<!-- 조회수 -->
						<span class="mx-2">|</span> <span class="fw-bold " id="time">${post.created_time}</span>
						<!-- 작성 시간 -->
					</div>
					<h2 class="fw-bold mb-3 my-3">${post.title}</h2>
					<div class="d-flex justify-content-between">
						<div class="me-4"></div>
					</div>
				</div>

				<hr class="my-4">
				<div class="my-2">
					<%-- 게시글 내용 --%>
					<input style="display: none;" class="hidden" id="post_id"
						type="number" value="${post.post_id}" readonly />
				</div>
				<div class="my-2">
					<label for="content" class="form-label"></label>
					<div class="form-control" id="content">${post.content}</div>
				</div>

				<!-- 해시태그 보여주기 -->
				<div class="d-flex gap-2 justify-content-start">
					<c:forEach items="${tags }" var="tag">
						<span
							class="px-3 py-1 text-primary-emphasis bg-light-subtle rounded-pill border  border-dark-subtle">#${tag}</span>
					</c:forEach>
				</div>

			</form>
		</div>

	
		<div class="d-flex justify-content-center my-4">
			<div
				style="display: flex; flex-direction: column; align-items: center;">
				<div style="margin-bottom: 20px;">
					<%-- 좋아요 및 싫어요 버튼 --%>
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
					<%-- 차트 --%>
					<canvas id="donutChart"></canvas>
				</div>
			</div>
		</div>

		<div style="margin-top: 20px;">
			<canvas id="donutChart"></canvas>
		</div>


		<div class="card-footer d-flex justify-content-center">
			<%-- 수정 버튼 작성자와 로그인한 이용자가 같을때 보여주기--%>
			<c:if test="${signedInUser eq post.user_id}">
				<c:url var="postmodify" value="/post/modify">
					<c:param name="post_id" value="${post.post_id}"></c:param>
				</c:url>
				<a class="btn btn-primary" href="${postmodify}"
					style="background-color: #3498db;">수정</a>
			</c:if>
		</div>

		<%-- 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 --%>
		<%-- 내 댓글 목록 --%>
		<div class="row mx-5 my-2">
			<div class="col-10">
				<%-- 댓글 입력창 --%>
				<textarea class="form-control" id="ctext" placeholder="댓글 입력"></textarea>
				<%-- 댓글 작성자 아이디 - TODO 로그인 사용자 아이디로 설정 --%>
				<input class="d-none" id="writer" value="${signedInUser}" />
			</div>
			<div class="col-2">
				<button class="btn btn-outline-success" id="btnRegisterComment">등록</button>
			</div>
		</div>

		<%-- 포스트에 달려 있는 댓글 목록을 보여줄 영역 --%>
		<div class="my-2" id="comments"></div>


				<div class="my-2 card">
                <div class="card-header d-inline-flex gap-1">
                    <!-- collapse(접기/펼치기) 기능 버튼 -->
                    <button class="btn btn-secondary" id="btnToggleComment">댓글 보기</button>
                </div>
                <!-- 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 -->
                <div class="card-body collapse" id="collapseComments">
                    <div class="card card-body">
                        <!-- 내 댓글 등록 -->
                        <div class="row my-2">
                            <div class="col-10">
                                <!-- 댓글 입력 창 -->
                                <textarea class="form-control"
                                    id="comment_content" placeholder="댓글 입력"></textarea>
                                <!-- 댓글 작성자 아이디 - 로그인 사용자 아이디로 설정 -->
                                <input class="d-none" id="writer" value="${signedInUser}" />
                            </div>
                            <div class="col-2">
                                <button class="btn btn-outline-success" 
                                    id="btnRegisterComment">등록</button>
                            </div>
                        </div>
                        
                        <!-- 포스트에 달려 있는 댓글 목록을 보여줄 영역 -->
                        <div class="my-2" id="comments"></div>
                    </div>
                </div>
            </div>
            
            <!-- 댓글 업데이트 모달(다이얼로그) -->
            <div id="commentModal" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body">
                            <!-- 수정할 댓글 아이디 -->
                            <input class="d-none" id="modalCommentId" />
                            <!-- 댓글 입력 -->
                            <textarea class="form-control" id="modalCommentText"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">취소</button>
                            <button id="btnUpdateComment" type="button"
                                class="btn btn-primary">변경 내용 저장</button>
                        </div>
                    </div>
                </div>
            </div> <!-- end modal -->
  
  
		

	</main>
	<div id=pageContainer></div>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script src="https://kit.fontawesome.com/1306328925.js" crossorigin="anonymous"></script>

<script src="../js/like.js"></script>
<script src="../js/bookmark.js"></script>
<script>
        const signedInUser = `${signedInUser}`;
    </script>

<script src="../js/comment.js"></script>
<script src="../js/time-details.js"></script>




</body>
</html>