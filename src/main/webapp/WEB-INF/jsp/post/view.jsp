<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                <p class="text-center" style="font-size: 20px;"><b>제목</b></p>
                            </div>
                            <div class="dropdown">
                                <div class="text-end"><span>작성자</span> <a class="nav-link dropdown-toggle d-inline" href="#" role="button" data-bs-toggle="dropdown">mekwon</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" onclick="return confirm('이 회원을 차단하시겠습니까?')">차단</a>
                                        </li>
                                    </ul>
                                </div>
                                <p class="text-end mb-0">작성일 22/05/31</p>
                                <p class="text-end mb-0">조회 44</p>
                                <p class="text-end mb-0">추천</p>
                            </div>
                        </div>
                        <div class="card-body" style="height: 515px;">본문내용</div>
                        <div class="card-footer bg-white">
                            <label class="form-label mt-3"><b>첨부파일</b></label>
                            <ul class="list-group attach-result">
                                <li class="list-group-item">첨부파일이 없습니다.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="text-center my-5">
                        <a href="modify" class="btn text-light" style="background-color: #005B48; width: 70px;"
                            onclick="return confirm('추천하시겠습니까?')">추천</a>
                        <a href="list.html" class="btn text-light"
                            style="background-color: #005B48; width: 70px;">목록</a>
                        <a href="remove" class="btn btn-secondary text-light" style="width: 70px;">신고</a>
                    </div>
                </main>
            <jsp:include page="../common/footer.jsp"></jsp:include>
            </div>
        </body>

        </html>