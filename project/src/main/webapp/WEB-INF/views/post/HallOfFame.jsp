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
            body {
              color: #fff;
              font-size: 16px;
              font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
              background-image: url(https://i.postimg.cc/XvT12qdD/3.jpg);
              background-size: cover;
              background-position: 50% 0;
              height: 100%;
              text-align: center;
              margin: 0;
              padding: 0;
            }
            body:before {
              content: '';
              display: inline-block;
              vertical-align: middle;
              height: 100%;
            }
            section {
              display: inline-block;
              vertical-align: middle;
              padding:  100px;
              max-width: 500px;
              text-shadow: 0 1px 2px rgba(0,0,0,0.5);
              box-shadow: 0 5px 15px rgba(0,0,0,0.5);
            }
            .link-area
            {
              position:fixed;
              bottom:20px;
              left:20px;  
              padding:15px;
              border-radius:40px;
              background:tomato;
            }
            .link-area a
            {
              text-decoration:none;
              color:#fff;
              font-size:25px;
            }
        </style>
        
	</head>
	<body>
    
    <h1>명예의 전당</h1> 
    <div class="container">
        <div class="card"></div>
    </div>
    
    <div class="link-area">
      <a href="https://www.youtube.com/channel/UCki4IDK86E6_pDtptmsslow" target="_blank">Click for More</a>
    </div>
		              
	</body>
    
    <script src="../js/hall-of-fame.js">
    </script>
    <script>
    $('body').ripples({
        resolution: 512,
        dropRadius: 20,
        perturbance: 0.04,
      });
    </script>
</html>