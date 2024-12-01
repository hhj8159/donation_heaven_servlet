
function CustomAlert() {
  this.alert = function (message, title) {
    return new Promise((resolve) => {
      // 경고창 요소를 동적으로 생성
      let dialogoverlay = document.createElement("div");
      dialogoverlay.id = "dialogoverlay";

      let dialogbox = document.createElement("div");
      dialogbox.id = "dialogbox";
      dialogbox.classList.add("slit-in-vertical");

      let dialogContent = `
        <div>
          <div id="dialogboxhead"></div>
          <div id="dialogboxbody"></div>
          <div id="dialogboxfoot"></div>
        </div>
      `;
      dialogbox.innerHTML = dialogContent;

      document.body.appendChild(dialogoverlay);
      document.body.appendChild(dialogbox);

      let winH = window.innerHeight;
      dialogoverlay.style.height = winH + "px";
      dialogbox.style.top = "20%";
	  
	  
	  
	  
	   /* http://localhost:8080/semi/updatePassword
	        http://localhost:8080/donation_heaven/post/view?pno=97&page=1&amount=10&category=2&type=&keyword=*/
/*			const aaa = location.href;

			var url = new URL(aaa);
			var urlparams = url.searchParams;
			var pno = urlparams.get('pno');
			var page = urlparams.get('page');
			var amount = urlparams.get('amount');
			var category = urlparams.get('category');
			var type = urlparams.get('type');
			var keyword = urlparams.get('keyword');
	          if(aaa == "http://localhost:8080/semi/updatePassword"){
	              dialogbox.style.top = "20%";
	          }else if(aaa == "http://localhost:8080/donation_heaven/post/view?pno="+pno+"&page="+page+"&amount="+amount+"&category="+category+
	          "&type="+type+
	          "&keyword="+keyword){
	              dialogbox.style.top = "60%";
	              
	          }else{
	              dialogbox.style.top = "20%";
	              console.log(aaa);
	          }*/
	  
	  
	  

      dialogoverlay.style.display = "block";
      dialogbox.style.display = "block";

      if (typeof title === "undefined") {
        document.getElementById("dialogboxhead").style.display = "none";
      } else {
        document.getElementById("dialogboxhead").innerHTML =
          '<i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' + title;
      }

      document.getElementById("dialogboxbody").innerHTML = message;
      document.getElementById("dialogboxfoot").innerHTML =
        '<button class="pure-material-button-contained active">확인</button>';

		let confirmButton = document
		  .getElementById("dialogboxfoot")
		  .querySelector("button");

		if (confirmButton) {
		  confirmButton.addEventListener("click", () => {

		    closediv();
		    resolve(true);
		  });
		  function closediv() {
		       document.getElementById("dialogbox").style.display = "none";
		       document.getElementById("dialogoverlay").style.display = "none";

		       document.body.removeChild(document.getElementById("dialogbox"));
		       document.body.removeChild(document.getElementById("dialogoverlay"));
		   }
		}
    });
  };
}
function CustomConfirm() {
  this.confirm = function (message, title) {
    return new Promise((resolve, reject) => {
      // 경고창 요소를 동적으로 생성
      let dialogoverlay = document.createElement("div");
      dialogoverlay.id = "dialogoverlay";

      let dialogbox = document.createElement("div");
      dialogbox.id = "dialogbox";
      dialogbox.classList.add("slit-in-vertical");

      let dialogContent = `
        <div>
          <div id="dialogboxhead"></div>
          <div id="dialogboxbody"></div>
          <div id="dialogboxfooter">
            <span id="dialogboxfoot"></span>
            <span id="dialogboxfoot2"></span>
          </div>
        </div>
      `;
      dialogbox.innerHTML = dialogContent;

      document.body.appendChild(dialogoverlay);
      document.body.appendChild(dialogbox);
	  
	  
	  

	          
	  
	  
	  
	  

      let winH = window.innerHeight;
      dialogoverlay.style.height = winH + "px";
      dialogbox.style.top = "20%";
	  
	  
	  
/*
	          http://localhost:8080/semi/updatePassword
	       http://localhost:8080/donation_heaven/post/view?pno=97&page=1&amount=10&category=2&type=&keyword=*/
/*		   const aaa = location.href;

		   var url = new URL(aaa);
		   var urlparams = url.searchParams;
		   var pno = urlparams.get('pno');
		   var page = urlparams.get('page');
		   var amount = urlparams.get('amount');
		   var category = urlparams.get('category');
		   var type = urlparams.get('type');
		   var keyword = urlparams.get('keyword');
	          if(aaa == "http://localhost:8080/semi/updatePassword"){
	              dialogbox.style.top = "20%";
	          }else if(aaa == "http://localhost:8080/donation_heaven/post/view?pno="+pno+"&page="+page+"&amount="+amount+"&category="+category+
	          "&type="+type+
	          "&keyword="+keyword){
	              dialogbox.style.top = "50%";
	              
	          }else{
	              dialogbox.style.top = "20%";
	              console.log(aaa);
	          }*/

      dialogoverlay.style.display = "block";
      dialogbox.style.display = "block";
		
      if (typeof title === "undefined") {
        document.getElementById("dialogboxhead").style.display = "none";
      } else {
        document.getElementById("dialogboxhead").innerHTML =
          '<i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' + title;
      }

      document.getElementById("dialogboxbody").innerHTML = message;
      document.getElementById("dialogboxfoot").innerHTML =
        '<button class="pure-material-button-contained active">확인</button>';
      document.getElementById("dialogboxfoot2").innerHTML =
        '<button class="pure-material-button-contained2">취소</button>';

      // 이벤트 리스너 추가
      let confirmButton = document
        .getElementById("dialogboxfoot")
        .querySelector("button");

      let cancelButton = document
        .getElementById("dialogboxfoot2")
        .querySelector("button");

      if (confirmButton) {
        confirmButton.addEventListener("click", () => {
          closediv();
          resolve(true);
        });
      }

      if (cancelButton) {
        cancelButton.addEventListener("click", () => {
          closediv();
          reject(false);
        });
      }

      function closediv() {
        document.getElementById("dialogbox").style.display = "none";
        document.getElementById("dialogoverlay").style.display = "none";

        document.body.removeChild(document.getElementById("dialogbox"));
        document.body.removeChild(document.getElementById("dialogoverlay"));
      }
    });
  };
}

let customAlert = new CustomAlert();
let customConfirm = new CustomConfirm();