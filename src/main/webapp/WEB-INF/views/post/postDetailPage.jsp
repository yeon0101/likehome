<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">


::-webkit-scrollbar {
	display: none;
}

body {
	font-family: pretendard;
}
/*네비바 css*/
#search {
	font-size: 1.2rem;
}

#cart {
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
	margin-left: 20px;
	flex: 0 0 auto;
}
/*네비바 css*/
.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: scroll;
	overflow-y: hidden;
}

.productCard {
	width: 5rem;
	height: 5rem;
	object-fit: cover;
	border: 0;
	flex: 0 0 auto;
}

.postCard {
	width: 6rem;
	height: 6rem;
	object-fit: cover;
	border: 0;
	flex: 0 0 auto;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">

var post_no = ${postNo};
	function refreshCommentList(){
		
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    	xhr.onreadystatechange = function () {
     	if(xhr.readyState == 4 && xhr.status == 200){
      	var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
      		
      		var follow = document.getElementById("followBox")
      		if(result.data.followVo != null){
      			follow.innerText = "팔로잉"
      		}else{
      			follow.innerText = "팔로우"
      		}
      	
      		var commentCount2 = document.getElementById("commentCount2")
      		commentCount2.innerText = result.data.postCommentCount;
      		
      		var commentBox = document.getElementById("commentBox")   
      		commentBox.innerHTML="";
      	
      		var outterColBox = document.createElement("div");
      		outterColBox.classList.add("col");
      		commentBox.appendChild(outterColBox);
      		
      		var outterRowBox1 = document.createElement("div");
      		outterRowBox1.classList.add("row");
      		outterColBox.appendChild(outterRowBox1);
      		
      		var commentCount =  document.createElement("div");
      		commentCount.classList.add("col");
      		commentCount.classList.add("ms-2");
      		commentCount.setAttribute("style","font-weight: bold;")
      		outterRowBox1.appendChild(commentCount);
      		
      		var commentCountSpan1 =  document.createElement("span");
      		commentCountSpan1.innerText= "댓글"+" ";
      		commentCount.appendChild(commentCountSpan1);
      		
      		var commentCountSpan2 =   document.createElement("span");
      		commentCountSpan2.innerText = result.data.postCommentCount;
      		commentCount.appendChild(commentCountSpan2);
      		
			var commentRegisterRow = document.createElement("div");
			commentRegisterRow.classList.add("row");
			outterColBox.appendChild(commentRegisterRow);
      		
			var commentRegisterProfilCol = document.createElement("div");
			commentRegisterProfilCol.classList.add("col-2");
			commentRegisterProfilCol.classList.add("p-2");
			commentRegisterProfilCol.classList.add("ms-2");
			commentRegisterProfilCol.setAttribute("style","align-self: center")
			commentRegisterRow.appendChild(commentRegisterProfilCol);
			
			if(result.customerInfo.customer_profile_image != null){
			var commentRegisterProfilImage = document.createElement("img");
			commentRegisterProfilImage.classList.add("img-fluid");
			commentRegisterProfilImage.classList.add("rounded-circle");
			commentRegisterProfilImage.setAttribute("src",customerInfo.customer_profile_image)
			commentRegisterProfilCol.appendChild(commentRegisterProfilImage);
			}else{
				var commentRegisterProfilImage = document.createElement("img");
				commentRegisterProfilImage.classList.add("img-fluid");
				commentRegisterProfilImage.classList.add("rounded-circle");
				commentRegisterProfilImage.setAttribute("src","https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2")
				commentRegisterProfilCol.appendChild(commentRegisterProfilImage);
				
			}
			
			var commentInputBox = document.createElement("div");
			commentInputBox.classList.add("col");
			commentInputBox.classList.add("p-2");
			commentRegisterRow.appendChild(commentInputBox);
			
			var commentInput = document.createElement("textarea");
			commentInput.classList.add("form-control");
			commentInput.setAttribute("style","height: 100%; width: 100%")
			commentInput.setAttribute("id","commentContent")
			commentInputBox.appendChild(commentInput);
			
			var registerButtonBox = document.createElement("div");
			registerButtonBox.classList.add("col-2");
			registerButtonBox.classList.add("p-2");
			registerButtonBox.classList.add("ps-0");
			registerButtonBox.classList.add("text-center");
			registerButtonBox.setAttribute("style","align-self: center;")
			commentRegisterRow.appendChild(registerButtonBox);
			
			var registerButton = document.createElement("button");
			registerButton.classList.add("btn");
			registerButton.classList.add("m-0");
			registerButton.classList.add("p-0");
			registerButton.innerText = "등록"
			registerButton.setAttribute("onclick","writeComment()")
			registerButtonBox.appendChild(registerButton);
			
			for(var data of result.data.postCommentDataList){
				
			var commentList = document.createElement("div");
			commentList.classList.add("row");
			commentList.classList.add("my-1");
			commentList.classList.add("commentListBox");
			outterColBox.appendChild(commentList);
				
			var commentListImageCol = document.createElement("div");
			commentListImageCol.classList.add("col-2");
			commentListImageCol.classList.add("ms-2");
			commentList.appendChild(commentListImageCol);
			
			if(data.commentCustomerVo.customer_profile_image != null){
				var commentListProfilImage = document.createElement("img");
				commentListProfilImage.classList.add("img-fluid");
				commentListProfilImage.classList.add("rounded-circle");
				commentListProfilImage.setAttribute("src",data.commentCustomerVo.customer_profile_image)
				commentListImageCol.appendChild(commentListProfilImage);
			}else{
				var commentListProfilImage = document.createElement("img");
				commentListProfilImage.classList.add("img-fluid");
				commentListProfilImage.classList.add("rounded-circle");
				commentListProfilImage.setAttribute("src","https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2")
				commentListImageCol.appendChild(commentListProfilImage);
			}
			
			var commentInfoBox = document.createElement("div");
			commentInfoBox.classList.add("col");
			commentInfoBox.classList.add("p-0");
			commentList.appendChild(commentInfoBox);
			
			var commentInfoRow1 = document.createElement("div");
			commentInfoRow1.classList.add("row");
			commentInfoBox.appendChild(commentInfoRow1);
			
			var commentInfoNick = document.createElement("div");
			commentInfoNick.classList.add("col");
			commentInfoNick.classList.add("commentNick");
			commentInfoNick.setAttribute("style","font-size: 0.8rem; font-weight: bold");
			commentInfoNick.innerText = data.commentCustomerVo.customer_nick;
			commentInfoRow1.appendChild(commentInfoNick);
			
			var commentInfoRow2 = document.createElement("div");
			commentInfoRow2.classList.add("row");
			commentInfoBox.appendChild(commentInfoRow2);
			
			var commentContent = document.createElement("div");
			commentContent.classList.add("col");
			commentContent.setAttribute("style","font-size: 0.8rem");
			commentContent.innerText = data.postCommentVo.post_comment_content;
			commentInfoRow2.appendChild(commentContent);
			
			var commentInfoRow3 = document.createElement("div");
			commentInfoRow3.classList.add("row");
			commentInfoRow3.setAttribute("style","font-size: 0.7rem");
			commentInfoBox.appendChild(commentInfoRow3);
			
			var commentinfoRow3Col = document.createElement("div");
			commentinfoRow3Col.classList.add("col");
			commentInfoRow3.appendChild(commentinfoRow3Col);
			
			var commentInfoSpan1 =document.createElement("span");
			commentInfoSpan1.innerText = moment(data.postCommentVo.post_comment_write_date).format(' MM.DD ') 
			commentinfoRow3Col.appendChild(commentInfoSpan1);
			
			var commentInfoSpan2 =document.createElement("span");
			commentinfoRow3Col.appendChild(commentInfoSpan2);
			
			var dotIcon =document.createElement("i");
			dotIcon.classList.add("bi");
			dotIcon.classList.add("bi-dot");
			commentInfoSpan2.appendChild(dotIcon);
			
			var commentInfoSpan3 =document.createElement("span");
			commentInfoSpan3.setAttribute("onclick","doCommentLike("+data.postCommentVo.post_comment_no+")");
			commentInfoSpan3.innerText = " ";
			commentinfoRow3Col.appendChild(commentInfoSpan3);
			
			if(data.postCommentLikeVo != null){
				var commentInfoLike = document.createElement("i");
				commentInfoLike.classList.add("postHeart");
				commentInfoLike.classList.add("bi-heart-fill");
				commentInfoLike.classList.add("text-danger");
				commentInfoSpan3.appendChild(commentInfoLike);
				
				var commentInfoLikeInfo = document.createElement("span");
				commentInfoLikeInfo.innerText = " "+"좋아요"+" ";
				commentInfoSpan3.appendChild(commentInfoLikeInfo);
			}else{
				var commentInfoLike = document.createElement("i");
				commentInfoLike.classList.add("postHeart");
				commentInfoLike.classList.add("bi-heart");
				commentInfoLike.classList.add("text-danger");
				commentInfoSpan3.appendChild(commentInfoLike);
				
				var commentInfoLikeInfo = document.createElement("span");
				commentInfoLikeInfo.innerText = " "+"좋아요"+" ";
				commentInfoSpan3.appendChild(commentInfoLikeInfo);
			}
			
			var commentInfoSpan4 =document.createElement("span");
			commentinfoRow3Col.appendChild(commentInfoSpan4);
			
			var dotIcon =document.createElement("i");
			dotIcon.classList.add("bi");
			dotIcon.classList.add("bi-dot");
			commentInfoSpan4.appendChild(dotIcon);
			
			var commentInfoSpan5 =document.createElement("span");
			commentInfoSpan5.innerText = " "+"답글달기"+" ";
			commentInfoSpan5.setAttribute("onclick","writeNestedComment(this ,"+data.postCommentVo.post_comment_no+")");
			commentinfoRow3Col.appendChild(commentInfoSpan5);
			

			
			var commentInfoSpan6 =document.createElement("span");
			commentinfoRow3Col.appendChild(commentInfoSpan6);
			
			var dotIcon =document.createElement("i");
			dotIcon.classList.add("bi");
			dotIcon.classList.add("bi-dot");
			commentInfoSpan6.appendChild(dotIcon);
			
			var commentInfoSpan7 =document.createElement("span");
			commentInfoSpan7.innerText=" "+"신고"+" "
			commentinfoRow3Col.appendChild(commentInfoSpan7);
			
			var commentInfoSpan8 = document.createElement("span");
			commentinfoRow3Col.appendChild(commentInfoSpan8);
			
			var dotIcon =document.createElement("i");
			dotIcon.classList.add("bi");
			dotIcon.classList.add("bi-dot");
			commentInfoSpan8.appendChild(dotIcon);
			
			var commentInfoSpan9 = document.createElement("span");
			commentInfoSpan9.innerText = " "+"수정"+" "
			commentinfoRow3Col.appendChild(commentInfoSpan9);
			
			var commentInfoSpan10 = document.createElement("span");
			commentinfoRow3Col.appendChild(commentInfoSpan10);
			
			var dotIcon =document.createElement("i");
			dotIcon.classList.add("bi");
			dotIcon.classList.add("bi-dot");
			commentInfoSpan10.appendChild(dotIcon);
			
			var commentinfoSpan11 = document.createElement("span");
			commentinfoSpan11.innerText = " "+"삭제"+" "
			commentinfoSpan11.setAttribute("onclick","deleteComment("+data.postCommentVo.post_comment_no+")")
			commentinfoRow3Col.appendChild(commentinfoSpan11);
			}
			
		
      		      
            }
        }
		
      xhr.open("get" , "./restPostDetail?post_no="+post_no);
      xhr.send();
};

function writeNestedComment(e,commentNo){
	var x = e.closest(".commentListBox")
	var No = commentNo
	var name = e.closest(".commentListBox").querySelector(".commentNick").innerText;
	var z = document.getElementById("commentBox")
	if(z.querySelector(".nestedCommentPlusBox")){
		var y = z.querySelector(".nestedCommentPlusBox")
		y.remove();
	}
	
	var nestedCommentBox =document.createElement("div");
	nestedCommentBox.classList.add("row");
	nestedCommentBox.classList.add("nestedCommentPlusBox");
	x.appendChild(nestedCommentBox);
	
	var nestedCommentCol1 = document.createElement("div");
	nestedCommentCol1.classList.add("col-2");
	nestedCommentBox.appendChild(nestedCommentCol1);
	
	var nestedCommentCol2 = document.createElement("div");
	nestedCommentCol2.classList.add("col-2");
	if(${customerInfo.customer_profile_image != null }){
		var commentListProfilImage = document.createElement("img");
		commentListProfilImage.classList.add("img-fluid");
		commentListProfilImage.classList.add("rounded-circle");
		commentListProfilImage.setAttribute("src",${data.commentCustomerVo.customer_profile_image})
		nestedCommentCol2.appendChild(commentListProfilImage);
	}else{
		var commentListProfilImage = document.createElement("img");
		commentListProfilImage.classList.add("img-fluid");
		commentListProfilImage.classList.add("rounded-circle");
		commentListProfilImage.setAttribute("src","https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2")
		nestedCommentCol2.appendChild(commentListProfilImage);
	}
	nestedCommentBox.appendChild(nestedCommentCol2);

	var nestedCommentCol3 = document.createElement("div");
	nestedCommentCol3.classList.add("col");
	nestedCommentCol3.classList.add("form-floating");
	nestedCommentCol3.classList.add("px-1");
	nestedCommentBox.appendChild(nestedCommentCol3);

	var nestCommentTextarea = document.createElement("textarea");
	nestCommentTextarea.classList.add("form-control");
	nestCommentTextarea.classList.add("pt-3");
	nestCommentTextarea.setAttribute("id","nestCommentContent")
	nestCommentTextarea.setAttribute("style","height: 3rem; width: 100%")
	nestedCommentCol3.appendChild(nestCommentTextarea);
	
	var nestedCommentNick =  document.createElement("span");
	nestedCommentNick.innerText = "@"+name
	nestCommentTextarea.appendChild(nestedCommentNick);
	
// 	var nestedCommentTextareaLabel = document.createElement("label");
// 	nestedCommentTextareaLabel.classList.add("text-info");
// 	nestedCommentTextareaLabel.classList.add("pt-2");
// 	nestedCommentTextareaLabel.setAttribute("for","floatingInputValue")
// 	nestedCommentTextareaLabel.innerText = "@"+name
// 	nestedCommentCol3.appendChild(nestedCommentTextareaLabel);

	var nestedCommentCol4 = document.createElement("div");
	nestedCommentCol4.classList.add("col-2");
	nestedCommentCol4.classList.add("text-center");
	nestedCommentCol4.innerText = "등록"
	nestedCommentCol4.setAttribute("onclick","nestedCommentRegister("+No+")")
	nestedCommentCol4.setAttribute("style","align-self:center")
	nestedCommentBox.appendChild(nestedCommentCol4);


}

function nestedCommentRegister(e){
	var post_comment_no = e
	console.log(post_comment_no)
	var nested_comment_content = document.getElementById("nestCommentContent").value
	console.log(nested_comment_content)
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    xhr.onreadystatechange = function () {
       if(xhr.readyState == 4 && xhr.status == 200){
          var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
          refreshCommentList()
       	}      
          
		}
   xhr.open("post" , "./restNestedCommentRegisterProcess");
   xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xhr.send("post_comment_no=" + post_comment_no + "&nested_comment_content=" + nested_comment_content); 

}

function doCommentLike(e){
	var post_comment_no = e;
	
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           refreshCommentList()
        }      
           
		}
    xhr.open("post" , "./restPostCommentLikeProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_comment_no=" + post_comment_no); 
}; 

