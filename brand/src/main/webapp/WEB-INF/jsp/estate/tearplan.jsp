<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>연간분양계획 | 분양단지 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub estate tearplan">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>분양단지</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/estate/sale/list">분양중인 단지</a></li>
                        <li><a href="/estate/plan/list">분양예정 단지</a></li>
                        <li><a href="/estate/apt/list">분양완료 단지</a></li>
                        <li><a href="/estate/tearplan" class="on">연간분양계획</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <h3>분양계획</h3>
                    <div class="tb_list">
                        <table>
                            <colgroup>
                                <col style="width:200px;">
                                <col style="width:auto;">
                                <col style="width:250px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>분양시기(예정)</th>
                                    <th>단지명</th>
                                    <th>홈페이지</th>
                                </tr>
                            </thead>
                            <tbody>
			                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                	<c:if test="${month !=  data.parcelPlanMonth}">
                                    <td rowspan="${data.parcelPlanCnt }" class="month">
                                        ${data.parcelPlanYear}년 ${data.parcelPlanMonth}월
                                    </td>
                                    </c:if>
                                    <c:set var="month" value="${data.parcelPlanMonth}" />
                                    <td>
                                        ${data.parcelName}
                                    </td>
                                    <td>
                                    	<c:if test="${data.homepageUrl!=''}">     
                                        <a href="${data.homepageUrl}" class="basic_btn outlink" target="${data.homepageUrlTarget }">
                                            <span>홈페이지 바로가기</span>
                                        </a>
                                        </c:if>
                                    </td>
                                </tr>			                    
			                    </c:forEach>
			                    <c:if test="${fn:length(list)==0}">
			                    <tr>	
			                    	<td colspan="3">정보가 없습니다.</td>
			                    </tr>
			                    </c:if>
			                    <!--                              
                                <tr>
                                    <td rowspan="2" class="month">
                                        3월
                                    </td>
                                    <td>
                                        송추 북한산 경남아너스빌
                                    </td>
                                    <td>
                                        <a href="#" class="basic_btn outlink">
                                            <span>홈페이지 바로가기</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        송추 북한산 경남아너스빌
                                    </td>
                                    <td>
                                        <a href="#" class="basic_btn outlink">
                                            <span>홈페이지 바로가기</span>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="month">
                                        4월
                                    </td>
                                    <td>
                                        송추 북한산 경남아너스빌
                                    </td>
                                    <td>
                                        <a href="#" class="basic_btn outlink">
                                            <span>홈페이지 바로가기</span>
                                        </a>
                                    </td>
                                </tr>
                                 -->
                            </tbody>
                        </table>
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
    </script>
</body>
</html>