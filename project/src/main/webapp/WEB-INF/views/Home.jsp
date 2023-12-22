<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Life mosaic</title>
		
          <style>
                .container{
                    display: grid;
                    grid-template-columns: 1fr 2.5fr 2.5fr 1fr;
                    grid-template-rows: 500px 250px 250px 250px 150px;
                    row-gap: 10px;
                    column-gap: 10px;
                 }
                 .item:nth-child(1) {
                    grid-column-start: 1;
                    grid-column-end: 2;
                    grid-row-start: 1;
                    grid-row-end: 5;
                 }
                 .item:nth-child(2) {
                    grid-column-start: 2;
                    grid-column-end: 4;
                    grid-row-start: 1;
                    grid-row-end: 2;
                 }
                 .item:nth-child(4) {
                    grid-column-start: 4;
                    grid-column-end: 5;
                    grid-row-start: 1;
                    grid-row-end: 5;
                 }
                 .item:nth-child(10) {
                    grid-column-start: 1;
                    grid-column-end: 5;
                    grid-row-start: 5;
                    grid-row-end: 6;
                 }
                 .gridHeader {
                    display: grid;
                    grid-template-columns: repeat(6, 1fr);
                 }
         </style>
        
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
            crossorigin="anonymous">
        <link rel="stylesheet" href="./css/profile_image.css" />
        <link rel="stylesheet" href="./css/main_navigation.css" />
	</head>
    <header>
    </header>

             <body>
   		 	 <main>
                 <div class="container-fluid d-flex justify-content-center">
                 	<c:url var="imgPath" value="./img/logo.png" />
                    <%@ include file="./fragments/navigation.jspf" %>
                </div>
                    <div class="outerDiv">
                        <div class="container">
                            <div class="item">
                            	<%@include file="./fragments/topwriter.jspf"  %>
                            </div>
                            <div class="item">
                            	<%@ include file="./fragments/main/maintopicbest.jspf" %>
                            </div>
                            <div class="item">
                            	<%@ include file="./fragments/main/fault.jspf" %>
                            </div>
                            <div class="item"></div><%-- 오른쪽 사이드 바 : 사용 안함 --%>
                            <div class="item">
								<%@ include file="./fragments/main/idiot.jspf" %>
							</div>
                            <div class="item">
								<%@ include file="./fragments/main/envy.jspf"  %>
							</div>
                            <div class="item">
                            	<%@ include file="./fragments/main/caraccident.jspf" %>
							</div>
                            <div class="item">
                            	<%@ include file="./fragments/main/gameaccident.jspf" %>
                            </div>
                            <div class="item">
                            	<%@ include file="./fragments/main/etcaccident.jspf" %>
                            </div>
                            <div style="background-color:rgb(100, 150, 100);"class="item">Footer</div>
                        </div>
                    </div>
				    </main>
            </body>


		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	</body>
</html>