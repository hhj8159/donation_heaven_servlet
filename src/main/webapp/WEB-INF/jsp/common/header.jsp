<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="container-fluid">     
            <nav class="navbar bg-white navbar-expand-sm">
                <ul class="navbar-nav container justify-content-start">
                    <li class="mx-3 nav-item"><a href="index.html" class="float-start"><img src="${cp}images/logo.png" alt="로고" class="img-fluid" width="250"></a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="${cp}post/list?category=1"><b class="font-color">공지사항</b></a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="${cp}post/list?category=5"><b class="font-color">자료실</b></a></li>
                    <li class="mx-3 nav-item"><a class="nav-link text-success" href="${cp}post/list?category=4"><b class="font-color">봉사인증</b></a></li>
                    <li class="mx-3 nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-success" href="#" role="button" data-bs-toggle="dropdown"><b class="font-color">커뮤니티</b></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${cp}post/list?category=2">자유게시판</a></li>
                            <li><a class="dropdown-item" href="${cp}post/list?category=3">질문과답변</a></li>
                        </ul>
                    </li>
                    
                    
                </ul>
				<div class="sign" style="margin-top: 50px; color: #005B48;">
                 	 <a href="signin" class="small float-start text-decoration-none" style="color: #005B48;">로그인</a>
                     <a href="#" class="small float-start text-decoration-none vertical mx-3" style="color: #005B48;"><p> | </p></a>
                     <a href="signup.html" class="small float-start text-decoration-none signup" style="margin-right: 20px; color: #005B48;">회원가입</a> 
                </div>
                <a href="donation" class="btn btn-block btn-sm col-1 donation" style="background-color: #005B48; color: white; font-size: 30px; margin-right: 30px; ">후원하기</a>
               
            </nav>
        </header>