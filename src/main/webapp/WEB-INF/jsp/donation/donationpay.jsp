<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../common/head.jsp"></jsp:include>
	
	<!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- iamport.payment.js --> 
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
      
<style>
	.block {display: block;}
	.none {display: none;}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
    }
</style>
</head>
<body>
	
    <div class="wrap">
        <jsp:include page="../common/header.jsp"></jsp:include>
        
        <main class="container">
            <div class="row justify-content-center">
                <div class="col-md-9">                
                    <div class="py-2">
                        <h2 class="bold-text my-3 mt-3 mb-4">후원 신청하기</h2>
                    </div>


                    <form name="frm" method="post">
                        <div class="block" id="select">
                            <div class="position-relative mx-auto mb-5 mt-5" style="width: 80%;">
                                <div>
                                <div class="border"></div>
                                </div>
                                <p class="position-absolute top-0 start-0 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #005B48;  width: 30%; color: white;">후원대상 선택</p>
                                <p class="position-absolute top-0 start-50 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원회원 정보</p>
                                <p class="position-absolute top-0 start-100 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원금 납입</p>
                            </div>                                
                            <div class="d-grid col-10 mx-auto">
                                <hr class="border border-2 border-secondary">
                                <ul class="list-group list-group-horizontal form-check my-3" id="donationcategoryselect">
                                    <li class="list-group px-3 col-2">후원방식</li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="정기후원" name="donationcategory" checked>정기후원</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="일시후원" name="donationcategory">일시후원</label></li>
                                </ul>
                                <ul class="list-group list-group-horizontal form-check mb-2 mt-3">
                                    <li class="list-group px-3 col-2">후원종류</li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="독거노인" name="donationtype" checked>독거노인</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="결식아동" name="donationtype">결식아동</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="한부모가정" name="donationtype">한부모가정</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="장애인" name="donationtype">장애인</label></li>
                                </ul>
                                <div class="list-group list-group-horizontal my-3">
                                    <p class="list-group px-3 mt-2 col-2">후원금액</p>
                                    <div class="col-3 px-3">
                                        <select class="form-select" id="donationpriceselect">
                                            <option value="직접입력">직접입력</option>
                                            <option value="10000">10,000</option>
                                            <option value="50000">50,000</option>
                                            <option value="100000">100,000</option>
                                        </select>
                                    </div>
                                    <p class="list-group ps-1"><input class="form-control text-end" type="number" name="donadate" id="priceWrite" placeholder="직접입력"></p>
                                </div>
                                <hr class="border border-2 border-secondary">
                                <div>
                                    <div class="list-group list-group-horizontal float-end">
                                        <p class="list-group me-3 pt-2">총 후원금액</p>
                                        <p class="donationpriceselectlog list-group me-1 ms-5 fs-4" id="totalDonationPrice"></p>                                    
                                        <p class="list-group me-3 pt-2">원</p>
                                    </div>
                                </div>
                                <hr class="border border-1 border-secondary">
                            </div>
                            <div class="d-flex col-3 mx-auto">
                                <button type="button" class="btn btn-outline-success m-4 mb-5 w-75 mx-auto" id="nextbtn1">다음 단계</button>
                            </div>  
                        </div>


                        <div class="none" id="info">
                            <div class="position-relative mx-auto mb-5 mt-5" style="width: 80%;">
                                <div>
                                <div class="border"></div>
                                </div>
                                <p class="position-absolute top-0 start-0 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원대상 선택</p>
                                <p class="position-absolute top-0 start-50 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #005B48;  width: 30%; color: white;">후원회원 정보</p>
                                <p class="position-absolute top-0 start-100 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원금 납입</p>
                            </div>                                
                            <div class="d-grid col-10 mx-auto">
                                <hr class="border border-2 border-secondary">
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">이름</li>
                                    <li class="list-group px-3">${member.name}</li>
                                </ul>
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">휴대전화</li>
                                    <li class="list-group px-3">${member.tel}</li>
                                </ul>   
                                <ul class="list-group list-group-horizontal my-3">
                                    <li class="list-group px-3 col-2">이메일</li>
                                    <li class="list-group px-3" >${member.email}</li>
                                </ul>
                                <div class="col-md-10">
                                    <div class="list-group list-group-horizontal my-3">
                                        <p class="list-group px-3 me-3 col-2">주소</p>
                                        <input type="text" class="form-control col-2 ms-3 me-2  py-2 w-50" id="roadAddrPart1" name="roadAddrPart1" placeholder="도로명주소" value="${member.roadAddr}" readonly>
                                        <button class="btn btn-success py-2 col-3" type="button" style="width: 15%;" id="search">주소 변경</button>
                                    </div>
                                    <div class="list-group list-group-horizontal my-3">
                                        <p class="list-group px-3 me-3 col-2"></p>
                                        <input type="text" class="form-control col-2 ms-3 me-2 py-2 w-50" id="addrDetail" name="addrDetail" placeholder="상세주소" value="${member.detailAddr}" readonly>
                                    </div>
                                    <ul class="list-group search-result-wrap mb-3 w-50" style="margin-left: 15%;" >
                
                                    </ul>
                                </div>
                                <hr class="border border-2 border-secondary">
                                <div class="d-flex col-6 mx-auto">
                                    <button type="button" class="btn btn-outline-success m-4 mb-5 w-75 me-3 mx-auto" id="prebtn1">이전 단계</button>                
                                    <button type="button" class="btn btn-outline-success m-4 mb-5 w-75 ms-3 mx-auto" id="nextbtn2">다음 단계</button> 
                                </div>
                            </div>
                        </div>


                        <div class="none" id="pay">
                            <div class="position-relative mx-auto mb-5 mt-5" style="width: 80%;">
                                <div>
                                  <div class="border"></div>
                                </div>
                                <p class="position-absolute top-0 start-0 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원대상 선택</p>
                                <p class="position-absolute top-0 start-50 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원회원 정보</p>
                                <p class="position-absolute top-0 start-100 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #005B48;  width: 30%; color: white;">후원금 납입</p>
                            </div>
                            <div class="d-grid col-10 mx-auto">
                                    <hr class="border border-2 border-secondary">
                                    <ul class="list-group list-group-horizontal form-check my-3">
                                        <li class="list-group px-3 col-2">납입방법</li>
                                    </ul>
                                    <div>
                                        <div class="d-flex col-12 mx-auto">
                                            <button type="button" id="card" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text" onclick="requestPay()">신용카드</button>
                                            <button type="button" id="trans" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text">계좌이체</button>
                                            <button type="button" id="bank" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text">무통장입금</button>
                                        </div>
                                    </div>
                                   
                                    <hr class="border border-2 border-secondary">
                                </div>
                                <div class="d-flex col-3 mx-auto">
                                	<button type="button" class="btn btn-outline-success m-4 mb-5 w-75 mx-auto" id="prebtn2">이전 단계</button>
                            	</div>
