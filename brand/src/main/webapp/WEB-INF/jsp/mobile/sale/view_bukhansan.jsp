<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/header.jsp" %>
<title>분양단지 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container" class="sub parcel view">
            <!-- s: title -->
            <div class="page_tit">
                <h2>분양단지</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec01">
                    <div class="tit_wrap">
                        <span class="flag scheduled">분양예정</span>
                        <div class="tit_inner">
                            <h3>
                                송추 북한산 경남아너스빌
                            </h3>
                            <p class="tel">031-963-1236</p>
                        </div>
                        <a href="http://bukhansan.honorsville.co.kr/" target="_blank" class="basic_btn outlink">
                            <span>홈페이지 바로가기</span>
                        </a>
                    </div>
                    <img src="/resources/images/sale/img_parcel_bukhansan01.jpg" alt="">
                </div>
                <div class="section full sec02">
                    <h4>분양일정</h4>
                    <div class="bg">
                        <div class="sec_inner">
                            <ul>
                                <li>
                                    <img src="/resources/images/sale/ico_parcel01.png" alt="">
                                    <p class="tit">모집공고</p>
                                    <p class="date">2019.10.04</p>
                                </li>
                                <li>
                                    <img src="/resources/images/sale/ico_parcel02.png" alt="">
                                    <p class="tit">청약접수</p>
                                    <p class="date">2019.10.10~14</p>
                                </li>
                                <li>
                                    <img src="/resources/images/sale/ico_parcel03.png" alt="">
                                    <p class="tit">당첨자발표</p>
                                    <p class="date">2019.10.18</p>
                                </li>
                                <li>
                                    <img src="/resources/images/sale/ico_parcel04.png" alt="">
                                    <p class="tit">계약</p>
                                    <p class="date">2019.10.29~31</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="section sec03">
                    <h4>사업개요</h4>
                    <table>
                        <colgroup>
                            <col width="130px">
                            <col width="420px">
                            <col width="130px">
                            <col width="420px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    <span>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</span>
                                </th>
                                <td>경기도 양주시 장흥면 부곡리 524-2번지 일대</td>
                                <th>
                                    <span>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</span>
                                </th>
                                <td>031-963-1236</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>분양시기</span>
                                </th>
                                <td>2020.03</td>
                                <th>
                                    <span>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</span>
                                </th>
                                <td>604세대</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>입주시기</span>
                                </th>
                                <td>2021.03월 예정 (변경될 수 있음)</td>
                                <th>
                                    <span>세&nbsp;&nbsp;대&nbsp;&nbsp;수</span>
                                </th>
                                <td>
                                    63㎡A-378세대 / 63㎡B-60세대 / 73㎡A-134세대 /<br>
                                    73㎡B-32세대
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span>시&nbsp;&nbsp;행&nbsp;&nbsp;사</span>
                                </th>
                                <td>SM티케이케미칼</td>
                                <th>
                                    <span>건축면적</span>
                                </th>
                                <td>4,709.5721㎡</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>건&nbsp;&nbsp;폐&nbsp;&nbsp;율</span>
                                </th>
                                <td>19.56%</td>
                                <th>
                                    <span>연&nbsp;&nbsp;면&nbsp;&nbsp;적</span>
                                </th>
                                <td>82,252.0071㎡</td>
                            </tr>
                            <tr class="last">
                                <th>
                                    <span>용&nbsp;&nbsp;적&nbsp;&nbsp;율</span>
                                </th>
                                <td>228.25%</td>
                                <th>
                                    <span>대지면적</span>
                                </th>
                                <td>24,070.00㎡</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="section sec04">
                    <h4>오시는길</h4>
                    <div class="location_wrap">
                        <div class="img_wrap">
                            <img src="/resources/images/sale/img_parcel_bukhansan02.jpg" alt="">
                        </div>
                        <div class="info_wrap">
                            <div class="info_inner">
                                <div class="info">
                                    <span class="tit">견본주택 주소</span>
                                    <p>
                                        경기도 고양시 원흥동 633-6번지
                                    </p>
                                </div>
                                <div class="info">
                                    <span class="tit">문의전화</span>
                                    <p class="tel">
                                        031-963-1236
                                    </p>
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
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
</body>
<script>
    honorsvilleBrand.stickyGnb();
</script>
</html>