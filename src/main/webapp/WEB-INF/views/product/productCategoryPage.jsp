<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />

<style type="text/css">
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#424242;
		}
	
	
	.f-small{
		font-size : small;
	}
	
	.btn-main{
		background-color:#ff6500;
		color:white;
	}
	
	.cat-name{
		font-size:small;
		color:gray;
		text-align:center;
		}
		
	.cat1{
		background-color: white;
   		border: 0.05rem solid #e9ecef;
   		padding-bottom:0.5rem;
	}
	
	.p-name{
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:2.4em;
		font-size:0.9rem;
	}
	
	.cat-name{
		font-size:small;
		color:gray;
		text-align:center;
	}
    
    .brand-name{
		font-size: 0.8rem;
		color: #757575;
		font-weight: bold;
    }
    
    .extra-info{
    	font-size:0.9rem;
    	color: #757575;
    	align-self: center;
    }
   
	.ad{
		position:relative;
	}
	
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}
	
    .btn-over{
      position: absolute;
      top: 50%;
      left: 50%;
      width:auto;
    }
    
    .filter{
		background-color: white;
   		border: 0.07rem solid #e9ecef;
   		padding-bottom:0.5rem;
   		display: flex;
    	justify-content: space-between;
	}
</style>
    
    
<script type="text/javascript">
    
	
	//done
	function showCategory2List(category1No){
		
		
		 var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);
					
					var data = jsonObj.productCategory2List;
					
					var cat2Box = document.getElementById("cat2");
					cat2Box.innerHTML = "";
					
					for(e of data){

						var cat2col = document.createElement('div');
						cat2col.classList.add("col-3", 'my-0');
						cat2Box.appendChild(cat2col);
						cat2col.setAttribute('onclick', "location.href='../product/productListPage?productCategory2No=" + e.product_category2_no + "'"); //해당되는 상품리스트 페이지로 이동

						var cat2img = document.createElement('img');
						cat2img.classList.add('img-fluid', 'p-2');
						cat2img.setAttribute('src','../resources/categoryImage/category2/' + e.product_category1_no + e.product_category2_no + '.png');

						var cat2name = document.createElement('div');
						cat2name.classList.add('cat-name');
						cat2name.innerText = e.product_category2_name;
						
						cat2col.appendChild(cat2img);
						cat2col.appendChild(cat2name);
					}
					
					showCategory1Product(category1No);
				}
			}
			xhr.open("get", "./restShowProductCategory2ListProcess?category1No=" + category1No);
			xhr.send();
	 }

	function showCategory1Product(category1No){
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var dataList = jsonObj.productDataList;
				
				var productList = document.getElementById("productList");
				productList.innerHTML = '';
				
				 for(data of dataList){

				      var col1 = document.createElement('article');
				      col1.classList.add('col-6','mb-2');
				      col1.setAttribute("onclick", "location.href='../product/productDetailPage?product_no=" + data.productVo.product_no + "'");

				      productList.appendChild(col1);

				      var row1 = document.createElement('div');
				      row1.classList.add('row' , 'mb-2');

				      var row1col1 = document.createElement('div');
				      row1col1.classList.add('col');
				      var imgbox = document.createElement('img');
				      imgbox.classList.add("img-fluid","rounded");
			          imgbox.setAttribute("src", "../../uploadFiles/titleImage/" + data.productTitleImageVo.title_image_link);
					  row1col1.appendChild(imgbox);

				      var row2 = document.createElement('div');
				      row2.classList.add('row');

				      var row2col1 = document.createElement('div');
				      row2col1.classList.add('col','brand-name');
				      row2col1.innerText = data.vendorVo.vendor_brand_name;

				      var row3 = document.createElement('div');
				      row3.classList.add('row');

				      var row3col1 = document.createElement('div');
				      row3col1.classList.add('col', 'p-name');
				      row3col1.innerText = data.productVo.product_name;
				      
				      var row4 = document.createElement('div');
				      row4.classList.add('row');

				      var row4col1 = document.createElement('div');
				      row4col1.classList.add('col','fw-bold','money');
				      row4col1.innerText = data.productVo.product_price;

				      var row5 = document.createElement('div');
				      row5.classList.add('row');

				      var row5col1 = document.createElement('div');
				      row5col1.classList.add('col', 'rating');
				      
				      var starIcon = document.createElement('i');
				      starIcon.classList.add('bi', 'bi-star-fill');
				      var starRating = document.createElement('span');
				      starRating.innerText = " 4.3";
				      var reviewCnt = document.createElement('span');
				      reviewCnt.classList.add('text-secondary');
				      reviewCnt.innerText = ' 	(2,333)';
				      
				      row5col1.appendChild(starIcon);
				      row5col1.appendChild(starRating);
				      row5col1.appendChild(reviewCnt);
				      

				      row1.appendChild(row1col1);
				      row2.appendChild(row2col1);
				      row3.appendChild(row3col1);
				      row4.appendChild(row4col1);
				      row5.appendChild(row5col1);

				      col1.appendChild(row1);
				      col1.appendChild(row2);
				      col1.appendChild(row3);
				      col1.appendChild(row4);
				      col1.appendChild(row5);

				    }
				    changeMoneyUnit();
			}
		}
		xhr.open("get", "./restShowCategory1ProductProcess?category1No=" + category1No);
		xhr.send();
	}
	
    window.addEventListener("DOMContentLoaded", function (){
		//처음 실행되는 코드 모음
		showCategory2List(1);
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
  
   
    <div class="container-fluid">
    
    <jsp:include page="../common/header.jsp"></jsp:include>	

    
    <section class="row px-0">
    	<img class="img-fluid px-0" src="../resources/img/today_deal_banner_220620.gif">
    </section>
     
    
     
     
    <section class="row row-cols-3"><!-- 카테고리1 선택 -->
      <c:forEach items="${productCategory1List }" var="cat1">
	      <div class="col cat1" onclick="showCategory2List(${cat1.product_category1_no})">
	        <img class="img-fluid px-4 py-1" src="../resources/categoryImage/category1/${cat1.product_category1_no }.png">
	        <div class="cat-name">${cat1.product_category1_name }</div>
	      </div>
      </c:forEach>
    </section>
    <section id="cat2" class="row bg-white py-3"></section><!-- 카테고리2선택 ajax -->
      
    
     <section class="row ad">
     	<img class="img-fluid px-0" src="../resources/img/11122222.png">
		<div class="btn-over">
			<button class="btn btn-main" type="button">인기가구 보러가기</button>
		</div>
     </section>
     
     
      <section class="row py-2 bg-white">
      	<div class="col text-secondary">패브릭</div>
      </section>
     
    <section class="row row-cols-2">
		<div class="col filter py-1">필터<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 13" style="width: 10%;">
    <g style="fill: none; fill-rule: evenodd; stroke: rgb(48, 48, 51); stroke-width: 1;">
        <path d="M6.44 2.975h11.95M6.45 2.975a2.475 2.475 0 1 0-4.95 0 2.475 2.475 0 0 0 4.95 0zM1.214 9.486H13.44M18.39 9.486a2.475 2.475 0 1 0-4.95 0 2.475 2.475 0 0 0 4.95 0z"></path>
    </g>
</svg></div>
		<div class="col filter py-1">판매순<i class="bi bi-arrow-down-up"></i></div>
	</section>
	
	
    <section class="row bg-white py-2"><!--상품리스트-->
        <div class="col">
          <div id="productList" class="row py-3 row-cols-2 g-2"></div>
        </div>
    </section>
    
    
    
    <jsp:include page="../common/footer.jsp"></jsp:include>		
     


    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>