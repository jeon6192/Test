<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="./resources/js/bbs_list.js"></script>

<c:set var="p" value="${pageMap}"/>
<c:set var="s" value="${searchMap}"/>
	<c:if test="${p.listCount>=1}">
		<li class="li_title">
			<div class="div_limit">
				<select class="sel_limit">
					<option value="3">3줄 보기</option>
					<option value="5">5줄 보기</option>
					<option value="7">7줄 보기</option>
					<option value="10">10줄 보기</option>
				</select>
			</div>
			<div class="div_bbsName">게시판</div>
			<div class="div_bbsCount">글 개수 : ${p.listCount }</div>
		</li>
		<li class="li_title2">
			<div class="div_num">번호</div>
			<div class="div_subject">제목</div>
			<div class="div_writer">작성자</div>
			<div class="div_date">날짜</div>
			<div class="div_readCount">조회수</div>
		</li>
		
		
		<c:set var="num" value="${p.listCount-(p.page-1)*p.limit }"/>
		<li class="li_body">
			<c:forEach var="bbs" items="${bbsBeanList }">
				<div class="div_body">
					<div class="div_num">
						<c:out value="${num }"/>
						<c:set var="num" value="${num-1 }"/>
					</div>
					<div style="text-align: left;" class="div_subject">
						<c:if test="${bbs.bbs_re_lev!=0 }">
							<c:forEach var="a" begin="0" end="${bbs.bbs_re_lev*2 }" step="1">
								&nbsp;
							</c:forEach>
							<img class="img_arrow" src="./resources/images/arrow.png">
						</c:if>
						<c:if test="${bbs.bbs_re_lev==0 }">
							&nbsp;
						</c:if>
						<a class="a_subject" href="./bbs_detail.nhn?num=${bbs.bbs_num }&page=${p.page}">
							${bbs.bbs_subject }
						</a>
					</div>
					<div class="div_writer">${bbs.bbs_name }</div>
					<div class="div_date" style="line-height: 1;">${bbs.bbs_date }</div>
					<div class="div_readCount">${bbs.bbs_readcount }</div>
				</div>
			</c:forEach>
		</li>
		
		<li class="li_page">
			<div class="div_page">
				<c:if test="${p.page<=1 }">
					이전&nbsp;
				</c:if>
				<c:if test="${p.page>1 }">
					<a href="./bbs_list.nhn?page=${p.page-1}&item=${s.item}&keyword=${s.keyword}&limit=${p.limit}">이전</a>&nbsp;
				</c:if>
				
				<c:forEach var="a" begin="${p.startPage }" end="${p.endPage }">
					<c:if test="${a==p.page }">
						<span class="span_page">${a}</span>
					</c:if>
					<c:if test="${a!=p.page }">
						<a href="./bbs_list.nhn?page=${a}&item=${s.item}&keyword=${s.keyword}&limit=${p.limit}">${a }</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${p.page>=p.maxPage }">
					&nbsp;다음
				</c:if>
				<c:if test="${p.page<p.maxPage }">
					&nbsp;<a href="./bbs_list.nhn?page=${p.page+1}&item=${s.item}&keyword=${s.keyword}&limit=${p.limit}">다음</a>
				</c:if>
				
			</div>
			<input type="hidden" class="page" value="${p.page}">
			<input type="hidden" class="item" value="${s.item}">
			<input type="hidden" class="keyword" value="${s.keyword}">
			<input type="hidden" class="limit" value="${p.limit}">
		</li>
		
	</c:if>
	
	
	<c:if test="${p.listCount==0}">
		<li class="li_title">
			<div class="div_bbsName">MVC 게시판</div>
			<div style="text-align:right;"><font style="margin-right:15px;" size=2>등록된 글이 없습니다.</font></div>
		</li>
	</c:if>
		<li class="li_bottom2">
			<div class="div_bbsWrite">
				<div class="div_search">
					<select name="search" class="sel_search">
						<option value="0" selected>검색</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
						<option value="4">제목+내용</option>
					</select>
					<input type="text" name="input_search" class="input_search">
					<div class="div_shadow"></div>
					<button class="btn_search" onclick="search()">검색</button>
				</div>
				<button class="btn_write" type="button">글쓰기</button>
			</div>
		</li>