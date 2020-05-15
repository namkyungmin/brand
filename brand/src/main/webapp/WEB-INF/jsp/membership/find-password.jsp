<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="Kisinfo.Check.IPINClient" %>

<%
	/********************************************************************************************************************************************
		NICE평가정보 Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		서비스명 : IPIN 가상주민번호 서비스 
		페이지명 : IPIN 가상주민번호 서비스 호출 페이지
	*********************************************************************************************************************************************/
	
	String sSiteCode	= "F511";		//  NICE평가정보에서 발급한 IPIN 서비스 사이트코드
	String sSitePw		= "honor!!@";		//  NICE평가정보에서 발급한 IPIN 서비스 사이트패스워드
	
	
	/*
	┌ sReturnURL 변수에 대한 설명  ─────────────────────────────────────────────────────
		암호화된 인증결과 데이터를 리턴받을 URL을 프로토콜부터 풀주소로 정의해주세요.
		
		* URL은 반드시 프로토콜부터 입력해야 하며 외부에서 접속이 가능한 주소여야 합니다.
		* 당사 샘플페이지 중 ipin_process 페이지가 인증결과 데이터를 리턴받는 페이지입니다.
		
		예 - http://www.test.co.kr/ipin_process.jsp
			 https://www.test.kr:4343/ipin_process.jsp
	└────────────────────────────────────────────────────────────────────
	*/
	//String sReturnURL	= "http://.../ipin_process.jsp";
	String url = "https://"+request.getServerName();
	if(request.getServerName().equals("localhost")) 
		url = "http://localhost:8080";	
	String sReturnURL	= url+"/plugin/ipin_process.jsp?mode=find-pw";
	
	/*
	┌ sCPRequest 변수에 대한 설명  ─────────────────────────────────────────────────────
		CP요청번호는 추가적인 보안처리를 위한 변수입니다. 인증 후 인증결과 데이터와 함께 전달됩니다.
		세션에 저장된 값과 비교해 데이터 위변조를 검사하거나, 사용자 특정용으로 이용할 수 있습니다.	
		위변조 검사는 인증에 필수적인 처리는 아니며 보안을 위한 권고 사항입니다.		
		
		+ CP요청번호 설정 방법
			1. 당사에서 배포된 모듈로 생성
			2. 귀사에서 임의로 정의(최대 30byte) 
	└────────────────────────────────────────────────────────────────────
	*/
	String sCPRequest = "";	
	
	
	// 모듈객체 생성
	IPINClient pClient = new IPINClient();	
	
	// CP요청번호 생성
	sCPRequest = pClient.getRequestNO(sSiteCode);
		
	// CP요청번호 세션에 저장 
	// : 저장된 값은 ipin_result 페이지에서 데이터 위변조 검사에 이용됩니다.
	session.setAttribute("CPREQUEST", sCPRequest);
	
	
	// 인증요청 암호화 데이터 생성
	int iRtn = pClient.fnRequest(sSiteCode, sSitePw, sCPRequest, sReturnURL);
	
	String sEncData		= "";	// 인증요청 암호화 데이터
	String sRtnMsg		= "";	// 처리결과 메세지
	
	// 암호화 처리결과코드에 따른 처리
	if (iRtn == 0)
	{
        // 인증요청 암호화 데이터 추출
		sEncData = pClient.getCipherData();		
		sRtnMsg = "정상 처리되었습니다.";
	}
	else if (iRtn == -1)
	{
		sRtnMsg = "암호화 시스템 오류 : 귀사 서버 환경에 맞는 모듈을 이용해주십시오.<br>오류가 지속되는 경우 iRtn 값, 서버 환경정보, 사이트코드를 기재해 문의주시기 바랍니다.";
	}
	else if (iRtn == -2)
	{
		sRtnMsg = "암호화 처리 오류 : 최신 모듈을 이용해주십시오. 오류가 지속되는 경우 iRtn 값, 서버 환경정보, 사이트코드를 기재해 문의주시기 바랍니다.";
	}
	else if (iRtn == -9)
	{
		sRtnMsg = "입력 정보 오류 : 암호화 함수에 입력된 파라미터 값을 확인해주십시오.<br>오류가 지속되는 경우, 함수 실행 직전 각 파라미터 값을 로그로 출력해 발송해주시기 바랍니다.";
	}
	else
	{
		sRtnMsg = "기타 오류: iRtn 값과 적용한 샘플소스를 발송해주시기 바랍니다.";
	}

