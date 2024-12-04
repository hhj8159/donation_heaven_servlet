<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="../common/head.jsp"></jsp:include>
      <link rel='stylesheet' type='text/css'href='${cp}css/alert.css'>
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
                        <span class="bold-text">Step 1</span><span style="margin-left: 35%;">Step 2</span>
                    </div>
                    <div class="col-6 circlewrap mt-2">
                        <span class="dot float-start" style="margin: 1px;" ></span><hr class="d-inline-block circlehr" style="width: 80%;"><span class="dot2 float-end" style="margin: 0px;"></span>
                    </div>
                    <div class="spanwrap mt-2">
                        <span class="bold-text">후원정보 확인</span> <span style="margin-left: 25%">홈페이지 ID 만들기</span>
                    </div>
                </div>
                <div class="row none" id="step2" >
                    <div class="divwrap" >
                        <span class="">Step 1</span><span class="bold-text" style="margin-left: 35%;">Step 2</span>
                    </div>
                    <div class="col-6 circlewrap mt-2">
                        <span class="dot float-start" style="margin: 1px;" ></span><hr class="d-inline-block circlehr" style="width: 80%;"><span class="dot2 float-end" style="margin: 0px;"></span>
                    </div>
                    <div class="spanwrap mt-2">
                        <span class="">후원정보 확인</span> <span class="bold-text" style="margin-left: 25%">홈페이지 ID 만들기</span>
                    </div>
                </div>
                <hr style="width: 80%;margin-left: 10%;">
                <div class="w-100 text-center">
                    <p style="font-size: 30px"><span class="font-color bold-text">기부천국</span> 홈페이지 <span class="font-color bold-text" style="color:#FF0000">가입</span>을 환영합니다</p>
                    <p>기부천국은 천사 회원님을 환영합니다</p>
                </div>
                <form name="form" id="form"class="" method="post" >
                <div>
                    <div class="block" id="onediv">
                    <div class="row ">
                    <label for="name" class="col-2 mt-2"  >이름</label><input type="text" class="col-3 form-control textwidth" id="name" name="name">
                    </div>
                    <div class="row mt-3">
                        <label for="birthday" class="col-2 mt-2">생년월일</label><input type="text" class="form-control col-3 textwidth" id="birthday" name="birthday" placeholder="생년월일 8자리를입력해주세요">
                    </div>
                    <div class="row mt-3 ">
                        <label for="tel" class="col-2 mt-2" style="padding: 0px">휴대전화 번호</label><input type="text" class="col-3 form-control" style=" width: 30%;" id="tel" name="tel"><button class="btn" style="background-color: #005B48; color: white; width: 10%" id="telresult">인증</button>
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
                    <label for="email" class="col-2 mt-2">이메일</label>
                    <input type="text" class="form-control textwidth mt-2 " id="email" name="email">
                    </div>
                    <button class="btn mt-3 mb-3 d-inline-block" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" id="emailbtn">인증 번호 발송</button><img src="${cp}images/8puiO.gif" id="lodingimg" class="ms-3 none"style="width:30px;height:30px;">
                 
                    <div class="row mt-2 mb-5">
		            <input type="text" class="form-control  none" id="emailcode" name ="code"placeholder="인증번호" style="margin-left: 31%;width: 20% ;">
		            <button class="btn col-2  none" style="background-color: #005B48; color: white; margin-left: 3%;" id="emailbtn2">인증 번호 확인</button>
		            </div>   
                    
					<div class="none" id="step3div">
                    <div class="row">
                        <label for="id" class="col-2 mt-2"  >아이디</label>
                        <input type="text" class="form-control mt-2" style="width:25%"id="id" name="id"><button class="btn mt-2" id="duplie" style="background-color: #005B48; color: white; width: 15%; height:38px;">중복 확인</button>
                    </div>
                    
                    
                    
                         <div class="col-5 mt-2" style="margin-left: 31%" id="succesId">
					        <div class="alert fade alert-simple alert-success alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">
					          <i class="start-icon far fa-check-circle faa-tada animated"></i>
					          <strong class="font__weight-semibold">사용가능한 아이디입니다!</strong>
					        </div>
      					</div>
      					
      					
      					
      					<div class="col-5 mt-2" style="margin-left: 31%" id="failId">
				        <div class="alert fade alert-simple alert-danger alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert" >
				          <i class="start-icon far fa-times-circle faa-pulse animated"></i>
				          <strong class="font__weight-semibold">사용이 불가능한 아이디입니다</strong>
				        </div>
     					 </div>
     					 
     					 
     					 <div class="col-5 mt-2" style="margin-left: 31%" id="duplieId">
				        <div class="alert fade alert-simple alert-danger alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert" >
				          <i class="start-icon far fa-times-circle faa-pulse animated"></i>
				          <strong class="font__weight-semibold">회원탈퇴시점 10분이후<br> 재가입가능합니다</strong>
				        </div>
     					 </div>
                    
                    
                    
                    
                    
                    <div class="mt-3 row">
                        <label for="pw" class="col-2 mt-2"  >비밀번호</label>
                        <input type="password" class="form-control textwidth mt-2" id="pwd" placeholder="비밀번호" name="pw">
                    </div>
                    <input type="password" class="form-control mt-2 " id="pwdresult" placeholder="비밀번호 확인" style="margin-left: 31%;width: 41%;">
                    
                    <div class="col-5 mt-2" style="margin-left: 31%" id="succesPwd">
					        <div class="alert fade alert-simple alert-success alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">
					          <i class="start-icon far fa-check-circle faa-tada animated"></i>
					          <strong class="font__weight-semibold">비밀번호가 일치합니다.</strong>
					        </div>
      					</div>
      					
      					
      					
      					<div class="col-5 mt-2" style="margin-left: 31%" id="failPwd">
				        <div class="alert fade alert-simple alert-danger alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert" >
				          <i class="start-icon far fa-times-circle faa-pulse animated"></i>
				          <strong class="font__weight-semibold">비밀번호가 일치하지않습니다.</strong>
				        </div>
     					 </div>
                    
                    
                    
                    
                    <div class="mt-3 row">
                     <label for="" class="col-2 mt-3" >주소</label>
                    <button class="btn mb-3 mt-2" id="search" style="background-color: #005B48; color: white; width: 17%;">주소지 검색</button>
                        
                    </div>
                    <div>
                    <input type="text" class="form-control " style=" width: 55%;margin-left: 31%;" id="roadAddrPart1" name="roadAddrPart1" placeholder="도로명 주소" readonly>
                    <input type="text" class="col-3 form-control textwidth mt-3 mb-3" style="margin-left: 31%" id="addrDetail" name = "addrDetail" placeholder="상세주소" readonly>
                    </div>
                        
                    <button class="btn mt-5 mb-5" style="background-color: #005B48; color: white; width: 40%;margin-left: 31%;" id="signupbtn" >확인</button>
                    </div>
                </div>
                </div>
                </form>
            </div>

        </main>
         <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script src="${cp}js/alert.js"></script>
    <script>
    $(function(){
    	let token = false;
    	let pwdresult =false;
    	$("#failPwd").slideUp();
        $("#succesPwd").slideUp();
        $("#duplieId").slideUp();
      	$("#failId").slideUp();
        $("#succesId").slideUp();
    	
        $("#telresult").on("click",function(e){
        	e.preventDefault();
        	customAlert.alert("서비스준비중입니다.");
        })
        
        $('#pwdresult').keyup(function () {
        	let pwdresultVal = $("#pwdresult").val();
        	let pwd = $("#pwd").val();
        	if(pwdresultVal == pwd && pwd != "" && pwdresultVal != ""){
                $("#succesPwd").slideDown(350);
                $("#failPwd").slideUp(150);
                pwdresult = true;
        	}else{
            	$("#failPwd").slideDown(350);
                $("#succesPwd").slideUp(150);
                pwdresult = false;
        	}
        });
        $('#pwd').keyup(function () {
        	let pwdresultVal = $("#pwdresult").val();
        	let pwd = $("#pwd").val();
        	if(pwdresultVal == pwd && pwd != "" && pwdresultVal != ""){
                $("#succesPwd").slideDown(350);
                $("#failPwd").slideUp(150);
                pwdresult = true;
        	}else{
            	$("#failPwd").slideDown(350);
                $("#succesPwd").slideUp(150);
                pwdresult = false;
        	}
        });
   
        $("#signupbtn").on('click',function(event){
        	let pwd = $("#pwd").val();
        	event.preventDefault();
        	
        	if(!token){
        		customAlert.alert("아이디중복확인 버튼을 눌러주세요");
        		return;
        	}
			if(!pwdresult){
        		customAlert.alert("비밀번호와 비밀번호확인이 맞지않습니다");
        		return;
        	}
        	
        	document.form.submit();
        });
        
        
    	$("#duplie").on('click',function(event){
    		event.preventDefault();
        	let id = $("#id").val();
        	let email = $("#email").val();
        		$.ajax({
        	        url: "${cp}signup/dupliid",
        	        type: "POST",
        	        data: { id:id,
        	        		email:email},
        	        beforeSend : function() {
        	          	$("#failId").slideUp(150);
        	            $("#succesId").slideUp(150);
        	            $("#duplieId").slideUp(150);
        	        },
        	        success: function (response) {
        	        	console.log(response);
        	        	if(id == ""){
        	        		customAlert.alert("아이디를입력해주세요");
        	        		$("#failId").slideDown(150);
        	        		token = false;
        	        		return;
        	        	}
        	            if (response === "success") {
        	                $("#succesId").slideDown(150);
        	                token = true;
        	            }else if(response === "duplie"){
        	            	$("#duplieId").slideDown(150);
        	            	token = false;
        	            } 
        	            else {
        	            	$("#failId").slideDown(150);
        	            	token = false;
        	            }
        	        },
        	        error: function () {
        	        	customAlert.alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
        	        },
        	    });
        	
        	
    	});
    	
    	
    	
    	$("#emailbtn").on('click',function(event){
    		event.preventDefault();
    		const email = $("#email").val();

    	    if (!email) {
    	    	customAlert.alert("이메일을 입력해주세요.","경고!");
    	        return;
    	    }
			$("#emailbtn").css("background-color","#a9a9a9");
			$("#lodingimg").show();
    	    $.ajax({
    	        url: "${cp}sendemail/send",
    	        type: "POST",
    	        data: { email },
    	        success: function (response) {
    	        	console.log(response);
    	            if (response === "success") {
    	            	$("#emailbtn").css("background-color","#005B48");
    	    			$("#lodingimg").hide();
    	            	customAlert.alert("인증번호가 발송되었습니다 이메일을 확인해주세요.","승인");
    	                $("#emailcode").removeClass("none").addClass("block");
    	                $("#emailbtn2").removeClass("none").addClass("block");
    	            } else {
    	            	customAlert.alert("인증번호 발송에 실패했습니다 다시 시도해주세요.");
    	            }
    	        },
    	        error: function () {
    	        	customAlert.alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    	        },
    	    });
    	});
    	
    	$("#emailbtn2").click(function(){
    		event.preventDefault();
    		const emailcode = $("#emailcode").val();
    		const email = $("#email").val();
    	    if (!email) {
    	    	customAlert.alert("이메일을 입력해주세요.","경고!");
    	        return;
    	    }else if(!emailcode){
    	    	customAlert.alert("이메일을 입력해주세요.","경고!");
    	        return;
    	    }
    	    
    	    $.ajax({
    	        url: "${cp}sendemail/select",
    	        type: "POST",
    	        data: { email:email,
    	        		code:emailcode},
    	        success: function (response) {
    	        	console.log(response);
    	            if (response === "success") {
    	                $("#step3div").removeClass("none").addClass("block");
    	                customAlert.alert("인증번호가 확인되었습니다","확인");
    	                $("#emailcode").removeClass("block").addClass("none");
    	                $("#emailbtn2").removeClass("block").addClass("none");
	    	                $.ajax({
	    	        	        url: "${cp}sendemail/delete",
	    	        	        type: "POST",
	    	        	        data: { email},
	    	        	        success: function (response) {
	    	        	        	console.log(response);
	    	        	        },
	    	        		});

    	            } else {
    	            	customAlert.alert("인증번호가 틀립니다");
    	            }
    	        },
    	        error: function () {
    	        	customAlert.alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
    	        },
    		});
    	});
    
    	
    	
    	
    	
        $("#search").click(function(){
            event.preventDefault();
            var pop = window.open("${cp}jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
        });
       
    $("#nextbtn").click(function(){
        event.preventDefault();
    	if($("#tel").val() == ""){
    		customAlert.alert("전화번호를 입력해주세요.","경고!");
    		return;
    	}
    	if($("#name").val() == ""){
    		customAlert.alert("이름을 입력해주세요.","경고!");
    		return;
    	}
    	if($("#birthday").val() == ""){
    		customAlert.alert("생년월일을 입력해주세요.","경고!");
    		return;
   		 }

        $("#onediv").removeClass("block").addClass("none");
        $("#twodiv").removeClass("none").addClass("block");
        $("#step1").removeClass("block").addClass("none");
        $("#step2").removeClass("none").addClass("block");
    })
    
    
    
})
 function jusoCallBack(roadAddrPart1,addrDetail){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

    		document.form.roadAddrPart1.value = roadAddrPart1;

    		document.form.addrDetail.value = addrDetail;
    		
    	}
    </script>
</body>
</html>