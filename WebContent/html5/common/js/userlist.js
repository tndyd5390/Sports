/**
 * 
 */
function userList(){
	var count = 0;
	var contents ="";
	var more = "";
	$.ajax({
		url : 'userListProc.do',
		method : 'post',
		success : function(data){
			$.each(data, function(key, value){
				contents += "<ul class='col-5'>";
				contents += "<li><p><input type='checkbox' class='chkbox' id='chk_item'></p></li>";
				contents += "<li><p>"+value.user_no+"</p></li>";
				contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
				contents += "<li><p>"+value.user_name+"</p></li>";
				contents += "<li><p>"+value.auth+"</p></li>";
				contents += "</ul>";
			})
			if(data[0].count>10){
			more += "<div class='more-type' id='more-type'>";
			more += "<a href='#' class='moremore' onclick='moreUserList(); return false;'>더보기</a>";
			more += "</div>";
			}
			$('#userList').html(contents);
			$('#more-div').html(more);
			contents="";
			more = "";
		}
	})
}
function moreUserList(){
	var contents ="";
	var more = "";
	$.ajax({
		url : 'moreUserListProc.do',
		method : 'post',
		data : {'readMore' : readMore},
		success : function(data){
			$.each(data, function(key, value){
				contents += "<ul class='col-5'>";
				contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
				contents += "<li><p>"+value.user_no+"</p></li>";
				contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
				contents += "<li><p>"+value.user_name+"</p></li>";
				contents += "<li><p>"+value.auth+"</p></li>";
				contents += "</ul>";
			})
			if(data[0].count>10){
			more += "<div class='more-type' id='more-type'>";
			more += "<a href='#' class='moremore' onclick='moreUserList(); return false;'>더보기</a>";
			more += "</div>";
			}
			$('#userList').append(contents);
			$('#more-div').html(more);
			contents="";
			more = "";
			readMore += 10;		
		}
	})
}
function doSearch(){
	var contents ="";
	var more = "";
	var searchType = $('#searchType').val();
	var searchValue = $('#searchValue').val();
	if(searchValue == ""){
		userList()
	}else{
	$.ajax({
		url : 'userListSearch.do',
		method : 'post',
		data : {'type' : searchType,
				'value' : searchValue},
		success : function(data){
					$.each(data, function(key, value){
						contents += "<ul class='col-5'>";
						contents += "<li><p><input type='checkbox' class='chkbox'></p></li>";
						contents += "<li><p>"+value.user_no+"</p></li>";
						contents += "<li><p><a href='userDetail.do?uNo="+value.user_no+"'>"+value.user_id+"</a></p></li>";
						contents += "<li><p>"+value.user_name+"</p></li>";
						contents += "<li><p>"+value.auth+"</p></li>";
						contents += "</ul>";
					})
					$('#userList').html(contents);
					contents="";					
			}
	})
	}
}
