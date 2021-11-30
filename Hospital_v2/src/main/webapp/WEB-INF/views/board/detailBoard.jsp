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
    <link href="resources/Style.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/style/detail.css?ver=2">
	
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
						<a href="<c:out value='${contextPath}' />update">회원정보수정</a>
						<a href="<c:out value='${contextPath}' />deletemember" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
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
                      <li><a class="dropdown-item" href="#">김태은</a></li>
                      <li><a class="dropdown-item" href="#">양철욱</a></li>
                      <li><a class="dropdown-item" href="#">옥동호</a></li>                      
                      <li><a class="dropdown-item" href="#">이윤경</a></li>
                      <li><a class="dropdown-item" href="#">이찬영</a></li>   
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">진료시간</a>
                  </li>    
                   <li class="nav-item">
                    <a class="nav-link" href="reservationCheck">진료예약</a>
                  </li>            
                  <li class="nav-item">
                    <a class="nav-link" href="#">찾아오시는 길</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="listboard2">공지사항</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="listboard">Q&A</a>
                  </li>
                   <c:if test="${sessionScope.loginId =='admin' }">
                   <li class="nav-item">
                    <a class="nav-link" href="listAllReservations">환자예약관리</a>
                  </li>
                  </c:if>
                </ul>
              </div>
            </div>
          </nav>
	</div>


<div class="outline">
	<div class="wrapper1">
		<c:if test="${board.boardtype == 'notice'}">
		<h3> 공지사항 </h3>
		안되나
		</c:if>
		<c:if test="${board.boardtype == 'qna'}">
		<h3> Q&A 게시판 </h3>
		</c:if>
		<input type="text" id="boardnum" name="boardnum" value="${board.boardnum}" hidden>
		<input type="text" id="boardtype" name="boardtype" value="qna" hidden>
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
			<tr><td colspan="2" style="border-bottom: none"></td></tr>
			<tr>
				<th style="text-align:left">
					<input type="button" value="글목록" onclick="boardList();">
				</th>
				<th style="text-align:right">
					<!-- 글삭제와 수정은 로그인한 사람과 해당글을 쓴 사람과 같아야 할 수 있다. -->
					<input type="button"  value="글삭제" onclick="boardDelete();">
					<input type="button"  value="글수정" onclick="boardUpdate();">				
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

  <div class="box" id="box_exp2">
          <div id="box_exp2_wrapper">
            <div id="box_exp2_1">
              <img src="resources/img/logoW.png">
            </div>
            <div id="box_exp2_2">
              <ul>
                <li>KITA의원</li>
                <div class="separator"></div>
                <li>사업자등록번호 : 123-45-78901</li>
                <div class="separator"></div>
                <li>대표 : 홍길동</li>
                <br>
                <li>주소 : 서울특별시 강남구 영동대로 511 트레이드 타워</li>
                <div class="separator"></div>
                <li>TEL : 02-1566-5114</li>
              </ul>
            </div>
          </div>
          <div id="box_exp2_3"></div>
        </div>
	
	 <div class="box" id="box_foot">Copyright 2021 KITA의원. All Rightfes Reserved. Design by SCIT 41</div>
        <div class="position-fixed" id="box_side">
          <div class="cell" id="box_side_1" onclick="location.href='https://www.facebook.com/KITA.fb';">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="white" class="bi bi-facebook" viewBox="0 0 16 16">
            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
            </svg>
          </div>
          <div class="cell" id="box_side_2" onclick="location.href='https://twitter.com/kita_net';">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="white" class="bi bi-twitter" viewBox="0 0 16 16">
            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
            </svg>
          </div>
          <div class="cell" id="box_side_3" onclick="location.href='https://www.youtube.com/channel/UCbMa8L3YgYXUc0UY3KUHH7A';">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="white" class="bi bi-youtube" viewBox="0 0 16 16">
            <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
            </svg>       
          </div>
          <div id="box_side_4" onclick="location.href='#';">
            <div id="box_side_4_logo">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="white" class="bi bi-map" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M15.817.113A.5.5 0 0 1 16 .5v14a.5.5 0 0 1-.402.49l-5 1a.502.502 0 0 1-.196 0L5.5 15.01l-4.902.98A.5.5 0 0 1 0 15.5v-14a.5.5 0 0 1 .402-.49l5-1a.5.5 0 0 1 .196 0L10.5.99l4.902-.98a.5.5 0 0 1 .415.103zM10 1.91l-4-.8v12.98l4 .8V1.91zm1 12.98 4-.8V1.11l-4 .8v12.98zm-6-.8V1.11l-4 .8v12.98l4-.8z"/>
              </svg>
            </div>
            <p>오시는 길</p> 
          </div>
          <div id="box_side_5" onclick="location.href='http://pf.kakao.com/_xeLxncj';">
            <div id="box_side_5_logo">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#3A1D1D" class="bi bi-chat-fill" viewBox="0 0 16 16">
              <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
              </svg>
            </div>
            <p>카톡상담</p> 
          </div>
          <div id="box_side_6">
            <p class="user-select-none">02-<br>1566-<br>5114</p>
          </div>
        </div>

</body>
</html>











