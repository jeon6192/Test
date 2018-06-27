$(document).ready(function(){
    if ($("#upfile").val() == "") {
        $("#close").hide();
    }
    $("#upfile").change(function() {
        var a = $("#upfile").val().split('\\');
        $("#filevalue").text(a[a.length-1]);
        $("#close").show();
        $(this).hide();
    });
    $("#close").click(function() {
        $("#close").hide();
        $("#filevalue").text("")
        $('#upfile').val('').show();
    });
});
function check(){
    if($('#name').val() == ''){
        alert('글쓴이를 입력');
        return false;
    }
    if($('#pass').val() == ''){
        alert('비밀번호를 입력');
        return false;
    }
    if($('#subject').val() == ''){
        alert('제목을 입력');
        return false;
    }
    if($('#content').val() == ''){
        alert('내용을 입력');
        return false;
    }
}