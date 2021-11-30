<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>KITA의원</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link href="resources/Style.css?ver=1" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
<style>
div.container{
	text-align:center;
}
#reservationTable{
	text-align:left;
	margin:auto;
}

</style>
	
	
</head>
<body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <div class="wrapper">
        <div class="box" id="box_head">
            <div id="box_account">
                <c:if test="${sessionScope.loginId==null}">
                	<span class="text-muted" id="account_text"><a href="join">회원가입</a> <a href="login">로그인</a></span>
               	</c:if>
               	<c:if test="${sessionScope.loginId!=null}">
						<span id="account_text">${sessionScope.loginName}님 환영합니다</span>
						<a href="logout">로그아웃</a>
				</c:if>
            </div>
            <div id="box_logo">
                  <a href="${pageContext.request.contextPath}/"><img id="logo" src="resources/img/logo.png"></a>
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
			<div class="container">
						<br>
				<h2>[ 병원 예약 ]</h2>
				<form action="reservation" method="POST">
					<input type="hidden" name="userid" value="${sessionScope.loginId}">
					<table id = reservationTable>
						<tr>
							<td>이름</td>
							<td>
								<input type="text" id="username" name="username" value="${sessionScope.loginName}">
							</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td>
								<input type="date" name="reservation_date"id="datefield" min="2021-07-20" max="2025-10-10" required>
							</td>
						</tr>
						<tr>
							<td>시간</td>
							<td>
								<input type="text" id="time1" name="reservation_time" class="form-control" style="width:200px;">
								<span id="time_input_re"></span>
							</td>
						</tr>			
						
					</table>		
					<br>				
					<!-- <input type="submit" class="btn btn-info" value="예약하기" onclick="return nameCheck();"> -->
					<input type="submit" class="btn btn-info" value="예약하기">
					<br><br>
					<!-- 시간 정해놓기 (9시부터 17시까지) 점심시간은 아직 안됨 -->		
				<script>
				
					
				$(function() {
					
			    $("#time1").timepicker({
			        timeFormat: 'h:mm p',
			        interval: 60,
			        minTime: '9',
			        maxTime: '17',
			        defaultTime: '11',
			        startTime: '9',
			        dynamic: false,
			        dropdown: true,
			        scrollbar: true,
			        change: time1
			    });
			  	  	function time1 () {
						
						//alert('gg');
				
			  	  	var time = $('#time1').val(); //time값이 "time1"인 입력란의 값을 저장
			  	  	var date = $('#datefield').val();
			  		var allData = {reservation_time : time, reservation_date : date}
			  	    $.ajax({
			  	        url:'timeCheck', //Controller에서 인식할 주소
			  	        type:'post', 
			  	        data: allData,
			  	     	dataType : "json",
			  	     	//cache: false,
			  	    	async : false,
			  	        success: function(data) {
			  	        	//alert(data);
			  	        	//console.log("성공 여부" + result);
			  	        	
			  	        	
			  	        		if(data != 1){
			  						$('#time_input_re').css("color", "blue");
			  						$("#time_input_re").text("예약 가능합니다");
			  						
			  					} else {
			  						$("#time_input_re").css("color", "red");
			  						$("#time_input_re").text("예약이 불가능합니다.");	
			  						
			  					}
			  	        	
			  	       		}
				  		
			
			
			  	   		 });
						
						
					};
			   });
					
					
				</script>
					
				</form>
				<!-- 날짜 오늘부터 7일후까지-->			
				<script>
				var today = new Date();
				var today2 = new Date();
				var dd = today.getDate();
				var dd2 = 0;
				var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
				var yyyy = today.getFullYear();
				if(dd<10){
				  dd='0'+dd
				} 
				if(mm<10){
				  mm='0'+mm
				}
				
				today = yyyy+'-'+mm+'-'+dd;
				document.getElementById("datefield").setAttribute("min", today);
				dd2 = Number(dd);
				today2= yyyy+'-'+mm+'-'+(dd2+7);
				document.getElementById("datefield").setAttribute("max", today2);
				</script>
				
					
			
			</div>
       
          <div class="box_icons">
         
        <div class="box" id="box_exp1">
          <div class="cell" id="cell_1">
            <div id="cell_1_1">Q&A</div>
            <div id="cell_1_2">궁금하신것이 있으시다면<br>
            Q&A에서 확인해보세요!</div>
            <p><a class="btn btn-secondary" href="#">지금 확인해보기</a></p>
          </div>
          <div class="cell" id="cell_2">
            <div id="cell_2_1">진료안내</div>
            <div id="cell_2_2">
              <table>
                <tr>
                  <td>평일</td>
                  <td>10:00 ~ 19:00</td>
                </tr>
                <tr>
                  <td>화,목(야간진료)</td>
                  <td>10:00 ~ 20:30</td>
                </tr>
                <tr>
                  <td>점심시간</td>
                  <td>12:30 ~ 14:00</td>
                </tr>
                <tr>
                  <td>토요일</td>
                  <td>09:30 ~ 14:00</td>
                </tr>
                <tr>
                  <td>일요일/공휴일</td>
                  <td>휴진</td>
                </tr>
              </table>
            </div>
          </div>
          <div class="cell" id="cell_3"></div>
          <div class="cell" id="cell_4">
            <div style="max-width:100%;list-style:none; transition: none;overflow:hidden;width:500px;height:300px;"><div id="mymap-display" style="height:100%; width:100%;max-width:100%;"><iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=kita&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8"></iframe></div><a class="googlemaps-html" rel="nofollow" href="https://www.embed-map.com" id="injectmap-data">https://www.embed-map.com</a><style>#mymap-display img{max-width:none!important;background:none!important;font-size: inherit;font-weight:inherit;}</style></div>
          </div>
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
    </div>
</body>
</html>