<%--                                 <div class="d-flex col-5 mx-auto">
                                    <button type="button" class="btn btn-outline-success m-4 mb-5 w-75 me-3 mx-auto" id="prebtn2">이전 단계</button>
                                    <a href="${cp}donationsuccess" type="button" class="btn btn-outline-success m-4 mb-5 w-75 ms-3 mx-auto" id="donabtn">후원 신청하기</a>
                                </div> --%>
                            <div>
                                
                            </div>
                        </div>
                    </form>
                   
					
                </div>
            </div> 
            
        </main>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script src="${cp}js/alert.js"></script>
	
	<c:if test="${empty member}">
    <script>
	 customAlert.alert("로그인 후 이용 가능합니다","경고!").then(function(){
		 location.href ="signin";
	 });	 
	 </script>
	</c:if>
	
    <script>

        
        $(function() {
			$("input[name='donationcategory']").change(function() {
        		event.preventDefault();
	        	let dcno = $("input[name='donationcategory']:checked").val();
	        	console.log("후원방식:" + dcno);	        	
			})
			$("input[name='donationtype']").change(function() {
        		event.preventDefault();
	        	let dtno = $("input[name='donationtype']:checked").val();
	        	console.log("후원종류:" + dtno)
			})
        	
        	
            $.numberWithCommas = function (x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            }
            $("#donationpriceselect").change(function(){
                $("#totalDonationPrice").text(function(){
                    if($("#donationpriceselect").val() != "직접입력"){
                        return $("#donationpriceselect").val();
                    }
                })
                if($("#donationpriceselect").val() != "직접입력"){
                    $("#priceWrite").addClass("none");
                }else{
                    $("#priceWrite").removeClass("none");
                    $("#totalDonationPrice").text(function(){
                        return 0;
                    })
                    $("#priceWrite").val(function(){
                        return 0;
                    })
                }
            });


            $("#priceWrite").keyup(function (event) {
                if($("#priceWrite").val().length >= 17){                    
                    customAlert.alert("후원금액은 0~17자리까지 가능합니다","경고!");
                    $("#priceWrite").val(0);
                    return;
                }
                let price = Number($(this).val());
                $(this).val(price);
                $("#totalDonationPrice").text(price);
                
                let dprice = $("#totalDonationPrice").text();
                let tdprice = $.numberWithCommas(dprice);

                $("#totalDonationPrice").text(tdprice);
            });

            
            

            $("#nextbtn1").click(function(){
                event.preventDefault();                                
                if($("#totalDonationPrice").text() == "" || $("#totalDonationPrice").text() <= 499) {
                    customAlert.alert("후원금액은 500원 이상이어야 합니다","경고!");                    
                } else {
                    $("#select").removeClass("block").addClass("none");        
                    $("#info").removeClass("none").addClass("block");
                }                
            });
            $("#nextbtn2").click(function(){
                event.preventDefault();
                if($("#roadAddrPart1").val() == "" || $("#addrDetail").val() == "") {
                	customAlert.alert("주소를 입력해주세요","경고!");    
                } else {                	
	                $("#info").removeClass("block").addClass("none");
	                $("#pay").removeClass("none").addClass("block");
                }	                	
	        });
            $("#prebtn1").click(function(){
                event.preventDefault();
                $("#info").removeClass("block").addClass("none");
                $("#select").removeClass("none").addClass("block");                
            });
            $("#prebtn2").click(function(){
                event.preventDefault();
                $("#pay").removeClass("block").addClass("none");
                $("#info").removeClass("none").addClass("block");                
            });
            
            
            
            $("#card").click(function() {
                event.preventDefault();
                $("#card").removeClass("btn-outline-success").addClass("bg-success text-white border-success");
                $("#trans").removeClass("bg-success text-white border-success").addClass("btn-outline-success");
                $("#bank").removeClass("bg-success text-white border-success").addClass("btn-outline-success");                
            })
            $("#trans").click(function() {
                event.preventDefault();
                $("#trans").removeClass("btn-outline-success").addClass("bg-success text-white border-success");
                $("#card").removeClass("bg-success text-white border-success").addClass("btn-outline-success");
                $("#bank").removeClass("bg-success text-white border-success").addClass("btn-outline-success");                
            })
            $("#bank").click(function() {
                event.preventDefault();
                $("#bank").removeClass("btn-outline-success").addClass("bg-success text-white border-success");
                $("#trans").removeClass("bg-success text-white border-success").addClass("btn-outline-success");
                $("#card").removeClass("bg-success text-white border-success").addClass("btn-outline-success");                
            })           
            
            

            $("#search").click(function(){
                event.preventDefault();
                var pop = window.open("${cp}donationjusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
            });
            
            

    })

	function jusoCallBack(roadAddrPart1,addrDetail){
 		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
 		document.frm.roadAddrPart1.value = roadAddrPart1;
 		document.frm.addrDetail.value = addrDetail;
 	}
        console.log(${member.mno})
    
        
    function requestPay() { 
        	let roadAddrPart1 = $("#roadAddrPart1").val();
        	console.log(roadAddrPart1);
    	let priceValue = document.getElementById("donationpriceselect").value;
    	if(priceValue === "직접입력"){
    		priceValue = document.getElementById("priceWrite").value;
    	}
    	var donationCategoryValue = document.querySelector("input[name='donationtype']:checked").value;    	
    	var donationTypeValue = document.querySelector("input[name=donationtype]:checked").value;    	
    	
    	
    	console.log(priceValue);
    	console.log(donationTypeValue);
    	const rm_uid = Math.floor(Math.random() * 10000000);
    	

    	console.log( `${rm_uid}`);
    	IMP.init("imp82235424");
	    IMP.request_pay({
		    channelKey: "channel-key-1d16e053-71db-476a-b2e7-6b2549d33d0f",
		    pay_method: "card",
		    merchant_uid: `${rm_uid}`, // 주문 고유 번호
		    name: donationTypeValue,
		    amount: priceValue,
		    buyer_email: `${member.email}`,
		    buyer_name: `${member.name}`,
		    buyer_tel: `${member.tel}`,
		    buyer_addr: roadAddrPart1,
	    },
	  	function (rsp) {
	    	// 결제 종료 시 호출되는 콜백 함수
	    	// response.imp_uid 값으로 결제 단건조회 API를 호출하여 결제 결과를 확인하고,
	    	// 결제 결과를 처리하는 로직을 작성합니다.
	    	if(rsp.success) {
	    		
	    		let mno = ${member.mno};
	    		let impUid = rsp.imp_uid;
	    		let buyerAddr = rsp.buyer_addr;
	    		let merchantUid = rsp.merchant_uid;
	    		let buyerEmail = rsp.buyer_email;
	    		let buyerName = rsp.buyer_name;
	    		let buyerTel = rsp.buyer_tel;
	    		let cardName = rsp.card_name;
	    		let cardNumber = rsp.card_number;
	    		let name = rsp.name;
	    		let price = rsp.paid_amount;
	    		let payType = rsp.pay_method;
	    		let pgTid = rsp.pg_tid;
	    		console.log(mno + ":::" +"mno");
	    		console.log(impUid + ":::" +"impUid");
	    		console.log(buyerAddr + ":::" +"buyerAddr");
	    		console.log(merchantUid + ":::" +"merchantUid");
	    		console.log(buyerEmail + ":::" +"buyerEmail");
	    		console.log(buyerName + ":::" +"buyerName");
	    		console.log(buyerTel + ":::" +"buyerTel");
	    		console.log(cardName + ":::" +"cardName");
	    		console.log(price + ":::" +"price");
	    		
	    		const data = {
	    				mno, 
	    				impUid, 
	    				buyerAddr, 
	    				merchantUid, 
	    				buyerEmail, 
	    				buyerName, 
	    				buyerTel,
	    				cardName,
	    				cardNumber,
	    				name,
	    				price,
	    				payType,
	    				pgTid
	    		}
	    	
	    		
	    		console.log(data);
	    		
	    		
	    		$.ajax({
  	    	        url: "${cp}donationpay/pay",
  	    	        type: "POST",
  	    	      	contentType: "application/json", 
  	    	        data: JSON.stringify(data),
  	    	        success: function (res) {
						if(res.status="success"){
							console.log(res.cardName);
							console.log(res.dcno);
							console.log(res.name);
							console.log(res.price);
							console.log(res.regdate);
							console.log(res.buyerAddr);
  	    	        	location.href = "${cp}donationsuccess?cardName="+res.cardName+"&dcno="+res.dcno+"&name="+res.name+"&price="+res.price+"&regdate="+res.regdate+"&buyerAddr="+res.buyerAddr;
						}
  	    	        },
  	    	        error: function () {
  	    	        	customAlert.alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
  	    	        },
  	    		});
	    		
	    	} else {
	    		console.log(rsp);		    		
	    	}
	  	},
	  	async (response) => {
	  		console.log(response);
	  	    if (response.error_code != null) {
	  	      return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
	  	    }

	  	    // 고객사 서버에서 /payment/complete 엔드포인트를 구현해야 합니다.
	  	    // (다음 목차에서 설명합니다)
	  	    const notified = await fetch(`${cp}donationpay/pay`, {
	  	      method: "POST",
	  	      headers: { "Content-Type": "application/json" },
	  	      // imp_uid와 merchant_uid, 주문 정보를 서버에 전달합니다
	  	      body: JSON.stringify({
	  	       
	  	      }),
	  	    });
	  	    
	  	    console.log(notified);
	  	  },
	    
	    ); 
    }
    </script>   

</body>
</html>