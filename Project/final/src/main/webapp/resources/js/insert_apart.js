$(document).ready(function(){
	$('.select_station').click(function(){
		
		var xhr = new XMLHttpRequest();
		var url = 'http://openapi.tago.go.kr/openapi/service/SubwayInfoService/getKwrdFndSubwaySttnList'; /*URL*/
		var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'TVCsVr8g3adcmCcALi9bYrk2cLFJEr3fCn16ZYY0FYOtOs6n5lC'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('subwayStationName') + '=' + encodeURIComponent('역삼'); /*지하철역명*/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
		    }
		};

		xhr.send('');
		
	});
});