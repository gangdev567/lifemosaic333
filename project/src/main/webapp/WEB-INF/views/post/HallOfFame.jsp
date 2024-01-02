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
        </style>
        
	</head>
	<body>
    
    <h1>명예의 전당</h1> 
    <div class="container">
        <div class="card"></div>
    </div>
		              
	</body>
    
    <script src="../js/hall-of-fame.js">
    </script>

</html>