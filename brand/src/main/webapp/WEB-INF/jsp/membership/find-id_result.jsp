<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>아이디 조회 결과 | 아이디 찾기 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership find">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>아이디 찾기</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                <c:if test="${data.userId !=null}">
                    <!-- 아이디찾기 결과 있을시 -->
                    <div class="info_area short">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">회원님의 아이디는 <span class="result">${fn:substring(data.userId,0,fn:length(data.userId)-3)}***</span> 입니다.</p>
                                <p class="txt2">입력하신 정보로 찾은 아이디입니다.</p>
                            </div>
                            <div class="btn_wrap two">
                                <a href="/membership/find-password" class="basic_btn type02"><span>비밀번호 찾기</span></a>
                                <a href="/membership/login" class="basic_btn sub"><span>로그인</span></a>
                            </div>
                        </div>
                    </div>
				</c:if>
				<c:if test="${data.userId ==null}">
                    <!-- 아이디찾기 결과 없을시 -->
                    <div class="info_area short2">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">일치하는 회원정보가 없습니다.</p>
                            </div>
                            <div class="btn_wrap two">
                                <a href="/membership/find-id" class="basic_btn type02"><span>재입력</span></a>
                                <a href="/membership/join/agreement" class="basic_btn sub"><span>회원가입</span></a>
                            </div>
                        </div>
                    </div>
                </c:if>
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