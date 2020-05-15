<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                        <div class="paging_wrap">
                            <span class="arrow_wrap left">
                                <a href="javascript:void(0)"  onClick="fn_paging('${pagination.prevPage }')"><img src="/resources/mobile/images/common/bg_arrow_left01.png" alt=""></a>
                            </span>
                            <ul class="paging">
							<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
	                        	<c:choose>
		                        	<c:when test="${pageNum eq  pagination.curPage}">
	                                <li>
	                                    <a href="#" class="on">${pageNum }</a>
	                                </li>
		                        	</c:when>
		                        	<c:otherwise>
		                        	<li><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></li>
		                        	</c:otherwise>
		                        </c:choose>
                        	</c:forEach>
                        	<c:if test="${fn:length(list)==0}">
	                        	<li class="on"><a href="#">1</a></li>
                        	</c:if>                            
                            </ul>
                            <span class="arrow_wrap right">
                                <a href="#" onClick="fn_paging('${pagination.nextPage }')"><img src="/resources/mobile/images/common/bg_arrow_right01.png" alt=""></a>
                            </span>
                        </div>            