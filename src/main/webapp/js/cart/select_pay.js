/**
 * select_Pay.js
 */
 
 $(".select-orderBtn").click(function(){
			
			var amount = $('.finalPrice_span').text();
			var amount_pay = '';
			var change_cart_noArr = [];
			let kind = -1;
			var order_name = '';
			$(".cart_info").each(function(index, element){
		 		if($(element).find(".cart_checkbox").is(":checked") == true){
		 			
		 			change_cart_noArr.push($(element).find(".cart_checkbox").data('no'));
			 		order_name = ($(element).find(".cart_checkbox").data('name'))
		 			
			 		kind ++;
		 		}
		 		
			});
			
			if(kind != 0){
			 	order_name = order_name.substring(0,5)+'...외 '+kind+'종';
			 	amount_pay = amount.substring(0,3);
			}else{
				amount_pay = amount.substring(0,2);
			}
			
			var m_id = '<c:out value="${m_id}"/>';
			var name = '<c:out value="${mvo.m_name}"/>';
			var email = '<c:out value="${email}"/>';
			var addr = '<c:out value="${mvo.m_jibunAddr}"/>';
			var post = '<c:out value="${mvo.m_post}"/>';
			var order_no = parseInt(new Date().getTime());
			var merchant_id = 'merchant_'+order_no;
			
			 IMP.init('imp53454156');
			  
			  IMP.request_pay({
			    pg: 'html5_inicis',
			    pay_method: 'card',
			    merchant_uid : merchant_id,
			    name : order_name,
			    amount : amount_pay,
			    buyer_email : email,
			    buyer_name : name,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : addr,
			    buyer_postcode : post
			  }, function (rsp) { // callback
				 console.log(rsp);
			     if(rsp.success){
			    	 $.ajax({
			 			type:'post',
			 			url:'/cart/order_ok',
			 			traditional:true, //ajax 배열 넘기기 옵션
			 			data: {
			 				change_cart_noArr : change_cart_noArr,
			 				order_no : order_no,
			 				m_id : m_id,
			 				order_name : order_name,
			 				order_price : amount
			 			},
			 			dataType: "text",
			 			success:function(result){
			 				if(result == 'SUCCESS'){
			 					alert('결제가 완료 되었습니다.');
			 					location.reload();
			 				}
			 			}
			 		});
			     }else{
			    	 var msg = '결제에 실패하였습니다.';
			    	 msg += '에러내용 : ' + rsp.error_msg;
			     }	  
			  }); 
			 });