<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spring 2</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
    <link href="../css/login-style.css" rel="stylesheet">

</head>
<body>
<div class="login-container" style="width: 500px; height: 500px;">
    <a href="/project/">
    <!-- 로고 이미지 추가 -->
    <img src="../img/logo.png" alt="로고 이미지" style="max-width: 100%; max-height: 100px; margin-left: 30px;" />
    </a>
    <!-- 여백 추가 -->
    <div style="margin-bottom: 20px;"></div>
    <!-- 로그인 폼 -->
    <form method="post">
            <!-- 로그인 실패 메시지 -->
            <c:if test="${not empty param.result && param.result eq 'f'}">
                <div class="alert alert-danger">아이디와 패스워드를 확인하세요...</div>
            </c:if>

        <!-- 아이디 입력 필드 -->
        <input type="text" class="form-control" name="user_id" placeholder="아이디" required autofocus style="background-color: #F3F1F5;" />

        <!-- 비밀번호 입력 필드 -->
        <input type="password" class="form-control" name="password" placeholder="비밀번호" required style="background-color: #F3F1F5;" />

        <!-- 로그인 버튼 -->
        <button type="submit" class="btn btn-primary w-100">로그인</button>
    </form>
        <div class="login-links text-center">
            <a href="#" data-bs-toggle="modal" data-bs-target="#findUserIdModal">아이디 찾기</a> |
            <a href="#" data-bs-toggle="modal" data-bs-target="#findPasswordModal">비밀번호 찾기</a> |
            <a href="<c:url value='/user/signup'/>">회원가입</a>
        </div>
    </div>
</div>

<!-- 아이디 찾기 모달 -->
<div class="modal fade" id="findUserIdModal" tabindex="-1" aria-labelledby="findUserIdModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="findUserIdModalLabel">아이디 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="findUserIdForm">
                    <div class="mb-3">
                        <label for="userIdEmail" class="col-form-label">이메일:</label>
                        <input type="email" class="form-control" id="userIdEmail" required style="background-color: #F3F1F5;">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">전송</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div class="modal fade" id="findPasswordModal" tabindex="-1" aria-labelledby="findPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="findPasswordModalLabel">비밀번호 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="findPasswordForm">
                    <div class="mb-3">
                        <label for="email" class="col-form-label">이메일:</label>
                        <input type="email" class="form-control" id="email" required style="background-color: #F3F1F5;">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">전송</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 비밀번호 찾기 모달 인스턴스 생성
        var findPasswordModal = new bootstrap.Modal(document.getElementById('findPasswordModal'));
        var closePasswordButton = document.querySelector('#findPasswordModal .btn-close');

        // 아이디 찾기 모달 인스턴스 생성
        var findUserIdModal = new bootstrap.Modal(document.getElementById('findUserIdModal'));
        var closeUserIdButton = document.querySelector('#findUserIdModal .btn-close');

        // 비밀번호 찾기 폼 처리
        document.getElementById('findPasswordForm').addEventListener('submit', function(e) {
            e.preventDefault();
            var email = document.getElementById('email').value;

            fetch('/project/user/findPassword', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ email: email })
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('서버에서 응답이 없습니다.');
                    }
                })
                .then(data => {
                    alert('임시 비밀번호가 이메일로 전송되었습니다.');
                    findPasswordModal.hide(); // 모달 닫기
                })
                .catch(error => {
                    alert('오류가 발생했습니다: ' + error.message);
                });
        });

        // 아이디 찾기 폼 처리
        document.getElementById('findUserIdForm').addEventListener('submit', function(e) {
            e.preventDefault();
            var email = document.getElementById('userIdEmail').value;

            fetch('/project/user/findUserId', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ email: email })
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('서버에서 응답이 없습니다.');
                    }
                })
                .then(data => {
                    alert('귀하의 아이디는: ' + data.user_id);
                    findUserIdModal.hide(); // 모달 닫기
                })
                .catch(error => {
                    alert('오류가 발생했습니다: ' + error.message);
                });
        });

        // 비밀번호 찾기 모달의 'x' 닫기 버튼 처리
        if (closePasswordButton) {
            closePasswordButton.addEventListener('click', function() {
                console.log('비밀번호 찾기 닫기 버튼 클릭됨');
                findPasswordModal.hide();
            });
        } else {
            console.error('비밀번호 찾기 모달의 닫기 버튼을 찾을 수 없습니다.');
        }

        // 아이디 찾기 모달의 'x' 닫기 버튼 처리
        if (closeUserIdButton) {
            closeUserIdButton.addEventListener('click', function() {
                console.log('아이디 찾기 닫기 버튼 클릭됨');
                findUserIdModal.hide();
            });
        } else {
            console.error('아이디 찾기 모달의 닫기 버튼을 찾을 수 없습니다.');
        }
    });
</script>
</body>
</html>