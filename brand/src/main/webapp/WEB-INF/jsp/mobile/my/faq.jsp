<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>자주 묻는 질문 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my faq">
        <%@ include file="/include/mobile/gnb.jsp" %>
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
                        <li class="on"><a href="/my/faq">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <!-- s: tabNav -->
                <div class="tab_nav type01">
                    <ul>
                         <li <c:if test="${ param.category==null}">class="on"</c:if>>
                             <a href="faq">전체</a>
                         </li>
                         <li  <c:if test="${param.category=='parcel'}">class="on"</c:if>>
                             <a href="faq?category=parcel">분양관련</a>
                         </li>
                         <li class="btm<c:if test="${param.category=='move'}"> on</c:if>">
                             <a href="faq?category=move">입주관련</a>
                         </li>
                         <li class="btm<c:if test="${param.category=='etc'}"> on</c:if>">
                             <a href="faq?category=etc">기타</a>
                         </li>                    
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <ul class="faq_wrap">
                    <c:forEach var="data" items="${list}"  varStatus="status">
                        <li>
                            <div class="question">
                                <div class="flag_wrap">
                                	<c:if test="${data.category=='parcel' }">
                                    <span class="sale">분양</span>
                                    </c:if>
                                    <c:if test="${data.category=='move' }">
                                    <span class="move_in">입주</span>
                                    </c:if>
                                    <c:if test="${data.category=='etc' }">
                                    <span class="etc">기타</span>
                                    </c:if>                                
                                </div>
                                <div class="tit_wrap">
                                    <p>
                                        ${data.title}
                                    </p>
                                </div>
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

                    <%@ include file="/include/mobile/paging.jsp" %>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.accodian();
    </script>
</html>