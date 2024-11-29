<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		
  		const notified = fetch(`${cp}donationpay/pay`, {
	      method: "POST",
	      headers: { "Content-Type": "application/json" },
	      // imp_uid와 merchant_uid, 주문 정보를 서버에 전달합니다
	      body: JSON.stringify({
	        // 주문 정보...
	        buyerAddr:'',
			buyerEmail:'',
			buyerName:'',
			buyerTel:'',
			cardName:'',
			cardNumber:'',
			impUid:'',
			merchantUid:'',
			donationTypeName:'',
			price:12345,
			payType:'',
			name:'',
			pgTid:''
	      }),
	    });

	    console.log(notified);
</script>
</body>
</html>