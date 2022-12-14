<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<style type="text/css">
 @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
 
 	body {
      font-family: Pretendard;
      color: #292929;
      }
      
    .f-gray{
    	color:#757575;
    }
    .fs{
    	font-size:0.9rem;
    }
    
    .carousel-indicators > li {
    height: 10px !important;
    width: 10px !important;
    border-radius: 50%;
    margin-right: 10px !important;
    }

    hr{
      margin-right: 0.7rem;
    }

	.product-name{
		font-size:1.1rem;
	}
    .style-scroll-container {
      height: 16rem;
      overflow-x: auto;
      overflow-y: hidden;
      white-space: nowrap;
      display: flex;
      flex-flow: column wrap;
      }

    .review-scroll-container {
      overflow-x: scroll;
      overflow-y: hidden;
      white-space: nowrap;
      display: flex;
      }

    .review-img{
      width: 4rem;
      height: 4rem;
      
    }

    .card {
      width: 8rem;
      height: 8rem;
      object-fit: cover;
      border: 0;
      flex: 0 0 auto;
      padding: 0.1rem;
    }

      

    .more {
      color: white;
      text-align: center;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
    
    .nav-link{
      color: #292929;
      font-size: 0.9em;
      font-weight: 500;
    }
          
    .box {
        width: 2rem;
        height: 2rem; 
        border-radius: 70%;
        overflow: hidden;
    }

    .profile {
        width: 3rem;
        height: 3rem;
        object-fit: cover;
    }

	.btn-main{
		background-color:#ff6500;
		color:white;
	}
	
	.btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	border-color:#ff6500;
	 	}
	 	
	 svg{
	    vertical-align: baseline;
	 }
	
	.title{
		font-weight: 600;
	}


</style>


<script type="text/javascript">

 var productNo = ${productData.productVo.product_no};
 
 function addToCart(){
	 
	 if(sessionStorage.getItem('customerInfo') == null){
		 location.href='../customer/customerLoginPage';
		 return;
	 }
	 
	 var productQty = document.getElementById("quantityBox").value;
	 console.log(productQty);
	 
	 var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
			}
		}
		xhr.open("post", "../order/restAddToCartProcess");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("product_no=" + productNo +"&cart_product_quantity=" + productQty);
 }
 
 function increaseProductQuantity(){
	var quantityInput = document.getElementById("quantityInput");
	quantityInput.value = parseInt(quantityInput.value) + 1;
	
	var price = document.getElementById('productPrice').innerText;
	price = parseInt(price.replace(/[^0-9]/g, ""));
	
	var total = document.getElementById('total');
	total.innerText = quantityInput.value * price + '???';
 }
 
 function decreaseProductQuantity(){
		var quantityInput = document.getElementById("quantityInput");
	 
	 	if(quantityInput.value == 1){
	 		return;
	 	}else{
	 		quantityInput.value = parseInt(quantityInput.value) - 1;
	 	}
	 	
	 	var price = document.getElementById('productPrice').innerText;
		price = parseInt(price.replace(/[^0-9]/g, ""));
		
		var total = document.getElementById('total');
		total.innerText = quantityInput.value * price + '???';
	 }
	 

  function scrapProduct(productNo){
	  var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				refreshScrap(productNo);
			}
		}
		xhr.open("post", "./restScrapProductProcess");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("product_no=" + productNo);
  }
  
  function refreshScrap(productNo){
	  
	  console.log(productNo);
	  var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var scrapIcon = document.getElementById("scrapIcon");
				if(jsonObj.result == true){
					scrapIcon.setAttribute("class", "bi bi-bookmark-fill");
					scrapIcon.setAttribute("style", "color:#ff6500");
					//scrapIcon.classList.add("bi", "bi-bookmark-fill");
				}else{
					scrapIcon.setAttribute("class", "bi bi-bookmark");
					//scrapIcon.classList.add("bi", "bi-bookmark");
				}
			}
		}
		xhr.open("post", "./restCheckProductScrapProcess");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("product_no=" + productNo);
  }
  
  
 	
  
  window.addEventListener("DOMContentLoaded", function (){
	  changeMoneyUnit();
	  refreshScrap(productNo);
	});
  
