/**
 * 
 */
	function prodReg(){
		location.href="productReg.do";
	}
	function prodDetail(pNo){
		location.href="productDetail.do?pNo="+pNo
	}
	
	function prodList(){
		var contents = "";
		$.ajax({
			url : 'productAll.do',
			method : 'post',
			success : function(data){
				$.each(data, function(key, value){
					contents += "<li>";
					contents += "<a href='#' onclick='prodDetail("+value.prod_no+"); return false;'>";
					contents += "<div class='thumb'>";
					contents += "<img src='"+value.main_src+"' alt='thumb'>";
					contents += "</div>";
					contents += "<div class='info'>";
					contents += "<p class='title'>"+value.prod_name+"</p>";
					contents += "<p class='price edit'>"+value.prod_price+"</p>"
					contents += "</div>"
					contents += "</a>";
					contents += "</li>";
				});
				$('#goods_list').html(contents);
			}
		});
	}
	
	function prodSelect(pNo){
		var contents = "";
		$.ajax({
			url : 'productSelect.do',
			method : 'post',
			data : {'pNo' : pNo},
			success : function(data){
				$.each(data, function(key, value){
					contents += "<li>";
					contents += "<a href='#' onclick='prodDetail("+value.prod_no+"); return false;'>";
					contents += "<div class='thumb'>";
					contents += "<img src='"+value.main_src+"' alt='thumb'>";
					contents += "</div>";
					contents += "<div class='info'>";
					contents += "<p class='title'>"+value.prod_name+"</p>";
					contents += "<p class='price edit'>"+value.prod_price+"</p>"
					contents += "</div>"
					contents += "</a>";
					contents += "</li>";
				});
				$('#goods_list').html(contents);
			}
		});
	}