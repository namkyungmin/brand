<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <!-- s: header -->
    <div id="header" class="header_wrap">
        <div class="header">
            <a href="/" class="logo"><img src="/resources/images/common/header_logo.png" alt="경남아너스빌"></a>
            <ul class="gnb">
                <li class="depth1">
                    <a href="/estate/sale/list" class="on">분양단지</a>
                    <ul class="depth2">
                        <li><a href="/estate/sale/list">분양중인 단지</a></li>
                        <li><a href="/estate/plan/list">분양예정 단지</a></li>
                        <li><a href="/estate/apt/list">분양완료 단지</a></li>
                        <li><a href="/estate/tearplan">연간분양계획</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="/brand/brandstory">브랜드</a>
                    <ul class="depth2">
                        <li><a href="/brand/brandstory">브랜드 스토리</a></li>
                        <li><a href="/brand/bi">브랜드 아이덴티티</a></li>
                        <li><a href="/brand/item">특화아이템</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="/members/news">아너스빌 멤버스</a>
                    <ul class="depth2">
                        <li><a href="/members/news">아너스빌 소식</a></li>
                        <li><a href="/members/guide">청약가이드</a></li>
                    </ul>
                </li>
                <li class="depth1">
                    <a href="/customer/info">마이 아너스빌</a>
                    <ul class="depth2">
                        <li><a href="/customer/info">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul>
                </li>
            </ul>

            <!-- s: 회원이 아닐경우 -->
            <ul class="member_wrap non_members">
                <li class="login"><a href="/membership/login">로그인</a></li>
                <li class="join"><a href="/membership/join/agreement">회원가입</a></li>
            </ul>
            <!--// e: 회원이 아닐경우 -->
            
            <!-- s: 회원일 경우 -->
            <!-- <ul class="member_wrap member">
                <li class="mypage"><a href="">마이페이지</a></li>
                <li class="logout"><a href="">로그아웃</a></li>
            </ul> -->
             <!--// e: 회원일 경우 -->

             <!-- s: SNS -->
             <div class="sns_wrap">
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
            </div>
            <!--// e: SNS -->
        </div>
        <div class="bg"></div>
    </div>
    <!--// e: header -->