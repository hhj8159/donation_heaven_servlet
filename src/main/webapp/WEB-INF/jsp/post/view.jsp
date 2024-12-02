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
         <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment-with-locales.min.js" integrity="sha512-4F1cxYdMiAW98oomSLaygEwmCnIP38pb4Kx70yQYqRwLVCs3DbRumfBq82T08g/4LJ/smbFGFpmeFlQgoDccgg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
                            <div class="text-end">작성자 <a class="nav-link dropdown-toggle d-inline" href="#" role="button" data-bs-toggle="dropdown">${post.id}</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" onclick="customConfirm.confirm('해당 회원을 차단하시겠습니까?','차단')">차단</a>
                                    </li>
                                </ul>
                            </div>
                            <p class="text-end mb-0">작성일                 <fmt:formatDate value="${post.regdate}" pattern="yyyy-MM-dd"/></p>
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
                
                                <form action="reply">
	               <div class="comment-section mt-4">
    <!-- 댓글 리스트 -->
    <div class="comment-list replies" >
        <input type="hidden" value="${member.id}" id="replyWriter">
    </div>

    <!-- 댓글 입력 -->
    <div class="comment-input mt-4">
        <textarea class="form-control mb-3" rows="3" placeholder="댓글을 입력하세요..." id="replyContent"></textarea>
        <button class="btn btn-success" id="replyWrite">댓글 등록</button>
    </div>
