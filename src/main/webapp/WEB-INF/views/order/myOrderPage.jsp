<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />


<title>나의 주문내역</title>

<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#424242 !important;
		
		}

	.o-info{
		font-size:0.9rem;
		font-weight:bold;
	}	
    .o-detail{
    	font-size:0.8rem;
    	color:#757575;
    	
    }
		
	.delivery{
		color:#404040;
		font-size:0.9rem;
		
		}
		
	.b-name{
		font-size: 0.8rem;
		color:#757575;
		}
		
	.p-name{
		font-size:0.9rem;
		}
		
	.p-price{
		font-size:0.9rem;
		}
    
	.rc{
	     background-color: white;
	     margin-bottom:0.5rem;
	     padding-bottom:0.7rem;
	   }
	   
	 a {text-decoration: none !important;}
	 
	 .btn-sub{
	 	background-color:white !important;
	 	color:#ff6500 !important;
	 	font-size:0.9rem !important;
	 	border-color:#ff6500 !important;
	 	}
	 	
	 	.nav{
	 	font-size:0.8rem}
</style>
 
 
 <script type="text/javascript">


	window.addEventListener("DOMContentLoaded", function (){
		
		changeMoneyUnit();
	});
	
//원 표시 자동변환 script
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


    <div class="container-fluid">
    <jsp:include page="../common/header.jsp"></jsp:include>	
      
     <div class="scroll-container mt-1 text-center pb-2 bg-white">
		 <div class="menu" onclick="location.href='../order/myOrderPage'">주문내역 조회</div>
		 <div class="menu" onclick="location.href='../customer/productScrapbookPage'">상품스크랩북</div>
		 <div class="menu">상품문의내역</div>
		 <div class="menu">쿠폰</div>
  	</div>
      
      <div class="row rc"><!--배송진행상황-->
        <div class="col px-0 text-center" onclick="location.href='../order/myOrderPage?deliveryStatus=3'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">전체</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../order/myOrderPage?deliveryStatus=0'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">결제완료</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../order/myOrderPage?deliveryStatus=1'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송중</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../order/myOrderPage?deliveryStatus=2'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송완료</button>
        </div>
      </div>
      <div class="row"><!--필터-->
        <div class="col"></div>
      </div>
      
      <div class="row"><!--나의 주문내역 로우-->
        <div class="col">

          <c:forEach items="${dataList }" var="data">
          <div class="row rc"><!--나의 주문내역>주문하나-->
            <div class="col">
              <div class="row pt-2">
                <div class="col o-info">
                	<%-- <span>${data.orderVo.order_no }</span>
                	<span> | </span> --%>
                	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${data.orderVo.order_date }"/></span>
                </div>
                <div class="col-4 text-end"><a href="./orderDetailPage?order_no=${data.orderVo.order_no }" class="o-detail">주문상세<i class="bi bi-chevron-right fs"></i></a></div>
              </div>
              <c:forEach items="${data.orderDetailList }" var="orderDetail">
              <div class="row">
                <div class="col">
                    <div class="card my-1">
                      <div class="card-header delivery py-1">
					<c:choose>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 0}">결제완료</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 1}">배송중</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">배송완료</c:when>
					</c:choose>
                      </div>
                      <div class="card-body pb-1">
                        <div class="row mb-2">
                          <div class="col-3"><img src="../../uploadFiles/titleImage/${orderDetail.productTitleImageVo.title_image_link }" class="img-fluid rounded" alt="..."></div>
                          <div class="col">
                            <div class="row">
                            	<div class="col b-name">${orderDetail.vendorVo.vendor_brand_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-name">${orderDetail.productVo.product_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-price">
                            		<span class="money">${orderDetail.productVo.product_price}</span>
                            	<span class="text-secondary"> | </span>${orderDetail.orderDetailVo.order_detail_quantity }개
                            	</div>
                            </div>
                          </div>
                        </div>
                        <c:if test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">
                         <div class="row">
                           <div class="col d-grid"><button class="btn btn-sub py-1 mb-2">리뷰 작성</button></div>
                         </div>
                        </c:if>
                      </div>
                    </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
        </c:forEach>
        </div>
      </div>
    </div>
    
   	<jsp:include page="../common/footer.jsp"></jsp:include>		
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  </body>
</html>