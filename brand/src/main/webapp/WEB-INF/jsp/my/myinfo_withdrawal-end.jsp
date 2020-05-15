<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>회원탈퇴 | 개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my">
        <%@ include file="/include/gnb.jsp" %>
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
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo" class="on">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li><a href="/my/myinfo">개인정보 변경</a></li>
                            <li><a href="/my/myinfo/password">비밀번호 변경</a></li>
                            <li class="on"><a href="/my/myinfo/withdrawal">회원탈퇴</a></li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">회원 탈퇴가 완료되었습니다.</p>
                                <p class="txt2">그동안 경남아너스빌을 이용해 주셔서 감사합니다.</p>
                            </div>
                            <div class="btn_wrap">
                                <a href="/logout" class="basic_btn sub"><span>확인</span></a>
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
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
    </script>
</body>
</html>