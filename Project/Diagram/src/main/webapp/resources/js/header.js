function login() {
	$('.id').val('');
	$('.div_chk').empty();
	$('.password').val('');

	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	$('#div_mask').css({
		'width' : maskWidth,
		'height' : maskHeight
	});

	$('#div_mask').fadeIn(500);
	$('#div_mask').fadeTo(100);

	const divWidth = maskWidth / 2 - 150 + 'px';
	const divHeight = maskHeight / 2 - 200 + 'px';
	$('.div_login').css('left', divWidth);
	$('.div_login').css('top', divHeight);
	$('.div_login').show();

	$(".div_login").load("jsp/login.jsp");
}

$(document).ready(function() {
	// 검은 막을 눌렀을 때
	$('#div_mask').click(function() {
		$(this).hide();
		$('.div_login').hide();
	});

	const icon = $('.header_icon');
	const text = $('.header_text');

	console.log('!width : ' + $(window).width());

	if ($(window).width() < 1000) {
		icon.show();
	} else {
		text.show();
	}

	$(window).resize(function() {
		console.log('width : ' + $(window).width());
		if ($(window).width() < 1000) {
			text.hide();
			icon.show();
		} else {
			icon.hide();
			text.show();
		}

	});
	

	$(window).scroll(function() {
		// console.log('top : ' + $(window).scrollTop() + '\nheight : ' +
		// $(window).height());
		
		if ($(window).scrollTop() > $(window).height() / 100) {
			$('header').css({
				'box-shadow' : '0 1px 10px gray',
			});
		} else {
			$('header').css({
				'box-shadow' : '',
			});
		}
		
		/*console.log("window.scrollTop : "+$(window).scrollTop()+" == document.height() : "+$(document).height()
				+" - window.height() : "+$(window).height() + "\n - : "+($(document).height() - $(window).height()));
		if ($(document).height() < 4000){
			if ($(window).scrollTop() >= ($(document).height() - $(window).height()) -1 ) {
				console.log('gogo');
				$('.div_temp_cont').append('<div style="width: 100%; height: 500px;"><h1 align="center">zz</h1></div>');
			}
			
		}*/
		
		
	});
});