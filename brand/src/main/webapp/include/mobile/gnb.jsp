<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- s: header -->
    <div id="header" class="header_wrap">
        <div class="header">
            <a href="/" class="logo"><img src="/resources/mobile/images/common/header_logo.png" alt="경남아너스빌"></a>
            <a href="#" class="btn_menu"></a>
        </div>
        <div class="gnb_wrap">
            <div class="util_wrap">
            	<c:if test="${sessionScope.userId==null&&cookie.Login.value ==null}">
                <!-- s: 회원일 경우 -->
                <div class="members_wrap non_member">
                    <a href="/membership/login" class="login">로그인</a>
                    <a href="/membership/join/agreement" class="join">회원가입</a>
                    
                </div>
                <!--// e: 회원일 경우 -->
                </c:if>
                <c:if test="${sessionScope.userId!=null||cookie.Login.value !=null}">
                <!-- s: 회원이 아닐경우 -->
                <div class="members_wrap members">
                    <li class="logout"><a href="/logout">로그아웃</a></li>
                </div>
                </c:if>
                <!--// e: 회원이 아닐경우 -->
                <div class="sns_wrap">
                    <a href="https://www.youtube.com/watch?v=HpP6siQh9NM&feature=youtu.be" class="youtube" target="_blank"></a>
                    <!-- <a href="#" class="facebook"></a> -->
                    <!-- <a href="#" class="kakao"></a> -->
                </div>
            </div>
            <ul class="gnb">
                <li class="depth1">
                    <a href="#">분양단지</a>
                    <ul class="depth2">
                        <li><a href="/estate/sale/list">분양중인 단지</a></li>
                        <li><a href="/estate/plan/list">분양예정 단지</a></li>
                        <li><a href="/estate/apt/list">분양완료 단지</a></li>
                        <li><a href="/estate/tearplan">연간분양계획</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="#">브랜드</a>
                    <ul class="depth2">
                        <li><a href="/brand/brandstory">브랜드 스토리</a></li>
                        <li><a href="/brand/bi">브랜드 아이덴티티</a></li>
                        <li><a href="/brand/item">특화아이템</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="#">아너스빌 멤버스</a>
                    <ul class="depth2">
                        <li><a href="/members/news">아너스빌 소식</a></li>
                        <li><a href="/members/guide">청약가이드</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="#">마이 아너스빌</a>
                    <ul class="depth2">
                        <li><a href="/my/faq">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        

        <!-- s: 회원이 아닐경우 -->
        <!-- <ul class="member_wrap non_members">
            <li class="login"><a href="/membership/login">로그인</a></li>
            <li class="join"><a href="/membership/join/agreement">회원가입</a></li>
        </ul> -->
        <!--// e: 회원이 아닐경우 -->
        
        <!-- s: 회원일 경우 -->
        <!-- <ul class="member_wrap member">
            <li class="mypage"><a href="">마이페이지</a></li>
            <li class="logout"><a href="">로그아웃</a></li>
        </ul> -->
            <!--// e: 회원일 경우 -->

            <!-- s: SNS -->
            <!-- <div class="sns_wrap">
            <div class="inner">
                <span class="txt">SNS</span>
                <div class="sns">
                    <span>
                        <a href="#" class="youtube"></a>
                        <a href="#" class="facebook"></a>
                        <a href="#" class="kakao"></a>
                    </span>
                </div>
            </div>
        </div> -->
        <!--// e: SNS -->
    </div>
    <!--// e: header -->