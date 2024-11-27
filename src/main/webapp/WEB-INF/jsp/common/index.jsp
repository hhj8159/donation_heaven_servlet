<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Donation Heaven</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">

   <!-- bootstrap  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- jquery -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- bxslider -->
   <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
   <!-- font-awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" /></head>


    <style>

    </style>
        <link rel='stylesheet' type='text/css'href='./font/font.css'>
   <body>
    <div class="wrap">
    	<jsp:include page="../common/header.jsp" /> 

        <main class="container main">
            <div class="row">
                <div class="col-md-12">
                    <ul class="box mt-5">
                        <h1>이미지 슬라이드 구간</h1>
                        <p id="token-result"></p>
                        <p id="token-result"></p>
                        
							<button class="api-btn" onclick="requestUserInfo()" id="api-btn"style="visibility:hidden">사용자 정보 가져오기</button>
                    </ul>
                    <div class="gallery">
                            <b>
                                <span>아이들의 행복을 더하는 </span>
                                <span class="certifi">봉사 인증</span>
                            </b>
                            <br>
                            <br>
                        </div>
                        <div class="certifi-img">
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                        </div>
                    </div>
                </div>
                
                
            <div class="dona-slide">
                <a href="#" class="float-start"><img src="img/logo.png" alt="알림로고" class="img-fluid" width="250"></a>
            </div>

            </main>
		<jsp:include page="footer.jsp" />
    </div>
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