</div>
                </form>
                            	<!-- The Modal -->
	<div class="modal fade" id="replyModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">댓글 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<label for="replyContent" class="mb-2">내용</label> <input
						type="text" class="form-control mb-3" id="replyContent2" > <label
						for="replyWriter" class="mb-2">작성자</label> <input type="text"
						class="form-control mb-3" id="replyWriter2" readonly >
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<div>

					</div>
					<button type="button" class="btn btn-warning"
							id="btnReplyModifySubmit">수정</button>

				</div>

			</div>
		</div>
	</div>
                
                
                
                <div class="text-center my-5">
                	<c:if test="${post.id == member.id or member.grade == 1}">
	                	<c:if test="${member.grade == 0 or (member.grade == 1 and cri.category == 1) or (member.grade == 1 and cri.category == 5)}">
		                  <a href="modify?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">수정</a>
	                	</c:if>
		                  	<a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">목록</a>
		                 	<a href="remove?pno=${post.pno}&${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;" onclick="confirm('삭제하시겠습니까?')">삭제</a>
                	</c:if>
                	
                	<c:if test="${post.id != member.id and member.grade == 0}">
                	  <c:if test="${(cri.category == 2 or cri.category == 5) and not empty member.id}">
	                  	<a class="btn text-light" style="background-color: #005B48; width: 80px;" id="likeBtn">추천 <span id="likesCount">${post.likes}</span></a>
 	                  	<a class="btn text-light d-none" style="background-color: #005B48; width: 80px;" id="unlikeBtn">추천 ${post.likes} </a>                 	  
                	  </c:if>
	                  <a href="list?${cri.qs2}" class="btn text-light" style="background-color: #005B48; width: 80px;">목록</a>
	                  <c:if test="${cri.category == 2 or cri.category == 5}">
	                  <a href="report?" class="btn btn-secondary text-light" style="width: 80px;" onclick="customConfirm.confirm('해당 글을 신고하시겠습니까?','신고')">신고</a>                    
                	  </c:if>
                	</c:if>          	
                </div>   

                 
	${reply2.id} ${member}


            </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
	
        <script src="${cp}js/alert.js"></script>
 		<script src="/donation_heaven/js/reply.js"></script>	
        <script>
        	$(function() {
        		$("#likeBtn").click(function(){
        			event.preventDefault();
        			const id = $("#memberId").val(); 
        			const pno = $("#postPno").val(); 
        			console.log("aa");
        			customConfirm.confirm('추천하시겠습니까?',"추천").then(function() {
        				$.ajax({
        					url: "${cp}post/like",
        					type: "POST",
        					data: {id:id, pno:pno},
        					success: function(response) {
        						  if (response === "success") {
        							  console("gg");
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
 
		

        
        <script>
        console.log(replyService);
			moment.locale('ko');            
            const pno = '${post.pno}';
            const id = "${member.id}";
            // replyService.write({content : 'aaaa'})

            function list(cri,myOnly) {
                replyService.list(pno, cri, function(data) {
                    if(!data.list.length) {
                        $(".btn-more-reply")
                        .prop("disabled", true)
                        .text("댓글이 없습니다.")
                        .removeClass("btn-primary")
                        .addClass("btn-secondary");
                        return;
                    }
                    let str = "";
                    let myStr = "";
                    for(let i in data.list) {
                        str += makeLi(data.list[i])
                    }
                    for(let i in data.myList) {
                        myStr += makeLi(data.myList[i])
                    }

                    $(".replies").html(str);
                    /* if(myOnly){
                        return false;
                    } */
                    $(".my-replies").html(myStr);
                    // 추가 css 작업
                    $(".my-replies .text-secondary, .my-replies .text-black").removeClass("text-secondary text-black")
                });
            }
            list();
           

        function makeLi(reply){
        	
            return `<div class="comment-item border-bottom pb-3 mb-3" data-rno="\${reply.rno}" id="rnoId">
            <div class="d-flex justify-content-between">
            <span class="fw-bold" >\${reply.id}</span>
            <span class="">\${moment(reply.regdate,'yyyy/MM/DD-HH:mm:ss').fromNow()}</span>



        </div>
        <p class="mt-2">\${reply.content}</p>
        <div class="d-flex justify-content-between">
            <span class="text-muted"><a href="#" id="ddd"><i class="fa fa-thumbs-up" ></i></a> \${reply.likes} </span>
	            <c:if test="\${reply.id == member.id}">
            		<span>
	                <a href="#" class="text-danger me-3" id="update">수정</a> / 
	                <a href="#" class="text-danger ms-2" id="delete">삭제</a>
		            </span>
	            </c:if>
        </div>
    </div>`;
        }
        
        
        //좋아요 버튼 클릭시
        $(document).on("click", "#ddd", function(event) {
            event.preventDefault(); 
            
        });

        
        
        $(document).on("click", "#delete", function() {
        	const $li = $(this).closest("li");
            if(! confirm("삭제 하시겠습니까?")) {
                return false;
            }
            const rno = $(this).closest("#rnoId").data("rno");
            console.log(rno);
            replyService.remove(rno, function(data) {
                alert("삭제 되었습니다");
                $li.remove();
                list(undefined, true);
          	});
            return false;
        });
        /*     event.preventDefault(); 
            
            alert("dd");
        }); */
        //li 클릭시 이벤트
        $(document).on("click", "#update", function() {
        	const rno = $(this).closest("#rnoId").data("rno");
            console.log(rno);
            $("#replyModal").modal("show");
            replyService.view(rno, function(data) {
            	console.log(data);
                $("#replyModal").find(".modal-footer div button").hide()
                    .filter(":gt(0)").show();
				
                $("#replyModal").data("rno", rno).modal("show");

                $("#replyContent2").val(data.content);

                $("#replyWriter2").val(data.id);
                console.log(data);
            })
        });

        // 삭제 버튼 클릭시 이벤트
        // $(".replies").on("click",$("#deletebtn"),function(){
        //     event.preventDefault();
        //     if(!confirm("삭제 하겠습니까?")){
        //         return;
        //     }
        //     const rno = $(this).closest("li").data("rno");
        //     replyService.remove(rno,function(data){
        //         alert("삭제 되었습니다");
        //         list();
        //     });
        // });

        $(".replies, .my-replies").on("click", "li .btn-reply-remove",function(){
            
            if(!confirm("삭제 하겠습니까?")){
                return false;
            }
            const $li = $(this).closest("li");
            const rno = $li.data("rno");
            replyService.remove(rno,function(data){
                alert("삭제 되었습니다");

                $li.remove();

                list(undefined, true);
                
            });
            return false;
        });

        // 댓글 더보기 버튼 클릭시
        $(".btn-more-reply").click(function() {
                const lastRno = $(".replies li:last").data("rno");
                list({lastRno});
            });
		
        // 댓글 작성(반영) 버튼 클릭시
    	$("#replyWrite").on("click",function(e) {
    		e.preventDefault();
    		const content = $("#replyContent").val();
    		const reply = {pno, id, content};
    		console.log(reply);
    		replyService.write(reply, function(data) {
    			list(undefined, true);
    			$("#replyContent").val("");
    		});
            
    	});
        
        //댓글쓰기 버튼 클릭시
        $("#btnReplyWrite").click(function(){

                $("#replyModal").find(".modal-footer div button").hide().filter(":eq(0)").show();
                $("#replyModal").modal("show");
                $("#replyContent").val("");
                $("#replyWriter").val("${member.id}");
                list(undefined, true);
        });
        $(function(){
			//댓글수정
            $("#btnReplyModifySubmit").click(function(){
				console.log("ddd");
                const rno = $("#replyModal").data("rno");
                const content = $("#replyContent2").val();
                const reply = {rno,content};
                console.log(rno);
                replyService.modify(reply,function(data){
                    $("#replyModal").modal("hide");
                    const $li = $(`.replies li[data-rno='\${rno}'] p`).text(content);
                    list(undefined,true);
                    // location.reload();
                });
            });

        });
        
        </script>
    </body>
    </html>