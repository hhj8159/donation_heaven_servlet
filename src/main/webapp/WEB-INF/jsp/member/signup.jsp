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
<link rel='stylesheet' type='text/css'href='${cp}font/font.css'>
</head>
<body>

    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
         <main class="container card w-50 mt-5" style="margin-left: 25%;">
            <div class="mt-3 w-100">
                <div class="row block" id="step1">
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
                <div class="row none" id="step2" >
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
                <div class="w-100 text-center">
                    <p style="font-size: 30px"><span class="font-color bold-text">기부천국</span> 홈페이지 <span class="font-color bold-text" style="color:#FF0000">가입</span>을 환영합니다</p>
                    <p>기부천국은 천사 회원님을 환영합니다</p>
                </div>
                <form name = "frm"class="" method="post" >
                <div>
                    <div class="block" id="onediv">
                    <div class="row ">
                    <label for="name" class="col-2 mt-2"  >이름</label><input type="text" class="col-3 form-control textwidth" id="name" name="name">
                    </div>
                    <div class="row mt-3">
                        <label for="birthday" class="col-2 mt-2">생년월일</label><input type="text" class="form-control col-3 textwidth" id="birthday" name="birthday" placeholder="생년월일 8자리를입력해주세요">
                    </div>
                    <div class="row mt-3 ">
                        <label for="name" class="col-2 mt-2" style="padding: 0px">휴대전화 번호</label><input type="text" class="col-3 form-control" style=" width: 30%;" id="name" name="tel"><button class="btn" style="background-color: #005B48; color: white; width: 10%">인증</button>
                    </div>
                    <div class="row mt-3">
                            <label for="birthday" class="col-2 mt-2">인증번호</label><input type="text" class="form-control col-3 textwidth" id="oknum" name="oknum">
                    </div>
                    <button class="btn mt-3 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" id="nextbtn" >다음 단계</button>
                    </div>
                    
                     <div class="none" id="twodiv">
                    <div class="row ">
                        <label for="" class="col-2 mt-2"  >성별</label>
                        <div class="mt-2 col-3">
                            <input class="form-check-input" type="radio" name="gender" id="radioNoLabel1" value="1" aria-label="...">남성
                            <input class="form-check-input ms-4" type="radio" name="gender" id="radioNoLabel1" value="2" aria-label="..." checked>여성
                        </div>
                    </div>
                    <div class="row mt-3">
                    <label for="name" class="col-2 mt-2">이메일</label>
                    <input type="text" class="form-control textwidth mt-2 " id="email" name="email">
                    </div>
                    <button class="btn mt-3 mb-3" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" id="emailbtn">인증 번호 발송</button>
                    <input type="text" class="form-control  none" id="emailcode" name ="code"placeholder="인증번호" style="margin-left: 31%;width: 20% ;">
                    <button class="btn mt-3 mb-5 none" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" id="emailbtn2">인증 번호 확인</button>
                    
					<div class="none" id="step3div">
                    <div class="row">
                        <label for="name" class="col-2 mt-2"  >아이디</label>
                        <input type="text" class="form-control textwidth mt-2" id="id" name="id">
                    </div>
                    <div class="mt-3 row">
                        <label for="name" class="col-2 mt-2"  >비밀번호</label>
                        <input type="text" class="form-control textwidth mt-2" id="pwd" placeholder="비밀번호" name="pw">
                    </div>
                    <input type="text" class="form-control mt-2 " id="pwdresult" placeholder="비밀번호 확인" style="margin-left: 31%;width: 41%;">
                     <label for="name" class="col-2 mt-3" >주소</label>
                    <div class="mt-3 ">
                        <input type="text" class="form-control " style=" width: 55%;margin-left: 15%;" id="roadAddr" name="addr" placeholder="도로명 검색"><button class="btn mt-3" id="search" style="background-color: #005B48; color: white; width: 15%;margin-left: 15%">주소지 검색</button>
                    </div>
                    <input type="text" class="col-3 form-control textwidth mt-3 mb-3" style="margin-left: 15%" id="name" name = "detailAddr" placeholder="상세주소">
                    <ul class="list-group search-result-wrap mb-3 w-50" style="margin-left: 15%;" >
                    
                    </ul>
                        
                    <button class="btn mt-5 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" >확인</button>
                    </div>
                </div>
                </div>
                </form>
            </div>
        </main>
         <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script>
    $(function(){
    	
    	$("#emailbtn").click(function(){
    		event.preventDefault();
    		const email = $("#email").val();

    	    if (!email) {
    	        alert("이메일을 입력해주세요.");
    	        return;
    	    }

    	    $.ajax({
    	        url: "${cp}sendemail",
    	        type: "POST",
    	        data: { email },
    	        success: function (response) {
    	        	console.log(response);
    	            if (response === "success") {
    	                alert("인증번호가 발송되었습니다 이메일을 확인해주세요.");
    	                $("#emailcode").removeClass("none").addClass("block");
    	                $("#emailbtn2").removeClass("none").addClass("block");
    	            } else {
    	                alert("인증번호 발송에 실패했습니다 다시 시도해주세요.");
    	            }
    	        },
    	        error: function () {
    	            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    	        },
    	    });
    	});
    	
    	$("#emailbtn2").click(function(){
    		event.preventDefault();
    		const emailcode = $("#emailcode").val();
    		const email = $("#email").val();
    	    if (!email) {
    	        alert("이메일을 입력해주세요.");
    	        return;
    	    }else if(!emailcode){
    	        alert("이메일을 입력해주세요.");
    	        return;
    	    }

    	    $.ajax({
    	        url: "${cp}emailselect",
    	        type: "POST",
    	        data: { email: email,
    	        		code: emailcode },
    	        success: function (response) {
    	        	console.log(response);
    	            if (response === "success") {
    	                $("#step3div").removeClass("none").addClass("block");
    	                alert("인증번호가 확인되었습니다");
	    	                $.ajax({
	    	        	        url: "${cp}emaildelete",
	    	        	        type: "POST",
	    	        	        data: { email},
	    	        	        success: function (response) {
	    	        	        	console.log(response);
	    	        	        },
	    	        		});

    	            } else {
    	                alert("인증번호가 틀립니다");
    	            }
    	        },
    	        error: function () {
    	            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    	        },
    		});
    	});
    
    	
    	
    	
    	
        $("#search").click(function(){
            event.preventDefault();
            
        const keyword = $(this).prev().val();
        if(!keyword) {
            return;
        }
        const data = {
            keyword,
            confmKey : 'devU01TX0FVVEgyMDI0MTEwNjE0NTczMjExNTIxNjE=',
            currentPage : 1,
            countPerPage : 100,
            resultType : 'json'
        };
        
        $.ajax({
            url :"https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do",
            type : "get",
            data,
            dataType : "jsonp",
            crossDomain : true,
            success : function(data){
                let arr = data.results.juso;
                console.log(data.results.juso);
                let idx = 0;

                for(let i =0;i < arr.length;i++){
                    let str = `<li class="list-group-item"><a href="#" class="small" id="addr" onclick="return false">\${arr[idx].roadAddr}</a></li>`
                    $('ul.search-result-wrap').append(str);
                    idx++;
                }
            },
            error : function(xhr,msg){
                console.log(msg);
            }
        })
    });
    $("ul.search-result-wrap").on("click","a",function(){
        $("#roadAddr").val($(this).text().trim());
        $("ul.search-result-wrap").closest("ul.search-result-wrap").empty();
    });
    $("#nextbtn").click(function(){
        event.preventDefault();
        $("#onediv").removeClass("block").addClass("none");
        $("#twodiv").removeClass("none").addClass("block");
        $("#step1").removeClass("block").addClass("none");
        $("#step2").removeClass("none").addClass("block");
    })
    
    
    
})
    </script>
</body>
</html>