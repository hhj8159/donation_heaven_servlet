<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <style>
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

        .signup {
            margin-right: 20px;
        }

        .sign {
            margin-top: 50px;
            color: #005B48;
        }

        .sign a:link {
            color: #005B48;
        }

        .donation:hover {
            color: #005B48;
        }

        body {
            font-family: 'MinSans', sans-serif;

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
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
  integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>

</head>

<body>

    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <main class="container">
            <div class="card mt-5 w-75 mb-5" style="margin-left: 15%;">
                <div class="text-center mt-5">
                    <p class="font-color bold-text"><span class="font-angel">천사 </span> 회원님, 반갑습니다</p>
                    <p>홈페이지 로그인을 통해, 나의 후원 정보 및 결연아동의 소식,</p>
                    <p>후원 중인 사업 내용, 회원 전용 커뮤니티 등 다양한 서비스를 이용해 보세요.</p>
                </div>

                <form name="frm" class="mx-auto col-12 col-sm-9 p-2 " method="post">
                    <div class="row mb-5">
                        <div class="col-7">
                            <input type="text" class=" form-control textwidth" id="id" placeholder="아이디" name="id">
                            <input type="password" class="form-control my-3 textwidth" id="pwd" placeholder="비밀번호"
                                name="pw">
                            <button class=" btn textwidth" style="background-color: #005B48; color: white;">로그인</button>
                            <div class=" form-check form-switch my-3">
                                <input class="form-check-input " style="margin-left: 1%" type="checkbox" id="mySwitch"
                                    name="remember-id" value="yes">
                                <label class="form-check-label font-size" style="margin-left: 2%" for="mySwitch">아이디
                                    저장</label>
                                <a href="#" class="font-size" style="margin-left: 8%;">아이디</a> <span
                                    class="font-size mx-1"> / </span> <a href="#"
                                    class="font-size"><span>비밀번호찾기</span></a><span class="font-size mx-1"> | </span><a
                                    href="${cp}signup"><span class="font-size">회원가입</span></a>
                            </div>
							<div class="textwidth">
                            <a id="kakao-login-btn" href="javascript:loginWithKakao()" class="text-center">
							  <img src="${cp}images/kakao_login_medium_narrow.png" width="222"
							    alt="카카오 로그인 버튼" />
							</a>
							<p id="token-result"></p>
							<button class="api-btn" onclick="requestUserInfo()" style="visibility: hidden" >사용자 정보 가져오기</button>
							</div>
                        </div>
                        <div class="col-5">
                        
                            <img src="${cp}images/login.png" class="loginimg">
                        </div>
                    </div>


                </form>
            </div>
        </main>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>

    <script>
    Kakao.init('0099f520165f3cbda94c9f9c80092492'); // 사용하려는 앱의 JavaScript 키 입력
    console.log( Kakao.isInitialized() ); 
    <c:if test="${param.error == 'faild'}">
	alert("아이디 혹은 비밀번호가 잘못되었습니다.");
	</c:if>
	function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://localhost:8080/donation_heaven/index',
	    });
	  }

	  // 아래는 데모를 위한 UI 코드입니다.
	  displayToken()
	  function displayToken() {
	    var token = getCookie('authorize-access-token');

	    if(token) {
	      Kakao.Auth.setAccessToken(token);
	      Kakao.Auth.getStatusInfo()
	        .then(function(res) {
	          if (res.status === 'connected') {
	            document.getElementById('token-result').innerText
	              = 'login success, token: ' + Kakao.Auth.getAccessToken();
	          }
	        })
	        .catch(function(err) {
	          Kakao.Auth.setAccessToken(null);
	        });
	    }
	  }

	  function getCookie(name) {
	    var parts = document.cookie.split(name + '=');
	    if (parts.length === 2) { return parts[1].split(';')[0]; }
	  }
	  
	  
	  

/* 	  function requestUserInfo() {
		  event.preventDefault();
		    Kakao.API.request({
		    	url: '/v2/user/me',
		    	success: function (res) {
	                  console.log(res);
	                  // 이메일, 성별, 닉네임, 프로필이미지
	                  var email = res.kakao_account.email;
	                  var gender = res.kakao_account.gender;
	                  var profile_nickname = res.kakao_account.profile.nickname;
	                  var profile_image = res.kakao_account.profile.thumbnail_image_url;
	                  var birthday = res.kakao_account.birthday;

	                  console.log(email, gender, profile_nickname, profile_image, birthday);
	              },
	              fail: function (error) {
	                  alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
	              }
		      });
		  } */
		  
		  
/* 		  $.ajax({
			    type : "POST"
			    , url : 'https://kauth.kakao.com/oauth/token'
			    , data : {
			        grant_type : 'authorization_code',
			        client_id : '0099f520165f3cbda94c9f9c80092492',
			        redirect_uri : 'http://localhost:8080/donation_heaven/signin',
			        code : kakaoCode
			    }
			    , contentType:'application/x-www-form-urlencoded;charset=utf-8'
			    , dataType: null
			    , success : function(response) {
			        Kakao.Auth.setAccessToken(response.access_token);
			        document.querySelector('button.api-btn').style.visibility = 'visible';
			    }
			    ,error : function(jqXHR, error) {

			    }
			}); */
		  
/* 		  function requestUserInfo() {
			  event.preventDefault();
			  Kakao.API.request({
				  url: '/v2/user/me',
				})
				  .then(function(response) {
				    console.log(response);
				  })
				  .catch(function(error) {
				    console.log(error);
				  });
			  } */
		  
    </script>
</body>

</html>