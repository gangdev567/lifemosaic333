<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
                display: grid;
                grid-template-columns: 1fr 4fr 1fr;
            }
            .cardContainer, .fame {
                transition: all 0.1s;
                padding: 30px;
                grid-column-start: 2;
                grid-column-end: 3;
            }
            .topProfileUserImg {
                width: 80px;
                height: 80px;
                border: 1px solid lightgray;

            }                
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
            crossorigin="anonymous">
        
	</head>
	<body>

        <div class="container" >
            <div class="fame" style="height: 130px;" >명예의 전당</div>
            <c:forEach var="writer" items="${writer}">
            <div class="d-flex flex-fill justify-content-between align-items-center my-3 cardContainer" style="background-color: black;">
                <div class="card" style="display: inline; backgronud-color: black;">
                    <c:url var="settingImgPage" value="/setting/settingImg" />
                    <img class="topProfileUserImg me-1 rounded-circle" style="background-color: black;" src="${settingImgPage}?fileName=${writer.profile_url }" />
                    
                    <div style="display: inline;">
                        <c:url var="memberPostListPage" value="/member/memberPostList">
                            <c:param name='nickname' value='${writer.nickname }'/>
                        </c:url>
                        <a href="${memberPostListPage}" style="text-decoration:none; color:black;">
                            <span class="align-middle fw-medium text-truncate d-inline-block" style="display: inline;">${writer.nickname }</span>
                        </a>
                    </div>

                    <div style="display: inline;">
                        <span class="align-middle me-1">
                            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="16" height="16" x="0" y="0" viewBox="0 0 501.28 501.28" style="margin-bottom: 3px;enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="m501.28 194.37-166.02-35.04-84.62-147.06v407.5l154.9 69.24-17.98-168.72z" style="" fill="#bfa2db" data-original="#ffcd00" opacity="1" class=""></path><path d="M166.02 159.33 0 194.37l113.72 125.92-17.98 168.72 154.9-69.24V12.27z" style="" fill="#f0d9ff" data-original="#ffda44" class="" opacity="1"></path></g></svg>
                        </span><span class="text-secondary">${writer.cnt }</span>
                    </div>

                </div>
            </div>
            </c:forEach>
        </div>

		              
	</body>
    
    <script src="../js/hall-of-fame.js">
    </script>

</html>