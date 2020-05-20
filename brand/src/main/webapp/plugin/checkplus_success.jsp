<%@ page language="java" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	//인증 후 결과값이 null로 나오는 부분은 관리담당자에게 문의 바랍니다.
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "BO500";			// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "Iyx1lInyzyFW";		// NICE로부터 부여받은 사이트 패스워드

    String sCipherTime = "";			// 복호화한 시간
    String sRequestNumber = "";			// 요청 번호
    String sResponseNumber = "";		// 인증 고유번호
    String sAuthType = "";				// 인증 수단
    String sName = "";					// 성명
    String sDupInfo = "";				// 중복가입 확인값 (DI_64 byte)
    String sConnInfo = "";				// 연계정보 확인값 (CI_88 byte)
    String sBirthDate = "";				// 생년월일(YYYYMMDD)
    String sGender = "";				// 성별
    String sNationalInfo = "";			// 내/외국인정보 (개발가이드 참조)
	String sMobileNo = "";				// 휴대폰번호
	String sMobileCo = "";				// 통신사
    String sMessage = "";
    String sPlainData = "";
    
    String cellPhone = ""; // 휴대폰 번호 파싱한값 
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
		//sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 사용시 주석 해제 후 사용
        sBirthDate		= (String)mapresult.get("BIRTHDATE");
        sGender			= (String)mapresult.get("GENDER");
        sNationalInfo  	= (String)mapresult.get("NATIONALINFO");
        sDupInfo		= (String)mapresult.get("DI");
        sConnInfo		= (String)mapresult.get("CI");
        sMobileNo		= (String)mapresult.get("MOBILE_NO");
        sMobileCo		= (String)mapresult.get("MOBILE_CO");
        cellPhone = "";
        
        if(sMobileNo.length() == 10)
        	cellPhone = sMobileNo.substring(0, 3)+"-"+sMobileNo.substring(3, 6)+"-"+sMobileNo.substring(6, 10);
        else if(sMobileNo.length() == 11)
        	cellPhone = sMobileNo.substring(0, 3)+"-"+sMobileNo.substring(3, 7)+"-"+sMobileNo.substring(7, 11);
        else cellPhone = sMobileNo;
        
        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "세션값 불일치 오류입니다.";
            sResponseNumber = "";
            sAuthType = "";
        }
    }
    else if( iReturn == -1)
    {
        sMessage = "복호화 시스템 오류입니다.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "복호화 처리 오류입니다.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "복호화 해쉬 오류입니다.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "복호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "사이트 패스워드 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }

%>
<%!

	public String requestReplace (String paramValue, String gubun) {

        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>

<html>
<head>
    <title>NICE평가정보 - CheckPlus 안심본인인증 테스트</title>
	<script language="javascript">
	function fnLoad()
	{
		<c:if test="${param.mode=='find-pw'}">
		document.getElementById('userId').value = parent.opener.parent.document.getElementById('userId').value;
		</c:if>
		document.mainForm.submit();window.close();
	}
	</script>    
</head>
<body onLoad="fnLoad()">
	<%if(iReturn == 0) { %>
	<c:if test="${param.mode=='find-id'}">
	<form method="post" name="mainForm" id="mainForm" action="/membership/find-id/result" target="Parent_window">
	</c:if>
	<c:if test="${param.mode=='find-pw'}">
	<form method="post" name="mainForm" id="mainForm" action="/membership/find-password/result" target="Parent_window">
		<input type="hidden" name="userId" id="userId" value="" >
	</c:if>
	<c:if test="${param.mode==''}">
	<form method="post" name="mainForm" id="mainForm" action="/membership/join/form" target="Parent_window">
	</c:if>
	<c:if test="${param.mode==null}">
	<form method="post" name="mainForm" id="mainForm" action="/membership/join/form" target="Parent_window">
	</c:if>	
		<input type="hidden" name="certType" value="20" >
		<input type="hidden" name="sDupInfo" value="<%=sDupInfo %>" >
		<input type="hidden" name="sGender" value="<%=sGender %>" >
		<input type="hidden" name="sName" value="<%=sName %>" >
		<input type="hidden" name="cellPhone" value="<%=cellPhone %>" >
	</form>
	<%} %>
	<!-- 
    <center>
    <p><p><p><p>
    본인인증이 완료 되었습니다.<br>
    <table border=1>
        <tr>
            <td>복호화한 시간</td>
            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
        </tr>
        <tr>
            <td>요청 번호</td>
            <td><%= sRequestNumber %></td>
        </tr>            
        <tr>
            <td>NICE응답 번호</td>
            <td><%= sResponseNumber %></td>
        </tr>            
        <tr>
            <td>인증수단</td>
            <td><%= sAuthType %></td>
        </tr>
		<tr>
            <td>성명</td>
            <td><%= sName %></td>
        </tr>
		<tr>
            <td>중복가입 확인값(DI)</td>
            <td><%= sDupInfo %></td>
        </tr>
		<tr>
            <td>연계정보 확인값(CI)</td>
            <td><%= sConnInfo %></td>
        </tr>
		<tr>
            <td>생년월일(YYYYMMDD)</td>
            <td><%= sBirthDate %></td>
        </tr>
		<tr>
            <td>성별</td>
            <td><%= sGender %></td>
        </tr>
				<tr>
            <td>내/외국인정보</td>
            <td><%= sNationalInfo %></td>
        </tr>
        </tr>
			<td>휴대폰번호</td>
            <td><%= sMobileNo %></td>
        </tr>
		<tr>
			<td>통신사</td>
			<td><%= sMobileCo %></td>
        </tr>
		<tr>
			<td colspan="2">인증 후 결과값은 내부 설정에 따른 값만 리턴받으실 수 있습니다. <br>
			일부 결과값이 null로 리턴되는 경우 관리담당자 또는 계약부서(02-2122-4615)로 문의바랍니다.</td>
		</tr>
		</table><br><br>        
    <%= sMessage %><br>
    </center>
      -->
</body>
</html>