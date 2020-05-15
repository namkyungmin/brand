<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>상세 | 아너스빌 소식 | 아너스빌 멤버스 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub members news">
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
                        <li><a href="/members/news" class="on">아너스빌 소식</a></li>
                        <li><a href="/members/guide">청약가이드</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <div class="tb_view">
                        <div class="top_wrap">
                            <div class="tit_wrap">
                                <div class="tit">
                                    ${data.title}
                                </div>
                                <div class="date">${fn:replace(fn:substring(data.displayDate,0,10),"-",".")}</div>
                            </div>
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">조회수</span>
                                    <span class="cont">${data.readCnt}</span>
                                </div>
                                <div class="data"> 
                                    <span class="tit">첨부파일</span>
                                    <span class="cont">
                                    <c:forEach var="sfile" items="${file}" varStatus="row">
                                    	<a href="/download_file?file_id=${sfile.fileId}&board_id=${sfile.boardId}&board_code=${sfile.boardCode}">${sfile.fileName}</a>
                                    </c:forEach>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="cont_wrap">
                            <p>
	                            ${data.contents }
                            </p>
                        </div>
                    </div>
                    <div class="btn_wrap">
                        <a href="/members/news" class="basic_btn">
                            <span>목록</span>
                        </a>
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