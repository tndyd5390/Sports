/**
 * 
 */
    /* 모리스 js 매출 분석 정보 달력 클릭시 마다 바뀌는 함수*/

    function sale_moris_day(sale_date_mo , cal_day){
  	  $.ajax({
  		url: "sale_chart.do",
  		method: "post",
  		data: {
  			'sale_date_mo' : sale_date_mo,
  			'cal_day' : cal_day
  		},
  		dataType: "json",
  		success : function(data){
  			var dt ="";
  			var arr = new Array();
  			$.each(data, function(key, value){
/*     				if(value.sum_price==null){
  					dt={y : "2000-11-11", a:0}
  				} */
  				dt={y: value.sale_date, a: value.sum_price}
  				arr.push(dt)
  											});
  			console.log(arr)
				/*  네비바 */
				 Morris.Bar({
                  element: 'morris-bar-chart',
                  data: arr,
                  xkey: 'y',
                  ykeys: ['a'],
                  labels: ['매출'],
                  hideHover: 'auto',
                  resize: true
            
              });
			}			      
		});   
    }
    
    /* 모리스 js 매출 분석 정보 달력 클릭시 마다 바뀌는 함수 끝*/