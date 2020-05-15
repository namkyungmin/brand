<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/header.jsp" %>
<title>분양단지 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub parcel view">
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
                        <span class="flag on">분양중</span>
                        <div class="tit_inner">
                            <h3>
                                당진 송악 경남아너스빌
                            </h3>
                            <p class="tel">1522-3456</p>
                        </div>
                        <a href="http://dangjin.honorsville.co.kr/" target="_blank" class="basic_btn outlink">
                            <span>홈페이지 바로가기</span>
                        </a>
                    </div>
                    <img src="/resources/images/sale/img_parcel_dangjin01.jpg" alt="">
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
                                    <span>위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</span>
                                </th>
                                <td>충남 당진시 송악읍  중흥리 396-3</td>
                                <th>
                                    <span>문&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의</span>
                                </th>
                                <td>1522-3456</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>분양시기</span>
                                </th>
                                <td>2019.10.04</td>
                                <th>
                                    <span>규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모</span>
                                </th>
                                <td>지하1층~지상20층 5개동, 총 381세대</td>
                            </tr>
                            <tr>
                                <th>
                                    <span>입주시기</span>
                                </th>
                                <td>2021.04월 예정</td>
                                <th>
                                    <span>주&nbsp;&nbsp;택&nbsp;&nbsp;형</span>
                                </th>
                                <td>59㎡A(129세대), 59㎡B(20세대), 59㎡C(29세대), <br>72㎡(165세대), 84㎡(38세대)</td>
                            </tr>
                            <tr class="last">
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행</span>
                                </th>
                                <td>경남기업㈜&middot;㈜티케이케미칼</td>
                                <th>
                                    <span>시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공</span>
                                </th>
                                <td>경남기업㈜&middot;㈜티케이케미칼</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="section sec04">
                    <h4>오시는길</h4>
                    <div class="location_wrap">
                        <div class="img_wrap">
                            <img src="/resources/images/sale/img_parcel_dangjin02.jpg" alt="">
                        </div>
                        <div class="info_wrap">
                            <div class="info_inner">
                                <div class="info">
                                    <span class="tit">현장주소</span>
                                    <p>
                                        충남 당진시 송악읍  중흥리 396-3
                                    </p>
                                </div>
                                <div class="info">
                                    <span class="tit">문의전화</span>
                                    <p class="tel">
                                        1522-3456
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