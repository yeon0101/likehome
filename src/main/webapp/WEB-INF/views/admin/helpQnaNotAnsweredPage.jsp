
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

</head>
<h1>Q&A 게시판</h1>
<select name="selectAnswerState" onchange="location.href=this.value">
	<option value="">--답변여부선택--</option>
	<option value="../main/helpQnaBoardPage">전체보기</option>
	<option value="./helpQnaNotAnsweredPage">미답변</option>
	<option value="./helpQnaAnsweredPage">답변완료</option>
</select>
<body>
	<table class="table table-bordered">
   <thead class="table-dark">
    <tr class="text-center" >
      <th scope="col">no</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">답변여부</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${dataList }" var="data">
  	<c:if test="${data.helpQnaVo.help_qna_answer_content == null }">
    <tr>
      <td>${data.helpQnaVo.help_qna_no }</td>
      <td><a href="../main/helpQnaBoardView?help_qna_no=${data.helpQnaVo.help_qna_no }">${data.helpQnaVo.help_qna_title }</a></td>
      <td>${data.customerVo.customer_nick }</td>
      <td><fmt:formatDate value="${data.helpQnaVo.help_qna_writedate }"/></td>
      <td>
		<span class="badge text-bg-secondary">미답변</span>      	
      </td>
    </tr>
    </c:if>
  </c:forEach>

  </tbody>
</table>
<button onclick="location.href='../main/mainPage'" type="button" class="btn btn-primary" >메인페이지로</button>

<div class="row">
<form action="./helpQnaNotAnsweredPage" method="get">
<div class="col">
<select name="searchType" >
	<option value="title">제목</option>
	<option value="nickname">작성자</option>
</select>
</div>
<div class="row">
<input name="searchWord" type="text" style="float:right">
</div>
<div class="col">
	<button class="btn btn-primary" style="float:right">검색</button>
</div>
</form>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>