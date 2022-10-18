<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<title>Insert title here</title>

<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	body {
		font-family: Pretendard;
		color:#404040;
	}
	
	#sort{
	      font-size: 1.1rem;
	      font-weight: bold;
	    }
	    
	.product-name{
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:2.4em;
		font-size:0.9rem;
	}
	
	.brand-name{
		font-size: 0.8rem;
		color: #757575;
		font-weight: bold;
	  }
	   
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}
</style>


<script type="text/javascript">
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
<body>
	<div class="container-fluid">

    <jsp:include page="../common/header.jsp"></jsp:include>	

	<div class="scroll-container mt-1 text-center pb-2 bg-white">
		 <div class="menu" onclick="location.href='../order/myOrderPage'">주문내역 조회</div>
		 <div class="menu" onclick="location.href='../customer/productScrapbookPage'">상품스크랩북</div>
		 <div class="menu">상품문의내역</div>
		 <div class="menu" onclick="location.href='../customer/customerMyCouponPage'">쿠폰</div>
  	</div>

      <div class="row">
        <div class="col">유저정보</div>
      </div>
      <div class="row">
        <div class="col">
          <div class="row text-center my-2" id="sort">
            <div class="col">모두</div>
            <div class="col">상품</div>
            <div class="col">사진</div>
          </div>
          <div class="row row-cols-2 g-2">
          	<c:forEach items="${productScrapDataList }" var="data">
	            <article class="col">
	              <div class="row mb-1">
	                <div class="col">
	                  <img class="img-fluid rounded" src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }" alt="">
	                </div>
	              </div>
	              <div class="row">
	                <div class="col brand-name">${data.vendorVo.vendor_brand_name }</div>
	              </div>
	              <div class="row">
	                <div class="col product-name">${data.productVo.product_name }</div>
	              </div>
	              <div class="row">
	                <div class="col fw-bold money">${data.productVo.product_price }</div>
	              </div>
	              <div class="row">
	                <div class="col rating">
	                  <i class="bi bi-star-fill"></i>
	                  <span>3.7</span>
	                  <span>(123)</span>
	                </div>
	              </div>
           		 </article>
          	</c:forEach>
          </div>
        </div>

      </div>



    </div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
</html>