//??? ?????? ???????????? script
  function changeMoneyUnit() {
      var moneyValue = document.querySelectorAll(".money");
      const moneyUnit = "???"
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
      
      <section class="row bg-white py-1"><!--????????????-->
        <div class="col fs f-gray">
        	<span>${categoryLayer.PRODUCT_CATEGORY1_NAME }</span>
        	<span><svg class="icon" width="10" height="10" viewBox="0 0 8 8" fill="currentColor"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg></span>
        	<span>${categoryLayer.PRODUCT_CATEGORY2_NAME }</span>
        </div>
      </section>

      <section class="row bg-white pb-1 d-grid"><!--?????????????????? ????????? ??????-->
        <div id="carouselExampleIndicators" class="carousel slide px-0" data-bs-ride="true">
          <ol class="carousel-indicators">
            <li  data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></li>
            <li  data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></li>
            <li  data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></li>
          </ol>
          <div class="carousel-inner">
            <c:forEach items="${productData.productTitleImageList }" var="list">
              <div class="carousel-item active">
                <img src="../../uploadFiles/titleImage/${list.productTitleImageVo.title_image_link }" class="d-block w-100">
              </div>
            </c:forEach>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </section>
      
      <section class="row bg-white mb-2 pb-4"><!-- ??????????????????????????? -->
      	<div class="col">
      		<div class="row my-1">
            <div class="col text-secondary fw-bold">${productData.vendorVo.vendor_brand_name }</div>
          </div>
          <div class="row mb-1">
            <div class="col product-name">${productData.productVo.product_name }</div>
          </div>
          <div class="row" style="font-size:0.9rem;">
            <div class="col">
              <span style="color:#ff6500">
	              <i class="bi bi-star-fill "></i>
	              <i class="bi bi-star-fill "></i>
	              <i class="bi bi-star-fill "></i>
	              <i class="bi bi-star-fill "></i>
	              <i class="bi bi-star-fill "></i>
              </span>
              <span> 4.2</span>
              <span class="text-secondary"> (2,567)</span>
            </div>
          </div>
          <div class="row my-2">
            <div class="col fw-bold fs-5"><span id="productPrice" class="money">${productData.productVo.product_price }</span></div>
          </div>
          <div class="row my-2 fs">
          	<div class="col-2 f-gray">??????</div>
          	<div class="col"><span class="fw-bold">100P </span><span class="f-gray">?????? (WELCOME 0.3% ??????)</span></div>
          </div>
          <div class="row fs">
          	<div class="col-2 f-gray">??????</div>
          	<div class="col">
              <div class="fw-bold">
                <c:choose>
                  <c:when test="${productData.productVo.product_delivery_fee eq '0'}">????????????</c:when>
                  <c:otherwise><span class="money">${productData.productVo.product_delivery_fee }</span></c:otherwise>
                </c:choose>
              </div>
              <div class="f-gray">13??? ?????? ????????? ????????????(??????,???????????????)</div>
            </div>
          </div>
      	</div>
      </section>

      <!-- ??????????????? -->
	    <section class="row mb-2"><img class="img-fluid px-0" src="../resources/img/165951549830809946.jpeg"></section>
	
      <section class="row bg-white mb-2 pt-2"><!--?????????????????????-->
        <div class="col">
          <div class="row mb-2">
            <div class="col title"><span>???????????? ???????????????</span><span class="f-gray"> 7,551</span></div>
          </div>
          <div class="row mb-2">
            <div class="style-scroll-container">
            	<c:forEach items="${subpostDataList }" var="data" varStatus="status" begin="0" end="7">
					<c:choose>
						<c:when test="${status.last }">
			              <div class="card">
			                <img class="rounded" style="filter:brightness(50%);" src="../resources/img/163478589377418883.webp">
			                <div class="more">?????????</div>
			              </div>
						</c:when>
						<c:otherwise>
			              <div class="card"><img class="rounded" src="../../uploadFiles/${data.subpost_image_link }" alt="subpostImg"></div>
						</c:otherwise>
					</c:choose>
            	</c:forEach>
            </div>
          </div>
          <div class="row my-2">
            <div class="col d-grid">
              <button class="btn btn-outline-secondary">??????????????? ????????????</button>
            </div>
          </div>
        </div>
      </section>

      <section class="row bg-white sticky-top"><!--???(????????????, ??????, ??????)sticky-->
        <div class="col">
          <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">????????????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">??????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">??????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">????????????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">??????</a>
            </li>
          </ul>
        </div>
      </section>

      <section class="row bg-white mb-2"><!--??????????????????-->
        <div class="col px-0">
          <c:forEach items="${productData.productDetailImageList }" var="list">
	          <img class="img-fluid" src="../../uploadFiles/detailImage/${list.productDetailImageVo.detail_image_link }" alt="...">
	        </c:forEach>
        </div>
      </section>
      
      <section class="row bg-white"><!--??????????????????-->
        <div class="col">
          <div class="row my-4"><!--???????????????-->
            <div class="col title">?????? <span class="text-secondary">11,242</span></div>
          </div>
          <div class="row fs mb-3"><!--??????,?????????,?????????-->
            <div class="col-7">
              <div class="dropdown">
                <button class="btn btn-secondary btn-sm dropdown-toggle py-0" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">??????</button>
              </div>
            </div>
            <div class="col">????????????</div>
            <div class="col">?????????</div>
          </div>

          <div class="row"><!--????????????????????????-->
            <div class="review-scroll-container pb-3">
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
              <div class="card" style="width:6rem;height:6rem;"><img class="rounded" src="../resources/img/163478589377418883.webp"></div>
             </div>
          </div>

          <div class="row"><!--????????????-->
            <div class="col mx-1">
              <article class="row fs mb-2"><!--????????????-->
                <div class="col">
                  <div class="row pb-2"><!--????????? ????????? ??????-->
                    <div class="col"><span>dkejowi1234</span><span></span></div>
                    <div class="col fxs text-end">2022.07.03</div>
                   </div>
                  <div class="row">
                    <div class="col-3"><img class="review-img rounded" src="../resources/img/163944985057083845.webp"></div>
                    <div class="col">????????? ?????? ??? ???????????? ?????????. ?????? ????????? ?????? ???????????? ??????????????????</div>
                  </div>
                </div>
              </article>
              <hr class="">
              <article class="row fs mb-1"><!--????????????-->
                <div class="col">
                  <div class="row pb-2"><!--????????? ????????? ??????-->
                    <div class="col"><span>woeotoc</span><span></span></div>
                    <div class="col fxs text-end">2022.07.03</div>
                  </div>
                  <div class="row">
                    <div class="col-3 p-0" style="object-fit: cover;"><img style="width: 100%;height: 100%;"class="rounded" src="../resources/img/163944985057083845.webp"></div>
                    <div class="col">?????? ???????????? ????????? ??????????????? ??? ??? ????????? ????????? ???????????? ?????????????????? ????????? ?????? ???????????? ???????????????.</div>
                  </div>
                </div>
              </article>
              <hr class="f-gray">
            </div>
          </div>
          <div class="row py-3 bg-white">
            <div class="col d-grid"><button class="btn btn-outline-secondary">?????? ?????? ??????</button></div>
          </div>
        </div>
      </section>

      <section class="row bg-white mb-2"><!--????????????-->
        <div class="col">
          <div class="row">
            <div class="col fw-bold">??????<span class="text-secondary"> 250</span></div>
          </div>
          <div class="row">
            <div class="col">???????????????</div>
          </div>
        </div>
      </section>

      
      <section class="row sticky-bottom bg-white mb-2 py-2"><!--???????????? ?????? offcanvas bottim sticky-->
        <div class="col-2 fs-1 text-center"><i id="scrapIcon" class="bi bi-bookmark" onclick="scrapProduct(${productData.productVo.product_no})"></i></div>
        <div class="col d-grid">
          <button class="btn btn-main" sytle="color:#ff6500;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom">????????????</button>
   
          <div class="offcanvas offcanvas-bottom" style="height:auto" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
            <form action="../order/buyNowProcess" method="post">
        	<input type="hidden" name="product_no" value="${productData.productVo.product_no }">
            <div class="offcanvas-body my-1">
              <div class="row">
                <div class="col">
               		<div class="row">
               			<div class="col pb-1">${productData.productVo.product_name }</div>
               		</div>
               		<div class="row mt-1">
	                    <div class="col-4">
	                      <div class="input-group px-0">
							  <button class="btn btn-outline-secondary py-0" type="button" onclick="decreaseProductQuantity()" >-</button>
							  <input id="quantityInput" type="number" class="form-control p-0" style="text-align: center;" name="cart_product_quantity" min="1" value="1">
							  <button class="btn btn-outline-secondary py-0" type="button" onclick="increaseProductQuantity()">+</button>
					 	 </div>
	               	    </div>
			       </div>
               		<div class="row">
               			<div class="col text-end">
               				<span class="fs f-gray">??? ?????? ??????&nbsp;&nbsp;</span>
               				<span id="total" style="font-weight:500"> ${productData.productVo.product_price }???</span>
               			</div>
               		</div>
                </div>
              </div>
               <div class="row g-2 mt-1">
                 <div class="col d-grid"><button type="button" class="btn btn-sub py-1" onclick="addToCart()">????????????</button></div>
                 <div class="col d-grid"><button class="btn btn-main py-1">????????????</button></div>
               </div>
            </div>
            </form>
          </div>
       </div>
      </section>
   
  </div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>