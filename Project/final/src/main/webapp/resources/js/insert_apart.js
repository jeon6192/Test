$(document).ready(function() {
	
	$('.div_subway_bottom input').css('background-color', '#d8d8d8');
	$('.div_subway_bottom').css({
		'pointer-events' : 'none',
		'padding-top' : '10px'
	});
	$('.chk_subway').change(function(){
		if ($('.chk_subway').prop('checked') == false) {
			$('.div_subway_bottom').css('pointer-events', 'none');
			$('.div_subway_bottom input').css('background-color', '#d8d8d8');
		} else {
			$('.div_subway_bottom').css('pointer-events', 'unset');
			$('.div_subway_bottom input').css('background-color', 'transparent');
		}
	});
	
	
    $(".input_subway").autocomplete({
        source: function(request, response){
        	var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
        	$.ajax({
				url : '../resources/json/subway.json',
				dataType : "json",
				data : request.term,
				success : function(data) {
					response($.map(data.DATA, function(v,i){
	                    var text = v.station_nm;
	                    if ( text && ( !request.term || matcher.test(text) ) ) {
	                        return {
	                                label: v.station_nm,
	                                value: v.station_nm
	                        };
	                    }
					}));
				}
			});
        },
        messages: {
            noResults: '',
            results: function() {}
        },
        select: function(event, ui) {
            console.log(ui.item);
        },
        focus: function(event, ui) {
            return false;
        }

    });
    
    $('.btn_cpx_count').click(function(){
    	var front = $('.select_cpx_count').val();
    	var back = $('.input_cpx_count').val();
    	
    	if (back > 20) {
    		alert('20동 이하까지만 가능');
    		$('.input_cpx_count').val('').focus();
    		return false;
    	}
    	
    	$('.div_detail_left').css('background-color', '#d8d8d8');
    	$('.div_apart_info_detail').css('border', '1px solid #dfdfdf');
    	
    	var apart = [];
    	var left = '';
		var right = '';
		var right_script = '<script>';
    	
    	for (let i = 1; i <= back; i++) {
    		if (i < 10) {
    			apart[i] = front + '0' + i;
    		} else {
    			apart[i] = front + i;
    		}
    		
    		left += '<div class="div_apart_dong" id="detail_left'+i+'" onclick="select_apart('+i+')">'+apart[i]+
    			'<input type="hidden" name="apartBeanList['+(i-1)+'].apart_dong" value="'+apart[i]+'"></div>';
    		
    		right += '<div class="div_dong_detail" id="detail_right'+i+'">'
    			+'<ul class="ul_dong_detail">'
    			+'<li class="li_dong_detail0">'+apart[i]+'동</li>'
    			+'<li class="li_dong_detail1"><div class="div_dong_detail1">층수&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_floor" placeholder="층" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail2"><div class="div_dong_detail2">면적&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_area" placeholder="m²" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail3"><div class="div_dong_detail3">방 개수&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_room" placeholder="개" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail4"><div class="div_dong_detail4">화장실&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_toilet" placeholder="개" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'<li class="li_dong_detail5"><div class="div_dong_detail5">가격&nbsp;<input type="text" name="apartBeanList['+(i-1)+'].apart_price" placeholder="만원" onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)"> </div></li>'
    			+'</ul><div class="div_dong_detail_img">' 
    			+'<input type="hidden" role="uploadcare-uploader" id="image'+apart[i]+'" data-images-only="true" data-multiple="true" onclick="insert_img('+apart[i]+')" />' 
    			+'<div id="showImage'+apart[i]+'" class="showImg"></div>' 
    			+'<input type="hidden" id="img_hidden'+apart[i]+'" name="apartBeanList['+(i-1)+'].apart_interior" value="">'
				+'</div></div>';
				
			right_script += 'uploadcare.MultipleWidget("[id=image'+apart[i]+']").onUploadComplete(function(info){'
							+ 'insert_img(info, '+apart[i]+'); });';
		}
		
		right_script += '</script>';

    	$('.div_detail_left').empty().append(left);
		$('.div_detail_right').empty().append(right).append(right_script);
		
		$('.div_dong_detail_img').css({
			'width' : '58%', 
			'height' : '100%'
		});
    	$('.div_apart_dong').css({
    		'height' : '20px'
    	});
    	$('.ul_dong_detail').css({
    		'box-sizing' : 'border-box',
    		'padding' : '3px',
    		'width' : '40%',
			'height' : '100%',
			'display' : 'inline-block'
		});
		$('.uploadcare--widget__dragndrop-area').css('display', 'none');
    	$('.ul_dong_detail>li').css({
    		'box-sizing' : 'border-box',
    		'height' : '16.666%',
    		'width' : '100%',
    		'padding-top' : '5px'
    	});
    	$('.li_dong_detail0').css({
    		'font-size' : '12pt',
    		'color' : 'blue'
    	});
    	$('.ul_dong_detail>li>div').css({
    		'height' : '100%',
    		'width' : '100%',
    		'padding-right' : '80px'
    	});
    	$('.ul_dong_detail li input').css({
    		'width' : '40%',
    		'float' : 'right'
		});
		$('.uploadcare--widget.uploadcare--widget_status_ready').css({
			'height' : '15%',
			'padding-top' : '0.5em'
		});
		$('.div_dong_detail_img>.showImg').css('height', '85%');
		$('canvas.uploadcare--progress__canvas').css({
			'width' : '15%',
			'margin' : '0 auto'
		});
    	
    	
    	$('.div_dong_detail').css({
    		'position' : 'absolute',
    		'left' : '0',
    		'display' : 'none'
    	});
    	$('#detail_right1').css('display', 'block');
    	$('#detail_left1').css({
			'background-color' : 'yellow',
			'cursor' : 'pointer'
		});
    	
    	
	});
	
    
	
});


