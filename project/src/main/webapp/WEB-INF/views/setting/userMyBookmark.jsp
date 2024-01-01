<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <style>
	 body {
            margin: 10px;
            padding: 10px;
            
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

        #left {
           
        }

        #left,#right {
            flex: 1;
        }

        #center {
            flex: 3; /* #center를 두 배 크기로 설정 */
           
        }
      #aside {
		    position: sticky;
		    top: 100px;
		    right: 300px;
		}
		.profileImg {
		  width: 30px;
		  height: 30px;
		   border-radius: 70%;
		  object-fit: cover;
		  align-items: left;
		}
		.profile{
		width: 230px;
		  height: 230px;
		   border-radius: 70%;
		  object-fit: cover;
		  align-items: center;
		}
		
	</style>
	<head>
 		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
      	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	</head>
	<body>
		<!-- 헤더 부분 -->
		<div id="top">
				<c:url var="imgPath" value="../img/logo.png" />
				<%@ include file="../fragments/navigation.jspf" %>
		</div>
		
		<div id="content">
			<div id="left" style="float:center;">
			<%@ include file="../fragments/settingNavigation.jspf"%>
			
			</div>
			<div class="d-flex" >
			  <div class="vr"></div>
			</div>
			<!-- div center -->
			 <div id="center">
		
                   <span style="font-size:25px; margin-left:40px; font-weight:bold;">
            		<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="30" height="30" x="0" y="0" viewBox="0 0 24 24" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><g data-name="Layer 2"><path fill="#987ef7" d="M17.5 1.25h-11A3.254 3.254 0 0 0 3.25 4.5V20a2.746 2.746 0 0 0 4.4 2.2l3.6-2.7a1.257 1.257 0 0 1 1.5 0l3.6 2.7a2.749 2.749 0 0 0 4.4-2.2V4.5a3.254 3.254 0 0 0-3.25-3.25z" opacity="1" data-original="#4285f4" class=""></path><path fill="#ffef20" d="M14.793 7.922h-1.1l-.545-1.274a1.251 1.251 0 0 0-2.3 0l-.546 1.274h-1.1a1.251 1.251 0 0 0-.884 2.135l.846.845-.412 1.652a1.249 1.249 0 0 0 1.832 1.388L12 13.136l1.41.806a1.25 1.25 0 0 0 1.833-1.388l-.412-1.654.846-.845a1.251 1.251 0 0 0-.884-2.135z" opacity="1" data-original="#afcbf9" class=""></path></g></g></svg>
            		 북마크(${bookmarkCount} 개의 게시물)
                   </span>
                   
                   <hr style="margin-top:27px;">
                   
                   <!-- 북마크 게시물들을 보여줄 부분 -->
                    <c:choose>
                    	<c:when test="${not empty bookmarkCount and bookmarkCount != 0 }">
                    	<c:forEach var="post" items="${bookmark}">
                    <div id="bookmarkList" class="card " style=" margin-left:40px; margin: 20px; width:800px; height:150px; float:center; ">
                        
                        <div style="margin-top:10px; margin-left: 10px; margin-right: 20px;">
                        	<c:url var="settingImgPage" value="/setting/settingImg"/>
                            <img class="profileImg mx-auto" src="${settingImgPage}?fileName=${post.profile_url}" name="profileImg" id="profileImg" alt="프로필 사진"> 
                             <span class="mb-2 text-sencondary" style="font-weight:bolder; font-size: small;">${post.post_user_nickname}</span>
                            <span class="mb-2 text-secondary" style="float: right; font-size: small; " >저장일시: ${post.bookmark_created_time}</span>
                        </div>
                        <div style="margin:5px;" >
                        <a href="/project/post/detail?post_id=${post.post_id}" style="text-decoration: none; color: black;">
                        <span style="text-align: left; margin-left: 20px; font-weight: bold;" onmouseover="changeColor(this)" onmouseout="restoreColor(this)"> 
                        ${post.post_title}
                        </span>
                        </a>
                        <span class="mb-2 text-secondary" style="float: right; font-size: small; margin-right:10px;">작성일: ${post.post_time} </span>
                        <div>
                       		 <span style="text-align: left; margin-top: 5px; margin-left: 30px; font-size: 14px;">
                        		${post.post_content}</span>
                        
                        
                        <div style="margin-left: 10px;margin-top: 5px;">

                            <span class="badge text-bg-light text-secondary mb-2" style="float:left;">${post.post_sub_category_name }</span>
                                <div style="margin-right: 10px; float:inline-end;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                    </svg>
                                    
                                    <span style="font-size: small;">${post.post_view_count } views</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16"><g id="_01_align_center" data-name="01 align center">
                                    <path d="M23.821,11.181v0C22.943,9.261,19.5,3,12,3S1.057,9.261.179,11.181a1.969,1.969,0,0,0,0,1.64C1.057,14.739,4.5,21,12,21s10.943-6.261,11.821-8.181A1.968,1.968,0,0,0,23.821,11.181ZM12,19c-6.307,0-9.25-5.366-10-6.989C2.75,10.366,5.693,5,12,5c6.292,0,9.236,5.343,10,7C21.236,13.657,18.292,19,12,19Z"/><path d="M12,7a5,5,0,1,0,5,5A5.006,5.006,0,0,0,12,7Zm0,8a3,3,0,1,1,3-3A3,3,0,0,1,12,15Z"/></g></svg>
                                    
                                      <span style="font-size: small;"> ${post.post_like_count } likes</span>
                                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                       </svg>
									
									<span style="font-size: small;">${post.post_comment_count } comments</span>
                                </div>
                        </div>

                        </div>
                    </div>
				</div>
				<hr style="margin-left:5px;">
			               </c:forEach>
                  			  
                    		<div class="d-flex justify-content-center" style="pading:10px; margin:20px;">
								<nav>
									<ul>
										<c:forEach var="pageNumber" begin="1" end="${pagesCount }">
											<c:url var="settingMyBookmarkPage" value="/setting/userMyBookmark"/>
											<li class="page-item ${pageNumber == currentPage ? 'active' : '' }" style="display: inline;" >
												<a href="${settingMyBookmarkPage}?currentPage=${pageNumber}">
												${pageNumber}	
												</a>
											</li>
										</c:forEach>
									</ul>
								</nav>
                    		</div>

		         </c:when>
		         
		         <c:otherwise>
		         	<h2>
		         	 북마크된 게시물이 없습니다.
		         	</h2>
		         </c:otherwise>
		        </c:choose>
		        
               </div>
                    <!-- div right -->
                    
                   <!--  <div id="right">
                     <div id="aside" style="">
						  <c:url var="settingImgPage" value="/setting/settingImg" />
							<img class="profile mx-auto" src="${settingImgPage}?fileName=${userProfileUrl}" name="profileImg" id="profileImg" alt="프로필 사진">
					</div>
			 
					</div> -->
		</div>
		<script>
		 function changeColor(element) {
		        element.style.color = '#6528F7'; // 마우스를 올렸을 때 글씨 색상 변경
		    }

		    function restoreColor(element) {
		        element.style.color = 'black'; // 마우스를 벗어났을 때 원래의 글씨 색상으로 복원
		    }
		</script>
	
    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	</body>
</html>