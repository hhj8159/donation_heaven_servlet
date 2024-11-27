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
                    
                    <form>
                        <div class="d-grid col-10 mx-auto">
                            <hr class="border border-2 border-secondary">
                            <div class="row justify-content-center">
                                <div class="mx-5 mt-3 col-6">
                                    <p class="float-start">후원자번호</p>
                                    <p class="float-end">000001</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">후원분야</p>
                                    <p class="float-end">결식아동</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">후원금액 합계</p>
                                    <p class="float-end">30,000원</p>
                                </div>
                                <div class="mx-5 col-6">
                                    <p class="float-start">후원방식</p>
                                    <p class="float-end">정기후원</p>
                                </div>
                                <div class="mx-5 mb-2 col-6">
                                    <p class="float-start">납입방법</p>
                                    <p class="float-end">자동이체</p>
                                </div>

                            </div>
                            <hr class="border border-2 border-secondary">                            
                        </div>
                    </form>
                    
                    <div class="d-flex col-3 mx-auto">
                        <button type="button" class="btn btn-outline-success m-4 mb-5 w-75">확인</button>
                    </div>
                </div>    
            </div> 
        </main>
       <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>

</body>
</html>