function insert(){
	if($('.input_cpx_apartname').val() == ''){
			alert('insert aptname!');
			$(this).focus();
			return false;
		}

	if(typeof $('.div_dong_detail').val() === 'undefined'){
		alert('add!');
		return false;
	}

	var count = 0;
	$('.ul_dong_detail li>div>input').each(function(){	
		count++;
		if ($(this).val() == ''){
			alert('insert detail!');
			$(this).focus();
			return false;
		}
	});

	if(count != $('.ul_dong_detail li>div>input').length){
		return false;
	}

	//return ture;
}

UPLOADCARE_LOCALE = "ko";
UPLOADCARE_TABS = "file url";
UPLOADCARE_PUBLIC_KEY = "c45d0fc9bcc9538a677e";
UPLOADCARE_LOCALE_TRANSLATIONS = {
	buttons: {
		cancel: 'Cancel',
		remove: 'Remove',
		choose: {
			images: {
			one: '파일 첨부',
			other: '파일 첨부'
			}
		}
	}
};

function insert_img(info, id) {
	var url=[];
	console.log(info.cdnUrl);
	
	var showImage = '#showImage' + id;
	var img_hidden = '#img_hidden' + id;
	console.log(showImage + '  ' + img_hidden);
	
	$('#showImage'+id).empty();
	$('#img_hidden'+id).attr('value', '');
	var length=info.cdnUrl.charAt(info.cdnUrl.length-2);
	
	for(var i=0;i<length;i++){
		url[i]=info.cdnUrl+"nth/"+i+"/";
		$('#showImage'+id).append('<img src="'+url[i]+'-/resize/x100/"/>');
		url[i]+="-/resize/500x/ ";
		var val=$('#img_hidden'+id).attr('value');
		$('#img_hidden'+id).attr('value', val+url[i]);
	}
	
}


function select_apart(num) {
	$('.div_apart_dong').css('background-color', 'transparent');
	$('.div_dong_detail').css('display', 'none');
	
	var id1 = '#detail_left' + num;
	var id2 = '#detail_right' + num;
	$(id1).css('background-color', 'yellow');
	$(id2).css('display', 'block');
}

function onlyNumber(e){
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}

function removeChar(e) {
	e = e || window.e;
	var keyID = (e.which) ? e.which : e.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		e.target.value = e.target.value.replace(/[^0-9]/g, "");
}