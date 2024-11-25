<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="head.jsp" />
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Donation Heaven</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">

   <!-- bootstrap  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-7Pi/otdlbbCR+LnW+F7PwFcSDJOuUJB3OxtEHbg4vSMvzvJjde4Po1v4BR9Gdc9aXNUNFVUY+SK51wWT8WF0Gg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- jquery -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- bxslider -->
   <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
   <!-- font-awesome -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" /></head>
    <style>

    </style>
        <link rel='stylesheet' type='text/css'href='./font/font.css'>
   <body>
    <div class="wrap">
    	<jsp:include page="header.jsp" />

        <main class="container main">
            <div class="row">
                <div class="col-md-12">
                    <ul class="box mt-5">
                        <h1>이미지 슬라이드 구간</h1>
                    </ul>
                    <div class="gallery">
                            <b>
                                <span>아이들의 행복을 더하는 </span>
                                <span class="certifi">봉사 인증</span>
                            </b>
                            <br>
                            <br>
                        </div>
                        <div class="certifi-img">
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                            <a href="#"><img src="img/로그인.png"></a>
                        </div>
                    </div>
                </div>
                
                
            <div class="dona-slide">
                <a href="#" class="float-start"><img src="img/logo.png" alt="알림로고" class="img-fluid" width="250"></a>
            </div>

            </main>
		<jsp:include page="footer.jsp" />
    </div>
</body>
</html>