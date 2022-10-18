<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
 <style type="text/css">
 @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
 
	body {
		font-family: Pretendard;
		color: #404040;
	}
      
 /*네비바*/
	::-webkit-scrollbar {
	   display: none;
	}
	
	#search{
		font-size: 1.2rem;	
	}
	
	#cart{
		margin-left: 10px;
		font-size: 1.5rem;
	}
	
	.scroll-container {
	  display: flex;
	  flex-wrap: no-wrap;
	  overflow-x: scroll;
	  overflow-y: hidden;
	}
	.menu {
	  margin-left:20px;
	  flex: 0 0 auto;
	} 
	
	.title{
		font-size: 1.2rem;
    	font-weight: 500;
}
	}

/*네비바*/
 </style>
  </head>
  
  <body>
  <div class="container-fluid">
       <jsp:include page="../common/header.jsp"></jsp:include>
  <div class="row">
  	<div class="col px-0">
  		<img class="img-fluid" src="../resources/img/165967434016801522.jpeg">
  	</div>
  </div>
  <div class="row">
  	<div class="col">
  		<div class="row">
  			<div class="col title">오늘의 상품</div>
  		</div>
  		<div id="productList" class="row py-3 row-cols-2 g-2"></div>
  	</div>
  </div>
         <jsp:include page="../common/footer.jsp"></jsp:include>
  
  
  </div><!-- container fluid end -->
  
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  </body>
</html>