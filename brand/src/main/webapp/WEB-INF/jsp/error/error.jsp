<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>경남아너스빌</title>
<style>
    html, body{height:100%;}
</style>
</head>

<body>
  <div id="wrap" class="wrap error">
    <%@ include file="/include/gnb.jsp" %>
    <div id="container">
      <div id="contents">
        <div class="sec1 section">
          <img src="/resources/images/common/error_icon.png" class="error_icon" alt="에러 아이콘">
          <h3>요청하신 페이지를 표시할 수 없습니다.</h3>
          <p>잘못된 경로로 접근하셨거나, 현재 운영되지 않는 페이지입니다.</p>
          <div class="btn_area">
            <a href="/" class="basic_btn"><span>메인으로</span></a>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="/include/footer.jsp" %>
  </div>
  <%@ include file="/include/common.jsp" %>
</body>
</html>