<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>문의내역 관리 | 1:1문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my question">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container"> 
            <!-- s: title -->
            <div class="page_tit">
                <h2>마이 아너스빌</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/my/faq">자주 묻는 질문</a></li>
                        <li class="on"><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <!-- s: tabNav -->
                <div class="tab_nav type01">
                    <ul>
                        <li class="btm">
                            <a href="/my/qna">1:1문의</a>
                        </li>
                        <li class="on btm">
                            <a href="">문의내역 관리</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="tb_view">
                        <div class="top_wrap">
                            <div class="tit_wrap">
                                <div class="tit">
                                    ${data.title }  </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">카테고리</span>
                                    <span class="cont">${data.category }</span>
                                </div>
                                <div class="data">
                                    <span class="tit">등록일</span>
                                    <span class="cont"> ${fn:substring(data.regTime,0,10)}</span>
                                </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data full file">
                                    <span class="tit">첨부파일</span>
                                    <span class="cont">
	                        		<c:forEach var="sfile" items="${file}" varStatus="row">
	                        			<a href="/download_file?file_id=${sfile.fileId}&board_id=${sfile.boardId}&board_code=${sfile.boardCode}">${sfile.fileName}</a><BR>
	                        		</c:forEach> 
                                    </span>
                                </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data full">
                                    <span class="tit">상태</span>
                                    <span class="cont">
                                    <c:if test="${data.status=='대기' }">
                                    	<span class="state_flag wait">대기</span>
                                    </c:if>
                                    <c:if test="${data.status=='답변완료' }">
                                        <span class="state_flag complete">답변완료</span>
                                    </c:if>
                                    <c:if test="${data.status=='답변불가' }">
                                        <span class="state_flag complete">답변완료</span>
                                    </c:if>                                    
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
                    <c:if test="${data.replyId!=null }">
                    <!-- s: 답변 -->
                    <div class="tb_view answer">
                        <div class="top_wrap">
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">답변자</span>
                                    <span class="cont">${data.replyId }</span>
                                </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data full">
                                    <span class="tit">답변일시</span>
                                    <span class="cont">
                                        ${data.replyTime }
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="cont_wrap">
                            <p>
                                ${data.replyContents}                                
                            </p>
                        </div>
                    </div>
                    <!--// e: 답변 -->
                    </c:if>
                    <div class="btn_wrap">
                        <a href="/my/qna/list" class="basic_btn">
                            <span>목록</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
    </script>
</html>