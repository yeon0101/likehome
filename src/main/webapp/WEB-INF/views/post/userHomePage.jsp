<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>
<style type="text/css">
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css")
	;

::-webkit-scrollbar {
	display: none;
}

body {
	font-family: pretendard;
}

.postImage {
	width: 100%;
	height: 80%;
	background-repeat: no-repeat;
	background-size: cover;
}
/*네비바 css*/
#search {
	font-size: 1.2rem;
}

#cart {
	font-size: 1.5rem;
}

.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: scroll;
	overflow-y: hidden;
}

.menu {
	margin-left: 20px;
	flex: 0 0 auto;
}
/*네비바 css*/
</style>

<script type="text/javascript">
function followList(){
	var followListBox = document.getElementById("postBox");
	followListBox.innerHTML="";
	
}

function followingList(){
	var followingListBox = document.getElementById("postBox");
	followListBox.innerHTML="";
	
}


function doFollw(x,e){
    var customer_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
        
           if(result.followVo != null){
        	   x.innerText = "팔로잉"
           }else{
        	   x.innerText = "팔로우"
           }
        }      
           
		}
    xhr.open("post" , "./restFollowProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("customer_no=" + customer_no); 
}; 


</script>
</head>
<body>
	<!-- 네비바 -->
	<nav id="navbar" class="pb-0 navbar navbar-light bg-white sticky-top border-bottom">
		<div class="row container-fluid m-0 pb-1  border-bottom">
			<div class="col-2 p-0">
				<button class="navbar-toggler p-0 ms-0 border-0" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar"
					style="box-shadow: 0 0 white; border: 0;">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>

			<div class="col-8 fw-bold fs-4" style="text-align: center">
				<a onclick="location.href='../main/mainPage'">LIKEHOME</a>
			</div>
			<div class="col-2 m-0 p-0">
				<div class="row">
					<div data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
						aria-controls="offcanvasRight"
						class="col p-0 m-0 mt-1 ms-1 me-1 text-center"
						style="align-self: center">
						<i id="search" class="bi bi-search"></i>
					</div>
					<div onclick="location.href='../order/cartPage'"
						class="col p-0 m-0">
						<i id="cart" class="m-0 bi bi-cart2"></i>
					</div>
				</div>
			</div>

			<!-- 오프캔버스 좌측 -->
			<div class="offcanvas offcanvas-start " style="width: 65%"
				tabindex="-1" id="offcanvasNavbar"
				aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">LIKEHOME</h5>
					<button type="button" class="btn-close text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="row offcanvas-body p-0 ">
					<div class="col p-0">
						<div id="navbarIdBox" class="row border-bottom p-2 ms-1 mb-1">
							<c:if test="${!empty customerInfo }">
								<div class="col-2 m-0 pe-0">
									<c:choose>
										<c:when test="${!empty customerInfo.customer_profile_image}">
											<img style="width: 100%; height: 100%" class="rounded-circle"
												src="${data.customerVo.customer_profile_image }">
										</c:when>
										<c:otherwise>
											<img style="width: 100%; height: 100%" class="rounded-circle"
												src="../resources/img/home1.png">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col" style="align-self: center">${customerInfo.customer_nick }</div>
							</c:if>
							<c:if test="${empty customerInfo && empty vendorInfo }">
								<div class="row justify-content-center">
									<div class="col-5 m-0 ms-2 p-0">
										<button type="button" class="btn btn-outline-warning"
											style="color: #ff6500; border-color: #ff6500;"
											onclick="location.href='#'">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
									</div>
									<div class="col-5 m-0 ms-2 p-0">
										<button type="button" class="btn btn-warning"
											style="color: white; background-color: #ff6500; border-color: #ff6500;"
											onclick="location.href='../customer/customerRegisterPage'">회원가입</button>
									</div>
								</div>
							</c:if>
							<c:if test="${!empty vendorInfo }">
								<div class="row p-0 m-0">
									<div class="col">${vendorInfo.vendor_brand_name }</div>
								</div>
							</c:if>
						</div>
					</div>
					<c:choose>
						<c:when
							test="${customerInfo.customer_no != null || vendorInfo.vendor_no == null}">
							<div class="row m-0 mt-2 border-bottom">
								<div class="col m-0 p-0 ">
									<div class="row">
										<div class="col border-bottom">
											<p class="menu" onclick="location.href='#'">홈</p>
											<p class="menu" onclick="location.href='#'">스토어</p>
											<p class="menu" onclick="location.href='#'">베스트</p>
											<p class="menu"
												onclick="location.href='../post/followPostListPage'">팔로잉</p>
											<p class="menu"
												onclick="location.href='../post/postListPage'">사진</p>
										</div>
									</div>
									<div class="row">
										<div class="col mt-2">
											<p class="menu" onclick="location.href='#'">마이페이지</p>
											<p class="menu" onclick="location.href='#'">나의 쇼핑</p>
											<p class="menu" onclick="location.href='../order/cartPage'">장바구니</p>
											<p class="menu"
												onclick="location.href='../post/postRegisterPage'">사진
												올리기</p>
											<p class="menu" onclick="location.href='#'">쿠폰</p>
											<p class="menu" onclick="location.href='#'">고객센터</p>
											<p class="menu"
												onclick="location.href='../main/helpQnaBoardPage'">문의하기</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-2 justify-content-end">
								<div class="col-5 p-0"
									onclick="location.href='../vendor/vendorRegisterPage'">판매자
									신청</div>
								<div class="col-5 p-0 me-1 text-center">로그아웃</div>
							</div>
						</c:when>
						<c:when test="${vendorInfo.vendor_no != null }">
							<div class="row mt-2">
								<div class="col">
									<p class="menu"
										onclick="location.href='../vendor/vendorMainPage'">쇼핑몰판매</p>
									<p class="menu"
										onclick="location.href='../product/productListPage'">상품
										리스트 페이지</p>
									<p class="menu" onclick="location.href='../order/cartPage'">장바구니
										페이지</p>
									<p class="menu" onclick="location.href='../order/myOrderPage'">나의
										주문 내역</p>
								</div>
							</div>
						</c:when>
					</c:choose>



				</div>
			</div>
		</div>
		<!-- 오프캔버스 좌측 -->

		<!-- 네비바 2차 -->
		<div class="ps-3 row mt-1 justify-content-center text-center" style="width: 100%">
			<div id="homeTap" class="col-auto">유저홈</div>
			<div id="imageTap" class="col-auto">사진</div>
			<div id="followTap" onclick="followList()" class="col-auto">팔로우</div>
			<div id="followingTap" onclick="followingList()" class="col-auto">팔로잉</div>
		</div>


		<!-- 네비바 2차 -->

		<!-- 오프캔버스 우측 -->
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
			aria-labelledby="offcanvasRightLabel">
			<div class="offcanvas-header">
				<input type="text" class="form-control"
					id="exampleFormControlInput1" placeholder="통합 검색">
				<button type="button" class="btn-close text-reset"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body"></div>
		</div>
		<!-- 오프캔버스 우측 -->

	</nav>
	<div id="container" class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row border-bottom" id="userInfoBox">
					<div class="col">
						<div class="card mb-3 border-0">
							<div class="row g-0">
								<div class="col-4">
									<c:choose>
										<c:when test="${!empty data.userInfo.customer_profile_image }">
											<img src="${data.userInfo.customer_profile_image }"
												class="img-fluid rounded-circle">
										</c:when>
										<c:otherwise>
											<img class="img-fluid rounded-circle"
												src="../resources/img/smile.jpg">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-8 pt-3">
									<div class="row">
										<div class="col fw-bold" style="font-size: 1.1rem;color: #404040">${data.userInfo.customer_nick }</div>
									</div>
									<div class="row">
										<div class="col" style="font-size: 0.9rem;color: #757575">
											<span onclick="followList()"> 팔로우 </span> <span onclick="followList()" id="follow" style="font-weight: bold"> ${data.follow } </span> 
											<span onclick="followingList()"> 팔로잉 </span> <span onclick="followingList()" id="following" style="font-weight: bold"> ${data.following } </span>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<button onclick="doFollw(this,${data.userInfo.customer_no})" id="followBtn"type="button" class="btn py-1" style="width: 50%;background-color: #ff6500; color: white; border-color: #ff6500">팔로우</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col" style="font-size: 0.9rem; color: #404040">
									${data.userInfo.customer_intro }
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="postBox">
					<div class="col">
						<div class="row" id="postInfo">
							<div class="col">사진 000</div>
							<div class="col">전체보기</div>
						</div>
						<div id="postImage" class="row row-cols-3 row-cols-md-6 g-1">
							<c:forEach items="${data.postDataList }" var="postData" begin="0" end="8">
							<div class="col">
								<div class="card" style="height: 100%;">
									<img src="../resources/img/${postData.subpostVo.subpost_image_link }" class="card-img-top" alt="...">
							
								</div>
							</div>
							</c:forEach>
			
						</div>
					</div>
				</div>







			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>		

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>