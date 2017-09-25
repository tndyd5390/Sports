	function inputFile(){
		var mainfileTarget = $('#main_file');
		var detailfileTarget = $('#detail_file');
		
		mainfileTarget.on('change',function() {
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('#main_label').val(filename);
		});
		
		detailfileTarget.on('change',function() {
			if (window.FileReader) {
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('#detail_label').val(filename);
		});
	};
	
	function UpSelected(parents , select){
		var contents = '';
		$.ajax({
			url : 'selectParents.do',
			method : 'post',
			data : {'parents' : parents},
			success : function(data){
				$.each(data, function(key,value){
					if(value.category_no == select){
						contents += "<option value='"+value.category_no+"' selected>"+value.category_name+"</option>";
					}else{
						contents += "<option value='"+value.category_no+"'>"+value.category_name+"</option>";
					}
				});
			$('#child_depth').html(contents);
			}
		});
	};
	
	function selected(parents){
		var contents = '';
		$.ajax({
			url : 'selectParents.do',
			method : 'post',
			data : {'parents' : parents},
			success : function(data){
				$.each(data, function(key,value){
					contents += "<option value='"+value.category_no+"'>"+value.category_name+"</option>";
				});
			$('#child_depth').html(contents);
			}
		});
	};
	
	function selectDepth(){
		$('#parents_depth').on('change', function(){
			parents = $(this).val();
			selected(parents);
		});
	};
	function optList(){
		var contents ="";
		$.ajax({
			url : 'selectOpt.do',
			method : 'post',
			success : function(data){
				$.each(data,function(key, value){
					contents += "<option value="+value.code_no+">"+value.code_name+"</option>";
				});
				$('#optParents').append(contents);
			}
		});
	}
	
	function optAdd(){
		var contents = "";
		var optParents = $('#optParents option:selected');
		
		if(optParents.val() == 0){
			alert("옵션을 선택하세요.");
			return false;
		}else{
			contents += "<div class='input_btn_wrap' name='opt_child'>";
			contents += "<input type='text' name='opt_name' placeholder='"+optParents.text()+"을 추가하세요'>";
			contents += "<input type='text' name='opt_price' placeholder='추가금' value='0'>";
			contents += "<input type='hidden' name='opt_parents' value='"+optParents.val()+"'>";
			contents += "<button type='button' class='opt-line-btn' name='btn' onclick='optDel(this)'>제거</button>"
			contents += "</div>";
			$('#opt_list').append(contents);
			return true;
		}
	}
	function optDel(obj){
		var index = $('#opt_list [name=btn]').index(obj);
		$('#opt_list [name=opt_child]').eq(index).remove();
	}
