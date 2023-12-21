window.addEventListener('load', function() {
    
    
    document.getElementById('verifyCurrentPasswordButton').addEventListener('click', function() {
        var currentPassword = document.getElementById('currentPassword').value;
        var messageBox = document.getElementById('messageBox');
        
        // AJAX 요청을 서버로 보내 현재 비밀번호 확인
        axios.post('/project/setting/verifyPassword', { currentPassword: currentPassword })
            .then(function(response) {
                // 비밀번호가 일치하면 처리
                messageBox.textContent = '비밀번호가 확인되었습니다.';
                messageBox.style.color = 'green'; // 메시지 색상을 녹색으로 설정
            })
            .catch(function(error) {
                // 비밀번호 불일치 처리
                messageBox.textContent = '비밀번호가 일치하지 않습니다.';
                messageBox.style.color = 'red'; // 메시지 색상을 빨간색으로 설정
            });
            
    }); // end eventlistener
    
    document.getElementById('changePasswordButton').addEventListener('click', function() {
        var currentPassword = document.getElementById('currentPassword').value;
        var newPassword = document.getElementById('newPassword').value;
        var confirmPassword = document.getElementById('confirmPassword').value;
        var messageBox = document.getElementById('messageBox');

        if (newPassword !== confirmPassword) {
            messageBox.textContent = '새 비밀번호와 비밀번호 확인이 일치하지 않습니다.';
            return;
        }

        axios.post('/project/setting/changePassword', {
            currentPassword: currentPassword,
            newPassword: newPassword
        })
        .then(function (response) {
            messageBox.textContent = '비밀번호가 변경되었습니다.';
        })
        .catch(function (error) {
            messageBox.textContent = '비밀번호 변경에 실패했습니다. 오류 메시지: ' + (error.response.data || error.message);
        });
    });
}); // end window eventlistener