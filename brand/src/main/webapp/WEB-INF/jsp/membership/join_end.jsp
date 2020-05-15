<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>회원가입 완료 |회원가입 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership find">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>회원가입</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                    <div class="info_area short">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">회원가입이 완료되었습니다.</p>
                                <p class="txt2">경남아너스빌 회원이 되신 것을 축하드립니다.</p>
                            </div>
                            <div class="btn_wrap">
                                <a href="/membership/login" class="basic_btn sub"><span>로그인</span></a>
                            </div>
                        </div>
                    </div>
                </div>
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