<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>A/S문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my question as end">
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
                        <li class="on btm">
                            <a href="/my/as">A/S 문의</a>
                        </li>
                        <li class="btm">
                            <a href="/my/as/list">문의내역 관리</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="form_wrap">
                        <p class="tit01">
                            문의하신 내용이 정상적으로 접수되었습니다.<br>
                            빠른 시일 내로 답변 드리겠습니다.
                        </p>
                        <p class="tit02">
                            답변이 완료되면 등록하신 이메일로<br>처리결과를 알려드립니다.<br>
                            답변 및 처리현황은 문의내역 관리 메뉴에서<br>확인하실 수 있습니다.
                        </p>
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
        honorsvilleBrand.fileUpload();
    </script>
</html>