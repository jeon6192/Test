$(function() {

	function selectData(url, senddata) {

		/*   $.getJSON(url,senddata,function(rdata){
		$(rdata).each(function(index,item){
		 var out ='';
		 out+="<li>";
		 out+="<div>id</div>";
		 out+="<div>"+item.id+"</div>";
		 out+="</li>";
		 out+="<li>";
		 out+="<div>name</div>";
		 out+="<div>"+item.name+"</div>";
		 out+="</li>";
		 out+="<li>";
		 out+="<div>modelnumber</div>";
		 out+="<div>"+item.modelnumber+"</div>";
		 out+="</li>";
		 out+="<li>";
		 out+="<div>series</div>";
		 out+="<div>"+item.series+"</div>";
		 out+="</li>";
		 $("#result").append(out);                  
		})//each end
		})//getJSON end    
		 */

		$.ajax({
			url : url,
			data : senddata,
			dataType : 'json',
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			success : function(responsedata) {
				$(responsedata).each(function(index, item) {
					var out = '';
					
					out += '<li class="li_id">';
					out += '<div>id</div>';
					out += '<div>' + item.id + '</div>';
					out += '</li>';
					out += '<li class="li_name">';
					out += '<div>name</div>';
					out += '<div>' + item.name + '</div>';
					out += '</li>';
					out += '<li class="li_number">';
					out += '<div>modelnumber</div>';
					out += '<div>' + item.modelnumber + '</div>';
					out += '</li>';
					out += '<li class="li_series">';
					out += '<div>series</div>';
					out += '<div>' + item.series + '</div>';
					out += '</li>';
					
					$("#result").append(out);
				})
				$("#name").val('');
				$("#modelnumber").val('');
				$("#series").val('');
			}
		})//ajax end

	}//selectData function end
	

	//초기 화면에 데이터를 표시 합니다.
	selectData('./jsontest3', null);

	$("#insert_form").submit(function(e) {
		if ($("#name").val() == '') {
			alert("name을 입력하세요");
			return false;
		}
		if ($("#modelnumber").val() == '') {
			alert("momdelnumber를 입력하세요");
			return false;
		}
		if ($("#series").val() == '') {
			alert("series를 입력하세요");
			return false;
		}

		//전송할 데이터들을 직렬화 합니다.
		//입력 양식에 입력한 데이터를 쿼리 스트링으로 바꿉니다.
		//name =" "&modelnumber=" "&series=" "
		var senddata = $(this).serialize();

		selectData('./jsontest2', senddata);

		e.preventDefault();
	})//form submit
	
	
	$(window).scroll(function() {
        if ($(window).scrollTop() > $(window).height() / 100) {
			$('.header_div').css({
				'box-shadow': '0 1px 10px gray',
			});
		} else {
			$('.header_div').css({
				'box-shadow': '',
			});
		}
     });
	
})//document function end

function dropbox(){
	className = $('a').children('i').attr('class');
	
	if (className == 'fa fa-angle-up') {
		$('.header_div').animate({'top' : '-250px'}, 480);
		$('i').attr('class', 'fa fa-angle-down');
		$('.div_arrow').animate({'top' : '0px'});
	} else {
		$('.header_div').animate({'top' : '0px'});
		$('i').attr('class', 'fa fa-angle-up');
		$('.div_arrow').animate({'top' : '210px'}, 440);
	}
}