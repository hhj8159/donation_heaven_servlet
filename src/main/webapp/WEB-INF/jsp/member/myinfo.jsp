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
                    <li class="mb-3"><a href="${cp}mypage" class="" style="color: #005B48;">마이페이지</a></li>
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
                    <li class="mb-3 mt-3"><a href="${cp}myinfo" class="" style="color: #005B48;">개인 정보</a></li>
					</ul>
            </div>
            

    <div class="col-9">
    <h2 class="fw-bold">개인정보 확인</h2>
    <p class="text-muted">회원가입 시 기재한 정보를 확인, 변경할 수 있습니다.</p>
    <hr>
    <h4 class="fw-bold mb-4">기본 정보</h4>
    <div class="">
        <table class="table">
            <tbody>
                <tr>
                    <th class="fw-bold text-start ">아이디</th>
                    <td>${member.id}</td>
                    <td></td>
                </tr>
                <tr>
                    <th class="fw-bold text-start">비밀번호</th>
                    <td>**********</td>
                    <td><button id="updatepwd"class="btn btn-secondary btn-sm">변경</button></td>
                </tr>
                <tr>
                    <th class="fw-bold text-start">이름</th>
                    <td>${member.name}</td>

                </tr>
                <tr>
                    <th class="fw-bold text-start">성별</th>
                    <td>${member.gender}</td>

                </tr>
                <tr>
                    <th  class="fw-bold text-start">생년월일</th>
                    <td>${member.birthday}</td>
                    <td></td>
                </tr>
                <tr>
                    <th class="fw-bold text-start">휴대폰번호</th>
                    <td>${member.tel}</td>
                    <td><button class="btn btn-secondary btn-sm">변경</button></td>
                </tr>
                <tr>
                    <th  class="fw-bold text-start">이메일</th>
                    <td>
                        <div class="d-flex">
                            <input type="text" class="form-control form-control-sm me-2" value="${member.email}">
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th  class="fw-bold text-start">주소</th>
                    <td>
                        <div class="mb-2">
                            <button class="btn btn-secondary btn-sm">주소지 검색</button>
                        </div>
                        <input type="text" class="form-control form-control-sm mb-2" placeholder="기본주소" value="${member.roadAddr}">
                        <input type="text" class="form-control form-control-sm" placeholder="상세주소" value="${member.detailAddr}">
                    </td>
                    <td></td>
                </tr>
               
              
            </tbody>
        </table>
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