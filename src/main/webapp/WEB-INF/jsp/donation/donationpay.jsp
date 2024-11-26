<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>
   <style>
        .font-color {color: #005B48; font-size: 25px;}
        body{
            font-family: 'MinSans', sans-serif;
        }
        .donation {background-color: #005B48; color: white; font-size: 30px; margin-right: 30px; }
        .signup {margin-right: 20px;}
        .sign {margin-top: 50px; color: #005B48;}
        .sign a:link { color: #005B48; }
        .donation:hover { color: #005B48;}
        .footer {background-color: #005B48; color: white;}
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


                    <div class="block" id="select">
                        <div class="position-relative mx-auto mb-5 mt-5" style="width: 80%;">
                            <div>
                            <div class="border"></div>
                            </div>
                            <p class="position-absolute top-0 start-0 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #005B48;  width: 30%; color: white;">후원대상 선택</p>
                            <p class="position-absolute top-0 start-50 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원회원 정보</p>
                            <p class="position-absolute top-0 start-100 translate-middle border-radius rounded-pill fs-4 pt-3 p-3 bold-text" style="text-align: center; background-color: #9FA6B2;  width: 30%; color: white;">후원금 납입</p>
                        </div>
                        
                        <form>                                
                            <div class="d-grid col-10 mx-auto">
                                <hr class="border border-2 border-secondary">
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">후원방식</li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="1" name="donationcategory" checked>정기후원</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="2" name="donationcategory">일시후원</label></li>
                                </ul>
                                <ul class="list-group list-group-horizontal form-check mb-2 mt-3">
                                    <li class="list-group px-3 col-2">후원종류</li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="1" name="donationtype" checked>독거노인</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="2" name="donationtype">결식아동</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="3" name="donationtype">한부모가정</label></li>
                                    <li class="list-group px-3 col-2"><label class="radio-inline"><input class="form-check-input mx-1" type="radio" value="4" name="donationtype">장애인</label></li>
                                </ul>
                                <div class="list-group list-group-horizontal my-3">
                                    <p class="list-group px-3 mt-2 col-2">후원금액</p>
                                    <div class="col-3 px-3">
                                        <select class="form-select" id="donationpriceselect">
                                            <option value="직접입력">직접입력</option>
                                            <option value="10,000">10,000</option>
                                            <option value="50,000">50,000</option>
                                            <option value="100,000">100,000</option>
                                        </select>
                                    </div>
                                    <p class="list-group ps-1"><input class="form-control text-end" type="number" name="donadate" id="priceWrite" placeholder="직접입력"></p>
                                </div>
                                <hr class="border border-2 border-secondary">
                                <div>
                                    <div class="list-group list-group-horizontal float-end">
                                        <p class="list-group me-3 pt-2">총 후원금액</p>
                                        <p class="donationpriceselectlog list-group me-1 ms-5 fs-4" id="totaldonationprice"></p>                                    
                                        <p class="list-group me-3 pt-2">원</p>
                                    </div>
                                </div>
                                <hr class="border border-1 border-secondary">
                            </div>
                        </form>
                        <div class="d-flex col-3 mx-auto">
                            <button type="button" class="btn btn-outline-success m-4 mb-5 w-75" id="nextbtn1">다음 단계</button>
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
                        
                        <form>                                
                            <div class="d-grid col-10 mx-auto">
                                <hr class="border border-2 border-secondary">
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">이름</li>
                                    <li class="list-group px-3 ">김길동</li>
                                </ul>
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">휴대전화</li>
                                    <li class="list-group px-3 ">010-1234-5678</li>
                                </ul>   
                                <ul class="list-group list-group-horizontal my-3">
                                    <li class="list-group px-3 col-2">이메일</li>
                                    <li class="list-group px-3 ">kimgd1234@naver.com</li>
                                </ul>
                                <div class="col-md-10">
                                    <div class="list-group list-group-horizontal my-3">
                                        <p class="list-group px-3 me-3 col-2">주소</p>
                                        <input type="text" class="form-control col-2 ms-3 me-2  py-2 w-50" id="roadAddr" name="addr" placeholder="도로명주소">
                                        <button class="btn btn-success py-2 col-3" type="button" style="width: 15%;" id="search">주소 검색</button>
                                    </div>
                                    <div class="list-group list-group-horizontal my-3">
                                        <p class="list-group px-3 me-3 col-2"></p>
                                        <input type="text" class="form-control col-2 ms-3 me-2 py-2 w-50" placeholder="상세주소" id="detailAddr">
                                    </div>
                                    <ul class="list-group search-result-wrap mb-3 w-50" style="margin-left: 15%;" >
                
                                    </ul>
                                </div>
                                <hr class="border border-2 border-secondary">
                                
                            </div>
                        </form>                        
                        <div class="d-flex col-6 mx-auto">
                            <button type="button" class="btn btn-outline-success m-4 mb-5 w-75" id="prebtn1">이전 단계</button>                
                            <button type="button" class="btn btn-outline-success m-4 mb-5 w-75" id="nextbtn2">다음 단계</button> 
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
                        
                        <form>                                
                            <div class="d-grid col-10 mx-auto"> 
                                <hr class="border border-2 border-secondary">
                                <ul class="list-group list-group-horizontal form-check my-3">
                                    <li class="list-group px-3 col-2">납입방법</li>                                
                                </ul>
                                <div>
                                    <div class="d-flex col-12 mx-auto">
                                        <button type="button" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text">신용카드</button>                
                                        <button type="button" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text">계좌이체</button>                
                                        <button type="button" class="btn btn-outline-success mt-4 mb-5 mx-4 py-2 w-75 fs-4 bold-text">무통장입금</button>                
                                    </div>             
                                </div>                           
                               
                                <hr class="border border-2 border-secondary">                            
                            </div>
                        </form>
                        <div>
                            <div class="d-flex col-6 mx-auto">
                                <button type="button" class="btn btn-outline-success m-4 mb-5 w-75" id="prebtn2">이전 단계</button>                
                                <button type="button" class="btn btn-outline-success m-4 mb-5 w-75" id="donabtn">후원 신청하기</button> 
                            </div>
                        </div>
                    </div>                    

                </div>
            </div>            
        </main>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
    <script>

        
        $(function() {
            $.numberWithCommas = function (x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            }
            $("#donationpriceselect").change(function(){
                $("#totaldonationprice").text(function(){
                    if($("#donationpriceselect").val() != "직접입력"){
                        return $("#donationpriceselect").val();
                    }
                })
                if($("#donationpriceselect").val() != "직접입력"){
                    $("#priceWrite").addClass("none");
                }else{
                    $("#priceWrite").removeClass("none");
                    $("#totaldonationprice").text(function(){
                        return 0;
                    })
                    $("#priceWrite").val(function(){
                        return 0;
                    })
                }
            });


            $("#priceWrite").keyup(function (event) {
                if($("#priceWrite").val().length >= 17){
                    
                    alert("후원금액은 0~17자리까지 가능합니다");
                    // customAlert.alert("후원금액은 0~17자리까지 가능합니다","경고!");

                    $("#priceWrite").val(0);
                    return;
                }
                let price = Number($(this).val());
                $(this).val(price);
                $("#totaldonationprice").text(price);
                
                let dprice = $("#totaldonationprice").text();
                let tdprice = $.numberWithCommas(dprice);

                $("#totaldonationprice").text(tdprice);
            });



            $("#nextbtn1").click(function(){
                event.preventDefault();
                $("#select").removeClass("block").addClass("none");        
                $("#info").removeClass("none").addClass("block");
            })
            $("#nextbtn2").click(function(){
                event.preventDefault();
                $("#info").removeClass("block").addClass("none");
                $("#pay").removeClass("none").addClass("block");                
            })
            $("#prebtn1").click(function(){
                event.preventDefault();
                $("#info").removeClass("block").addClass("none");
                $("#select").removeClass("none").addClass("block");                
            })
            $("#prebtn2").click(function(){
                event.preventDefault();
                $("#pay").removeClass("block").addClass("none");
                $("#info").removeClass("none").addClass("block");                
            })
            

            
            $("#search").click(function() {
                event.preventDefault

                const keyword = $(this).prev().val();
                if(!keyword) {
                    return;
                }
                const data = {
                    keyword,
                    confmKey : 'devU01TX0FVVEgyMDI0MTAyOTEyMTYxNjExNTIwMDI=',
                    currentPage : 1,
                    countPerPage : 100,
                    resultType : 'json' 
                };
                console.log(data);
                
                $.ajax({
                    url : "https://business.juso.go.kr/addrlink/addrLinkApiJsonp.do",
                    type : 'get',
                    data,
                    dataType : 'jsonp',
                    crossDomain : true,
                    success : function(data) {
                        console.log(data.results.juso);

                        let str = '';
                        for(let i in data.results.juso) {
                            str += `<li class="list-group-item"><a href="#" class="small">
                                ${data.results.juso[i].roadAddr}</a></li>`;
                        }
                        $("ul.search-result-wrap").html(str);
                                                    
                    },
                    error : function(xhr, msg) {
                        console.log(msg);
                    }
                })

                $("ul.search-result-wrap").on("click", "a", function() {
                    $("#roadAddr").val($(this).text().trim());
                    $(this).closest("ul.search-result-wrap").empty();
                })                
            })






    })
    </script>    

</body>
</html>