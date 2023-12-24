<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
            crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/main_navigation.css" />
<style>


	.post-title a:hover .hover-text {
	    color: #007bff; 
	    text-decoration: none; 
	}

    body {
        background-color: #fff; 
    }

    .post-items {
        list-style-type: none;
        padding: 0;
    }

    .post-item {
        display: flex;
        align-items: center;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 10px;
        background-color: #f9f9f9;
        transition: background-color 0.3s ease;
    }

    .post-details {
        flex: 1;
    }

    .post-info {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .post-nickname {
        font-weight: bold;
        color: #333;
    }

    .post-title {
        margin: 8px 0;
        font-size: 1.1em;
        font-weight: bold; /* 글 목록 리스트를 굵게 변경 */
    }

    .post-link {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .post-created-time {
        font-size: 1em; /* 시간 폰트를 좀 더 크게 변경 */
        font-weight: bold; /* 시간 폰트를 굵게 변경 */
        color: #777;
    }
</style>


	</head>
	<body>
	
		    <!-- 내비게이션 include 시 경로 및 겹치는 div 만들어줘야 함 -->
        <div class="container-fluid d-flex justify-content-center">
            <c:url var="imgPath" value="/img/logo.png" />
            <%@ include file="../fragments/navigation.jspf" %>
        </div>
        <div style="margin:100px"></div>
        
        
        
   <div class="container">
    <div class="mt-3 d-flex justify-content-start"> <!-- 위에 여백을 주기 위한 마진 추가 -->
        <c:url var="createPage" value="/post/create/">
            <c:param name="sub_category_id" value="${cId}"></c:param>
        </c:url>
        <a class="btn btn-primary fs-5 fw-bold" href="${createPage}" style="margin-right: 10px;">
            <i class="fas fa-pencil-alt me-2"></i>글 쓰기 
        </a>
    </div>

 <div class="row justify-content-center">
    <div class="col-lg-10">
        <div class="card-body my-2">
            <div class="post-list">
                <ul class="post-items">
                    <c:forEach var="p" items="${posts}">
                        <li class="post-item">
                            <div class="post-details">
                                <div class="post-info">
                                    <span class="post-nickname">
                                        <a href="#" class="text-decoration-none text-dark">${p.nickname}</a>
                                    </span>
                                    <span class="post-view-count">
                                        <i class="far fa-eye"></i> ${p.view_count} views
                                    </span>
                                </div>
                               <h3 class="post-title">
								    <c:url var="postDetails" value="/post/detail">
								        <c:param name="post_id" value="${p.post_id}" />
								    </c:url>
								    <a href="${postDetails}" class="text-decoration-none text-dark" style="transition: color 0.3s ease; text-decoration: none;">
								        <span class="hover-text">${p.title}</span>
								    </a>
								</h3>
                                <p class="post-tag">
                                    <a href="#" class="text-decoration-none text-dark">#태그 미정</a>
                                </p>
                            </div>
                            <div class="post-created-time">
                                <span class="time">${p.created_time}</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>



          
        
       <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <!-- 이전 페이지 버튼 -->
    <c:if test="${pageMaker.prev}">
      <li class="page-item">
        <a class="page-link" href="?sub_category_id=${cId}&pageNo=${pageMaker.startPage-1}">Previous</a>
      </li>
    </c:if>

    <!-- 각 번호 페이지 버튼 -->
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
      <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
        <c:choose>
          <c:when test="${pageMaker.cri.pageNum == num}">
            <span class="page-link disabled">${num}</span>
          </c:when>
          <c:otherwise>
            <a class="page-link" href="?sub_category_id=${cId}&pageNo=${num}">${num}</a>
          </c:otherwise>
        </c:choose>
      </li>
    </c:forEach>

    <!-- 다음 페이지 버튼 -->
    <c:if test="${pageMaker.next}">
      <li class="page-item">
        <a class="page-link" href="?sub_category_id=${cId}&pageNo=${pageMaker.endPage + 1}">Next</a>
      </li>
    </c:if>
  </ul>
</nav>
        
 
    

    
    <form id="moveForm" method="get">   
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">  
        <input type="hidden" name="type" value="${pageMaker.cri.type}">    
    </form>
        
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/1306328925.js"
         crossorigin="anonymous"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
                
        <script src="../../js/page.js"></script>
        <script src="../../js/time.js"></script>
        
	</body>
</html>