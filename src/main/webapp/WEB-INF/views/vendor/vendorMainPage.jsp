<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	
	<title>판매자 메인</title>
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
    
    <script>
    	
    </script>

  </head>
  <body>

	
  	<div class="container-fluid px-3 mt-3 mb-3">

	  	<div class="row mb-3">
	  		<div class="col-5 fs-1">
				<i class="bi bi-list" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"></i>
			</div>
		</div>
  	
  		<div class="row mb-5">
	  		<div class="col-8 pe-0">
	  			<span class="fs-3 fw-bold">${vendorInfo.vendor_brand_name } 님, 안녕하세요!</span>
	  		</div>
  			
  			<div class="col text-end ps-0 pt-1">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal">
  			프로필 수정
			</button>
  			</div>
  			<span>* 정산일은 매월 25일입니다.</span>
  		</div>
  		
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">이번달 판매 순위</span>
  			</div>
  			
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  			전체보기
			</button>
  			</div>

  		</div>
  		
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">순위</th>
		      <th scope="col">상품명</th>
		      <th scope="col">총 판매량</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularProduct }" var="product" begin="0" end="4">
			  	<c:set var="i" value="${i+1 }"/>
			   		<tr>
				      <th scope="row">${i }</th>
				      <td>${product.productVo.product_name }</td>
				      <td>${product.productCount }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 판매량 순으로 정렬 하였습니다.</span>
  		</div>
  		
  		<div class="row mb-4">
  			<div class="col-8">
  				<span class="fs-5 fw-bold">스크랩 순위</span>
  			</div>
  			<div class="col text-end ps-0">
  			<!-- Button trigger modal -->
  			<button type="button" class="btn btn-outline py-0" style="border-color: #ff6500; color: #ff6500;" data-bs-toggle="modal" data-bs-target="#exampleModal2">
  			전체보기
			</button>
  			</div>
  		</div>
  		
  		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">순위</th>
		      <th scope="col">상품명</th>
		      <th scope="col">스크랩 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularScrap }" var="scrap" begin="0" end="4">
			  	<c:set var="q" value="${q+1 }"/>
			   		<tr>
				      <th scope="row">${q }</th>
				      <td>${scrap.productVo.product_name }</td>
				      <td>${scrap.countScrapProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 스크랩 순으로 정렬 하였습니다.</span>
  		</div>
  		
  	</div>
	
	<!-- 프로필 수정 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">판매자 프로필</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      	<form action="../vendor/updateVendor">
	      		<div class="row mb-3">
	      			<span>브랜드 : ${vendorInfo.vendor_brand_name }</span>
	      			<input name="vendor_no" value="${vendorInfo.vendor_no }" type="hidden" class="form-control">
	      		</div>
	      		
				<div class="input-group flex-nowrap mb-3">
			 		<span class="input-group-text" id="addon-wrapping">비밀번호 변경</span>
			  		<input name="vendor_pw" type="text" class="form-control" placeholder="비밀번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				
				<div class="input-group flex-nowrap mb-3">
			 		<span class="input-group-text" id="addon-wrapping">이메일 변경</span>
			  		<input name="vendor_email" type="text" class="form-control" placeholder="이메일을 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				
				<div class="input-group flex-nowrap mb-3">
			 		<span class="input-group-text" id="addon-wrapping">전화번호 변경</span>
			  		<input name="vendor_phone" type="text" class="form-control" placeholder="전화번호를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				
				<div class="input-group flex-nowrap mb-3">
			 		<span class="input-group-text" id="addon-wrapping">주소 변경</span>
			  		<input name="vendor_address" type="text" class="form-control" placeholder="주소를 입력해주세요." aria-label="Username" aria-describedby="addon-wrapping">
				</div>
				
				<button class="btn" style="background-color: #ff6500; color: white;" type="submit">프로필 수정하기</button>
				
	        </form>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 이번달 판매 순위 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">판매 순위</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
	      
<!-- 	      	      	   	검색 -->
<!-- 		<div class="row pe-2 my-3"> -->
<!-- 			<div class="col"> -->
<!-- 				<form action="./vendorMainPage" method="get"> -->
<!-- 					<div class="row"> -->
<!-- 					<div class="col pe-0"> -->
<!-- 						<select name="searchType" class="form-control"> -->
<!-- 							<option value="product_name">상품명</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="col-6 px-0 mx-0"> -->
<!-- 						<input name="searchWord" type="text" class="form-control"> -->
<!-- 					</div> -->
<!-- 					<div class="col d-grid px-0 mx-0"> -->
<!-- 						<button class="btn btn" style="background-color: #ff6500; color: white;">검색</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
	      
			
  		<div class="row px-3 mb-5">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">순위</th>
		      <th scope="col">상품명</th>
		      <th scope="col">총 판매량</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularProduct }" var="product">
			  	<c:set var="j" value="${j+1 }"/>
			   		<tr>
				      <th scope="row">${j }</th>
				      <td>${product.productVo.product_name }</td>
				      <td>${product.productCount }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 판매량 순으로 정렬 하였습니다.</span>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	<!-- 이번달 스크랩 순위 Modal -->
	<div class="row">
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">스크랩 순위</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-end">
			
			  		<div class="row px-3">
  		
  		<table class="table text-center">
		  <thead>
		    <tr class="bg-secondary bg-opacity-25">
		      <th scope="col">순위</th>
		      <th scope="col">상품명</th>
		      <th scope="col">스크랩 수</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${popularScrap }" var="scrap" begin="0" end="4">
			  	<c:set var="w" value="${w+1 }"/>
			   		<tr>
				      <th scope="row">${w }</th>
				      <td>${scrap.productVo.product_name }</td>
				      <td>${scrap.countScrapProduct }</td>
				    </tr>
		    </c:forEach>
		  </tbody>
		</table>
  		<span>* 상품 스크랩 순으로 정렬 하였습니다.</span>
  		</div>
	        
	      </div>

	    </div>
	  </div>
	</div>		
	</div>
	
	
	
	
	
	<!-- 메뉴 -->
	<div class="offcanvas offcanvas-start pb-0" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
      <div class="offcanvas-header">
        <h2 style="color: #ff6500;" class="offcanvas-title" id="offcanvasWithBothOptionsLabel">LIKEHOME</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">

        <div class="accordion mb-5" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        ${vendorInfo.vendor_brand_name }
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		     	<a class="menu" href="../vendor/logoutProcess">로그아웃</a><br>
		      </div>
		    </div>
		  </div>
		</div>
        
        <div class="accordion mb-3" id="accordionExample">
         <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button fw-bold" style="background-color: #ff6500; color: white;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        스토어 판매
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        <a class="menu" href="../vendor/vendorMainPage">판매메인페이지</a><br>
		        <a class="menu" href="../vendor/vendorProductRegisterPage">상품등록</a><br>
		        <a class="menu" href="../vendor/vendorProductListPage">상품리스트</a><br>
		        <a class="menu" href="../vendor/vendorOrderListPage">주문리스트</a><br>
 				<a class="menu" data-bs-toggle="modal" data-bs-target="#exampleModal1">상품 판매 순위</a><br>
 				<a class="menu" data-bs-toggle="modal" data-bs-target="#exampleModal2">스크랩 순위</a>
  			
		      </div>
		    </div>
		  </div>
		</div>

      </div>
    </div>




    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

  </body>
  <jsp:include page="../common/footer.jsp"></jsp:include>
</html>