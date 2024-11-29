<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
    
        <jsp:include page="../common/head.jsp"></jsp:include>
        <style>
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
                    <h2 class="mt-5 font-color bold-text;"><b> 
			            <c:if test="${cri.category == 1}">공지사항</c:if>
			            <c:if test="${cri.category == 2}">자유게시판</c:if>
			            <c:if test="${cri.category == 3}">질문과 답변</c:if>
			            <c:if test="${cri.category == 4}">봉사인증</c:if>
			            <c:if test="${cri.category == 5}">자료실</c:if>            
            		</b></h2>
                </div>
                <div class="card border-start-0 border-end-0 rounded-0 border-2">
                    <div class="card-header">
                        <div>
                            <p class="text-center" style="font-size: 20px;"><b>${post.title}</b></p>
                        </div>
                        <div class="dropdown">
                        ${post.attachs}
                            <div class="text-end">작성자 <a class="nav-link dropdown-toggle d-inline" href="#" role="button" data-bs-toggle="dropdown">${post.id}</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" onclick="customConfirm.confirm('해당 회원을 차단하시겠습니까?','차단')">차단</a>
                                    </li>
                                </ul>
                            </div>
                            <p class="text-end mb-0">작성일 <fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd"/></p>
                            <c:if test="${cri.category == 2}">
                            <p class="text-end mb-0">추천 <span id="likesCount">${post.likes}</span></p>
                        	</c:if>
                            <p class="text-end mb-0">조회 ${post.viewCount}</p>
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
                        	<li class="list-group item">
                        		<a href="${cp}download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}" class="text-dark text-decoration-none">${a.origin}</a>                        		
                        		<c:if test="${a.image == 'true'}">
                        		<div style="width: 100px;"><img class="img-thumbnail" src="${cp}display?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}"></div>
                        		</c:if>
                        	</li>
                        </c:forEach>
                        </ul>
                    </div>                     
                </div>
                
                <div class="text-center my-5">
                	<c:if test="${post.id == member.id}">
	                  <a href="modify?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">수정</a>
	                  <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">목록</a>
	                  <a href="remove?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;" onclick="confirm('삭제하시겠습니까?')">삭제</a>
	                  
<%-- 	                  <a href="" class="btn text-light" style="background-color: #005B48; width: 80px;" onclick="customConfirm.confirm('삭제하시겠습니까?','삭제').then(function() { location.href='remove?pno=${post.pno}&${cri.qs2}'})">삭제</a> --%>
                	</c:if>
                	
                	<c:if test="${post.id != member.id}">
                	  <c:if test="${cri.category== 2 and not empty member.id}">
	                  	<a class="btn text-light" style="background-color: #005B48; width: 80px;" id="likeBtn">추천 <span id="likesCount">${post.likes}</span></a>
 	                  	<a class="btn text-light d-none" style="background-color: #005B48; width: 80px;" id="unlikeBtn">추천 ${post.likes} </a>                 	  
                	  </c:if>
	                  <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">목록</a>
	                  <c:if test="${cri.category== 2}">
	                  <a href="report?" class="btn btn-secondary text-light" style="width: 80px;" onclick="customConfirm.confirm('해당 글을 신고하시겠습니까?','신고')">신고</a>                    
                	  </c:if>
                	</c:if>                 	
                </div>   
                 
                <form>
	                <input type="hidden" value="${post.pno}" id="postPno">
	                <input type="hidden" value="${member.id}" id="memberId">
	                <input type="text">
	                <input type="submit" class="btn" value="댓글작성">
                </form>
               
            </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
        <script src="${cp}js/alert.js"></script>

        
        <script>
        	$(function() {
        		$("#likeBtn").click(function(){
        			event.preventDefault();
        			const id = $("#memberId").val(); 
        			const pno = $("#postPno").val(); 
        			customConfirm.confirm('추천하시겠습니까?',"추천").then(function() {
        				$.ajax({
        					url: "${cp}post/like",
        					type: "POST",
        					data: {id:id, pno:pno},
        					success: function(response) {
        						  if (response === "success") {
	        						customAlert.alert("추천되었습니다","확인");
	        						let currentLikes = parseInt($("span#likesCount").text());
	                                
	        						let afterLikes = currentLikes + 1;
	        						
	        						$("span#likesCount").text(afterLikes);
	        						
        						  }
        						  else if(response === "duplication") {
        							  console.log("중복불가");
        							  customAlert.alert("같은 아이디로 중복추천 불가능","경고"); 
        						  }
        					},
        					error: function(response) {
        						if (response === "fail") {
	        						customAlert.alert("서버 오류","경고");        							  
        						  }
        					} 			
        				})
        				
        			})
        			
        			
        		})
        	});
        </script>
    </body>

    </html>