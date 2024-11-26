<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <jsp:include page="../common/head.jsp"></jsp:include>
        <style>
            .font-color {
                color: #005B48;
                font-size: 30px;
            }

            .green-color {
                color: #005B48;
            }

            body {
                font-family: 'MinSans', sans-serif;
            }

            .bold-text {
                font-family: 'MinSans', sans-serif;
                font-weight: 700;
            }

            .pagination a:hover {
                background-color: #ffffff;
                font: #005B48;
            }
        </style>
    </head>
    <body>
        <div class="wrap">
            <jsp:include page="../common/header.jsp" />
            <main class="container">
                <div class="clearfix py-4">
                    <h2 class="mt-5 font-color bold-text float-start"><b>공지사항</b></h2>
                </div>
                <div class="card border-start-0 border-end-0 rounded-0 border-2">
                    <div class="card-header">
                        <div>
                            <p class="text-center" style="font-size: 20px;"><b>${post.title}</b></p>
                        </div>
                        <div class="dropdown">
                            <div class="text-end">작성자 <span>${post.id}</span> <a class="nav-link dropdown-toggle d-inline" href="#" role="button" data-bs-toggle="dropdown">mekwon</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" onclick="return confirm('이 회원을 차단하시겠습니까?')">차단</a>
                                    </li>
                                </ul>
                            </div>
                            <p class="text-end mb-0">작성일 <fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd"/></p>
                            <p class="text-end mb-0">조회 ${post.viewCount}</p>
                            <p class="text-end mb-0">추천 ${post.likes}</p>
                        </div>
                    </div>
                    <div class="card-body" style="height: 515px;">${post.content}</div>
                    
                    
                    <div class="card-footer bg-white">
                        <label class="form-label mt-3"><b>첨부파일</b></label>
                        <ul class="list-group attach-result">
                        <c:if test="${empty post.attachs}">
                            <li class="list-group-item">첨부파일이 없습니다.</li>
                        </c:if>
                        <c:forEach items="${post.attachs}" var="a">
                        	<li class="list-group item"><a href="${cp}download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">${a.origin}</a></li>
                        </c:forEach>
                        </ul>
                    </div>                     
                </div>
                
                <div class="text-center my-5">
                	<c:if test="${post.id == member.id}">
                  <a href="modify?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;">수정</a>
                  <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;">목록</a>
                  <a href="remove?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
                	</c:if>
                	
                	<c:if test="${post.id != member.id}">
                  <a href="likes?" class="btn text-light" style="background-color: #005B48; width: 70px;" onclick="return confirm('추천하시겠습니까?')">추천</a>
                  <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;">목록</a>
                  <a href="report?" class="btn btn-secondary text-light" style="width: 70px;" onclick="return confirm('신고하시겠습니까?')">신고</a>                    
                	</c:if>                    	
                </div>
                <div class="text-center my-5">
                        <c:if test="${post.writer == member.id}">
                            <a href="modify?pno=${post.pno}&${cri.qs2}" class="btn btn-warning">수정</a>
                            <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;">목록</a>
                            <a href="remove?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
                        </c:if>
                        
                        <c:if test="${post.writer != member.id}">
                            <a href="likes?" class="btn text-light" style="background-color: #005B48; width: 70px;" onclick="return confirm('추천하시겠습니까?')">추천</a>
                            <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 70px;">목록</a>
                            <a href="report?" class="btn btn-secondary text-light" style="width: 70px;" onclick="return confirm('신고하시겠습니까?')">신고</a>                    
                        </c:if>                        
                    </div>
                    <form>
                    <input type="hidden" value="${post.pno}">
                    <input type="text">
                    <input type="submit" class="btn" value="댓글작성">
                    </form>
            </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </body>

    </html>