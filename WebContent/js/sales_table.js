/**
 * 
 */

 /* 매출분석 정보 테이블마다 바뀌는 함수 */
    function sale_table_day(sale_date_mo, cal_day){
    	$.ajax({
    		url : "sale_table.do",
    		method : "post",
    		data : {
    			'sale_date_mo': sale_date_mo,
    			'cal_day' : cal_day
    		},
    		dataType:"json",
    		success:function(data){
    		var cont= "";
    		var cnt= 1;
    		$.each(data, function(key, value){
    			cont +="<tr> <td>"+ cnt +"</td><td>"+value.name+"</td></tr>";
    			cnt++;
    			
    		})
    		$('#table_date_ajax').html(cont);
    		console.log(data);
    		}
    	});
    }
    
    /* 매출분석 정보 테이블마다 바뀌는 함수끝 */