// const replyService =  {};
const replyService = (function() {
    const url = "/donation_heaven/post/reply";
	function aaa(){
		alert("dddd");
	}
    function write(reply,callback) {
        
        // reply
        const data = JSON.stringify(reply);
        console.log(data);
        $.post({
            url,
            data,
        }).done(function(data){
            console.log(data);
            if(callback){
                callback(data);
            }
        })
        // if(callback){
        //     callback();
        // }
    }
	function list(pno, cri, callback) {
        let reformedUrl = url + "/list/" + pno;
		
		console.log(reformedUrl);
        if(cri && cri.lastRno) {
            reformedUrl += "/" + cri.lastRno;
            if(cri.amount) {
                reformedUrl += "/" + cri.amount;
            }
        }
        $.getJSON(reformedUrl).done(function(data) {
			const rp = data.list; 
			        console.log("aaa:", rp);
			        
			        rp.forEach(reply => {
			            makeLi(reply);
			        });


            if(callback)
            callback(data);
        });
    }
    function view(rno,callback){
        $.getJSON(url + "/" + rno).done(function(data){
            if(callback)
                callback(data);
        })
    }
    function modify(reply,callback){
        const data = JSON.stringify(reply);
        $.ajax(url,{
            method : 'put',
            data
        }).done(function(data){
            if(callback)
                callback(data);
        })
    }
    function remove(rno,callback){
        console.log(rno);
        $.ajax(url + "/" + rno,{
            method : 'delete'
        }).done(function(data){
            if(callback)
                callback(data);
        })
    }
    return {write, list,view,modify,remove,aaa}
})();