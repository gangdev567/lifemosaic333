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
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
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
					 <div class="col-6">
					  나의 정보 영역
						 <div>
						 <label class="form-label" for="user_id">아이디</label>
						 <input class="form-control" id="user_id" type="text" value="${user.user_id }">
						 </div>
						 <div>
						 <label class="form-label" for="user_id">이메일</label>
						 <input class="form-control" id="user_id" type="text" value="${user.email }">
						 </div>
						 <div>
						 <label class="form-label" for="user_id">닉네임</label>
						 <input class="form-control" id="user_id" type="text" value="${user.nickname }">
						 </div>
					 </div>
					 <div class="col-3 ">
					 <div class="img-box" >
						  <img src="${user.profile_url }"  alt="...">
						  <div class="card-body">
						    <a href="#" class="btn btn-primary">프로필 사진 변경</a>
						  </div>
						</div>
					 </div>
				</div>
			</div>

    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
       integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	</body>
</html>