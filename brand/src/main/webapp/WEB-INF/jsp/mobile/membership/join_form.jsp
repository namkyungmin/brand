<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>회원정보 입력 | 회원가입 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership join form">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>회원가입</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <!-- s: Step tab -->
                <div class="tab_nav type02">
					<ul>
						<li><a href="javascript:;;">1. 이용약관 동의</a></li>
						<li><a href="javascript:;;">2. 본인 인증</a></li>
						<li class="on"><a href="javascript:;;">3. 회원정보 입력</a></li>
                    </ul>
                </div>
                <!--// e: Step tab -->
                <div class="section sec1">
                	<form name="joinForm" id="joinForm">
                	<input type="hidden" name="certType" id="certType" value="${param.certType}">
                	<input type="hidden" name="certInfo" id="certInfo" value="${param.sDupInfo}">
                	<input type="hidden" name="name" id="name" value="${param.sName }">
                	<input type="hidden" name="dup" id="dup" value="">                
                    <div class="form_wrap">
                        <p class="top_txt"><sup>*</sup> 필수 입력사항</p>
                        <ul>
                            <li>
                                <dl>
                                    <dt class="tit">아이디 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap id">
                                            <input type="text" name="userId" id="userId" class="" placeholder="아이디를 입력해 주세요">
                                            <a href="javascript:void(0);" class="btn" id="checkUserId">중복확인</a>
                                        </div>
                                        <p class="notice">※ 아이디는 6~20자의 영문 소문자, 숫자, 특수문자(_), (-)만 사용이 가능합니다.</p>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl class="form_type02">
                                    <dt class="tit">이름</dt>
                                    <dd>${param.sName }</dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">비밀번호 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap">
                                            <input type="password" name="password" id="password" class="" placeholder="비밀번호를 입력해 주세요">
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">비밀번호 확인 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap">
                                            <input type="password" name="passwordCheck" id="passwordCheck" class="" placeholder="비밀번호를 다시 입력해 주세요">
                                        </div>
                                        <p class="notice">※ 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.</p>
                                        <p class="notice">※ 사용 가능 특수문자 : ` ~ ! @ # $ % ^ * ( ) - _ = +</p>
                                        <p class="notice">※ 비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.</p>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">휴대전화 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap tel">
                                            <input type="tel" class="" id="cell" name="cell" placeholder="휴대전화번호를 입력해 주세요">
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">전화</dt>
                                    <dd>
                                        <div class="input_wrap tel">
                                            <input type="tel" class="" name="tel" id="tel" placeholder="전화번호를 입력해 주세요">
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">이메일 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap email">
                                            <input type="text" name="email" id="email" class="" placeholder="이메일을 입력해 주세요">
                                            <span>@</span>
                                        </div>
                                        <div class="input_wrap">
                                            <input type="text" name="emailDomain" id="emailField" class="">
                                        </div>
                                        <div class="input_wrap">
                                            <select name="" id="selectEmail">
                                                <option value="">직접입력</option>
                                                <option value="">naver.com</option>
                                                <option value="">gmail.com</option>
                                                <option value="">hanmail.net</option>
                                                <option value="">daum.net</option>
                                                <option value="">hotmail.com</option>
                                            </select>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl>
                                    <dt class="tit">주소 <sup>*</sup></dt>
                                    <dd>
                                        <div class="input_wrap address">
                                            <input type="text" name="zipcode" id="address1" class="" placeholder="우편번호" readonly onclick="openzip()">
                                            <a href="javascript:openzip()" class="btn">주소검색</a>
                                        </div>
                                        <div class="input_wrap address2">
                                            <input type="text" name="address" id="address2" class="" placeholder="주소를 검색해 주세요">
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl class="form_type03">
                                    <dt class="tit">우편물 동의 <sup>*</sup></dt>
                                    <dd>
                                        <div class="radio_wrap">
                                            <label for="agreeY2">
                                                <input type="radio" id="agreeY2" name="mailYn" value="Y">
                                                예
                                            </label>
                                            <label for="agreeN2" class="checked">
                                                <input type="radio" id="agreeN2" name="mailYn" value="N" checked="checked">
                                                아니오
                                            </label>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl class="form_type03">
                                    <dt class="tit">이메일 수신동의 <sup>*</sup></dt>
                                    <dd>
                                        <div class="radio_wrap">
                                            <label for="agreeY3">
                                                <input type="radio" id="agreeY3" name="emailYn" value="Y">
                                                예
                                            </label>
                                            <label for="agreeN3" class="checked">
                                                <input type="radio" id="agreeN3" name="emailYn" value="N" checked="checked">
                                                아니오
                                            </label>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                            <li>
                                <dl class="form_type03">
                                    <dt class="tit">SMS 수신동의 <sup>*</sup></dt>
                                    <dd>
                                        <div class="radio_wrap">
                                            <label for="agreeY4">
                                                <input type="radio" id="agreeY4" name="smsYn" value="Y">
                                                예
                                            </label>
                                            <label for="agreeN4" class="checked">
                                                <input type="radio" id="agreeN4" name="smsYn" value="N" checked="checked">
                                                아니오
                                            </label>
                                        </div>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="btn_wrap type02">
                        <a href="javascript:void(0);" class="basic_btn sub type02" id="resetBtn">
                            <span>취소</span>
                        </a>
                        <a href="javascript:void(0);" class="basic_btn sub" id="saveBtn">
                            <span>가입 완료</span>
                        </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="/resources/mobile/js/base.js"></script>    
    <script src="/resources/mobile/js/register.js"></script>    
    <script>
        honorsvilleBrand.stickyGnb();
    </script>
</body>
</html>