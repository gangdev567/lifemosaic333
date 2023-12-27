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

        #left,#right {
            flex: 1;
        }

        #center {
            flex: 2; /* #center를 두 배 크기로 설정 */
            padding:40px;
        }
      
		.profileImg {
		  width: 30px;
		  height: 30px;
		   border-radius: 70%;
		  object-fit: cover;
		  align-items: left;
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
		</div><!-- end div id="top" -->
		<div id="content">
			<!--  네비게이션 바 부분 -->
			<div id="left">
				<%@ include file="../fragments/settingNavigation.jspf"%>
			</div>
			
			<div id="center">
				<p class="text-center" style="font-size: 25px; font-weight: bold;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
						<path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
						</svg>
						내가 쓴 댓글(${commentLength}개의 댓글)
			   </p>
			   <hr>
		<!-- 댓글 목록 보여줄 부분 -->
			<c:choose>
                <c:when test="${not empty commentLength and commentLength != 0}">
			<c:forEach var="post" items="${comment}">
			  <div class="list-group my-1 pd-1">
			  <a href="/project/post/detail?post_id=${post.post_id}" class="list-group-item list-group-item-action">
			    <div  style="font-size: 17px; font-weight: 500; padding-bottom:10px;">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-text-fill" viewBox="0 0 16 16">
						  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2zm3.5 1a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 2.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"/>
				</svg> ${post.comment_content}
				</div> 
				<div class="card " style="font-size: 17px; font-weight: normal;">
				  <p class="text-body-secondary fw-semibold" style="font-weight: normal; font-size: 13px; margin:10px;">
					    <c:url var="settingImgPage" value="/setting/settingImg" />
								<img class="profileImg mx-auto" src="${settingImgPage}?fileName=${post.post_user_profile_url}" name="profileImg" id="profileImg" alt="프로필 사진">    	
							 <span>${post.post_nickname}</span>	<span style="color: black; float: right;">${post.post_created_time }</span> 
				  </p>	
				 
				 <div style="margin-left:10px;"> ${post.post_title} </div>
				 
				 <div >
				 <div>
				 	
				 </div>
				 		<!-- 카테고리, 조회수, 좋아요수, 댓글 수 -->
           					<div>
				 			<span class="badge bg-secondary mb-2 bg-opacity-75" style="float: left; margin: 10px;">${post.post_subcategory}</span>
							 <div class="fw-semibold"  style="font-size:13px; font-weight: normal; float: right; padding: 10px;">
							 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
							  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
							</svg>
							  <span >${post.post_like_count }</span> 
							 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
							   <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
							  </svg>
							  <span> ${post.comment_count }</span>
							  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
								  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
								  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
							  </svg>
							  <span>${post.post_view_count }</span> 
							 </div>
							 </div>
				 </div>
				</div>
				  </a>
			 
			</div>
			</c:forEach>
						<!--페이지네이션 부분-->
						<div class="d-flex justify-content-center" style="pading:10px; margin:20px;">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <c:forEach var="pageNumber" begin="1" end="${pagesCount}">
						     <c:url var="settingMyCommentPage" value="/setting/userMyComment"/>
						      <li class="page-item ${pageNumber == currentPage ? 'active' : ''}" style="display: inline;">
						        <a class="page-link" href="${settingMyCommentPage}?currentPage=${pageNumber}">
						          ${pageNumber}
						        </a>
						      </li>
						    </c:forEach>
						  </ul>
						</nav>
						</div>
						<!-- ------------ -->
			</c:when>
			<c:otherwise>
				
				<h1 class="text-center"> 
				댓글이 없습니다.🥲
				</h1>	
			</c:otherwise>
			</c:choose>			
			
			
			
			</div>
			<div id="right">
			
			</div>
				
				<div>
		</div>
		</div><!-- end div="content" -->
		 	
    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
       
		<!-- 사용할 js 폴더 넣기<script src="../js/profile-modify.js"></script>-->
	</body>
</html>