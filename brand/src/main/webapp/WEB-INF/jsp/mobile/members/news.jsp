<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>아너스빌 소식 | 아너스빌 멤버스 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub members news">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>아너스빌 멤버스</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul class="auto">
                        <li class="on">
                            <a href="/members/news">아너스빌 소식</a>
                        </li>
                        <li>
                            <a href="/members/guide">청약 가이드</a>
                        </li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <div class="tb_list">
                        <table>
                            <colgroup>
                                <col width="*">
                                <col width="76px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>

		                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                    <td>
                                    	<c:if test="${data.newsType=='link' }">
                                    	<a href="${data.url }" target="_blank" onclick="showLink('${data.newsId}')">${data.title }</a>
                                    	</c:if>
                                    	<c:if test="${data.newsType=='news' || data.newsType==null }">
                                        <a href="/members/view?news_id=${data.newsId}">${data.title }</a>
                                        </c:if>                                       
                                    </td>
                                    <td>${fn:replace(fn:substring(data.displayDate,0,10),"-",".")}</td>
                                </tr>		                    
		                    
		                    </c:forEach>
		                    <c:if test="${fn:length(list)==0}">
		                    <tr>	
		                    	<td colspan="3" class="text-center">정보가 없습니다.</td>
		                    </tr>
		                    </c:if>                            
                            </tbody>
                        </table>
                       <%@ include file="/include/mobile/paging.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script>
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
        
        function showLink(id) {
        	var url = '/members/view?news_id='+id;
		  $.ajax({
    		    url: url,
    		    type: "POST",
    		    cache: false,
    		    dataType: "json",
    		    success: function(data){
    		    },
    		    error: function (request, status, error){        
    		        var msg = "ERROR : " + request.status + "<br>"
    		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
    		      console.log(msg);              
    		    }
    		  }); 
      	}
    </script>
</body>
</html>