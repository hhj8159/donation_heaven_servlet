<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <jsp:include page="../common/head.jsp"></jsp:include>
   <style>
    .font-color {color: #005B48; font-size: 30px;}
    .donation {background-color: #005B48; color: white; font-size: 30px; margin-right: 30px; }
        .signup {margin-right: 20px;}
        .sign {margin-top: 50px; color: #005B48;}
        .sign a:link { color: #005B48; }
        .donation:hover { color: #005B48;}
    body{
        font-family: 'MinSans', sans-serif;

    }
    .font-angel {
        color: #009273;
    }
    .textwidth{
        width: 40%;
        
    }
    .dot {
        height: 25px;
        width: 25px;
        background-color: #FB8F7D;
        border-color: #005B48;
        border: 1px solid;
        border-radius: 50%;
        display: inline-block;
    }
    .dot2 {
        height: 25px;
        width: 25px;
        background-color: rgb(0, 91, 72,0.4);
        border-color: #005B48;
        border: 1px solid;
        border-radius: 50%;
        display: inline-block;
    }
    .divwrap{
        margin-left: 25%;
    }
    .circlewrap{
        margin-left: 26%;
    }
    .circlehr{
        margin: 1px;
        padding: 1px;
        margin-bottom: 3px;
    }
    .spanwrap{
        margin-left: 23%;
    }
    label{
        margin-left: 15%;
    }
    .none{
        display: none;
    }
    .block{
        display: block;
    }
</style>
<link rel='stylesheet' type='text/css'href='../font/font.css'>
</head>
<body>

    <div class="wrap">
         <jsp:include page="../common/header.jsp"></jsp:include>
        <main class="container  w-50 mt-5" style="margin-left: 25%;">
            <form action="${cp}signin">
                <img src="${cp}images/logo.png">
                <div class="w-100 text-center mt-5">
                    <p style="font-size: 30px"><span class="font-color bold-text">기부천국</span> 홈페이지 <span class="font-color bold-text" style="color:#FF0000">가입</span>을 축하드립니다.</p>
                </div>
                <button class="btn mt-5 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" >로그인으로 이동합니다</button>
            </form>
        </main>
         <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script>
    </script>
</body>
</html>