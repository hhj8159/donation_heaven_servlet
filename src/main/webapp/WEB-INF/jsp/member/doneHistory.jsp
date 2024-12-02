<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
     <jsp:include page="../common/head.jsp"></jsp:include>
    <style>
    
    	.sidebar-menu {
            color: #005B48;
            font-weight: bold;
            font-size: 18px;
        }
        .sidebar-menu a {
            text-decoration: none;
            color: #005B48;
        }
        .sidebar-menu .active {
            text-decoration: underline;
        }
    
     	.submenu {
            margin-left: 20px;
            font-size: 14px;
            color: #005B48;
        }
        .submenu a {
            text-decoration: none;
            color: #005B48;
        }
        .submenu a:hover {
            text-decoration: underline;
        }
        .main-section {
            margin: 50px auto;
        }
        .sidebar {
            color: #005B48;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .main-heading {
            color: #005B48;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .subheading {
            color: #005B48;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .description {
            color: #333;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .main-btn {
            background-color: #005B48;
            color: white;
            border: 1px solid #005B48;
            font-weight: bold;
        }
        .main-btn:hover {
            background-color: green;
            color: #005B48;
        }
        .font-color {
            color: #005B48;
            font-size: 30px;
        }

        .donation {
            background-color: #005B48;
            color: white;
            font-size: 30px;
            margin-right: 30px;
        }
        .donation:hover {
            color: #005B48;
        }



        .font-angel {
            color: #009273;
        }

        .textwidth {
            width: 80%;
            margin-left: 10%;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .font-size {
            font-size: 13px;
        }

        .loginimg {
            height: 90%;
            margin-left: 13%;
            width: 70%;
		}
        
        
        
        
    </style>
</head>
<body>

<div class="wrap">
     <jsp:include page="../common/header.jsp"></jsp:include>
    <main class="container main mt-5">

        <div class="row">

            <div class="col-3">
                <ul class="list-unstyled sidebar">
                    <li class="mb-3"><a href="${cp}mypage" class="" style="color: #005B48;">마이페이지</a></li>
                </ul>
                 <ul class="list-unstyled sidebar"id="done">                    
                    <li class=""><a href="${cp}donehistory" class=""  style="color: #005B48;">후원관리</a></li>
                     <li class="submenu non ">
                    <a href="${cp}donehistory"  class="text-decoration-underline">- 후원내역</a>
	                </li>
	                <li class="submenu non">
	                    <a href="${cp}monthdone" class="">- 결제방식 조회/변경</a>
	                </li>
	                </ul>
	                 <ul class="list-unstyled sidebar">  
                    <li class="mb-3 mt-3"><a href="${cp}myinfo" class="" style="color: #005B48;">개인 정보</a></li>
					</ul>
            </div>
            

            <div class="col-9">
			    <h2 class="fw-bold" style="color: #005B48;">후원내역</h2>
			    <p class="text-muted">신청하신 후원내역을 확인하세요</p>
			    <hr>
			    <!-- 리스트 컨테이너 -->
			    <ul class="list-unstyled" id="support-list">
			        <c:if test="${not empty done}">
			         
				         <c:forEach items="${done}" var="done">
				           <li class="mb-4">
				                <div class="row">
				                    <div class="col-md-2 fw-bold">금액:</div>
				                    <div class="col-md-10">${done.price}원</div>
				                </div>
				                <div class="row">
				                    <div class="col-md-2 fw-bold">후원일자:</div>
				                    <div class="col-md-10">${done.regdate}</div>
				                </div>
				                <div class="row">
				                    <div class="col-md-2 fw-bold">후원대상:</div>
				                    <div class="col-md-10">${done.name}</div>
				                </div>
				                <div class="row">
				                    <div class="col-md-2 fw-bold">결제타입:</div>
				                    <div class="col-md-10">
				                        <c:choose>
				                            <c:when test="${done.payType == 'card'}">카드</c:when>
				                            <c:otherwise>${done.payType}</c:otherwise>
				                        </c:choose>
				                    </div>
				                </div>
				                <div class="row">
				                    <div class="col-md-2 fw-bold">카드명:</div>
				                    <div class="col-md-10">${done.cardName}</div>
				                </div>
				                <div class="row">
				                    <div class="col-md-2 fw-bold">주소:</div>
				                    <div class="col-md-10">${done.buyerAddr}</div>
				                </div>
				                <hr>
	            		</li>
				         
				         </c:forEach>
			       
			        
			        </c:if>
			        
			        <c:if test="${empty done}">
			       <li class="text-center text-muted" id="no-data-message" style="margin: 50px 0;">
			            후원내역이 없습니다
			        </li>
			        </c:if>

			    </ul>
			    <hr>
			    <!-- 버튼 -->
			    <div class="text-center mt-4">
			        <button class="btn" style="border: 1px solid #005B48; color: #005B48; font-weight: bold; padding: 10px 20px; background-color: white;">
			            후원 신청하기
			        </button>
			    </div>
			</div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
    <script src="${cp}js/alert.js"></script>
	
	<c:if test="${empty member}">
    <script>
	 customAlert.alert("로그인 후 이용 가능합니다","경고!").then(function(){
		 location.href ="signin";
	 });

	 </script>
	 	 </c:if>
    <script>
    
    	$(function(){
    		
    	
    	});
    </script>
</body>
</html>