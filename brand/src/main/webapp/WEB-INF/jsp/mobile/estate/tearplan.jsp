<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>연간분양계획 | 분양단지 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub estate tearplan">
        <%@ include file="/include/mobile/gnb.jsp" %>
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
                        <li class="on"><a href="/estate/tearplan">연간분양계획</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <h3>2020년 분양계획</h3>
                    <div class="tb_list">
                        <table>
                            <colgroup>
                                <col stlye="width:90px;">
                                <col stlye="width:auto;">
                                <col stlye="width:94px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>분양일정</th>
                                    <th colspan="2">단지명</th>
                                </tr>
                            </thead>
                            <tbody>
			                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                	<c:if test="${month !=  data.parcelPlanMonth}">
                                    <td rowspan="${data.parcelPlanCnt }" class="month">
                                        ${data.parcelPlanYear}년  ${data.parcelPlanMonth}월
                                    </td>
                                    </c:if>
                                    <c:set var="month" value="${data.parcelPlanMonth}" />
                                    <td class="parcelname">
                                        ${data.parcelName}
                                    </td>
                                    <td class="btn_area">
				                        <c:if test="${data.inquiry!=''}">
					                        <a href="tel:${data.inquiry}" class="btn_tel">전화걸기</a>
				                        </c:if>
				                        <c:if test="${data.homepageUrl!=''}">                                        
                                        <a href="${data.homepageUrl}" class="btn_outlink" target="${data.homepageUrlTarget }">
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
                            </tbody>
                        </table>
                    </div>

                    <!-- s: 검색결과가 없을경우 -->
                    <!-- <div class="no_result">
                        <p>
                            검색하신 정보가 없습니다.
                        </p>
                    </div> -->
                    <!--// e: 검색결과가 없을경우 -->
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.btnFavor();
    </script>
</body>
</html>