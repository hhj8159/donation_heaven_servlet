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
                     <li class="submenu non d-none">
                    <a href="${cp}donehistory" class="">- 후원내역</a>
	                </li>
	                <li class="submenu non d-none">
	                    <a href="${cp}monthdone" class="">- 결제방식 조회/변경</a>
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
    <form name="form">
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
                    <c:if test="${member.gender eq 1}">
                     <td>남성</td>
                    </c:if>
                    <c:if test="${member.gender eq 2}">
                     <td>여성</td>
                    </c:if>
                   

                </tr>
                <tr>
                    <th  class="fw-bold text-start">생년월일</th>
                    <td>${member.birthday}</td>
                    <td></td>
                </tr>
                <tr>
                    <th class="fw-bold text-start">휴대폰번호</th>
                    <td>${member.tel}</td>
                    <td><button class="btn btn-secondary btn-sm" id="telbtn">변경</button></td>
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
                            <button class="btn btn-secondary btn-sm" id="search">주소지 검색</button>
                        </div>
                        <input type="text" class="form-control form-control-sm mb-2" placeholder="기본주소" value="${member.roadAddr}" id="roadAddrPart1" name="roadAddrPart1">
                        <input type="text" class="form-control form-control-sm" placeholder="상세주소" value="${member.detailAddr}" id="addrDetail" name="addrDetail">
                    </td>
                    <td><button class="btn btn-secondary btn-sm" id="jusoupdate">변경</button></td>
                    <td></td>
                </tr>
               
              
            </tbody>
        </table>
        </form>
        			    <div class="text-center mt-4" id="leavebtn">
			        <button class="btn" style="border: 1px solid #005B48; color: #005B48; font-weight: bold; padding: 10px 20px; background-color: white;">
			            회원탈퇴
			        </button>
			    </div>
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
    		$("#updatepwd").click(function(event){
    			event.preventDefault();
    			location.href="updatePassword";
    		})
    		$("#telbtn").click(function(event){
    			event.preventDefault();
    			customAlert.alert("서비스 준비중입니다.");
    		})
    		$("#done").hover(function () {
    			$(".non").removeClass("d-none");
                $(".non").slideDown();
            }, function () {
                $(".non").slideUp();
            });
    		
    		
    		 $("#search").click(function(){
    	            event.preventDefault();
    	            var pop = window.open("${cp}jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
    	        });
    		
    		$("#leavebtn").click(function(event){
    			event.preventDefault();
    			customConfirm.confirm('정말로 회원탈퇴 하시겠습니까? 이메일과 연관된 동일아이디는 10분뒤에 재가입가능합니다',"경고").then(function() {
        			location.href="leavemember";
    			});

    		});
    		$("#jusoupdate").click(function(event){
    			event.preventDefault();
    			let roadAddr = $("#roadAddrPart1").val();
    			let detailAddr = $("#addrDetail").val();
    			customConfirm.confirm('주소 변경하시겠습니까?',"승인").then(function() {
    				$.ajax({
    	    	        url: "${cp}myinfo/updatejuso",
    	    	        type: "POST",
    	    	        data: { roadAddr:roadAddr,
    	    	        		detailAddr:detailAddr},
    	    	      
    	    	        success: function (response) {
    	    	        	console.log(response);
    	    	            if (response === "success") {
    	    	            	customAlert.alert("주소변경및 저장이되었습니다.");
    	    	            }
    	    	            else {
    	    	            	customAlert.alert("주소변경및 저장이실패했습니다.");
    	    	            }
    	    	        },
    	    	        error: function () {
    	    	        	customAlert.alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    	    	        },
    	    	    })
    			})
    		});
    	});
    	 function jusoCallBack(roadAddrPart1,addrDetail){
     		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

     		document.form.roadAddrPart1.value = roadAddrPart1;

     		document.form.addrDetail.value = addrDetail;
     		
     	}
    </script>
</body>
</html>