<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>qna</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/style/detail.css?ver=2">
    <link href="resources/Style.css" rel="stylesheet">
	
<style>
	
</style>
<script src="resources/script/jquery-3.6.0.min.js"></script>
<script src="resources/script/replyScript.js?ver=1"></script>

<script>
function logout(){
	if('${sessionScope.loginId}' == null){
		alert("로그인해주세요");
		return;
	}
	else{
		if(confirm("로그아웃 하시겠습니까")){
			let targetPlace = "logout";
			location.href = targetPlace;
			alert("로그아웃 되었습니다.")
		}
		else{
			return;
		}
	}	
}

function boardList() {
	let targetPlace = "listboard";
	location.href = targetPlace;
}
function boardDelete() {
	let boardnum = '${board.boardnum}';
	let userid = '${board.userid}';
	let loginId = $("#userid").val();
	if(userid == loginId){
		let answer = confirm('게시글을 삭제하시겠습니까?');
		
		if(answer) {
			location.href="deleteboard?boardnum=" + boardnum;
		}
	}
	else{
		alert("삭제 권한이 없습니다.");
	}
	
}
function boardUpdate() {
	let boardnum = '${board.boardnum}';
	let userid = '${board.userid}';
	let loginId = $("#userid").val();
	if(userid == loginId){
		location.href="updateboard?boardnum=" + boardnum;
	}
	else {
		alert("수정 권한이 없습니다.");
	}	
}
</script>
</head>
<body>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <div class="wrapper">
        <div class="box" id="box_head">
            <div id="box_account">
                <c:if test="${sessionScope.loginId==null}">
                	<span class="text-muted" id="account_text"><a href="#">회원가입</a> <a href="login">로그인</a></span>
               	</c:if>
               	<c:if test="${sessionScope.loginId!=null}">
						<span id="account_text">${sessionScope.loginName}님 환영합니다</span>
						<a href="logout">로그아웃</a>
				</c:if>
            </div>
            <div id="box_logo">
               <a href="${pageContext.request.contextPath}/"><img id="logo" src="resources/img/logo.png"></a>
                <!-- <img id="logo" src="resources/img/logo.png"> -->
            </div>
            
        </div>
        <nav class="navbar sticky-top navbar-expand-lg navbar-light bg-white" aria-label="Tenth navbar example" style="border-top:1px solid rgb(240, 240, 240)">
            <div class="container-fluid">
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
        
              <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link" href="#">병원소개</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">인사말</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown08" data-bs-toggle="dropdown" aria-expanded="false">의료진 소개</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown08">
                      <li><a class="dropdown-item" href="#">양철욱</a></li>
                      <li><a class="dropdown-item" href="#">옥동호</a></li>
                      <li><a class="dropdown-item" href="#">장혁진</a></li>
                      <li><a class="dropdown-item" href="#">정인호</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">진료시간</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">예약</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">찾아오시는 길</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">공지사항</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="listboard">Q&A</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
	</div>


<div class="outline">
	<div class="wrapper1">
		
		<h3> Q&A 게시판 </h3>
		<input type="text" id="boardnum" name="boardnum" value="${board.boardnum}" hidden>
		<table id="contentstable">
			<tr>
				<td colspan="2" style="font-weight : bolder">${board.title}</td>
			</tr>
			<tr>				
				<td style="width : 10%">${board.userid}</td>
				<td>${board.regdate}</td>
			</tr>						
			<tr>
				<td colspan="2">
					<pre>${board.text}</pre>
				</td>
			</tr>
			<tr>
				<td >첨부파일</td>
				<td>
					<c:if test="${board.originalfile != null}">
						<a href="download?boardnum=${board.boardnum}">${board.originalfile}</a>
					</c:if>
				</td>				
			</tr>
			<tr><td colspan="2" style="border-bottom: none"></tr>
			<tr>
				<th class="btn" style="text-align:left">
					<input type="button" value="글목록" onclick="boardList();">
				</th>
				<th class="btn" style="text-align:right;">
					<!-- 글삭제와 수정은 로그인한 사람과 해당글을 쓴 사람과 같아야 할 수 있다. -->
					<input type="button" value="글삭제" onclick="boardDelete();">
					<input type="button" value="글수정" onclick="boardUpdate();">				
				</th>
			</tr>
		</table>	
		<br>
		<!-- 댓글 입력 : 로그인한 사람만 보여야 함  -->
		<c:if test="${sessionScope.loginId != null }">
			<form action="" method="POST">
				<table id="replyInput" class="reply">
					<tr>
						<td>
							<input type="text" id="userid" name="userid" value="${sessionScope.loginId}" readonly style="background-color: #f7f7f7; width:150px">			
							<input id="replytext"    type="text" name="replytext">
							<input id="insert0" type="button" value="댓글 저장">
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		<br>
		<div id="replyTarget">
		</div>
		
		<!-- 댓글 출력 -->
	</div>
	<br><br>
	
</div>

</body>
</html>











