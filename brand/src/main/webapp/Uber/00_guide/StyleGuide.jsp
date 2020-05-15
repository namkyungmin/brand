<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<title>title</title>
</head>
<body>
    <div id="wrap" class="wrap sub common">
        <%@ include file="../include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>스타일가이드</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab_wrap">
                <ul>
                    <li>
                        <a href="#" class="on">브랜드스토리</a>
                    </li>
                    <li>
                        <a href="#">브랜드 아이덴티티</a>
                    </li>
                </ul> 
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <div>
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">Text Color</p>
                        <!-- s : source -->
                        <p class="color_004c6b">004c6b</p>
                        <p class="color_303e48">303e48</p>
                        <p class="color_9a8b86">9a8b86</p>
                        <p class="color_d0c0bb">d0c0bb</p>
                        <p class="color_8f9d9d">8f9d9d</p>
                        <p class="color_f0eeed">f0eeed</p>
                        <p class="color_888888">888888</p>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div>
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">국문 타이틀</p>
                        <!-- s : source -->
                        <h3>분양단지</h3>
                        <h4>분양단지</h4>
                        <h5>분양단지</h5>
                        <h6>분양단지</h6>
                        <p class="h7">분양단지</p>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div>
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">영문 타이틀</p>
                        <!-- s : source -->
                        <h3 class="eng">NEWS</h3>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div>
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">flags</p>
                        <p style="margin:10px 0;">메인배너</p>
                        <!-- s : source -->
                        <p class="flag banner scheduled">
                            <span>분양<br>예정</span>
                        </p>
                        <p class="flag banner on">
                            <span>분양중</span>
                        </p>
                        <p class="flag banner complete">
                            <span>분양<br>완료</span>
                        </p>
                        <!--// e : source -->
                        <p style="margin:10px 0;">분양단지</p>
                        <!-- s : source -->
                        <span class="flag scheduled">분양예정</span>
                        <span class="flag on">분양중</span>
                        <span class="flag complete">분양완료</span>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div class="button" style="background:#4a4a4a; padding:30px; color:#fff;">
                       <p style="margin-bottom:30px; font-size:30px; font-weight:700;">BUTTONS</p>
                        <p style="margin-bottom:10px">기본버튼</p>
                        <!-- s : source -->
                        <a href="#" class="basic_btn">
                            <span>브랜드 스토리</span>
                        </a>
                        <!--// e : source -->
                        <p style="margin:10px 0;">아웃링크버튼</p>
                        <!-- s : source -->
                        <a href="#" class="basic_btn outlink">
                            <span>홈페이지 바로가기</span>
                        </a>
                        <!--// e : source -->
                        <p style="margin:10px 0;">다운로드버튼</p>
                        <!-- s : source -->
                        <a href="#" class="basic_btn download" download="">
                            <span>JPG 다운로드</span>
                        </a>
                        <!--// e : source -->
                        <p style="margin:10px 0;">더보기 버튼</p>
                        <div style="background:#fff; padding:10px;">
                            <!-- s : source -->
                            <a href="#" class="basic_btn more">
                                <span>더보기</span>
                            </a>
                            <!--// e : source -->
                        </div>
                        <p style="margin:10px 0;">2개 사용 버튼</p>
                        <!-- s : source -->
                        <div class="btn_wrap two">
                            <a href="#" class="basic_btn sub type02">
                                <span>비밀번호 찾기</span>
                            </a>
                            <a href="#" class="basic_btn sub">
                                <span>로그인</span>
                            </a>
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div>
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">RADIO</p>
                        <!-- s : source -->
                        <div class="radio_wrap">
                            <label for="agreeY">
                                <input type="radio" id="agreeY" name="agree" value="Y">
                                동의함
                            </label>
                            <label for="agreeN">
                                <input type="radio" id="agreeN" name="agree" value="N">
                                동의안함 (동의하셔야 등록이 가능합니다.)
                            </label>
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <div style="padding:30px; background:#d8d8d8;">
                        <p style="margin-bottom:30px; font-size:30px; font-weight:700;">INPUT FORM</p>
                        <!-- s : source -->
                        <div class="input_wrap">
                            <input type="text" class="" placeholder="아이디">
                        </div>
                        <div class="input_wrap">
                            <input type="password" class="" placeholder="비밀번호">
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <p style="margin-bottom:30px; font-size:30px; font-weight:700;">FORM</p>
                    <div>
                        <!-- s : source -->
                        <div class="form_wrap">
                            <table>
                                <colgroup>
                                    <col width="144px">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="ip_tit">아이디<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap">
                                                <input type="text" class="" placeholder="아이디를 입력해 주세요">
                                                <a href="javascript:void(0);" class="btn">중복확인</a>
                                            </div>
                                            <p class="notice">※ 아이디는 6~20자의 영문 소문자, 숫자, 특수문자(_), (-)만 사용이 가능합니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            박경남
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">비밀번호<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap">
                                                <input type="text" class="" placeholder="비밀번호를 입력해 주세요">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">비밀번호 확인<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap">
                                                <input type="text" class="" placeholder="비밀번호를 다시 입력해 주세요">
                                            </div>
                                            <p class="notice">※ 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.</p>
                                            <p class="notice">※ 사용 가능 특수문자 : ` ~ ! @ # $ % ^ * ( ) - _ = +</p>
                                            <p class="notice">※ 비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">휴대전화<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap tel">
                                                <select name="" id="">
                                                    <option value="010">010</option>
                                                </select>
                                                <input type="tel" class="">
                                                <input type="tel" class="">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">전화</th>
                                        <td>
                                            <div class="input_wrap tel">
                                                <select name="" id="">
                                                    <option value="02">02</option>
                                                </select>
                                                <input type="tel" class="">
                                                <input type="tel" class="">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">이메일<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap email">
                                                <input type="text" class="" placeholder="이메일을 입력해 주세요">
                                                <span>@</span>
                                                <input type="text" id="emailField" class="">
                                                <select name="" id="selectEmail">
                                                    <option value="etc">직접입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                    <option value="daum.net">daum.net</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ip_tit">주소<sup>*</sup></th>
                                        <td>
                                            <div class="input_wrap address">
                                                <input type="text" class="" placeholder="우편번호">
                                                <a href="javascript:void(0);" class="btn">주소검색</a>
                                            </div>
                                            <div class="input_wrap address2">
                                                <input type="text" class="" placeholder="주소를 검색해 주세요">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>우편물 동의</th>
                                        <td>
                                            <div class="radio_wrap">
                                                <label for="agreeY2">
                                                    <input type="radio" id="agreeY2" name="agree2" value="Y">
                                                    예
                                                </label>
                                                <label for="agreeN2">
                                                    <input type="radio" id="agreeN2" name="agree2" value="N">
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
                                                    <input type="radio" id="agreeY3" name="agree3" value="Y">
                                                    예
                                                </label>
                                                <label for="agreeN3">
                                                    <input type="radio" id="agreeN3" name="agree3" value="N">
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
                                                    <input type="radio" id="agreeY4" name="agree4" value="Y">
                                                    예
                                                </label>
                                                <label for="agreeN4">
                                                    <input type="radio" id="agreeN4" name="agree4" value="N">
                                                    아니오
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="btn_wrap two">
                            <a href="#" class="basic_btn sub type02">
                                <span>취소</span>
                            </a>
                            <a href="#" class="basic_btn sub">
                                <span>가입 완료</span>
                            </a>
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <p style="margin-bottom:30px; font-size:30px; font-weight:700;">TABLE 리스트</p>
                    <div>
                        <!-- s : source -->
                        <div class="tb_list">
                            <div class="search_wrap">
                                <div class="input_wrap">
                                    <select name="" id="">
                                        <option value="">제목+내용</option>
                                        <option value="">제목</option>
                                        <option value="">내용</option>
                                    </select>
                                    <input type="text">
                                    <a href="" class="btn">검색</a>
                                </div>
                            </div>
                            <table>
                                <colgroup>
                                    <col width="130px">
                                    <col width="*">
                                    <col width="190px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>183</td>
                                        <td>
                                            <a href="#">원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조</a>
                                        </td>
                                        <td>2019.11.28</td>
                                    </tr>
                                    <tr>
                                        <td>182</td>
                                        <td>
                                            <a href="#">원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조</a>
                                        </td>
                                        <td>2019.11.28</td>
                                    </tr>
                                    <tr>
                                        <td>181</td>
                                        <td>
                                            <a href="#">원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조</a>
                                        </td>
                                        <td>2019.11.28</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="paging_wrap">
                                <span class="arrow_wrap left">
                                    <a href="#"><img src="../resources/images/common/bg_arrow_left02.png" alt=""></a>
                                    <a href="#"><img src="../resources/images/common/bg_arrow_left01.png" alt=""></a>
                                </span>
                                <ul class="paging">
                                    <li>
                                        <a href="#" class="on">1</a>
                                    </li>
                                    <li>
                                        <a href="#">2</a>
                                    </li>
                                    <li>
                                        <a href="#">3</a>
                                    </li>
                                    <li>
                                        <a href="#">4</a>
                                    </li>
                                    <li>
                                        <a href="#">5</a>
                                    </li>
                                </ul>
                                <span class="arrow_wrap right">
                                    <a href=""><img src="../resources/images/common/bg_arrow_right01.png" alt=""></a>
                                    <a href=""><img src="../resources/images/common/bg_arrow_right02.png" alt=""></a>
                                </span>
                            </div>
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <p style="margin-bottom:30px; font-size:30px; font-weight:700;">TABLE 뷰</p>
                    <div>
                        <!-- s : source -->
                        <div class="tb_view">
                            <div class="top_wrap">
                                <div class="tit_wrap">
                                    <div class="tit">
                                        원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조<br>
                                        원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조
                                    </div>
                                    <div class="date">2019.11.28</div>
                                </div>
                                <div class="data_wrap">
                                    <div class="data">
                                        <span class="tit">조회수</span>
                                        <span class="cont">123</span>
                                    </div>
                                    <div class="data">
                                        <span class="tit">첨부파일</span>
                                        <span class="cont"><a href="">notice.pdf</a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="cont_wrap">
                                <p>
                                    원주단계 경남아너스빌, 주택 수요자 주목.. 전세대 4베이 구조<br><br>
                                    강원도 원주의 주거생활 중심지인 단계동에 주변의 일반 아파트 분양가나 시세에 비해 가격이 합리적인 수준으로 책정된 아파트가 나와<br>
                                    관심이 집중된다. (가칭)단계18통행복지역주택조합추진위원회와 (주)우리터가 원주시 단계동 117-1번지 일대에서 공급 중인 '원주 단계<br>
                                    경남아너스빌' 이다.<br>
                                    .<br>
                                    .<br>
                                    .
                                </p>
                            </div>
                        </div>
                        <div class="btn_wrap">
                            <a href="#" class="basic_btn sub">
                                <span>목록</span>
                            </a>
                        </div>
                        <!--// e : source -->
                    </div>
                    <hr style="margin:60px 0;">
                    <p style="margin-bottom:30px; font-size:30px; font-weight:700;">TAB</p>
                    <div style="margin-bottom:30px; padding-bottom:30px;">
                        <!-- s : source -->
                        <ul class="tab_wrap_depth3">
                            <li class="on">
                                <a href="">전체</a>
                            </li>
                            <li>
                                <a href="">분양관련</a>
                            </li>
                            <li>
                                <a href="">입주관련</a>
                            </li>
                            <li>
                                <a href="">기타</a>
                            </li>
                        </ul>
                        <!--// e : source -->
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../include/footer.jsp" %>
    </div>
    <%@ include file="../include/common.jsp" %>
</body>

    <script>
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();

        //이메일 select 선택입력
        $("#selectEmail").change(function(){ 
            $("#selectEmail option:selected").each(function () { 
                if($(this).val()== 'etc'){ 
                    $("#emailField").val(''); 
                    $("#emailField").attr("disabled",false);
                }else{ 
                    $("#emailField").val($(this).text());
                    $("#emailField").attr("disabled",true);
                }
            });
        });a
    </script>
</html>