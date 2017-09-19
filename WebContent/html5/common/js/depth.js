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
