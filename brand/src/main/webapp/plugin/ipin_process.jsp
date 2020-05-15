<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	/*********************************************************************************************
		NICE������ Copyright(c) KOREA INFOMATION SERVICE INC. ALL RIGHTS RESERVED
		
		���񽺸� : IPIN �����ֹι�ȣ ���� 
		�������� : IPIN �����ֹι�ȣ ���� ������� ó�� ������
		
		            ���Ϲ��� ������� �����͸� ȣ�� �������� �����ϰ� �����˾��� �ݴ� ������
	**********************************************************************************************/
	
	// ������� ��ȣȭ ������ ��� (������û ��ȣȭ ������ ���� �޶�� ����)
	String sResponseData = requestReplace(request.getParameter("enc_data"), "encodeData");
%>

<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>NICE������ �����ֹι�ȣ ����</title>
	<script>
		function fnLoad()
		{
			// ��翡���� �ֻ����� 'parent.opener.parent.document.'�� �����Ͽ����ϴ�
			// �ͻ��� ȯ�� �� ���μ����� �°� �����Ͻñ� �ٶ��ϴ�
			parent.opener.parent.document.vnoform.enc_data.value = "<%= sResponseData %>";
			parent.opener.parent.document.vnoform.target = "Parent_window";
			
			// ������� �����͸� ���� �����ϴ� ��������� URL (����:�����ּ�, �ʼ��׸�:��������) 
			//parent.opener.parent.document.vnoform.action = "http://.../ipin_result.jsp";
			parent.opener.parent.document.vnoform.action = "/plugin/ipin_result.jsp";
			<c:if test="${param.mode=='find-pw'}">
			parent.opener.parent.document.vnoform.userId.value = parent.opener.parent.document.getElementById('userId').value;
			</c:if>
			
			parent.opener.parent.document.vnoform.submit();
			
			self.close();
		}
	</script>
</head>

<%    
	// ������� ��ȣȭ �����Ͱ� �����ϴ� ���
	if (!sResponseData.equals("") && sResponseData != null)
	{
%>
<body onLoad="fnLoad()">
<%
	// ������� ��ȣȭ �����Ͱ� �������� �ʴ� ���
	} else {
%>
<body onLoad="self.close()">
<%
	}
%>

<%!
	// ���ڿ� ���� �Լ�
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
</body>
</html>