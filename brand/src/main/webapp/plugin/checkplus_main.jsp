<%@ page language="java" contentType="text/html;charset=utf-8" %>

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
    String url = "https://"+request.getServerName();
	if(request.getServerName().equals("localhost")) 
		url = "http://localhost:8080";
    String sReturnUrl = url+"/plugin/checkplus_success.jsp";      // 성공시 이동될 URL
    String sErrorUrl = url+"/plugin/checkplus_fail.jsp";          // 실패시 이동될 URL    

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

<html>
<head>
	<title>NICE평가정보 - CheckPlus 안심본인인증 테스트</title>
	
	<script language='javascript'>
	window.name ="Parent_window";
	
	function fnPopup(){
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}
	</script>
</head>
<body>
	<%= sMessage %><br><br>
	업체정보 암호화 데이타 : [<%= check_sEncData %>]<br><br>

	<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="<%= check_sEncData %>">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	    
		<a href="javascript:fnPopup();"> CheckPlus 안심본인인증 Click</a>
	</form>
</body>
</html>