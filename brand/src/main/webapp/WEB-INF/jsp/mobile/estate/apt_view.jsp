<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>상세 | 분양단지 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub estate view">
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
                        <li class="on"><a href="/estate/apt/list">분양완료 단지</a></li>
                        <li><a href="/estate/tearplan">연간분양계획</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
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
                            <!-- <p class="tel">${data.inquiry}</p> -->
                        </div>
                        <c:if test="${data.inquiry!=''}">
                        <a href="tel:${data.inquiry}" class="btn_tel">전화걸기</a>
                        </c:if>
                        <c:if test="${data.homepageUrl!=''}">
                        <a href="${data.homepageUrl}" target="${data.homepageTarget}" class="btn_outlink"></a>
                        </c:if>
                    </div>
                    <c:if test="${data.parcelDetailImage != ''}">
                    <img src="${data.parcelDetailImage}" alt="">
                    </c:if>                     
                </div>

				<c:if test="${data.displayYn == 'Y'}">
                <div class="section sec02">
                    <h4>분양일정</h4>
                    <div class="bg">
                        <ul>
                            <li class="step01">
                                <div class="txt_wrap">
                                    <p class="tit">모집공고</p>
                                    <c:if test="${data.announceStartDate==data.announceEndDate || data.announceEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.announceStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.announceStartDate!=data.announceEndDate && data.announceEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.announceStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.announceEndDate,'-','.') }"/></p>
                                    </c:if>
                                </div>
                            </li>
                            <li class="step02">
                                <div class="txt_wrap">
                                    <p class="tit">청약접수</p>
                                    <c:if test="${data.applicationStartDate==data.applicationEndDate || data.applicationEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.applicationStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.applicationStartDate!=data.applicationEndDate && data.applicationEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.applicationStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.applicationEndDate,'-','.') }"/></p>
                                    </c:if>
                                </div>
                            </li>
                            <li class="step03">
                                <div class="txt_wrap">
                                    <p class="tit">당첨자발표</p>
                                    <c:if test="${data.winnerStartDate==data.winnerEndDate || data.winnerEndDate == ''  }">
                                    <p class="date"><c:out value="${fn:replace(data.winnerStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.winnerStartDate!=data.winnerEndDate  && data.winnerEndDate != ''}">
                                    <p class="date"><c:out value="${fn:replace(data.winnerStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.winnerEndDate,'-','.') }"/></p>
                                    </c:if>
                                </div>
                            </li>
                            <li class="step04">
                                <div class="txt_wrap">
                                    <p class="tit">계약</p>
                                    <c:if test="${data.contractStartDate==data.contractEndDate || data.contractEndDate == '' }">
                                    <p class="date"><c:out value="${fn:replace(data.contractStartDate,'-','.') }"/></p>
                                    </c:if>
                                    <c:if test="${data.contractStartDate!=data.contractEndDate && data.contractEndDate != '' }">
                                    <p class="date"><c:out value="${fn:replace(data.contractStartDate,'-','.') }"/>~<br><c:out value="${fn:replace(data.contractEndDate,'-','.') }"/></p>
                                    </c:if>
                                </div>  
                            </li>
                        </ul>
                    </div>
                </div>
                </c:if>

                <div class="section sec03">
                    <h4>사업개요</h4>
                    <table>
                        <colgroup>
                            <col stlye="width:85px;">
                            <col stlye="width:auto;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <span>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</span>
                                </th>
                                <td>${data.location }</td>
                            </tr>
                            <tr>
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
                            </tr>
                            <tr>
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
                            </tr>
                            <tr>
                                <th>
                                    <span>주&nbsp;&nbsp;택&nbsp;&nbsp;형</span>
                                </th>
                                <td>${data.numbers }</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행</span>
                                </th>
                                <td>${data.enforcementCompany }</td>
                            </tr>
                            <tr class="last">
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</span>
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
                            <img src="${data.constructionImageMo}" alt="">
                        </div>
                        <div class="info_wrap">
                            <table>
                                <colgroup>
                                    <col stlye="width:65px;">
                                    <col stlye="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <span>현장주소</span>
                                        </th>
                                        <td> ${data.constructionLocation }</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span>문의전화</span>
                                        </th>
                                        <td class="tel">${data.constructionInquiry}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </c:if>
				<c:if test="${data.modelhouseDisplayYn == 'Y'}">
                <div class="section sec04">
                    <h4>견본주택위치</h4>
                    <div class="location_wrap">
                        <div class="img_wrap">
                            <img src="${data.modelhouseImageMo}" alt="">
                        </div>
                        <div class="info_wrap">
                            <table>
                                <colgroup>
                                    <col stlye="width:65px;">
                                    <col stlye="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <span>현장주소</span>
                                        </th>
                                        <td> ${data.modelhouseLocation }</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <span>문의전화</span>
                                        </th>
                                        <td class="tel">${data.modelhouseInquiry}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
             </c:if>
            <div class="section sec04">                
                <div class="btn_wrap">
                    <a href="/estate/apt/list" class="basic_btn">
                        <span>목록</span>
                    </a>
                </div>
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

        //분양타이틀 br태그 제거
        var estateTit = $('.estate.view .tit_wrap .tit_inner h3');
        var oriText = estateTit.html();
        var newText = oriText.replace(/<(\/br|br)([^>]*)>/gi," ");
        estateTit.text(newText);
    </script>
</body>
</html>