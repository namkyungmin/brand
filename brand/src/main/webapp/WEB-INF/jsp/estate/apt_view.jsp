<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>상세 | 분양단지 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub estate view">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>분양단지</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec01">
                    <div class="tit_wrap">
                    	<c:if test="${data.parcelStage=='분양중' && data.parcelType == '상가분양'}">
                        <span class="flag store_on">${data.parcelStage }</span>
                        </c:if>
                        <c:if test="${data.parcelStage=='분양중' && data.parcelType != '상가분양'}">
                        <span class="flag on">${data.parcelStage }</span>
                        </c:if>			                        
                        <c:if test="${data.parcelStage=='분양예정'  && data.parcelType == '상가분양'}">
                        <span class="flag store_on">${data.parcelStage }</span>
                        </c:if>
                        <c:if test="${data.parcelStage=='분양예정'  && data.parcelType != '상가분양'}">
                        <span class="flag scheduled">${data.parcelStage }</span>
                        </c:if>			                        
                        <c:if test="${data.parcelStage=='분양완료'  && data.parcelType == '상가분양'}">
                        <span class="flag store_on">${data.parcelStage }</span>
                        </c:if>                                    
                        <c:if test="${data.parcelStage=='분양완료'  && data.parcelType != '상가분양' }">
                        <span class="flag complete">${data.parcelStage }</span>
                        </c:if>		                                  
                        <div class="tit_inner">
                            <h3>
                                ${data.parcelName}
                            </h3>
                            <p class="tel">${data.inquiry}</p>
                        </div>
                        <c:if test="${data.homepageUrl != ''}">
                        <a href="${data.homepageUrl}" target="${data.homepageTarget}" class="basic_btn outlink">
                            <span>홈페이지 바로가기</span>
                        </a>
                        </c:if>
                    </div>
                    <c:if test="${data.parcelDetailImage != ''}">
                    <img src="${data.parcelDetailImage}" alt="">
                    </c:if>
                </div>
                
                <c:if test="${data.displayYn == 'Y'}">
                <div class="section full sec02">
                    <h4>분양일정</h4>
                    <div class="bg">
                        <div class="sec_inner">
                            <ul>
                                <li>
                                    <img src="/resources/images/estate/ico_parcel01.png" alt="">
                                    <p class="tit">모집공고</p>
                                    <c:if test="${data.announceStartDate==data.announceEndDate || data.announceEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.announceStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.announceStartDate!=data.announceEndDate && data.announceEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.announceStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.announceEndDate,'-','.') }"/></p>
                                    </c:if>
                                </li>
                                <li>
                                    <img src="/resources/images/estate/ico_parcel02.png" alt="">
                                    <p class="tit">청약접수</p>
                                    <c:if test="${data.applicationStartDate==data.applicationEndDate || data.applicationEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.applicationStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.applicationStartDate!=data.applicationEndDate && data.applicationEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.applicationStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.applicationEndDate,'-','.') }"/></p>
                                    </c:if>
                                    
                                </li>
                                <li>
                                    <img src="/resources/images/estate/ico_parcel03.png" alt="">
                                    <p class="tit">당첨자발표</p>
                                    <c:if test="${data.winnerStartDate==data.winnerEndDate || data.winnerEndDate == ''  }">
                                    <p class="date"><c:out value="${fn:replace(data.winnerStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.winnerStartDate!=data.winnerEndDate  && data.winnerEndDate != ''}">
                                    <p class="date"><c:out value="${fn:replace(data.winnerStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.winnerEndDate,'-','.') }"/></p>
                                    </c:if>
                                </li>
                                <li>
                                    <img src="/resources/images/estate/ico_parcel04.png" alt="">
                                    <p class="tit">계약</p>
                                    <c:if test="${data.contractStartDate==data.contractEndDate || data.contractEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.contractStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.contractStartDate!=data.contractEndDate && data.contractEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.contractStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.contractEndDate,'-','.') }"/></p>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:if>
                <div class="section sec03">
                    <h4>사업개요</h4>
                    <table>
                        <colgroup>
                            <col style="width:130px;">
                            <col style="width:420px;">
                            <col style="width:130px;">
                            <col style="width:420px;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <span>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</span>
                                </th>
                                <td>${data.location }</td>
                                <th>
                                    <span>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</span>
                                </th>
                                <td>${data.inquiry }</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>분양시기</span>
                                </th>
                                <td>${data.period }</td>
                                <th>
                                    <span>세&nbsp;&nbsp;&nbsp;대&nbsp;&nbsp;&nbsp;수</span>
                                </th>
                                <td>${data.scale }</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>입주시기</span>
                                </th>
                                <td>${data.admission }</td>
                                <th>
                                    <span>주&nbsp;&nbsp;택&nbsp;&nbsp;형</span>
                                </th>
                                <td>${data.numbers }</td>
                            </tr>
                            <tr class="last">
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행</span>
                                </th>
                                <td>${data.enforcementCompany }</td>
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</span>
                                </th>
                                <td>${data.constructorCompany}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <c:if test="${data.constructionDisplayYn == 'Y'}">
                <div class="section sec04">
                    <h4>현장위치</h4>
                    <div class="location_wrap">
                        <div class="img_wrap">
                        	<c:if test="${data.constructionImagePc != ''}">
                            <img src="${data.constructionImagePc}" alt="">
                            </c:if>
                        </div>
                        <div class="info_wrap">
                            <div class="info_inner">
                                <div class="info">
                                    <span class="tit">현장주소</span>
                                    <p>
                                        ${data.constructionLocation }
                                    </p>
                                </div>
                                <div class="info">
                                    <span class="tit">문의전화</span>
                                    <p class="tel">
                                        ${data.constructionInquiry}
                                    </p>
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>
                <c:if test="${data.modelhouseDisplayYn == 'Y'}">
                <div class="section sec04">
                    <h4>견본주택위치</h4>
                    <div class="location_wrap">
                        <div class="img_wrap">
                            <img src="${data.modelhouseImagePc}" alt="">
                        </div>
                        <div class="info_wrap">
                            <div class="info_inner">
                                <div class="info">
                                    <span class="tit">현장주소</span>
                                    <p>
                                        ${data.modelhouseLocation }
                                    </p>
                                </div>
                                <div class="info">
                                    <span class="tit">문의전화</span>
                                    <p class="tel">
                                        ${data.modelhouseInquiry}
                                    </p>
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>                
                </c:if>
                <p class="btn_wrap">
                    <a href="list" class="basic_btn">
                        <span>목록으로</span>
                    </a>
                </p>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <script>
        honorsvilleBrand.stickyGnb();
    </script>
</body>
</html>