function doFollow(e){
    var customer_no = e;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           refreshCommentList()
        	
        }      
           
		}
    xhr.open("post" , "../customer/restFollowProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("customer_no=" + customer_no); 
}; 

function writeComment(){
    var post_comment_content = document.getElementById("commentContent").value;
    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           refreshCommentList()
        	
        }      
           
		}
    xhr.open("post" , "./restPostCommentRegisterProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no + "&post_comment_content=" + post_comment_content); 
}; 

function deleteComment(e){
	var post_comment_no = e 
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           refreshCommentList()
        	
        }      
           
		}
    xhr.open("post" , "./restPostCommentDeleteProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_comment_no=" + post_comment_no);
	
}

function report(e){
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
           if(result.postReport == null){
        	   e.innerText = "신고하기"
           }else{
        	   e.innerText = "신고됨"
           }
        }      
           
		}
    xhr.open("post" , "./restPostReportProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no);
	
}

function doPostLike(){
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
    		var x = document.getElementById("postLikeCount");
    		var e = document.getElementById("postLikeIcon");       
           if(result.postLike){
        	   e.setAttribute("style","color: #ff6500; font-size:1.3rem;");
        	   e.classList.replace("bi-heart","bi-heart-fill")
        	   x.innerText = result.likeCount
           }else{
        	   e.setAttribute("style","color: #404040; font-size:1.3rem;");
        	   e.classList.replace("bi-heart-fill","bi-heart")
        	   x.innerText = result.likeCount
           }
        }      
           
		}
    xhr.open("post" , "./restPostLikeProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no);
	
}

