<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="../js/passwordChange.js"></script>
</head>
<body>
    <h2>비밀번호 변경</h2>
    <form id="passwordChangeForm">
        <label for="currentPassword">현재 비밀번호:</label>
        <input type="password" id="currentPassword" name="currentPassword" required><br>
        <button type="button" id="verifyCurrentPasswordButton">확인</button><br>
        <label for="newPassword">새 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        <button type="button" id="changePasswordButton">비밀번호 변경</button>
    </form>
    <div id="messageBox">
        <!-- 서버로부터의 응답 메시지가 여기에 표시됩니다 -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>