%>

<%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String check_sSiteCode = "BO500";			// NICE로부터 부여받은 사이트 코드
    String check_sSitePassword = "Iyx1lInyzyFW";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(check_sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubun 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
	
	String sGender = ""; 			//없으면 기본 선택 값, 0 : 여자, 1 : 남자 
	
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    //String sReturnUrl = "http://www.test.co.kr/checkplus_success.jsp";      // 성공시 이동될 URL
    //String sErrorUrl = "http://www.test.co.kr/checkplus_fail.jsp";          // 실패시 이동될 URL
    String sReturnUrl = url+"/plugin/checkplus_success.jsp?mode=find-pw";      // 성공시 이동될 URL
    String sErrorUrl = url+"/plugin/checkplus_fail.jsp?mode=find-pw";          // 실패시 이동될 URL    

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + check_sSiteCode.getBytes().length + ":" + check_sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
						"6:GENDER" + sGender.getBytes().length + ":" + sGender;
    
    String sMessage = "";
    String check_sEncData = "";
    
    int iReturn = niceCheck.fnEncode(check_sSiteCode, check_sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
    	check_sEncData = niceCheck.getCipherData();
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>본인 인증 | 비밀번호 찾기 | 경남아너스빌</title>
	<script>
		window.name ="Parent_window";

		function ipin_fnPopup(){
			window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			document.form_ipin.target = "popupIPIN2";
			document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
			document.form_ipin.submit();
		}
	
		function fnPopup(){
			window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
			document.form_chk.target = "popupChk";
			document.form_chk.submit();
		}
	</script>	
</head>

<body>
    <div id="wrap" class="wrap sub membership find">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>비밀번호 찾기</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">실명인증은 아이핀, 휴대폰 중 소지하고 계신<br> 한 가지를 선택하여 하실 수 있습니다.</p>
                                <p class="txt2">본인인증 시 제공되는 정보는 해당 기관에서 직접 수집하며,<br> 인증 이외의 용도로 이용 또는 저장되지 않습니다.</p>
                            </div>
                            <div class="btn_wrap two">
								<form name="form_ipin" method="post">
									<!-- 요청모드 (필수 데이터) -->
									<input type="hidden" name="m" value="pubmain">	
									<!-- 인증요청 암호화 데이터 -->
									<input type="hidden" name="enc_data" value="<%= sEncData %>">
									<input type="hidden" name="mode" value="find-pw">
								</form>
								<!-- 아이핀 가상주민번호 서비스 팝업 인증결과 전달 form -->
								<form name="vnoform" method="post">
									<!-- 인증결과 암호화 데이터 -->
									<input type="hidden" name="enc_data">
									<input type="hidden" name="mode" value="find-pw">
									<input type="hidden" name="userId" value="find-pw">								
								</form>								
                                <form name="form_chk" method="post">
									<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
									<input type="hidden" name="EncodeData" value="<%= check_sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
								</form>
								                            
                                <input type="text" name="userId" id="userId" class="first" placeholder="아이디">
                               	<a href="javascript:ipin_fnPopup();" class="basic_btn sub"><span>아이핀 인증</span></a>
                               	<a href="javascript:fnPopup();" class="basic_btn sub"><span>휴대폰 인증</span></a>                                
                            </div>
                        </div>
                    </div>
                    <span class="sec_footer">아이디를 찾으시나요? <a href="/membership/find-id">아이디 찾기</a></span>
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