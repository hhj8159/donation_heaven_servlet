function CustomAlert(){
  this.alert = function(message, title){
    // 경고창 요소를 동적으로 생성
    let dialogoverlay = document.createElement('div');
    dialogoverlay.id = 'dialogoverlay';

    let dialogbox = document.createElement('div');
    dialogbox.id = 'dialogbox';
    dialogbox.classList.add('slit-in-vertical');

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
	const aaa = location.href;
/*	alert(aaa);
	http://localhost:8080/semi/updatePassword*/
	
	if(aaa == "http://localhost:8080/semi/updatePassword"){
		dialogbox.style.top = "20%";
	}else{
		dialogbox.style.top = "20%";
		
	}
	


    dialogoverlay.style.display = "block";
    dialogbox.style.display = "block";

    document.getElementById('dialogboxhead').style.display = 'block';

    if (typeof title === 'undefined') {
      document.getElementById('dialogboxhead').style.display = 'none';
    } else {
      document.getElementById('dialogboxhead').innerHTML = '<i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' + title;
    }

    document.getElementById('dialogboxbody').innerHTML = message;
    document.getElementById('dialogboxfoot').innerHTML = '<button class="pure-material-button-contained active" onclick="customAlert.ok()">확인</button>';
  }

  this.ok = function(){
    // 경고창을 닫을 때 DOM에서 제거
    document.getElementById('dialogbox').style.display = "none";
    document.getElementById('dialogoverlay').style.display = "none";

    document.body.removeChild(document.getElementById('dialogbox'));
    document.body.removeChild(document.getElementById('dialogoverlay'));
  }
}
function CustomConfirm(){
	 this.confirm = function(message, title){
	    // 경고창 요소를 동적으로 생성
	    let dialogoverlay = document.createElement('div');
	    dialogoverlay.id = 'dialogoverlay';

	    let dialogbox = document.createElement('div');
	    dialogbox.id = 'dialogbox';
	    dialogbox.classList.add('slit-in-vertical');

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
		const aaa = location.href;
	/*	alert(aaa);
		http://localhost:8080/semi/updatePassword*/
		
		if(aaa == "http://localhost:8080/semi/updatePassword"){
			dialogbox.style.top = "20%";
		}else{
			dialogbox.style.top = "20%";
			
		}
		


	    dialogoverlay.style.display = "block";
	    dialogbox.style.display = "block";

	    document.getElementById('dialogboxhead').style.display = 'block';

	    if (typeof title === 'undefined') {
	      document.getElementById('dialogboxhead').style.display = 'none';
	    } else {
	      document.getElementById('dialogboxhead').innerHTML = '<i class="fa fa-exclamation-circle" aria-hidden="true"></i> ' + title;
	    }

	    document.getElementById('dialogboxbody').innerHTML = message;
	    document.getElementById('dialogboxfoot').innerHTML = '<button class="pure-material-button-contained active" onclick="customConfirm.ok()">확인</button>';
		document.getElementById('dialogboxfoot2').innerHTML = '<button class="pure-material-button-contained2 " onclick="customConfirm.no()">취소</button>';
	  }

	  this.ok = function(){
		    // 경고창을 닫을 때 DOM에서 제거
		    document.getElementById('dialogbox').style.display = "none";
		    document.getElementById('dialogoverlay').style.display = "none";
	
		    document.body.removeChild(document.getElementById('dialogbox'));
		    document.body.removeChild(document.getElementById('dialogoverlay'));
			return true;
		
		}
	  this.no = function(){
		// 경고창을 닫을 때 DOM에서 제거
		document.getElementById('dialogbox').style.display = "none";
		document.getElementById('dialogoverlay').style.display = "none";

		document.body.removeChild(document.getElementById('dialogbox'));
		document.body.removeChild(document.getElementById('dialogoverlay'));
			return console.log(false);
	  }
	  
}

let customAlert = new CustomAlert();
let customConfirm = new CustomConfirm();