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