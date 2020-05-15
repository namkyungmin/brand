<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>비밀번호 찾기 결과 | 비밀번호 찾기 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership find">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>비밀번호 찾기</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
            	<c:if test="${data.userId !=null}">
                <!-- 결과 있을 시 -->
                <div class="section sec1">
                    <div class="box_wrap">
                                <p class="txt1"><span class="result">${fn:substring(data.email,0,fn:indexOf(data.email,"@")-3) }***
    	                    ${fn:substring(data.email,fn:indexOf(data.email,"@"),fn:length(data.email)) }  </span><br>메일 주소로 임시 비밀번호가 발급되었습니다.</p>
                        <div class="btn_wrap">
                            <a href="/membership/login" class="basic_btn">
                                <span>로그인</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- //결과 있을 시 -->
                    </c:if>
					<c:if test="${data.userId ==null}">                
                <!-- 결과 없을 시 -->
                <div class="section sec1">
                    <div class="box_wrap">
                        <p class="txt1">일치하는 회원정보가 없습니다.</p>
                        <div class="btn_wrap">
                            <a href="/membership/login" class="basic_btn">
                                <span>회원가입</span>
                            </a>
                            <a href="/membership/find-password" class="basic_btn type02">
                                <span>재입력</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- //결과 없을 시 -->
                </c:if>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script>
        honorsvilleBrand.stickyGnb();
    </script>
</body>
</html>