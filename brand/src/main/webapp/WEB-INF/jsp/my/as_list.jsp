<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>문의내역 관리 | A/S문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my question list">
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
                        <li><a href="/my/faq">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as" class="on">A/S 문의</a></li>
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
                            <li>
                                <a href="/my/as">A/S 문의</a>
                            </li>
                            <li class="on">
                                <a href="/my/as/list">문의내역 관리</a>
                            </li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="tb_list">
                        <table>
                            <colgroup>
                                <col width="105px">
                                <col width="">
                                <col width="130px">
                                <col width="130px">
                                <col width="155px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>답변일</th>
                                    <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
			                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                    <td>
                                       ${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}
                                    </td>
                                    <td>
                                        <a href="/my/as/view?as_id=${data.asId}">${data.title }</a></td>
                                    </td>
                                    <td>
                                        ${fn:substring(data.regTime,0,10)}
                                    </td>
                                    <td>
                                        ${fn:substring(data.replyTime,0,10) }
                                    </td>
                                    <td>
                                    	<c:if test="${data.status =='대기'}">
                                        <span class="state wait">
                                            		대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기
                                        </span>
                                        </c:if>
                                        <c:if test="${data.status =='답변완료'}">
                                        <span class="state complete">
                                            		답변완료
                                        </span>
                                        </c:if>
                                        <c:if test="${data.status =='답변불가'}">
                                        <span class="state complete">
                                            		답변완료
                                        </span>
                                        </c:if>
                                    </td>
                                </tr>			    
			                    </c:forEach>
			                    <c:if test="${fn:length(list)==0}">
			                    <tr>	
			                    	<td colspan="5" class="text-center">정보가 없습니다.</td>
			                    </tr>
			                    </c:if> 
                            </tbody>
                        </table>
                        <%@ include file="/include/paging.jsp" %>
                    </div>
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