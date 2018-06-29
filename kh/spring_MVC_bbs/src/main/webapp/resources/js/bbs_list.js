$(document).ready(function(){
	var limit = $('.limit').val();
	$('.sel_limit option').each(function(){
		if ($(this).val() == limit){
			$(this).attr('selected', 'selected');
		}
	});
	
	$('.div_bbsName').click(function(){
		location.href='./bbs_list.nhn';
	});
   $('.btn_write').click(function(){
       location.href='./bbs_write.nhn';
   });
   
   $('.sel_limit').change(function(){
	   console.log('?');
		var limit=$('.sel_limit option:selected').val();
		var item = $('.item').val();
		var keyword = $('.keyword').val();
		
		$.ajax({
			type : "POST",
			data : {"limit" : limit, "state" : "ajax"},
			url : "./bbs_list.nhn?item="+item+"&keyword="+keyword,
			cache : false,
			headers : {"cache-control" : "no-cache", "pragma" : "no-chache"},
			success: function(data){
				$(".ul_list").empty().prepend(data);
			},
			error: function() {
				alert("error");
			}
		});
   });
});

function search(){
    var item = $('.sel_search').val();
    var keyword = $('.input_search').val();
    
    if (item == 0){
        alert('검색조건을 선택해주세요!');
    } else {
        location.href = './bbs_list.nhn?item=' + item + '&keyword=' + keyword;
    }
}