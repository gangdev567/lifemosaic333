<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
    </style>
	</head>
	<body>
    
        <div class="my-2">
            <c:url var="returnList" value="/post/list/" >
                <c:param name="sub_category_id" value="${post.sub_category_id}"></c:param>
            </c:url>
            <a class="btn btn-primary fs-5 fw-bold" href="${returnList}">게시판 돌아가기</a>
            <a id="bookmark" class="fs-5 fw-bold btn btn-secondary">북마크</a>
        </div>
        
        <div>
        <main class="my-2">
            <div class="card">
                <form class="card-body">
                    <div class="my-2">
                        <label for="id" class="form-label">번호</label> <input
                            class="form-control" id="post_id" type="number"
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
                <div>
                    <button class="btn btn-success" id="likeBtn" name="likeBtn">좋아요</button>
                    <button class="btn btn-danger" id="dislikeBtn" name="dislikeBtn">싫어요</button>
                </div>
                <div id="like">
                </div>
                <div>
                    <canvas id="donutChart"></canvas>
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

            <div class="my-2 card">
                <div class="card-header d-inline-flex gap-1">
                    <%-- collapse(접기/펼치기) 기능 버튼 --%>
                    <button class="btn btn-secondary"
                        id="btnToggleComment">댓글 보기</button>
                </div>
                <%-- 댓글 토글 버튼에 의해서 접기/펼치기를 할 영역 --%>
                <div class="card-body collapse" id="collapseComments">
                    <div class="d-none card card-body">PEPPER</div>
                    <%-- 내 댓글 목록 --%>
                    <div class="row my-2">
                        <div class="col-10">
                            <%-- 댓글 입력창 --%>
                            <textarea class="form-control" id="ctext"
                                placehold="댓글 입력"></textarea>
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
                    <div class="my-2" id="comments"></div>

                </div>
            </div>

            <%-- 댓글 업데이트 모달(다이알로그) --%>
            <div class="modal" id="commentModal" class="modal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Modal title</h5>
                            <button type="button" class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <%-- 수정할 댓글 아이디 --%>
                            <input class="d-none" id="modalCommentId"/>
                            <%-- 댓글 입력 --%>
                            <textarea class="form-control" id="modalCommentText"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal">취소</button>
                            <button id="btnUpdateComment" type="button" data-id="${comment.id}"
                                class="btn btn-primary">변경 내용 저장</button>
                        </div>
                    </div>
                </div>
            </div> <%-- end modal --%>
        </main>
    </div>
  
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script src="../js/like.js"></script>
        <script src="../js/bookmark.js"></script>
	</body>
</html>