<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>문의내역 관리 | A/S문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my question list">
        <%@ include file="/include/gnb.jsp" %>
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
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as" class="on">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li>
                                <a href="/my/as">A/S 문의</a>
                            </li>
                            <li class="on">
                                <a href="/my/as/list">문의내역 관리</a>
                            </li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="tb_view">
                        <div class="top_wrap">
                            <div class="tit_wrap">
                                <div class="tit">
                                     ${data.title }   
                                </div>
                                <div class="date"> ${fn:substring(data.regTime,0,10)}   </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">첨부파일</span>
                                    <span class="cont">
	                        		<c:forEach var="sfile" items="${file}" varStatus="row">
	                        			<a href="/download_file?file_id=${sfile.fileId}&board_id=${sfile.boardId}&board_code=${sfile.boardCode}">${sfile.fileName}</a>
	                        		</c:forEach>                                    
                                    </span>
                                </div>
                            </div>
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">상태</span>
                                    <div class="cont">
                                    <c:if test="${data.status=='대기' }">
                                        <!-- s: 답변 대기일경우 -->
                                        <span class="state wait">
                                            대&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기
                                        </span>
                                        <!--// e: 답변 대기일경우 -->
                                        </c:if>
                                        <c:if test="${data.status=='답변완료' }">
                                        <!-- s: 답변 완료일경우 -->
                                        <span class="state complete">
                                            답변완료
                                        </span>
                                        <!--// e: 답변 완료일경우 -->
                                        </c:if>
                                        <c:if test="${data.status=='답변불가' }">
                                        <!-- s: 답변 완료일경우 -->
                                        <span class="state complete">
                                            답변완료
                                        </span>
                                        <!--// e: 답변 완료일경우 -->
                                        </c:if>                                        
                                    </div>
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
                    <!-- s: 관리자 답변 -->
                    <div class="tb_view answer">
                        <div class="top_wrap">
                            <div class="data_wrap">
                                <div class="data">
                                    <span class="tit">답변자</span>
                                    <span class="cont">${data.replyId }</span>
                                </div>
                                <div class="data">
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
                    <!--// e: 관리자 답변 -->
                    </c:if>
                    
                    <div class="btn_wrap">
                        <a href="/my/as/list" class="basic_btn">
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
        honorsvilleBrand.btnFavor();
        honorsvilleBrand.accodian();
    </script>
</body>
</html>