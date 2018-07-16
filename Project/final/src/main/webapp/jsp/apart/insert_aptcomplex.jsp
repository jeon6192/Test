<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="../resources/css/insert_apart.css" rel="stylesheet" type="text/css">
		
	</head>
	
	<body>
	
		<ul class="ul_insert">
		
			<li class="li_map">
			
				<div class="div_map_area">
					<div class="div_map">
						<h2>~지도~</h2>
					</div>
				</div>
				
			</li>
			
			<li class="li_info1">
			
				<div class="div_aptname">
					<div class="div_aptname_span">
						<span class="span_info">
							아파트명
						</span>
					</div>
					<div class="div_aptname_input">
						<input type="text" name="complex_apartname" class="input_cpx_apartname">
					</div>
				</div>
				
				<div class="div_cpx_count">
				
					<div class="div_cpx_count_top">
						<div class="div_cpx_count_span">
							<span class="span_info">
								단지 내 아파트 개수
							</span>
						</div>
						<div class="div_cpx_input">
							<select class="select_cpx_count">
								<option value="0">동 수</option>
								<option value="1">1</option>
								<option value="1">2</option>
								<option value="1">3</option>
								<option value="1">4</option>
								<option value="1">5</option>
								<option value="1">6</option>
								<option value="1">7</option>
								<option value="1">8</option>
								<option value="1">9</option>
							</select>
							<input type="text" class="input_cpx_count">
							&nbsp; <b>동</b>
						</div>
					</div>
					
					<div class="div_cpx_btn">
						<button type="button" class="btn_cpx_count">입력</button>
					</div>
				</div>
					
				
			</li>
			
			<li class="li_info2">
				<div class="div_apart_info">
					<div class="div_apart_info_detail">
						세부사항
					</div>
				</div>
				
				<div class="div_cpx_info">
					<div class="div_cpx_info_span">
						<span class="span_info">
							아파트 소개
						</span>
					</div>
					<div class="div_cpx_info_text">
						<textarea rows="15" cols="10" class="textarea_cpx_info"></textarea>
					</div>
				</div>
			</li>
			
			<li class="li_info3">
				<div class="div_apart_pdate">
					<div class="div_apart_pdate_span">
						<span class="span_info">
							분양 시기
						</span>
					</div>
					<div class="div_apart_pdate_cal">
						
					</div>
				</div>
				
				<div class="div_apart_subway">
					<div class="div_apart_subway_span">
						<span class="span_info">
							역세권
						</span>
					</div>
					<div class="div_apart_subway_detail">
						<ul class="ul_subway_detail">
							<li class="li_subway_top">
								<div class="div_subway_top">
									<input type="checkbox" class="chk_subway">
								</div>
							</li>
							<li class="li_subway_bottom">
								<div class="div_subway_bottom">
									<select class="select_station">
										<option value="0">지하철역</option>
										<option value="1">1</option>
										<option value="1">2</option>
										<option value="1">3</option>
										<option value="1">4</option>
										<option value="1">5</option>
										<option value="1">6</option>
										<option value="1">7</option>
										<option value="1">8</option>
										<option value="1">9</option>
									</select>
									<input type="text" class="input_foot">
									&nbsp; <b>분</b>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</li>
			
			
		</ul>
		
	</body>
</html>