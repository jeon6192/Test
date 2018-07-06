function pwd_find(){
	window.open("pwd_find.nhn","비번찾기","width=400,height=300, left=500, top=350");
	//자바 스크립트에서 window객체의 open("팝업창경로와 파일명","팝업창이름","팝업창속성")
	//메서드로 새로운 팝업창을 만듬 폭이 400,높이가 300인 새로운 팝업창을 만듬 . 단위는 픽셀 
}
$(document).ready(function(){
	$('#div_mask').click(function () {  
		$(this).hide();  
		$('.div_login').hide();
	});
	$('#btn_login, #span_login, #img_login, #input_login').click(function(){
		$('.id').val('');
	    $('.div_chk').empty();
	    $('.password').val('');
	    
	    var maskHeight = $(document).height();  
	    var maskWidth = $(window).width();  

	    $('#div_mask').css({'width':maskWidth,'height':maskHeight});  

	    $('#div_mask').fadeIn(500);
	    $('#div_mask').fadeTo(100);    

	    const divWidth = maskWidth/2 - 150+'px';
	    const divHeight = maskHeight/2 - 200+'px';
	    $('.div_login').css('left', divWidth);
	    $('.div_login').css('top', divHeight);
	    $('.div_login').show();
	    
	    
	    //$(".div_login").load("jsp/member/login.jsp");
	    $(".div_login").load("member_loginbox.nhn");
	});
});