<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   <title>로그인</title>
    <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
      body {
      font-family : pretendard;
      color: #404040;
      }
          a{
          text-decoration-line: none;
          color: #404040;
         }
   </style>
   
   <script type="text/javascript">
   
   function doSubmit(){
      
      const form = document.getElementById("formID");
      
      var vendorId = document.getElementById("id");
      var vendorPw = document.getElementById("pw");
      
      var vendorIdInput = vendorId.value;
      var vendorPwInput = vendorPw.value;
      
      var xhr = new XMLHttpRequest();   //AJAX 객체 생성
      
      xhr.onreadystatechange = function(){
         if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText);   //xhr.responseText = 응답 결과 텍스트

            if(jsonObj.id == false){
               alert("아이디가 다릅니다.");
               vendorIdInput.focus();
               return;
            }
            
            if(jsonObj.pw == false){
               alert("비밀번호가 다릅니다.");
               vendorPwInput.focus();
               return;
            }
            
            if(jsonObj.state != "T"){
               alert("판매자 가입이 승인되지 않았습니다.");
               return;
            }
            
            form.submit();
         }
          
      }
      
      xhr.open("get", "../vendor/vendorLoginCheckProcess?vendor_business_number=" + vendorIdInput + "&vendor_pw=" + vendorPwInput);   //리퀘스트 세팅..
      //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");   //post
      xhr.send();   //AJAX로 리퀘스트함...
   }
   
   </script>
   
</head>
<body>

   <div class="container-fluid px-3 mt-3 mb-5">
   
      <!-- 뒤로가기 -->
      <div class="row mb-3">
         <div class="col fs-1">
            <a href="../main/mainPage"><i class="bi bi-arrow-left-square" style="color: #ff6500;"></i></a>
         </div>
      </div>
      
      <div class="row text-center mb-4">
         <h1 style="color: #ff6500;">LIKE HOME</h1><br>
      </div>
      
      <div class="row px-5">

         <div class="col">
            <form id="formID" action="../vendor/vendorLoginProcess" method="post">
               <div class="row mb-1">
	               <div class="btn-group px-0">
					  <a href="../customer/customerLoginPage" class="btn btn-outline"style="border-color: #ff6500; color: #ff6500;" aria-current="page">일반회원</a>
					  <a href="../vendor/vendorLoginPage" class="btn" style="background-color: #ff6500; color: white;">판매자</a>
					</div>
               </div>
               <div class="row mb-2">
                  <div class="input-group flex-nowrap px-0 mb-1">
                       <input id="id" name="vendor_business_number" type="text" class="form-control" placeholder="사업자 번호" aria-label="Username" aria-describedby="addon-wrapping">
                  </div>
                  <div class="input-group flex-nowrap mb-3 px-0">
                       <input id="pw" name="vendor_pw" type="text" class="form-control" placeholder="비밀번호" aria-label="Username" aria-describedby="addon-wrapping">
                  </div>
               </div>
               <div class="row d-grid mb-1">
                  <button onclick="doSubmit()" type="button" class="btn btn-outline" style="border-color: #ff6500; color: #ff6500;">
                  판매자 로그인
                  </button>
                  
               </div>
            </form>
               <div class="row">
                  <div class="col-7 text-end ps-0">
                     <span style="color: #757575;">비밀번호 재설정</span>
                  </div>
                  <div class="col ps-0">
                     <a style="color: #757575;" href="../vendor/vendorRegisterPage">회원가입</a>
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="co text-center ps-0">
                     <span style="font-size: 0.8em;">SNS계정으로 간편 로그인/회원가입</span>
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="col text-center ps-0">
                     <img style="width: 3em; height: 3em;" src="../resources/img/facebook.png">
                     <img style="width: 3em; height: 3em;" src="../resources/img/kakaotalk.png">
                     <img style="width: 3em; height: 3em;" src="../resources/img/naver.png">
                  </div>
               </div>
               
               <div class="row mt-4">
                  <div class="col text-center ps-0">
                     <span style="font-size: 0.8em;">로그인에 문제가 있으신가요?</span>
                  </div>
               </div>
         </div>

      </div>
      
   </div>
   
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>