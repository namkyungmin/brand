<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>A/S문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my question as">
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
                        <li><a href="/my/faq">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li class="on"><a href="/my/as">A/S 문의</a></li>
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
                        <li class="btm">
                            <a href="/my/as">A/S 문의</a>
                        </li>
                        <li class="on btm">
                            <a href="/my/as/list">문의내역 관리</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="tb_list">
                        <table>
                            <colgroup>
                                <col width="*">
                                <col width="76px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
			                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                    <td>
                                        <a href="/my/as/view?as_id=${data.asId}">${data.title }</a></td>
                                    </td>
                                    <td>
                                    	<c:if test="${data.status =='대기'}">
                                        <span class="state_flag wait">
                                            		대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기
                                        </span>
                                        </c:if>
                                        <c:if test="${data.status =='답변완료'}">
                                        <span class="state_flag complete">
                                            		답변완료
                                        </span>
                                        </c:if>                                        
                                        <c:if test="${data.status =='답변불가'}">
                                        <span class="state_flag complete">
                                            		답변완료
                                        </span>
                                        </c:if>                                        
                                    </td>
                                </tr>			    
			                    </c:forEach>
								<c:if test="${fn:length(list)==0}">
			                    <tr>
                                    <td colspan="2">
                                        문의하신 내역이 없습니다.
                                    </td>
                                </tr>
			                    </c:if>       			                    
                            </tbody>
                        </table>
                        <%@ include file="/include/mobile/paging.jsp" %>
                    </div>
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
    </script>
</html>