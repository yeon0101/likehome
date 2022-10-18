<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
	#btn{
	  background-color: #ff6500;
	  color:white;
	  border-radius: 20px;
	}
	
	#row{
	  margin-left: 1em;
	  margin-right: 1em;	
	}
</style>
</head>
<body>
	

<div class="container-fluid my-4">
	<div class="row" style="text-align: center;">
		<h3>쿠폰생성</h3>
	</div>
	<form action="./writeCouponProcess" method="post">		 
		<div class="mb-3">
  			<label for="formGroupExampleInput" class="form-label">쿠폰이름</label>
  			<input type="text" name="coupon_name" class="form-control" placeholder="쿠폰이름을 입력하세요.">
		</div>
	   <div class="mb-3">
  			<label for="formGroupExampleInput2" class="form-label">쿠폰금액</label>
  			<input type="text" name="coupon_amount" class="form-control" placeholder="할인금액을 입력하세요.">
		</div>
	   <div class="mb-3">
  			<label for="formGroupExampleInput2" class="form-label">쿠폰날짜</label>
  			<input type="date" name="coupon_end_date" class="form-control">
		</div>
	  <div class="row d-grid" id="row">
 			<button id="btn" type="submit" class="btn">등록</button>
 		</div>
 	</form>
</div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	 												
</body>
</html>