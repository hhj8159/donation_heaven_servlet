<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <li class="mb-3"><a href="#" class="" style="color: #005B48;">마이페이지</a></li>
                </ul>
                 <ul class="list-unstyled sidebar"id="done">                    
                    <li class=""><a href="#" class=""  style="color: #005B48;">후원관리</a></li>
                     <li class="submenu non d-none">
                    <a href="#" class="">- 후원내역</a>
	                </li>
	                <li class="submenu non d-none">
	                    <a href="#" class="">- 결제방식 조회/변경</a>
	                </li>
	                </ul>
	                 <ul class="list-unstyled sidebar">  
                    <li class="mb-3 mt-3"><a href="#" class="" style="color: #005B48;">개인 정보</a></li>
					</ul>
            </div>
            

            <div class="col-9">
                <h2 class="main-heading">${member.name}님 반갑습니다.</h2>
                <hr>
                <div class="row">

                    <div class="col-4">
                        <img src="${cp}images/login.png" class="">
                    </div>

                    <div class="col-8">
                        <h4 class="subheading">나눔이 주는 <span style="color: #009273;">기쁨과 행복</span>을 누리세요</h4>
                        <p class="description">기부천국과 함께 라면 나눔은 즐거운 일이 됩니다.</p>
                        <!-- Buttons -->
                       
                    </div>
                     <div class="d-flex gap-3 mt-5">
                            <button class="btn main-btn px-4">후원하기</button>
                           <!--  <button class="btn main-btn px-4">통합 회원가입</button> -->
                      </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</div>
    <script>
    	$(function(){
    		
    		$("#done").hover(function () {
    			$(".non").removeClass("d-none");
                $(".non").slideDown();
            }, function () {
                $(".non").slideUp();
            });
    	});
    </script>
</body>
</html>