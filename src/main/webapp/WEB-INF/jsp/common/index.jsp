<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>   
	<style>
		.slider-wrap {
            width: 1300px;
            margin: 0 auto;
        }
        .slider-wrap img {
            max-width: 100%;
        }
        .font-color {color: #005B48; font-size: 25px;}
        body{
            position: relative;
            font-family: 'MinSans', sans-serif;
        }
        .donation {background-color: #005B48; color: white; font-size: 30px; margin-right: 30px; }
        .signup {margin-right: 20px;}
        .sign {margin-top: 50px; color: #005B48;}
        .sign a:link { color: #005B48; }
        .donation:hover { color: #005B48;}
        .footer {background-color: #005B48; color: white;}
        .notice{
            max-width: 75px;
            overflow: hidden;
            position: fixed;
            right: 20px;
            bottom: 20px;
            border-radius: 111px;
            background-color: white;
            }

        .notice img{
                max-width: initial;
                margin-left: 5px;
                margin-top: 2px;
            }
        .main{
            margin-bottom: 10%;
        }
        .box {
            border: 2px solid black;
            padding: 100px;
            text-align: center;
            }
        .gallery {font-size: 35px; margin-top: 120px;}
        .certifi {color: #005B48;}
        .certifi-img img {text-align: center;}
        .certifi-img a {margin-left: 20px;}
    </style>
    <body>
    <div class="wrap">
    	<jsp:include page="../common/header.jsp" /> 
        <main class="container main">
            <div class="row">
                <div class="col-md-12">
				 <div class="slider-wrap">
			        <div>
			            <img src ="https://bxslider.com/assets/plant-bd76206132f914fc54fd28f9794f7fe346bb8b9a9d16dd5de830b93f365eea9c.jpg">
			            <img src ="https://bxslider.com/assets/daisies-aef04136667e60d9190943f4c6cd605043e67188247ffe928500edfd29b0a158.jpg" >
			            <img src ="https://bxslider.com/assets/succulents-7b5637dbc01af703069905a7991d9e7e7d27c680fa885fe3d6c713c1f77c0f92.jpg">
			        </div>
			     </div>
                    <ul class="box mt-5 container">
	                    <div class="gallery float-start">
                            <b><span>모두의 행복을 더하는 </span> <span class="certifi">봉사 인증</span></b>
	                            
	                                                        
                        </div>
                        <p id="token-result"></p>
                        <p id="token-result"></p>
						<button class="api-btn" onclick="requestUserInfo()" id="api-btn"style="visibility:hidden">사용자 정보 가져오기</button>
                    </ul>
                    </div>
                </div>
                
            </main>
		<jsp:include page="footer.jsp" />
    </div>
    
    
     <script>
        $(".slider-wrap div").bxSlider({mode : 'fade'})
    </script>
    
    
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
  integrity="sha384-DKYJZ8NLiK8MN4/C5P2dtSmLQ4KwPaoqAfyA/DfmEc1VDxu4yyC7wy6K1Hs90nka" crossorigin="anonymous"></script>
    
    <script>
	Kakao.init('9ed87b1f615236eaed4924ab07517929'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
    <script>
    let token = getCookie('authorize-access-token');
    
    $.ajax({
	    type : "POST"
	    , url : 'https://kauth.kakao.com/oauth/token'
	    , data : {
	        grant_type : 'authorization_code',
	        client_id : 'fe85b768c846f2d5b1efcf0cbc590b73',
	        redirect_uri : 'http://localhost:8080/Kakaologin',
	        code : token
	    }
	    , contentType:'application/x-www-form-urlencoded;charset=utf-8'
	    , success : function(response) {
	        Kakao.Auth.setAccessToken(response.access_token);
	        document.querySelector('button.api-btn').style.visibility = 'visible';
	    }
	    ,error : function(jqXHR, error) {
			console.log(";;")
	    }
	});
    
    
	//requestUserInfo();
	function requestUserInfo() {

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
  }


	
	
	
	// 아래는 데모를 위한 UI 코드입니다.
	  displayToken()
/* 	  function displayToken() {
	    var token = getCookie('authorize-access-token');
		console.log(token);
		console.log("aa");
	    


	    if(token) {
		  console.log(Kakao.Auth.setAccessToken(token));
	      Kakao.Auth.setAccessToken(token);

	      
	      document.querySelector('#token-result').innerText = 'login success, ready to request API';
	      document.querySelector('#api-btn').style.visibility = 'visible';
	    }
	  } */
	
	  function displayToken() {
		    var token = getCookie('authorize-access-token');
		    console.log(token);


		    if(token) {

		      Kakao.Auth.setAccessToken(token);
				console.log(Kakao.Auth.getStatusInfo());
		      Kakao.Auth.getStatusInfo()
		        .then(function(res) {
		        	console.log(res);
		        	
		          if (res.status === 'connected') {
		            document.getElementById('token-result').innerText
		              = 'login success, token: ' + Kakao.Auth.getAccessToken();
		          }
		        })
		        .catch(function(err) {
		        	console.log(err);
		          Kakao.Auth.setAccessToken(null);
		        });
		    }
		  }
	
	  


	  function getCookie(name) {
	    var parts = document.cookie.split(name + '=');
	    if (parts.length === 2) { return parts[1].split(';')[0]; }
	  }
    </script>
    
</body>
</html>