<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Project22</title>
	

<!-- user.js에서 이메일 인증 url의 앞부분 -->
<script>
	var baseUrl = "<c:url value='/project/user/'/>";
</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
        crossorigin="anonymous">

</head>
<body>
	<div class="container-fluid">
        <c:set var="title" value="회원가입" />
        <%@ include file="../fragments/title.jspf" %>
        
        <main class="my-2">
            <div class="mhy-2 card card-body">
                <c:url var="signUpPage" value="/user/signup" />
                <form action="${signUpPage}" method="post" onsubmit="combineEmail()">
                    <div class="my-2">
                        <input type="text" class="form-control"
                            id="user_id" name="user_id" placeholder="user_id" required autofocus />
                    </div>
                    <div id="checkIdResult">
                        <!-- user_id 중복체크 결과 표시 -->
                    </div>
                    <div class="my-2">
                        <input type="text" class="form-control"
                            id="nickname" name="nickname" placeholder="nickname" required />
                    </div>
                    <div id="checkNicknameResult">
                        <!-- nickname 중복체크 결과 표시 -->
                    </div>
					<div class="my-2">
						<input type="password" class="form-control" id="password" name="password" placeholder="password" required />
						<span id="passwordMessage"></span>
					</div>

					<div class="form-group email-form">
						<label for="email">이메일</label>
						<div class="input-group">
							<input type="text" class="form-control" name="userEmail1"
								id="userEmail1" placeholder="이메일"> <select
								class="form-control" name="userEmail2" id="userEmail2">
								<option>@naver.com</option>
								<option>@daum.net</option>
								<option>@gmail.com</option>
							</select>
						</div>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input"
								placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
								maxlength="6">
						</div>
						<span id="mail-check-warn"></span>
					</div>

					<div>
                        <button type="submit" id="btnRegister" 
                            class="form-control btn btn-success disabled">회원가입</button>
                    </div>

					<input type="hidden" name="email" id="combinedEmail">

					<script>
						function combineEmail() {
							var emailPart1 = document
									.getElementById('userEmail1').value;
							var emailPart2 = document
									.getElementById('userEmail2').value;
							document.getElementById('combinedEmail').value = emailPart1
									+ emailPart2;
						}
					</script>
				</form>
				<div class="mt-3 text-center">
					<a href="/project/" class="btn btn-secondary">홈으로</a>
				</div>
            </div>
        </main>
    </div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
	    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
	    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../js/user.js"></script>
</body>
</html>