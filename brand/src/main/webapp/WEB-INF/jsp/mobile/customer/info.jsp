<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/include/header.jsp" %>
<title>문의 안내 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container" class="sub customer info">
            <!-- s: title -->
            <div class="page_tit">
                <h2>문의안내</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                    <div class="cont">
                        <div class="left">
                            <p><strong>현재 전화문의만 이용하실 수 있습니다.</strong>궁금하신 점이 있으시면 문의해 주시기 바랍니다.<br>신속하게 답변 드리도록 노력하겠습니다.</p>
                        </div>
                        <div class="right">
                            <span class="call_txt">전화문의 <span class="number">1600-1233</span></span>
                            <span class="time_txt">상담시간 : 평일 AM 09:00 ~ 12:00 / PM 13:00 ~ 17:00</span>
                        </div>
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