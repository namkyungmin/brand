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
        <div id="container" class="sub parcel list">
            <!-- s: title -->
            <div class="page_tit">
                <h2>분양단지</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section">
                    <div class="parcel_wrap">
                        <div class="parcel_item intro">
                            <h3 class="color_9a8b86">
                                분양 상태별<br>
                                단지 정보를<br>
                                확인해보세요.
                            </h3>
                        </div>
                        <a href="view_bukhansan" class="parcel_item">
                            <div class="info">
                                <h4>
                                    송추 북한산<br>
                                    경남아너스빌
                                </h4>
                                <table class="color_9a8b86">
                                    <colgroup>
                                        <col width="55px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>위치</th>
                                            <td>경기도 양주시 장흥면 부곡리<br>524-2</td>
                                        </tr>
                                        <tr>
                                            <th>세대수</th>
                                            <td>604세대</td>
                                        </tr>
                                        <tr>
                                            <th>분양</th>
                                            <td>20년 3월 예정</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p class="tel">031-963-1236</p>
                                <span class="flag scheduled">분양예정</span>
                            </div>
                            <div class="thumb"><img src="/resources/images/sale/thumb_parcel01.jpg" alt=""></div>
                        </a>
                        <a href="view_dangjin" class="parcel_item">
                            <div class="info">
                                <h4>
                                    당진 송악<br>
                                    경남아너스빌
                                </h4>
                                <table class="color_9a8b86">
                                    <colgroup>
                                        <col width="55px">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>위치</th>
                                            <td>충남 당진시 송악읍 중흥리<br>396-3</td>
                                        </tr>
                                        <tr>
                                            <th>세대수</th>
                                            <td>381세대</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p class="tel">1522-3456</p>
                                <span class="flag on">분양중</span>
                            </div>
                            <div class="thumb"><img src="/resources/images/sale/thumb_parcel02.jpg" alt=""></div>
                        </a>
                    </div>
                </div>
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