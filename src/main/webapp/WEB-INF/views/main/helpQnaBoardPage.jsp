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
<script type="text/javascript">
	
	function isAnswered(value){
			
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
				var aaa = document.getElementById("aaa");
				aaa.innerHTML = "";
				
				for(boardData of result.data){
					console.log(boardData.helpQnaVo.help_qna_title);
					
					var bbb = document.createElement("div");
					bbb.classList.add("row");
					bbb.innerText = boardData.helpQnaVo.help_qna_title; //값 세팅..
					aaa.appendChild(bbb);
					
					var ccc = document.createElement("div");
					ccc.classList.add("row");
					ccc.innerText = boardData.helpQnaVo.help_qna_no; //값 세팅..
					bbb.appendChild(ccc);
				}
			
			}
		}
	
		xhr.open("post" , "./isHelpQnaAnswered"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("value=" + value); //AJAX로 리퀘스트함..
		}

</script>
</head>
<body>
<h1>Q&A 게시판</h1>

<c:if test="${authority == 2 }">
	<select id="qqq" name="selectAnswerState" onchange="isAnswered(this.value)">
		<option value="" selected disabled hidden>--답변여부선택--</option>
		<option id="all" value="all">전체보기</option>
		<option id="notAnswered" value="notAnswered">미답변</option>
		<option id="answered" value="answered">답변완료</option>
	</select>
</c:if>

<c:if test="${authority == 0 }">
	<button onclick="location.href='./helpQnaWritePage'" type="button" class="btn btn-primary" style="float:right">글쓰기</button>
</c:if>


<!--
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
   <tr>
      <td>${data.helpQnaVo.help_qna_no }</td>
      <td><a href="./helpQnaBoardViewPage?help_qna_no=${data.helpQnaVo.help_qna_no }">${data.helpQnaVo.help_qna_title }</a></td>
      <td>${data.customerVo.customer_nick }</td>
      <td><fmt:formatDate value="${data.helpQnaVo.help_qna_writedate }"/></td>
      <td>
      	<c:choose>
      	<c:when test="${data.helpQnaVo.help_qna_answer_content == null }">
			<span class="badge text-bg-secondary">미답변</span>    
		</c:when>  	
		<c:otherwise>
			<span class="badge text-bg-primary">답변완료</span>      	
		</c:otherwise>
		</c:choose>
      </td>
    </tr>
  </c:forEach>

  </tbody>
</table>

<div id="" class="row">
     <div id="" class="col">${data.helpQnaVo.help_qna_no }</div>
     <div id="" class="col"><a href="./helpQnaBoardViewPage?help_qna_no=${data.helpQnaVo.help_qna_no }">${data.helpQnaVo.help_qna_title }</a></div>
     <div id="" class="col">${data.customerVo.customer_nick }</div>
     <div id="" class="col"><fmt:formatDate value="${data.helpQnaVo.help_qna_writedate }"/></div>
</div>
<button onclick="location.href='./mainPage'" type="button" class="btn btn-primary" >메인페이지로</button>
-->

<div id="aaa" class="row">
	<div id="col">에이잭스</div>
</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>