<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <style>
        .pagination a:hover { background-color: #ffffff; font: #005B48;}     
    </style>
</head>
   <body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp" />       
        <main class="container">
             <h2 class="mt-5 font-color bold-text;"><b> 
	            <c:if test="${cri.category == 1}">공지사항</c:if>
	            <c:if test="${cri.category == 2}">자유게시판</c:if>
	            <c:if test="${cri.category == 3}">질문과 답변</c:if>
	            <c:if test="${cri.category == 4}">봉사인증</c:if>
	            <c:if test="${cri.category == 5}">자료실</c:if>            
       		</b></h2>
           
			<div class="my-3 col-md-9 mx-auto">
                <form method="post" action="write?page=1&${cri.qs}">
                	<input type="hidden" class="form-control" id="id" name="id" value="${member.id}">
                	
	                <label for="title" class="form-label mt-3"><b> 제목</b></label>
	                <input type="text" class="form-control" id="title" placeholder="title" name="title">
	
	                <label for="content" class="form-label mt-3"><b> 내용</b></label>
	                <textarea class="form-control" rows="20" id="content" name="content" placeholder="content"></textarea>
	
	             	<label for="attach" class="form-label my-1"><span class="btn text-light btn-sm" style="background-color: #005B48;">파일 첨부</span></label>
	             	<span class="mx-2 attach-count-txt"></span>
	                <input type="file" id="attach" accept="image/png, image/jpeg, image/gif, image/webp" name="files" class="d-none" multiple>
						<div id="preview">
    					</div>
                    <ul class="list-group attach-result">					
                    </ul>
	                                 
                    <div class="text-center text-light my-5">
	                	<button class="btn text-light" style="background-color: #005B48; width: 70px;">작성</button>
	                    <a href="list" class="btn text-light" style="background-color: #005B48; width: 70px;">목록</a>
	                </div>
	                <div class="uploaded-input">
	                </div>
                </form>
            </div>          
        </main>
        <jsp:include page="../common/footer.jsp"></jsp:include>
   </div>
    
   <script>
		function previewFiles() {
			var preview = document.querySelector("#preview");
			var files = document.querySelector("input[type=file]").files;

			function readAndPreview(file) {
				// `file.name` 형태의 확장자 규칙에 주의하세요
				if (/\.(jpe?g|png|gif|webp)$/i.test(file.name)) {
				var reader = new FileReader();

				reader.addEventListener(
					"load",
					function () {
					var image = new Image();
					image.height = 150;
					image.title = file.name;
					image.src = this.result;
					preview.appendChild(image);
					},
					false,
				);

				reader.readAsDataURL(file);
				}
			}

			if (files) {
				[].forEach.call(files, readAndPreview);
			}
		}
		
	/* 유효성체크해야함 - 개수, 크기, 확장자 제한*/
	
		$("#attach").change(function() {
			const url = '${cp}'+'upload';
			console.log(url);
			const formData = new FormData();
			const files = this.files;
			
			if(!files){
				$(".attach-count-txt").text("");
				$(".attach-result").empty();
				return;
	
			}
			for(let i = 0; i < files.length; i++){
				formData.append("file",files[i]);
			}
			$.post({
				url,
				contentType:false,
				processData:false,
				data:formData
			})
			.done(function(data) {
				$(".attach-count-txt").text(data.length + "개의 파일");
				let str = '';
				let strHidden = '';
				
				for(let i in data){
					str += `<li class="list-group-item">\${data[i].origin}</li>`;
					strHidden += `<input type="hidden" name="uuid" value="\${data[i].uuid}">`;
					strHidden += `<input type="hidden" name="origin" value="\${data[i].origin}">`;
					strHidden += `<input type="hidden" name="image" value="\${data[i].image}">`	
					strHidden += `<input type="hidden" name="path" value="\${data[i].path}">`;
					
				}
				
				$(".attach-result").html(str);
				$(".uploaded-input").html(strHidden);
				
			});
            previewFiles();
			$("#preview").empty();

		});
	</script>
</body>
</html>