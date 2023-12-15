<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>life mosaic</title>
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
            crossorigin="anonymous">
	</head>
	<body>
        <%@ include file="../fragments/navigation.jspf" %>
        
        <table class="table table-striped table-hover card-body my-2">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${posts}">
                            <tr>
                                <td>${p.post_id}</td>
                                <td>
                                    <c:url var="postDetails" value="/post/details">
                                        <c:param name="id" value="${p.post_id}" />
                                    </c:url>
                                    <a href="${postDetails}">${p.title}</a>
                                </td>
                                <td>${p.nickname}</td>
                                <td>${p.modified_time}</td>  
                            </tr>
                        </c:forEach>
                    </tbody>
        </table>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
	</body>
</html>