	function prodReg(){
		location.href="productReg.do";
	}
	function prodDetail(pNo){
		location.href="productDetail.do?pNo="+pNo
	}
	
	function prodList(){
		$('#moremore').show();
		readMore = 6;
		var contents = "";
		var btn = '<a href="#" class="moremore" onclick="prodMore(); return false;">더보기</a>'
		$('#moremore').html(btn);
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
	function prodMore(){
		var contents = "";
		var count = 0;
		$.ajax({
			url : 'moreProdList.do',
			method : 'post',
			data : {'readMore' : readMore},
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
					count += 1;
				});
				if(count<6){
					$('#moremore').hide();
				}
				$('#goods_list').append(contents);
				readMore += 6;
			}
		});
	}
	function selectProdMore(){
		var contents = "";
		var count = 0;
		$.ajax({
			url : 'selectMoreProdList.do',
			method : 'post',
			data : {'readMore' : readMore, 'parents_no' : parents_no},
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
					count += 1;
				});
				if(count<6){
					$('#moremore').hide();
				}
				$('#goods_list').append(contents);
				readMore += 6;
			}
		});
	}
	
	
	function prodSelect(pNo){
		$('#moremore').show();
		readMore = 6;
		var contents = "";
		var count = 0;
		var btn = '<a href="#" class="moremore" onclick="selectProdMore(); return false;">더보기</a>'
		$('#moremore').html(btn);
		parents_no = pNo;
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
					count += 1;
				});
				if(count<6){
					$('#moremore').hide();
				}
				if(data.length==0){
					alert('등록된 상품이 없습니다.');
					$('#moremore').hide();
				}
				$('#goods_list').html(contents);
			}
		});
	}
