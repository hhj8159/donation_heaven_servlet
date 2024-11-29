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
</style>
<link rel='stylesheet' type='text/css'href='${cp}font/font.css'>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
         <main class="container card w-50 mt-5" style="margin-left: 25%;">
                     <form method="post" name="frm">
           <div class="mt-3 w-100 text-center" id="step1">
            <p class="font-color">회원정보에 등록한 비밀번호 변경</p>

            <div class="row">
                <label for="name" class="col-2 mt-2"  >아이디</label>
                <input type="text" class="form-control textwidth mt-2" id="id" name="id">
            </div>
            <div class="row mt-3">
                <label for="name" class="col-2 mt-2">이메일</label>
                <input type="text" class="form-control textwidth mt-2 " id="email" name="email">
            </div>
            <button class="btn mt-3 mb-3" style="background-color: #005B48; color: white; width: 41%;;margin-left: 3%;" id="emailbtn">인증 번호 발송</button><img src="${cp}images/8puiO.gif" id="lodingimg" class="ms-3 none"style="width:30px;height:30px;">
            <div class="row mt-2 mb-5">
            <input type="text" class="form-control  none" id="emailcode" name ="code"placeholder="인증번호" style="margin-left: 31%;width: 20% ;">
            <button class="btn col-2  none" style="background-color: #005B48; color: white; margin-left: 3%;" id="emailbtn2">인증 번호 확인</button>
            </div>
            </div>
             <div class="mt-3 w-100 text-center none mb-5" id="step2">
              <p class="font-color">비밀번호 변경</p>
              <div class="row mt-2">
                <label for="name" class="col-2  mt-2"  >새 비밀번호</label>
                <input type="password" class="form-control textwidth mt-2" id="newpw" name="newpw">
            </div>
              <div class="row  mt-2">
                <label for="name" class="col-2  mt-2" >새 비밀번호 확인</label>
                <input type="password" class="form-control textwidth mt-2" id="newpw" name="">
            </div>
            <button class="btn mt-3 mb-3" style="background-color: #005B48; color: white; width: 41%;margin-left: 3%;" id="updatebtn" >비밀번호 변경</button>
             			
             </div>
			</form>
        </main>
         <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script src="${cp}js/alert.js"></script>
 	<script>
 	 $(function(){
  		 $("#updatebtn").on('click',function(event){
 			event.preventDefault();
 			customAlert.alert("변경이완료되었습니다").then(function(){
 	 			document.frm.submit();
 			});

 		 }); 
     	$("#emailbtn").on('click',function(event){
     		event.preventDefault();
     		const email = $("#email").val();
     		const id = $("#id").val();
     	    if (email == "" || id =="") {
     	    	customAlert.alert("이메일과 아이디를 입력해주세요.","경고!");
     	        return;
     	    }
			$("#emailbtn").css("background-color","#a9a9a9");
			$("#lodingimg").show();
     	    $.ajax({
     	        url: "${cp}sendemail/cfidsendemail",
     	        type: "POST",
     	        data: { email:email,
     	        		id:id},
     	        success: function (response) {
     	        	console.log(response);
     	            if (response === "success") {
    	            	$("#emailbtn").css("background-color","#005B48");
    	    			$("#lodingimg").hide();
    	    			customAlert.alert("인증번호가 발송되었습니다 이메일을 확인해주세요.","승인").then((result)=> {
     	            		if(result){
     	            			$("#emailcode").removeClass("none").addClass("block");
             	                $("#emailbtn2").removeClass("none").addClass("block");
             	            	$("#id" ).prop('readonly', true);
     	            		}
     	            	})	
     	                
     	            } else {
     	            	customAlert.alert("회원정보에 등록한 아이디와 이메일을 기입해주세요.");
     	            	$("#emailbtn").css("background-color","#005B48");
    	    			$("#lodingimg").hide();
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
     		const id = $("#id").val();
     	    if (!email) {
     	    	customAlert.alert("이메일을 입력해주세요.","경고!");
     	        return;
     	    }else if(!emailcode){
     	    	customAlert.alert("인증코드를 입력해주세요","경고!");
     	        return;
     	    }

     	    $.ajax({
     	        url: "${cp}sendemail/select",
     	        type: "POST",
     	        data: { code:emailcode,
     	        		email:email},
     	        success: function (response) {
     	        	console.log(response);
     	            if (response === "success") {

     	                $("#step3div").removeClass("none").addClass("block");
     	                customAlert.alert("인증번호가 확인되었습니다","확인");
     	                $("#emailcode").removeClass("block").addClass("none");
     	                $("#emailbtn2").removeClass("block").addClass("none");
     	                $("#step2").removeClass("none").addClass("block");
     	                $("#step1").addClass("none");
     	                
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
	     
	 })
 	</script>
</body>
</html>