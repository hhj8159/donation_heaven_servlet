<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>
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
                    <form method="post" action="">
                        <div class="d-grid col-10 mx-auto">

				         
                            <hr class="border border-2 border-secondary">
                            <div class="row justify-content-center">
                                <div class="mx-5 mt-3 col-6">
                                    <p class="float-start">후원금액</p>
                                    <p class="float-end">${price}원</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">후원대상</p>
                                    <p class="float-end">${name}</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">납입방법</p>
                                    <p class="float-end">${dcno}</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">카드명</p>
                                    <p class="float-end">${cardName}</p>
                                </div>
                                <div class="mx-5 mb-2 col-6">
                                    <p class="float-start">주소</p>
                                    <p class="float-end">${buyerAddr}</p>
                                </div>

                            </div>
                            <hr class="border border-2 border-secondary">   
             
                        </div>
                    </form>
                    
                    <div class="d-flex col-3 mx-auto">
                        <a href="${cp}index" type="button" class="btn btn-outline-success m-4 mb-5 w-75">확인</a>
                    </div>
                </div>    
            </div> 
        </main>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>
        <script src="${cp}js/alert.js"></script>


</body>
</html>