<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>

<body>

    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
        <main class="container">
            <div class="card mt-5 w-75" style="margin-left: 15%;">
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

                            <button class="btn btn-primary mb-5 " style="margin-left: 10%;">카카오 로그인</button>
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
    </script>
</body>

</html>