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
});