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
        width: 70%;
        margin-left: 15%;
    }
    .dot {
        height: 25px;
        width: 25px;
        background-color: rgb(0, 91, 72,0.4);
        border-color: #005B48;
        border: 1px solid;
        border-radius: 50%;
        display: inline-block;
    }
    .dot2 {
        height: 25px;
        width: 25px;
        background-color: #FB8F7D;

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
</style>
<link rel='stylesheet' type='text/css'href='../font/font.css'>
</head>
<body>

    <div class="wrap">
         <jsp:include page="../common/header.jsp"></jsp:include>
        <main class="container card w-50 mt-5" style="margin-left: 25%;">
            <div class="mt-3 w-100">
                <div class="row" >
                    <div class="divwrap" >
                        <span class="">Step 1</span><span class="bold-text" style="margin-left: 40%;">Step 2</span>
                    </div>
                    <div class="col-6 circlewrap mt-2">
                        <span class="dot float-start" style="margin: 1px;" ></span><hr class="d-inline-block circlehr" style="width: 87%;"><span class="dot2 float-end" style="margin: 0px;"></span>
                    </div>
                    <div class="spanwrap mt-2">
                        <span class="">후원정보 확인</span> <span class="bold-text" style="margin-left: 34%">홈페이지 ID 만들기</span>
                    </div>
                </div>
                <hr style="width: 80%;margin-left: 10%;">

                <form name = "frm"class="mx-auto col-12 col-sm-9 p-2 " method="post">
                <div class="" >
                    <div style="margin-left: 15%;" class="mt-3">
                        성별<br>
                        <div class="mt-2">
                            <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1" value="male" aria-label="...">남성
                            <input class="form-check-input ms-4" type="radio" name="radioNoLabel" id="radioNoLabel1" value="female" aria-label="..." checked>여성
                        </div>
                    </div>
                    <div class="mt-3">
                    <label for="name" class="mt-2"  >이메일</label>
                    <input type="text" class="form-control textwidth mt-2" id="email">
                    <button class="btn mt-3 mb-2 textwidth" style="background-color: #005B48; color: white; width: 20%;" >인증번호 발송</button>
                    <input type="text" class="form-control textwidth" id="email" placeholder="인증번호" style="display: none;">
                    </div>
                    <div class="mt-3">
                        <label for="name" class="mt-2"  >아이디</label>
                        <input type="text" class="form-control textwidth mt-2" id="id">
                    </div>
                    <div class="mt-3">
                        <label for="name" class="mt-2"  >비밀번호</label>
                        <input type="text" class="form-control textwidth mt-2" id="pwd" placeholder="비밀번호">
                        <input type="text" class="form-control textwidth mt-3" id="pwdresult" placeholder="비밀번호 확인">
                    </div>
                        
                    <button class="btn mt-5 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" >확인</button>
                </div>
                </form>
            </div>
        </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script>
/*     if($.cookie("save")){
    	$("#id").val($.cookie("save"));
    	$("#mySwitch").prop("checked",true);
    } */
    </script>
</body>
</html>