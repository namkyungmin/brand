<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>청약 가이드 | 아너스빌 멤버스 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub members guide">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>아너스빌 멤버스</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/members/news">아너스빌 소식</a></li>
                        <li><a href="/members/guide" class="on">청약가이드</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <ol class="step_list">
                        <li class="step1">
                            <dl>
                                <dt>나에게 맞는 아파트 선택</dt>
                                <dd>우선 일반분양, 임대 등<br>조건에 맞는 아파트 결정</dd>
                            </dl>
                        </li>
                        <li class="step2">
                            <dl>
                                <dt>청약자격 발생</dt>
                                <dd>
                                    청약통장 가입 후 일정 기간과<br>자격이 갖춰지면 순위 발생
                                    <p>※ 희망하는 아파트의 청약 수요가<br> 많을 경우 청약 우선 순위 발생</p>
                                </dd>
                            </dl>
                        </li>
                        <li class="step3">
                            <dl>
                                <dt>청약통장 마련</dt>
                                <dd>청약통장 가입 자격 확인,<br>희망하는 조건에 맞는 청약통장 개설</dd>
                            </dl>
                        </li>
                        <li class="step4">
                            <dl>
                                <dt>입주자 모집공고 확인</dt>
                                <dd>홈페이지, 견본주택에서<br>청약을 위한 구체적인 내용 확인</dd>
                            </dl>
                        </li>
                        <li class="step5">
                            <dl>
                                <dt>청약 신청</dt>
                                <dd>홈페이지, 견본주택 및 은행에서<br>청약 시 필요 절차 및 서류 확인</dd>
                            </dl>
                        </li>
                        <li class="step6">
                            <dl>
                                <dt>당첨자 발표 후<br>계약 및 입주 진행</dt>
                                <dd></dd>
                            </dl>
                        </li>
                    </ol>
                    <p class="bottom_txt">자세한 사항은 <span>KB국민은행 또는 한국감정원 청약홈</span>을 통해 확인 하실 수 있습니다.</p>
                    <div class="btn_wrap two">
                        <a href="https://oland.kbstar.com/quics?page=ohsubs" class="basic_btn type02" target="_blank"><span>KB국민은행</span></a>
                        <a href="https://www.applyhome.co.kr/co/coa/selectMainView.do" class="basic_btn sub" target="_blank"><span>한국감정원 청약홈</span></a>
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