<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<style>
	 body {
            margin: 10px;
            padding: 10px;
            font-family: Arial, sans-serif;
            
        }

        #top {
            padding: 20px;
            margin: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
         #content {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

        #left, #center {
            padding: 10px;
            border: 1px solid #ddd;
            margin: 10px;
        }

        #left {
            flex: 1;
        }

        #center {
            flex: 3; /* #center를 두 배 크기로 설정 */
        }
        .img-box {
		    width: 30px;
		    height: 30px; 
		    border-radius: 70%;
		}
		.profileImg {
		  width: 30px;
		  height: 30px;
		  object-fit: cover;
		  
		}
	</style>
	<head>
 		<meta charset="UTF-8">
		<title>LifeMosaic</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
      	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	</head>
	<body>
		<!--  헤더 부분 -->
		<div id="top">
				<c:url var="homePage" value="/" />
	 				  <a href="${homePage}">
			        <img alt="라이프 모자이크 로고" src="../img/logo.png" style="width:130px; height:38px"/>
			    </a>		 
		</div>
		<div id="content">
			<!--  네비게이션 바 부분 -->
			<div id="left">
				<%@ include file="../fragments/settingNavigation.jspf"%>
			</div>
			
			<div id="center">
				<!-- 댓글 목록 리스트 부분 -->
				<p class="text-center" style="font-size: 25px; font-weight: bold;">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
					<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
					</svg>
					내가 쓴 댓글
				</p>
				<hr>
				
				<c:forEach var="post" items="${comment}">
				<div>
				<!--  댓글 목록을 보여줄 div -->
				<div class="card border-secondary mb-3" >
				  <div class="card-header  d-flex justify-content-between align-items-center">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-text-fill" viewBox="0 0 16 16">
					  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"/>
				</svg>
				<div style="font-size: 20px; font-weight: normal;">
				  ${post.comment_content}
				
				</div>
				  <div class="text-secondary" style="font-size: 15px; font-weight: bold; margin-left: auto;"> 
				  ${post.comment_created_time }
				  </div>
				  </div>
				  <div class="card-body text-secondary">
				  <div>
				  
				  <span class="d-inline-flex py-1 fw-semibold text-secondary bg-dark-subtle" style="font-size:13px; border-radius: 5px; padding:5px; margin:5px;">
					${post.post_subcategory}
					</span>
				  </div>
				    <h5 class="card-title">${post.post_title }</h5>
				    <p class="card-text">
				    <div>
				    <!-- 작성자(프로필 이미지), 작성시간 ,좋아요수, 댓글수,조회수 -->
					    <div class="my-2 img-box">
					    <c:url var="settingImgPage" value="/setting/settingImg" />
								<img class="profileImg mx-auto" src="${settingImgPage}?fileName=${post.post_user_profile_url}" name="profileImg" id="profileImg" alt="프로필 사진">    		
					    </div>
					    <div class="mb-3">
				   		<div> ${post.post_nickname}</div>
				   		<div class="text-secondary" style="font-size: 15px; font-weight: bold; margin-left: auto;">
				   			작성 시간 : ${post.post_created_time } 좋아요: ${post.post_like_count } 댓글: ${post.comment_count } 조회수: ${post.post_view_count }
				   		</div>
				   		</div>
				    </div>
				    
				    </p>
				  </div>
				</div>
			</div>
		</c:forEach>
			</div>
		</div>
		 	
    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<!-- 사용할 js 폴더 넣기<script src="../js/profile-modify.js"></script>-->
	</body>
</html>