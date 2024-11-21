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
                        <span class="bold-text">Step 1</span><span style="margin-left: 40%;">Step 2</span>
                    </div>
                    <div class="col-6 circlewrap mt-2">
                        <span class="dot float-start" style="margin: 1px;" ></span><hr class="d-inline-block circlehr" style="width: 87%;"><span class="dot2 float-end" style="margin: 0px;"></span>
                    </div>
                    <div class="spanwrap mt-2">
                        <span class="bold-text">후원정보 확인</span> <span style="margin-left: 34%">홈페이지 ID 만들기</span>
                    </div>
                </div>
                <hr style="width: 80%;margin-left: 10%;">
                <div class="w-100 text-center">
                    <p style="font-size: 30px"><span class="font-color bold-text">기부천국</span> 홈페이지 <span class="font-color bold-text" style="color:#FF0000">가입</span>을 환영합니다</p>
                    <p>기부천국은 천사 회원님을 환영합니다</p>
                </div>
                <form name = "frm"class="mx-auto col-12 col-sm-9 p-2 " method="post" action="${cp}signup2">
                <div >
                    <div class="row ">
                    <label for="name" class="col-2 mt-2"  >이름</label><input type="text" class="col-3 form-control textwidth" id="name">
                    </div>
                    <div class="row mt-3">
                        <label for="birthday" class="col-2 mt-2">생년월일</label><input type="password" class="form-control col-3 textwidth" id="birthday" name="birthday">
                    </div>
                    <div class="row mt-3 ">
                        <label for="name" class="col-2 mt-2" style="padding: 0px">휴대전화 번호</label><input type="text" class="col-3 form-control" style=" width: 30%;" id="name"><button class="btn" style="background-color: #005B48; color: white; width: 10%">인증</button>
                    </div>
                    <div class="row mt-3">
                            <label for="birthday" class="col-2 mt-2">인증번호</label><input type="password" class="form-control col-3 textwidth" id="birthday" name="birthday">
                    </div>
                    <button class="btn mt-3 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" >다음 단계</button>
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