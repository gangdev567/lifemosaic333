<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>life mosaic</title>
        
        <style>
            html {
            height: 100%;
            }
            .container {
                width: 220px; height: 310px;
                transition: all 0.1s;
            }
            .card {
                width: 220px; height: 310px;
                background-image: url("../img/profile.jpg");
                background-size: cover;
                }
                
            .curtain-effect {
              height: 100%;
              width: 0;
              position: fixed;
              top: 0;
              left: 0;
              background-color: #000;
              transition: width 1s ease-in-out;
              overflow: hidden;
              z-index: 9999;
            }
            
            .curtain-effect.open {
              width: 100%;
            }
        </style>
        
	</head>
	<body>
    
    <div id="curtain" class="curtain-effect">
    <!-- 커튼 효과를 주고자 하는 내용 -->
        <h1>명예의 전당</h1> 
        
        
        <div class="container">
            <div class="card"></div>
        </div>
    </div>
    
		              
	</body>
    
    <script src="../js/hall-of-fame.js">
    </script>

</html>