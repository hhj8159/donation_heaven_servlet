<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <style>
        .font-color {color: #005B48; font-size: 30px;}
        .green-color { color: #005B48; }
       
        body{
            font-family: 'MinSans', sans-serif;
        }
        .bold-text {
           font-family: 'MinSans', sans-serif;
            font-weight: 700;
        }

        .pagination a:hover { background-color: #ffffff; font: #005B48;}     

    </style>
</head>
   <body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp" />       
        <main class="container">
            <h2 class="mt-5 font-color bold-text;"><b>공지사항</b></h2>
            <form>	 
                <div class="row my-3">
                    <div class="col-sm-0 col-md-3 col-lg-1 col-xl-4 col-xxl-8"></div>
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 col-xxl-1 pe-0"> 
                        <select class="form-select form-select-sm" name="type">
                            <option value="T" selected>제목</option>
                            <option value="TC">제목+내용</option>
                            <option value="W">작성자</option>				
                        </select>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-5 col-xl-4 col-xxl-3 ps-0" style="border: 0;">
                        <div class="float-end">
                            <div class="input-group">
                                <input class="text border-1">
                                <button href="#" class="btn btn-sm btn-secondary">검색</button>
                            </div>
                        </div>
                    </div>	
                </div>
			</form>
            
            <table class="table text-center" style="table-layout: fixed;">
                <thead>
                <tr class="table-active">
                    <th style="width: 15%;">글번호</th>
                    <th>제목</th>
                    <th style="width: 15%;">작성일</th>
                    <th style="width: 15%;">조회수</th>
                </tr>
                </thead>
                
                <tbody>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="text-truncate text-start"><a href="#" class="text-decoration-none text-reset">제목제제목제목제목제목제목제목</a></td>
                    <td>2014/11/07</td>
                    <td>0</td>
                </tr>
               
                </tbody>
            </table>
            <a href="write.html" class="btn float-end" style="background-color: #005B48; width: 70px;">글쓰기</a>

             <ul class="pagination justify-content-center my-5">
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angles-left"></i></a></li>
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angle-left"></i></a></li>
                <li class="page-item"><a class="page-link border-white bold-text text-secondary" href="#">1</a></li>
                <li class="page-item"><a class="page-link border-white bold-text text-secondary" href="#">2</a></li>
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
              </ul>
              
        </main>
        	<jsp:include page="../common/footer.jsp"></jsp:include>

    </div>
</body>
</html>