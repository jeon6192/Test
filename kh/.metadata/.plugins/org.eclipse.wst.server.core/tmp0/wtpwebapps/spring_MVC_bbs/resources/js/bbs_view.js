function wrapWindow(){
    $('.div_chk').empty();
    $('.input_pass').val('');
    
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    $('#mask').fadeIn(500);
    $('#mask').fadeTo(100);    

    const divWidth = maskWidth/2 - 150+'px';
    const divHeight = maskHeight/2 - 200+'px';
    $('.div_in').css('left', divWidth);
    $('.div_in').css('top', divHeight);
    $('.div_in').show();
}

$(document).ready(function(){
    //검은 막을 눌렀을 때
    $('#mask').click(function () {  
        $(this).hide();  
        $('.div_in').hide();
    }); 
    
    $('.span_x').click(function(){
        $('#mask').hide();
        $('.div_in').hide();
    });
    
    $('.btn_delete').click(function () {
        var pass = $('#bbs_pass').val();
        var inputPass = $('.input_pass').val();
        var page = $('#page').val();
        var num = $('#bbs_num').val();
        
        if(pass != inputPass) {
            $('.div_chk').empty().append('비밀번호가 틀렸습니다.').hide().fadeIn(800);
            setTimeout(function() {
                $('.div_chk').fadeOut(800, function() {
                    $(this).empty().show();
                });
              }, 3000);
        } else {
            $('#mask, .div_in').hide();  
            location.href='./bbs_delete.nhn?num='+num+'&page='+page;
        }
    });
    
    console.log('!width : '+$(window).width());
    $(window).scroll(function() {
       //console.log('top : ' + $(window).scrollTop() + '\nheight : ' + $(window).height());
    });

    $( window ).resize( function() {
       console.log('width : ' + $(window).width());
    });
});