function doPostScrap(){
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
     xhr.onreadystatechange = function () {
        if(xhr.readyState == 4 && xhr.status == 200){
           var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
    		var x = document.getElementById("postScrapCount");
    		var e = document.getElementById("postScrapIcon");       
           if(result.postScrap != null){
        	   e.setAttribute("style","color: #ff6500; font-size:1.3rem;");
        	   e.classList.replace("bi-bookmark","bi-bookmark-fill")
        	   x.innerText = result.postScrapCount
           }else{
        	   e.setAttribute("style","color: #404040; font-size:1.3rem;");
        	   e.classList.replace("bi-bookmark-fill","bi-bookmark")
        	   x.innerText = result.postScrapCount
           }
        }      
           
		}
    xhr.open("post" , "./restPostScarpProcess");
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("post_no=" + post_no);
	
}




document.addEventListener('click',function(event){
	var x = document.getElementById("commentBox").querySelector(".nestedCommentPlusBox")
	
	var e = event.target.innerText
	if((x== event.target.closest(".nestedCommentPlusBox")) || e.includes("답글달기") ){
		return
	}else{
		if(x){
		x.remove();
		}
	}
	
})




</script>


</head>
<body>
	<!-- 네비바 -->
	<nav id="navbar" class="navbar navbar-light bg-white sticky-top">
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
				<i id="search" class="bi bi-search" 
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
					aria-controls="offcanvasRight"></i> <i id="cart"
					class="bi bi-cart2"
					onclick="location.href='../order/cartPage'"></i>
			</div>

			<!-- 오프캔버스 좌측 -->
			<div class="offcanvas offcanvas-start" style="width: 65%"
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
										<c:when
											test="${!empty data.customerVo.customer_profile_image }">
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
											<p class="menu" onclick="location.href='#'">사진</p>
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

					<!-- 기능 이식 후 삭제 해주세요-->
					<button onclick="location.href='../customer/customerLoginPage'"
						type="button" class="btn btn-primary">일반회원로그인</button>
					<button onclick="location.href='../vendor/vendorLoginPage'"
						type="button" class="btn btn-primary">사업자로그인</button>
					<button onclick="location.href='../admin/adminLoginPage'"
						type="button" class="btn btn-primary">관리자로그인</button>
					<!-- 기능 이식 후 삭제 해주세요-->

				</div>
			</div>
		</div>
		<!-- 오프캔버스 좌측 -->

		<!-- 네비바 2차 -->
		<div class="scroll-container mt-1 text-center">
			<div class="menu">홈</div>
			<div class="menu">스토어</div>
			<div class="menu">베스트</div>
			<div class="menu">팔로잉</div>
			<div class="menu">사진</div>
			<div class="menu">쿠폰</div>
			<div class="menu">고객센터</div>
			<div class="menu">문의하기</div>
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
	<!-- 네비바 -->
	<div id="container" class="container-fluid p-0">
		<div class="row" style="border-bottom: 0.3rem solid #f8f9fa;">
			<div onclick="location.href='../customer/userHomePage?userNo=${data.postCustomerVo.customer_no}'" class="col-2 p-2 ms-2">
				<c:choose>
					<c:when
						test="${!empty data.postCustomerVo.customer_profile_image }">
						<img class="rounded-circle img-fluid"
							src="/uploadFiles/customerIntro${data.postCustomerVo.customer_profile_image }">
					</c:when>
					<c:otherwise>
						<img class="rounded-circle img-fluid"
							src="https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col align-self-center">
				<div class="row">
					<div class="col p-0">
						<span onclick="location.href='../customer/userHomePage?userNo=${data.postCustomerVo.customer_no}'" class="fw-bold" style="color: #404040">${data.postCustomerVo.customer_nick }</span>
						<span><i class="bi bi-dot"></i></span> <span
							style="color: #ff6500"
							onclick="doFollow(${data.postCustomerVo.customer_no })"
							id="followBox"> <c:choose>
								<c:when test="${!empty data.followVo}">
							팔로잉
							</c:when>
								<c:otherwise>
							팔로우
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col p-0" style="color: #757575; font-size: 0.8rem">
						<fmt:formatDate value="${data.postVo.post_write_date }"
							pattern="yy.MM.dd" />
					</div>


				</div>
			</div>

			<div class="col-auto text-end pe-3 ps-0 pt-1">
				<button type="button" class="p-0 btn border border-white"
					data-bs-toggle="modal" data-bs-target="#exampleModal">
					<i class="pb-1 fs-2 bi bi-three-dots"></i>
				</button>

			</div>
		</div>

		<div class="row" style="border-bottom: 0.3rem solid #f8f9fa;">
			<div class="col my-1 ms-2" style="color: #757575; font-size: 0.9rem">${data.houseTypeName }&nbsp;&#124;&nbsp;${data.houseStyleName }</div>
		</div>

		<c:forEach items="${data.subPostDataList }" var="subdata">
			<div class="row">
				<div class="col">
					<div class="row my-2">
						<div class="col ms-2" style="color: #757575; font-size: 0.9rem">${subdata.spaceTypeNmae}</div>
					</div>
					<div class="row mb-1">
						<div class="col">
							<img style="max-width: 100%; height: auto;"
								src="/uploadFiles/${subdata.subPostVo.subpost_image_link }">
						</div>
					</div>
					<div class="scroll-container ps-2">
						<c:forEach items="${subdata.subPostProductDataList }"
							var="attachedProduct">
							<div class="productCard p-1">
								<c:if test="${!empty attachedProduct.ProductImage }">
									<img class="img rounded" style="width: 100%; height: 100%"
										src="../resources/img/titleImage/${attachedProduct.ProductImage }">
								</c:if>
							</div>
						</c:forEach>
					</div>
					<div class="row my-2">
						<div style="color: #404040" class="col ms-2">${subdata.subPostVo.subpost_content }</div>
					</div>
					<div class="row row-cols-auto mt-4 mb-2 ms-2 pe-2">
						<c:forEach items="${subdata.subPostHashtagDataList}" var="hashtag">
							<div class="col p-0">
								<p style="color: #ff6500;" class="me-1 mb-0">${hashtag.hashtagVo.hashtag_keyword }</p>
							</div>

						</c:forEach>
					</div>


				</div>
			</div>
		</c:forEach>
		<div class="row ps-2 row-cols-auto"
			style="border-bottom: 0.4rem solid #f8f9fa;">
			<div class="col">
				<span style="color: #757575">조회&nbsp;</span><span class="fw-bold">${data.postVo.post_views }</span>
			</div>
			<div class="col">
				<span style="color: #757575">댓글&nbsp;</span><span id="commentCount2"
					class="fw-bold">${data.postCommentCount }</span>
			</div>
		</div>

		<div class="row mt-2">
			<div class="col ms-2">
				<span class="fw-bold" style="color: #404040">${data.postCustomerVo.customer_nick }</span><span
					style="color: #757575; font-size: 0.8rem">&nbsp;님의 다른 포스트</span>
			</div>
		</div>
		<div class="scroll-container ps-2">
			<c:forEach items="${data.customerSubPostDataList }"
				var="customerSubPostDataList" begin="1" end="7">
				<c:choose>
					<c:when
						test="${customerSubPostDataList.customerSubPostVo.post_no eq data.postVo.post_no }">
					</c:when>
					<c:otherwise>
						<div class="postCard p-1">

							<img style="width: 100%; height: 100%;" class="rounded"
								src="/uploadFiles/${customerSubPostDataList.customerSubPostVo.subpost_image_link }">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${data.size gt 4 }">
			<div class="postCard d-flex justify-content-center"
				style="align-items: center;">
				<i class="bi bi-plus-circle text-center" style="font-size: 2rem"></i>
			</div>
			</c:if>
		</div>
		<div id="commentBox" class="row my-2"
			style="border-top: 0.4rem solid #f8f9fa">
			<div class="col">
				<div class="row">
					<div class="col ms-2 fw-bold">
						<span style="color: #404040">댓글&nbsp;</span><span
							style="color: #404040">${data.postCommentCount }</span>
					</div>
				</div>
				<div class="row">
					<div class="col-2 p-2 ms-2" style="align-self: center;">
						<c:choose>
							<c:when test="${!empty customerInfo.customer_profile_image }">
								<img class="img-fluid rounded-circle"
									src="/uploadFiles/customerIntro${customerInfo.customer_profile_image }">
							</c:when>
							<c:otherwise>
								<img class="img-fluid rounded-circle"
									src="https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col p-2">
						<textarea style="height: 100%; width: 100%" class="form-control"
							id="commentContent"></textarea>
					</div>
					<div class="col-2 p-2 ps-0 text-center" style="align-self: center;">
						<button onclick="writeComment()" class="btn m-0 p-0">등록</button>
					</div>
				</div>
				<c:forEach items="${data.postCommentDataList }"
					var="postCommentDataList">
					<div class="row my-1 commentListBox">
						<div class="col-2 ms-2">
							<c:choose>
								<c:when
									test="${!empty postCommentDataList.commentCustomerVo.customer_profile_image }">
									<img class="img-fluid rounded-circle"
										src="/uploadFiles/customerIntro${postCommentDataList.commentCustomerVo.customer_profile_image }">
								</c:when>
								<c:otherwise>
									<img class="img-fluid rounded-circle"
										src="https://mblogthumb-phinf.pstatic.net/20150202_133/chaejhh_1422874976243x0rSA_JPEG/%3F%3F%3F%A5%E1%3F3_edit.jpg?type=w2">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col p-0">
							<div class="row">
								<div class="col commentNick"
									style="font-size: 0.8rem; font-weight: bold">${postCommentDataList.commentCustomerVo.customer_nick }</div>
							</div>
							<div class="row">
								<div class="col" style="font-size: 0.8rem">${postCommentDataList.postCommentVo.post_comment_content }</div>
							</div>
							<div class="row" style="font-size: 0.7rem">
								<div class="col">
									<span> <fmt:formatDate
											value="${postCommentDataList.postCommentVo.post_comment_write_date }"
											pattern="MM.dd" />
									</span> <span><i class="bi bi-dot"></i></span> <span
										onclick="doCommentLike(${postCommentDataList.postCommentVo.post_comment_no })">
										<c:choose>
											<c:when
												test="${!empty postCommentDataList.postCommentLikeVo }">
												<i class="postHeart bi bi-heart-fill text-danger"></i>
												<span>좋아요</span>
											</c:when>
											<c:otherwise>
												<i class="postHeart bi bi-heart text-danger"></i>
												<span>좋아요</span>
											</c:otherwise>
										</c:choose>
									</span> <span> <i class="bi bi-dot"></i>
									</span> <span
										onclick="writeNestedComment(this,${postCommentDataList.postCommentVo.post_comment_no })">
										답글달기 </span> <span> <i class="bi bi-dot"></i>
									</span> <span> 신고 </span>
									<c:if
										test="${postCommentDataList.postCommentVo.customer_no eq customerInfo.customer_no }">
										<span> <i class="bi bi-dot"></i>
										</span>
										<span
											onclick="deleteComment(${postCommentDataList.postCommentVo.post_comment_no})">삭제</span>
									</c:if>
									<c:if
										test="${postCommentDataList.postCommentVo.customer_no eq customerInfo.customer_no }">
										<span> <i class="bi bi-dot"></i>
										</span>
										<span>수정</span>
									</c:if>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
				<!-- 좋아요부분 수정 -->
		<div class="row border-top">
			<div class="col text-center">
				<c:choose>
					<c:when test="${postLike }">
						<button class="btn " onclick="doPostLike()" style=" border:none">
							<i id="postLikeIcon"class="postHeart bi bi-heart-fill" style="color: #ff6500; font-size:1.3rem;"></i><span class="ms-1" style="font-size: 1.1rem" id="postLikeCount">${postLikeCount}</span>
						</button>
					</c:when>
					<c:otherwise>
						<button class="btn " onclick="doPostLike()" style=" border:none">
							<i id="postLikeIcon" class="postHeart bi bi-heart"style="color:#404040; font-size:1.3rem;" ></i><span class="ms-1"style="font-size: 1.1rem" id="postLikeCount">${postLikeCount }</span>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col text-center">
				<c:choose>
					<c:when test="${!empty postScrapVo }">
						<button class="btn " onclick="doPostScrap()"style="border: none">
							<i id="postScrapIcon" class="bi bi-bookmark-fill"style="color: #ff6500; font-size:1.3rem"></i><span id="postScrapCount"class="ms-1" style="font-size:1.1rem">${postScrapCount }</span>
						</button>
					</c:when>
					<c:otherwise>
						<button class="btn " onclick="doPostScrap()"style="border: none">
							<i id="postScrapIcon" class="bi bi-bookmark" style="color:#404040; font-size:1.3rem"></i><span id="postScrapCount" class="ms-1" style="font-size:1.1rem">${postScrapCount }</span>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col text-center">
				<button class="btn"
					onclick="location.href='postDetailPage?post_no=${data.postVo.post_no}#commentBox'">
					<i class="bi bi-chat-dots" style="color:#404040; font-size:1.3rem"></i><span id="postCommentCount" class="ms-1" style="font-size:1.1rem">${data.postCommentCount }</span>
				</button>
			</div>
			<div class="col text-center" style="align-self:center">
				<i class="bi bi-share" style="color:#404040; font-size:1.3rem;"></i>
			</div>
		</div>
<!-- 좋아요부분 수정 -->
	</div>

	<div class="px-2 modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<c:choose>
					<c:when test="${empty postReport}">
						<div onclick="report(this)"
							class="modal-body text-center border-bottom text-danger">신고하기</div>
					</c:when>
					<c:otherwise>
						<div onclick="report(this)"
							class="modal-body text-center border-bottom text-danger">신고됨</div>
					</c:otherwise>

				</c:choose>

				<c:if
					test="${customerInfo.customer_no eq data.postCustomerVo.customer_no }">
					<div
						onclick="location.href='./postEditPage?post_no=${data.postVo.post_no}'"
						class="modal-body text-center border-bottom">수정하기</div>
				</c:if>
				<c:if
					test="${customerInfo.customer_no eq data.postCustomerVo.customer_no }">
					<div
						onclick="location.href='./postDeleteProcess?post_no=${postNo}'"
						class="modal-body text-center border-bottom">삭제하기</div>
				</c:if>
				<div class="modal-body text-center border-bottom"
					data-bs-dismiss="modal" aria-label="Close">취소</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

