<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp"></jsp:include>   
	<style>
		.slider-wrap {
            margin: 0 auto;
        }
        .slider-wrap img {
            max-width: 100%;
           
        }
        .font-color {color: #005B48; font-size: 30px;}
        
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
        
        
        .gallery-section {
        padding: 30px 0;
        background-color: #f9f9f9;
        border-radius: 10px;
    }

    .gallery {
        font-size: 35px;
        color: #005B48;
    }

    .card {
        border: none;
        border-radius: 10px;
        overflow: hidden;
    }

    .card-img {
        border-radius: 10px 10px 0 0;
    }

    .card-title {
        font-size: 20px;
        font-weight: bold;
        color: #005B48;
    }

    .card-text {
        font-size: 14px;
        color: #666;
    }

    .detailbtn {
        color: #005B48;
        border-color: #005B48;
        transition: all 0.3s ease;
    }

    .detailbtn:hover {
        background-color: #005B48;
        color: white;
    }
    .slider-wrap div img{
    	height : 600px;
    }
        
        
    </style>
    <body>
    <div class="wrap">
    	<jsp:include page="../common/header.jsp" /> 
        <main class="container main">
		    <div class="row">
		        <div class="col-md-12">
		            <div class="slider-wrap" >
		                <div >
		                    <img src="${cp}images/vl.jpg">
		                    <img src="${cp}images/girl.jpg">
		                    <img src="${cp}images/ddd.jpg">
		                </div>
		            </div>
		        </div>
		    </div>

		    <section class="gallery-section">
		        <h2 class="text-center gallery m-5"><b>모두의 행복을 더하는 <span>봉사 인증</span></b><br></h2>
		        <div class="row mt-2">
					
					<c:forEach items="${posts}" var="p">
						<c:forEach items="${p.attachs}" begin="0" end="0" var="a">
							<div class="col-md-4 mb-4 ">
				                <div class="card shadow-sm" >
				                    <div style="height:300px; overflow: hidden;">
					                    <c:if test="${!a.image}">
			                    		<c:set var="src" value="https://placehold.co/300x300?text=cannot%20find\nimage%20data"/>
			                    		</c:if>
			                    		<c:if test="${a.image}">
			                    		<c:set var="src" value="${cp}display?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}"/>
			                    		</c:if>
					                    
					                    <div style="height:300px; background: no-repeat center url('${src}'); background-size:cover;" ></div>
					                   
		                   			</div>
				                    <div class="card-body">
				                        <h5 class="card-title text-truncate" >${p.title}</h5>
				                        <p class="card-text text-truncate">${p.content} </p>
				                        <a href="${cp}post/view?pno=${p.pno}&${pageDto.cri.qs2}" class="btn detailbtn">자세히 보기</a>
				                    </div>
				                </div>
				            </div>
					    		          			
		              	</c:forEach>
					
					</c:forEach>
		        </div>
		    </section>
		</main>
    </div>
	<jsp:include page="footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
    <script>
     $(document).ready(function(){
        $(".slider-wrap div").bxSlider({mode : 'fade',
            speed: 500,        // 이동 속도를 설정
            pager: false,      // 현재 위치 페이징 표시 여부 설정
            moveSlides: 1,     // 슬라이드 이동시 개수

            slideHight: 100,
            slideMargin: 5,    // 슬라이드간의 간격
            auto: true,        // 자동 실행 여부
            autoHover: true,   // 마우스 호버시 정지 여부
            controls: true    // 이전 다음 버튼 노출 여부
    })
     });
    </script>
    
    
    <!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.4/kakao.min.js"
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
    </script> -->
    
</body>
</html>