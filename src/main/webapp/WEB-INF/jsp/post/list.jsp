<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/head.jsp"></jsp:include>
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment-with-locales.min.js" integrity="sha512-4F1cxYdMiAW98oomSLaygEwmCnIP38pb4Kx70yQYqRwLVCs3DbRumfBq82T08g/4LJ/smbFGFpmeFlQgoDccgg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <style>
        .pagination a:hover { background-color: #ffffff; font: #005B48;}     
        .pagination a:focus { background-color: #ffffff; box-shadow:none; font: #005B48;}     

    </style>
</head>
   <body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp" />       
        <main class="container">
            <h2 class="mt-5 font-color bold-text;"><b> 
	            <c:if test="${pageDto.cri.category == 1}">공지사항</c:if>
	            <c:if test="${pageDto.cri.category == 2}">자유게시판</c:if>
	            <c:if test="${pageDto.cri.category == 3}">질문과 답변</c:if>
	            <c:if test="${pageDto.cri.category == 4}">봉사인증</c:if>
	            <c:if test="${pageDto.cri.category == 5}">자료실</c:if>            
            </b></h2>
            	<c:if test="${pageDto.cri.category != 4}">
		            <form>
		            	<input type="hidden" name="page" value="${pageDto.cri.page}">
						<input type="hidden" name="category" value="${pageDto.cri.category}">	 
		                <div class="row my-3">
		                    <div class="col-sm-0 col-md-3 col-lg-1 col-xl-4 col-xxl-8"></div>
		                    <div class="col-sm-12 col-md-12 col-lg-3 col-xl-3 col-xxl-1 pe-0"> 
		                        <select class="form-select form-select-sm" name="type">
		                            <option ${pageDto.cri.type == "T" ? 'selected' : ''} value="T" selected>제목</option>
		                            <option ${pageDto.cri.type == "TC" ? 'selected' : ''} value="TC">제목+내용</option>
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
            	</c:if>
            
          	<!-- 공지사항 -->
           	<c:if test="${pageDto.cri.category == 1}">
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
		  		    <c:if test="${empty posts}"><tr><td colspan="4">작성된 글이 없습니다.<td></tr></c:if>
	                <c:forEach items="${posts}" var="p">
	                <tr>
	                	<td>${p.pno}</td>
	             		<td class="text-truncate text-start"><a href="view?pno=${p.pno}&${pageDto.cri.qs2}" class="text-decoration-none text-reset">${p.title}</a>
	                	<c:if test="${p.attachFlag}"><i class="fa-solid fa-paperclip text-dark"></i></c:if></td>
	                	<td><fmt:formatDate value="${p.regdate}" pattern="yyyy-MM-dd" /></td>
	                	<td>${p.viewCount}</td>
	                </tr>
	                </c:forEach>
	                </tbody>
				</table>
           	</c:if>
			<!-- 자유게시판 -->
           	<c:if test="${pageDto.cri.category == 2}">
           		<table class="table text-center" style="table-layout: fixed;">
            		<thead>
	                <tr class="table-active">
	                    <th style="width: 15%;">글번호</th>
	                    <th>제목</th>
	                    <th style="width: 7%;">작성자</th>
	                    <th style="width: 15%;">작성일</th>
	                    <th style="width: 5%;">조회수</th>
	                    <th style="width: 5%;">추천</th>
	                </tr>
	                </thead> 
	                <tbody>
		  		    <c:if test="${empty posts}"><tr><td colspan="6">작성된 글이 없습니다.<td></tr></c:if>
	                <c:forEach items="${posts}" var="p">
	                <tr>
	                	<td>${p.pno}</td>
	             		<td class="text-truncate text-start"><a href="view?pno=${p.pno}&${pageDto.cri.qs2}" class="text-decoration-none text-reset">${p.title}</a>
	                	<c:if test="${p.attachFlag}"><i class="fa-solid fa-paperclip text-dark"></i></c:if>	                	
	                	<td>${p.id}</td>
	                	<td><fmt:formatDate value="${p.regdate}" pattern="yyyy-MM-dd" /></td>
	                	<td>${p.viewCount}</td>
	                	<td>${p.likes}</td>
	                </tr>
	                </c:forEach>
	                </tbody>
            	</table>
            </c:if>            
           	<!-- 답변게시판 -->
           	<c:if test="${pageDto.cri.category == 3}">
           		<table class="table text-center" style="table-layout: fixed;">
            		<thead>
	                <tr class="table-active">
	                    <th style="width: 15%;">글번호</th>
	                    <th>제목</th>
	                    <th style="width: 15%;">작성일</th>
	                    <th style="width: 5%;">조회수</th>
	                </tr>
	                </thead> 
	                <tbody>
	                <c:if test="${empty member.id}"><tr><td colspan="4">로그인 후 확인가능합니다.</td></tr></c:if>
		  		    <c:if test="${not empty member.id && empty posts}"><tr><td colspan="4">작성된 글이 없습니다.</td></tr></c:if>
	                <c:forEach items="${posts}" var="p" varStatus="status">	        
		               <c:if test="${p.id == member.id}">
			               <tr>
			                	<td>${p.pno}</td>
			             		<td class="text-truncate text-start"><a href="view?pno=${p.pno}&${pageDto.cri.qs2}" class="text-decoration-none text-reset">${p.title}</a>
			                	<c:if test="${p.attachFlag}"><i class="fa-solid fa-paperclip text-dark"></i></c:if>	                	
			                	<td><fmt:formatDate value="${p.regdate}" pattern="yyyy-MM-dd" /></td>
			                	<td>${p.viewCount}</td>
			                </tr>
		                </c:if>
	                </c:forEach>
	                </tbody>
	             </table>
           	</c:if>
           	<!-- 갤러리 -->
           	<c:if test="${pageDto.cri.category == 4}">
	           	<div class="clearfix"><a href="write?${pageDto.cri.qs2}" class="btn text-light float-end" style="background-color: #005B48; width: 70px;">글쓰기</a></div>	               
	            <div>
	                <div class ="d-flex flex-wrap justify-content-between px-5">
	                	<c:if test="${empty posts}"><tr><td colspan="5">작성된 글이 없습니다.<td></tr></c:if>
		               	<!-- 출력 갯수에 따라 마지막페이지 정렬하는거 -->
		                <c:forEach items="${posts}" var="p">
		                    <div class="col-6 col-sm-4 col-md-6 col-xxl-3 d-inline m-5 p-0" style="width: 300px;"><a href="view?pno=${p.pno}&${pageDto.cri.qs2}" class="text-decoration-none text-reset"><div class="text-truncate"><img src="https://placehold.co/300"><h4>${p.title}</h4></div></a></div>	                
		                </c:forEach>
	            	</div>	            
	            </div>
           	</c:if>
           	<!-- 자료실 -->
           	
           	<c:if test="${pageDto.cri.category == 5}">
				<table class="table text-center" style="table-layout: fixed;">
            		<thead>
	                <tr class="table-active">
	                    <th style="width: 15%;">글번호</th>
	                    <th>제목</th>
	                    <th style="width: 15%;">발행일</th>
	                    <th style="width: 10%;">다운로드 수</th>
	                    <th style="width: 10%;">다운로드</th>
	                </tr>
	                </thead> 
	                <tbody>
		  		    <c:if test="${empty posts}"><tr><td colspan="5">작성된 글이 없습니다.<td></tr></c:if>
	                <c:forEach items="${posts}" var="p">	       
		                <tr class="align-middle">
		                	<td>${p.pno}</td>
		             		<td class="text-truncate text-start">${p.title}</td>
		             
		                	<td><fmt:formatDate value="${p.regdate}" pattern="yyyy-MM-dd" /></td>
		                	<c:forEach items="${p.attachs}" var="a" begin="0" end="1">
								<td><span id="downloadCount">${a.downloadCount}</span></td>	    
								<td>            	
		                		<a id="downloadBtn" type="button" class="btn btn-sm btn-outline-light text-dark" href="${cp}download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">다운로드 <i class="fa-solid fa-down-long"></i></a>
		                		</td>
		                	</c:forEach>
		                </tr>
	                </c:forEach>
	                </tbody>
	             </table>           		
           	</c:if>
           
            <c:if test="${(pageDto.cri.category == 2) or (pageDto.cri.category == 3)}">
	            <a href="write?${pageDto.cri.qs2}" class="btn float-end text-white" style="background-color: #005B48; width: 70px;">글쓰기</a>            
            
            </c:if>    

             <ul class="pagination justify-content-center my-5">
             	<c:if test="${pageDto.doublePrev}">
	                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angles-left"></i></a></li>             	
             	</c:if>
             	<c:if test="${pageDto.prev}">
                <li class="page-item"><a class="page-link link-success border-white green-color" href="#"><i class="fa-solid fa-angle-left"></i></a></li>
             	</c:if>
             	<c:forEach begin ="${pageDto.startPage}" end="${pageDto.endPage}" var="page">
	                <li class="page-item"><a class="page-link border-white bold-text text-secondary ${page == pageDto.cri.page ? 'text-decoration-underline' : ''}" href="list?page=${page}&amount=${pageDto.cri.amount}&category=${pageDto.cri.category}">${page}</a></li>	
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
    <script>
	    $(function() {
			$("#downloadBtn").click(function(){
				let currentDownload = parseInt($("#downloadCount").text());
				let afterDownload = currentDownload + 1;
				$("#downloadCount").text(afterDownload);
			})
		});
	    
    </script>
</body>
</html>