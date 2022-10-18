<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
	<title>판매자 상품리스트</title>

    <style>
	   	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
		body {
		font-family : pretendard;
		color: #404040;
		}
	    .menu{
	      font-size: large;
	    }
       	a{
      	 text-decoration-line: none;
      	 color: #404040;
      	}
    </style>

	<script type="text/javascript">
	
	function doUpdate(){
		document.getElementById("update").submit();
	}
	
	window.addEventListener("DOMContentLoaded", function (){
		changeMoneyUnit();
	});
	
	// 원 표시 자동변환 script
    function changeMoneyUnit() {
        var moneyValue = document.querySelectorAll(".money");
        const moneyUnit = "원"
        var regex = /[^0-9]/g;
        for(i of moneyValue){
            result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            result = result.concat(moneyUnit);
            i.innerText = result;
        };
    };
	
	
	</script>
  </head>
  <body class="bg-light">
	
	<div class="container-fluid px-3">
	
		<!-- 뒤로가기 -->
		<div class="row">
			<div class="col fs-1 mt-3">
				<a href="./vendorMainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;" data-bs-toggle="modal"></i></a>
			</div>
		</div>
	
	
		<!-- 검색 -->
		<div class="row my-3 pe-2">
			<div class="col">
				<form action="./vendorProductListPage" method="get">
					<div class="row">
					<div class="col pe-0">
						<select name="searchType" class="form-control">
							<option value="product">상품명</option>
							<option value="price">가격</option>
							<option value="quantity">총 수량</option>
						</select>
					</div>
					<div class="col-6 px-0 mx-0">
						<input name="searchWord" type="text" class="form-control">
					</div>
					<div class="col d-grid px-0 mx-0">
						<button class="btn" style="background-color: #ff6500; color: white;">검색</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	
	
	<c:forEach items="${dataList }" var="product">
	<div class ="row border rounded bg-white my-3 mx-0">
		<div class="col">
			 <div class="row">
			 	<div class="col py-2">
			 		<span>${product.productVo.product_no } ㅣ </span>
					<span>${product.vendorVo.vendor_brand_name }</span><br>
					<span class="fs-3 fw-bold"><a href="../vendor/vendorProductDetailListPage?product_no=${product.productVo.product_no }">${product.productVo.product_name }</a></span><br>
					<span class="money fw-bold">${product.productVo.product_price }원</span><br>
					<span class="money">${product.productVo.product_delivery_fee }원</span>
					<span>ㅣ ${product.productVo.product_quantity_onhand }개</span>
			 	</div>
			 </div>
			 <div class="row">
			 	<div class="col text-end py-2 px-2">
			 	
			 	<!-- Button trigger modal -->
				<button type="button" class="btn" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal${product.productVo.product_no }">
				 수정
				</button>
				<a href="../vendor/deleteProductProcess?product_no=${product.productVo.product_no }"><button class="btn" style="border-color: red; color: red;" type="button">삭제</button></a>

				<div class="modal fade" id="exampleModal${product.productVo.product_no }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
   				      		
				      <div class="modal-body">
				      	
   				      		<form id="update" action="./updateProductProcess" method="post" enctype="multipart/form-data">
	
							<div class="mb-3">
								<span class="fw-bold">브랜드 : ${vendorInfo.vendor_brand_name }</span><br>
								<input name="vendor_no" value="${vendorInfo.vendor_no }" type="hidden">
							</div>
								
							<div class="input-group flex-nowrap mb-3">
						 		<span class="input-group-text" id="addon-wrapping">상품명</span>
						  		<input name="product_name" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							
							<div class="input-group flex-nowrap mb-3">
						 		<span class="input-group-text" id="addon-wrapping">판매가</span>
						  		<input name="product_price" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							
							<div class="input-group flex-nowrap mb-3">
						 		<span class="input-group-text" id="addon-wrapping">재고수량</span>
						  		<input name="product_quantity_onhand" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							
							<div class="input-group flex-nowrap mb-3">
						 		<span class="input-group-text" id="addon-wrapping">배송비용</span>
						  		<input name="product_delivery_fee" type="text" class="form-control" placeholder="상품이름을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
							</div>
							
							<input name="product_no" value="${product.productVo.product_no }" type="hidden">
							
							<button class="btn btn" style="background-color: #ff6500; color: white;" type="submit">상품수정하기</button>
							
							</form>
				      	
				      		
				      	
				      </div>
				      <div class="modal-footer">
<!-- 				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
<!-- 				        <button type="button" class="btn btn-primary" onclick="doUpdate()">Save changes</button> -->
				      </div>
				     
				      
				    </div>
				  </div>
				</div>
				
			 	
			 	</div>
			 </div>
		</div>
	</div>
	</c:forEach>
	
	<!-- 페이지 -->
	<div class="row">
		<div class="col">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  	<c:choose>
			  		<c:when test="${startPage <= 1 }">
  					    <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
			  		
			  		</c:when>
			  		<c:otherwise>
  					    <li class="page-item"><a class="page-link" href="./vendorProductListPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
			  		</c:otherwise>
			  	</c:choose>
			    
			    <c:forEach begin="${startPage }" end="${endPage }" var="i">
			    	<c:choose>
			    		<c:when test="${i == currentPageNum }">
			    			<li class="page-item active"><a class="page-link" href="./vendorProductListPage?pageNum=${i }${additionalParam}">${i }</a></li>
			    		</c:when>
			    		<c:otherwise>
			    		<li class="page-item"><a class="page-link" href="./vendorProductListPage?pageNum=${i }${additionalParam}">${i }</a></li>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    </c:forEach>
			    <c:choose>
			    	<c:when test="${endPage >= totalPageCount}">
			    		<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			    	</c:when>
			    	<c:otherwise>
			    		<li class="page-item"><a class="page-link" href="./vendorProductListPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
			    	</c:otherwise>
			    </c:choose>
			  </ul>
			</nav>
		</div>
	</div>
	
	</div>
	

	
	
    
    
    <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <h2 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">LIKEHOME</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        
        <button onclick="location.href='../customer/customerLoginPage'" type="button" class="btn btn-primary" >일반회원로그인</button>
        <button onclick="location.href='../vendor/vendorLoginPage'" type="button" class="btn btn-primary" >사업자로그인</button>
        <button onclick="location.href='../admin/adminLoginPage'" type="button" class="btn btn-primary" >관리자로그인</button>
        <button onclick="location.href='../customer/customerRegisterPage'" type="button" class="btn btn-primary">일반회원 회원가입</button>
        <button onclick="location.href='../vendor/vendorRegisterPage'" type="button" class="btn btn-primary">사업자 회원가입</button>

        <br>
        <br>
        <p  class="menu"><a href="">자유게시판</a></p>
        <p class="menu"><a href="">상품관리</a></p>
        <p class="menu"><a href="">주문관리</a></p>
        <p class="menu"><a href="">리뷰관리</a></p>
        <p class="menu"><a href="">문의관리</a></p>
        

        <button type="button" class="btn btn-primary">로그아웃</button>



        
      </div>
    </div>




    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 
  </body>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</html>