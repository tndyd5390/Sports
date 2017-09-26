/**
 * 
 */

	function plItemCnt(price){
		var qty = parseInt($('#prod_qty').val());
		if(qty<99){
			qty += 1;
			$('#prod_qty').val(qty);
			$('#prod_price').text(addComma(qty * price));
		}
	}
	
	function miItemCnt(price){
		var qty = parseInt($('#prod_qty').val());
		if(qty>1){
			qty -= 1;
			$('#prod_qty').val(qty);
			$('#prod_price').text(addComma(qty * price));
		}
	}
	function addComma(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	function addBasket(){
		var userNo = '<%=userNo%>';
		var prod_no = '<%=CmmUtil.nvl(pDTO.getProd_no())%>';
		var price = $('#prod_price').text();
		if(userNo == ""){
			alert("로그인을 해주세요");
			location.href="login.do";
		}else{
			var sel = document.getElementsByName('optSelect');
			var selectedItemArray = [];
			for(var i = 0 ;i< sel.length; i++){
				for(var j = 0; j < sel[i].options.length; j++){
					if(sel[i].options[j].selected == true){
						if(sel[i].options[j].value == "-1"){
							alert("옵션을 선택해 주세요");
							return;
						}
						selectedItemArray.push(sel[i].options[j].value);
					}
				}
			}
			$.ajax({
				url : "customer/addBasket.do",
				data : {
					'prod_no' : prod_no,
					'prod_qty' : document.getElementById('prod_qty').value,
					'opt_no' : selectedItemArray,
					'bsk_price' : unComma(price)
				},
				method : "post",
				success : function(data){
					var result = parseInt(data);
					if(result == 1){
						alert("장바구니에 담았습니다.");
					}else{
						alert("장바구니 담기에 실패했습니다.");
					}
				},
				error:function(x,e){
					if(x.status==0){
			            alert('네트워크가 정상적으로 동작하지 않습니다.');
			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
			            }else if(x.status==404){
			            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(x.status==500){
			            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(e=='parsererror'){
			            alert('json파싱에 실패했습니다.');
			            }else if(e=='timeout'){
			            alert('응답 요청 시간이 지났습니다.');
			            }else {
			            alert('Unknow Error.n'+x.responseText);
			            }
			    }
			});
		}
	}

	function updateProd(pNo){
		location.href="productUpdate.do?pNo="+pNo;
	}
	
	function deleteProd(pNo){
		if(confirm("삭제 하시겠습니까?")){
			location.href="productDelete.do?pNo="+pNo;
			return true;
		}else{
			return false;
		}
	}
