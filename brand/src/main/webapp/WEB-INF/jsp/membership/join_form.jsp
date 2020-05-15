<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>본인 인증 | 회원가입 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership join">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>회원가입</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <!-- s: Step tab -->
                <div class="tab_nav">
					<ul>
						<li><a href="javascript:;;">STEP 1. 이용약관 동의</a></li>
						<li><a href="javascript:;;">STEP 2. 본인 인증</a></li>
						<li class="on"><a href="javascript:;;">STEP 3. 회원정보 입력</a></li>
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
                        <span class="top_txt"><sup>*</sup> 필수 입력사항</span>
                        
                        <table>
                            <colgroup>
                                <col width="144px">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="ip_tit">아이디 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap">
                                            <input type="text" name="userId" id="userId" class="" placeholder="아이디를 입력해 주세요">
                                            <a href="javascript:void(0);" class="btn" id="checkUserId">중복확인</a>
                                        </div>
                                        <p class="notice">※ 아이디는 6~20자의 영문 소문자, 숫자, 특수문자(_), (-)만 사용이 가능합니다.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${param.sName }</td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">비밀번호 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap">
                                            <input type="password" name="password" id="password" class="" placeholder="비밀번호를 입력해 주세요">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">비밀번호 확인 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap">
                                            <input type="password" name="passwordCheck" id="passwordCheck" class="" placeholder="비밀번호를 다시 입력해 주세요">
                                        </div>
                                        <p class="notice">※ 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.</p>
                                        <p class="notice">※ 사용 가능 특수문자 : ` ~ ! @ # $ % ^ * ( ) - _ = +</p>
                                        <p class="notice">※ 비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">휴대전화 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap tel">
                                            <select name="cell1" id="cell1">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>
                                            <input type="tel" class="" id="cell2" name="cell2">
                                            <input type="tel" class="" id="cell3" name="cell3">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">전화</th>
                                    <td>
                                        <div class="input_wrap tel">
                                            <select name="tel1" id="tel1">
                                                <option value="02">02</option>
                                                <option value="031">031</option>
                                                <option value="032">032</option>
                                                <option value="033">033</option>
                                                <option value="041">041</option>
                                                <option value="042">042</option>
                                                <option value="043">043</option>
                                                <option value="044">044</option>
                                                <option value="051">051</option>
                                                <option value="052">052</option>
                                                <option value="053">053</option>
                                                <option value="054">054</option>
                                                <option value="055">055</option>
                                                <option value="061">061</option>
                                                <option value="062">062</option>
                                                <option value="063">063</option>
                                            </select>
                                            <input type="tel" class="" name="tel2" id="tel2">
                                            <input type="tel" class="" name="tel3" id="tel3">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">이메일 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap email">
                                            <input type="text" name="email" id="email" class="" placeholder="이메일을 입력해 주세요">
                                            <span>@</span>
                                            <input type="text" name="emailDomain" id="emailField" class="">
                                            <select name="" id="selectEmail">
                                                <option value="">직접입력</option>
                                                <option value="">naver.com</option>
                                                <option value="">gmail.com</option>
                                                <option value="">hanmail.net</option>
                                                <option value="">daum.net</option>
                                                <option value="">hotmail.com</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">주소 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap address">
                                            <input type="text" name="zipcode" id="address1" class="" placeholder="우편번호" readonly onclick="openzip()">
                                            <a href="javascript:openzip()" class="btn">주소검색</a>
                                        </div>
                                        <div class="input_wrap address2">
                                            <input type="text" name="address" id="address2" class="" placeholder="주소를 검색해 주세요">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>우편물 동의</th>
                                    <td>
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
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일 수신동의</th>
                                    <td>
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
                                    </td>
                                </tr>
                                <tr>
                                    <th>SMS 수신동의</th>
                                    <td>
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
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_wrap two">
                        <a href="javascript:;;" class="basic_btn sub type02" id="resetBtn">
                            <span>취소</span>
                        </a>
                        <a href="javascript:;;" class="basic_btn sub"  id="saveBtn">
                            <span>가입 완료</span>
                        </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <!-- <script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/register.js"></script>
    <script>
        honorsvilleBrand.stickyGnb();
    </script>
</body>
</html>