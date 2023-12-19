<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<style>
		.img-box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.image_container{
	width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}

img {
  width: 150px;
  height: 150px;
  object-fit: cover;
  
}
	</style>
	<head>
 		<meta charset="UTF-8">
		<title>lifeMosaic</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
      	rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	</head>
	<body>
		<h1>프로필 설정</h1>
		<nav></nav>
		
			<div class="container-fluid" >
				<div class="row">
					 <div class="col-3">
					  마이 페이지 네비게이션 바 
						 
					 </div>
					 
					 <div class="col-6 card my-2">
					  나의 정보 영역
						 <div>
						 <label class="form-label" for="user_id">아이디</label>
						 <input class="form-control" id="user_id" type="text" value="${user.user_id }">
						 </div>
						 <div>
						 <label class="form-label" for="email">이메일</label>
						 <input class="form-control" id="email" type="text" value="${user.email }">
						 </div>
						 <div>
						 <label class="form-label" for="nickname">닉네임</label>
						 <input class="form-control" name="nickname" id ="nickname"type="text" value="${user.nickname }">
						 <button type="button" class="btn btn-primary"  name="btnCheckNickname" id="btnCheckNickname">중복 확인</button>
						 </div>
						 <div>
						 <button type="button" class="btn btn-warning">저장</button>
						 </div>
					 </div>
		 <div class="col-3 ">
					 <div class="img-box" >
						  <img src="${user.profile_url}" name="profileImg1"  alt="..."> 
						</div>
						<div class="profile-btn-area">
						<input type="file" id="profileImg" name = "profileImg" accept="image/*"
						onchange="setThumbnail(event);"/>
						<h3>미리보기</h3>
						<div id="image_container" ></div>
		<script>
			var img = null;
			function setThumbnail(event) {
				var reader = new FileReader();
				if(!img){
				img = document.createElement("img");
				
				}
				
				reader.onload = function(event){	
					img.setAttribute("src", event.target.result);
					img.setAttribute("class","img-box");
					document.querySelector("div#image_container").appendChild(img);	
					
				};
				
				reader.readAsDataURL(event.target.files[0]);
			}
		
		</script>
						  	<button type="submit"> 변경하기</button>
						  	</div>
						<br>
					<form action="profile">
					
					</form>
						<br>
						<button type="button" class="btn btn-secondary">기본 이미지로 변경</button>
		</div>
				</div>
			</div>
			
    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		<script src="../js/profile-modify.js"></script>
		
	</body>
</html>