<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계정 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link href="../css/myPostListStyle.css" rel="stylesheet"> <!-- "내가 쓴 게시글" 스타일시트 적용 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../js/passwordChange.js"></script>
</head>
<body>
    <div id="top" class="mb-3">
        <c:url var="homePage" value="/" />
        <a href="${homePage}"> <img alt="라이프 모자이크 로고" src="../img/logo.png" style="width: 130px; height: 38px" /></a>
    </div>

    <div id="content" class="container-fluid">
        <div id="left" class="col-md-2">
            <!-- 왼쪽 섹션: 여기에 설정 메뉴 또는 기타 네비게이션 요소 추가 가능 -->
            <%@ include file="../fragments/settingNavigation.jspf"%> <!-- 예시: 설정 메뉴 포함 -->
        </div>
        <div id="center" class="col-md-8">
            <h2 class="text-center my-4">계정 관리</h2>
            <form id="passwordChangeForm" class="my-3">
                <div class="mb-3">
                    <label for="currentPassword" class="form-label">현재 비밀번호:</label>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                </div>
                <button type="button" class="btn btn-primary mb-3" id="verifyCurrentPasswordButton">확인</button>
                <div class="mb-3">
                    <label for="newPassword" class="form-label">새 비밀번호:</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">비밀번호 확인:</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <button type="button" class="btn btn-primary" id="changePasswordButton">비밀번호 변경</button>
            </form>
            <div id="messageBox">
                <!-- 서버로부터의 응답 메시지가 여기에 표시됩니다 -->
            </div>
        </div>
        <div id="right" class="col-md-2">
            <!-- 오른쪽 섹션: 추가적인 컨텐츠나 광고, 정보 패널 등을 포함할 수 있음 -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>