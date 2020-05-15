<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>자주 묻는 질문 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my faq">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>마이 아너스빌</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/my/faq" class="on">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li <c:if test="${ param.category==null}">class="on"</c:if>>
                                <a href="faq">전체</a>
                            </li>
                            <li  <c:if test="${param.category=='parcel'}">class="on"</c:if>>
                                <a href="faq?category=parcel">분양관련</a>
                            </li>
                            <li  <c:if test="${param.category=='move'}">class="on"</c:if>>
                                <a href="faq?category=move">입주관련</a>
                            </li>
                            <li  <c:if test="${param.category=='etc'}">class="on"</c:if>>
                                <a href="faq?category=etc">기타</a>
                            </li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <ul class="faq_wrap">
                    <c:forEach var="data" items="${list}"  varStatus="status">
                        <li>
                            <div class="question">
                                <a href="">
                                    <div class="flag_wrap">
                                        <c:if test="${data.category=='parcel' }">
                                        <span class="sale">분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양</span>
                                        </c:if>
                                        <c:if test="${data.category=='move' }">
                                        <span class="move_in">입&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주</span>
                                        </c:if>
                                        <c:if test="${data.category=='etc' }">
                                        <span class="etc">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;타</span>
                                        </c:if>
                                    </div>
                                    <div class="tit_wrap">
                                        <p>
                                            ${data.title}
                                        </p>
                                    </div>
                                </a>
                            </div>
                            <div class="answer">
                                <p>
                                    ${data.contents}
                                </p>
                            </div>
                        </li>
                    </c:forEach>
                    <c:if test="${fn:length(list)==0}">
                    <li>	
                    	<div class="question no_info">
                    		<div class="tit_wrap">
                    		정보가 없습니다.
                    		</div>
                    	</div>
                    </li>
                    </c:if>                        
                    </ul>
                    <%@ include file="/include/paging.jsp" %>
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
        honorsvilleBrand.btnFavor();
        honorsvilleBrand.accodian();
    </script>
</body>
</html>