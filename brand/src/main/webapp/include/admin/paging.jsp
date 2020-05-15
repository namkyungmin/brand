<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<div class="row">
                <div class="col-sm-5" >
                    <div class="dataTables_info" id="example1_info" role="status" aria-live="polite" style="display:none">
			                     게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
			         </div>
                </div>
                <div class="col-sm-7">
                	<div class="dataTables_paginate paging_simple_numbers" id="list_paginate">
                        <ul class="pagination">
	                        <li class="paginate_button previous" id="list_previous"><a href="#" onClick="fn_paging(1)"><<</a></li>
                        	<li class="paginate_button previous" id="list_previous"><a href="#"  onClick="fn_paging('${pagination.prevPage }')"><</a></li>
                        	<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
	                        	<c:choose>
		                        	<c:when test="${pageNum eq  pagination.curPage}">
		                        	<li class="paginate_button active"><a href="#">${pageNum }</a></li>
		                        	</c:when>
		                        	<c:otherwise>
		                        	<li class="paginate_button"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:forEach>
                        	<c:if test="${fn:length(list)==0}">
	                        	<li class="paginate_button active"><a href="#">1</a></li>
                        	</c:if>
                        	<li class="paginate_button next" id="list_next"><a href="#" onClick="fn_paging('${pagination.nextPage>=pagination.pageCnt?pagination.pageCnt:pagination.nextPage }')">></a></li>
                        	<li class="paginate_button next" id="list_next"><a href="#" onClick="fn_paging('${pagination.pageCnt }')">>></a></li>
						</ul>
                   </div>
				</div>
            </div>