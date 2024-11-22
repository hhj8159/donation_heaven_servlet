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
            	<input type="hidden" name="page" value="${pageDto.cri.page}">
				<input type="hidden" name="category" value="${pageDto.cri.category}">	 
                <div class="row my-3">
                    <div class="col-sm-0 col-md-3 col-lg-1 col-xl-4 col-xxl-8"></div>
                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 col-xxl-1 pe-0"> 
                        <select class="form-select form-select-sm" name="type">
                            <option ${pageDto.cri.type == "T" ? 'selected' : ''} value="T" selected>제목</option>
                            <option ${pageDto.cri.type == "TW" ? 'selected' : ''} value="TC">제목+내용</option>
                            <option ${pageDto.cri.type == "W" ? 'selected' : ''} value="W">작성자</option>				
                        </select>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-5 col-xl-4 col-xxl-3 ps-0" style="border: 0;">
                        <div class="float-end">
                            <div class="input-group">
                                <input class="text border-1" class="form-control" placeholder="검색" name="keyword" value="${pageDto.cri.keyword}">
                                <button type="submit" class="btn btn-sm btn-secondary">검색</button>
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
                <c:forEach items="${posts}" var="p">
                <tr>
                	<td>${p.pno}</td>
             		<td class="text-truncate text-start"><a href="view?pno=${p.pno}&${pageDto.cri.qs2}" class="text-decoration-none text-reset">${p.title}</a>
                	<c:if test="${p.attachFlag}"><i class="fa-solid fa-paperclip text-dark"></i></c:if>
                	<td>${p.id}</td>
                	<td>${p.regdate}</td>
                	<td>${p.viewCount}</td>
                </tr>
                </c:forEach>
                </tbody>
             </table>
                
            <a href="write?${pageDto.cri.qs2}" class="btn float-end" style="background-color: #005B48; width: 70px;">글쓰기</a>

             <ul class="pagination justify-content-center my-5">
             	<c:if test="${pageDto.doublePrev}">
	                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angles-left"></i></a></li>             	
             	</c:if>
             	<c:if test="${pageDto.prev}">
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angle-left"></i></a></li>
             	</c:if>
             	<c:forEach begin ="${pageDto.startPage}" end="${pageDto.endPage}" var="page">
	                <li class="page-item ${page == pageDto.cri.page ? 'active' : ''}"><a class="page-link border-white bold-text text-secondary" href="list?page=${page}&amount=${pageDto.cri.amount}&category=${pageDto.cri.category}">${page}</a></li>	
	            </c:forEach>
                <c:if test="${pageDto.next}">
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angle-right"></i></a></li>
                </c:if>
                <c:if test="${pageDto.doubleNext}">
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angles-right"></i></a></li>
                </c:if>
              </ul>
              
        </main>
        	<jsp:include page="../common/footer.jsp"></jsp:include>

    </div>
</body>
</html>