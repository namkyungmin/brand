<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>아너스빌 소식 | 아너스빌 멤버스 | 경남아너스빌</title>
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
                    <div class="tb_list">
                        <div class="search_wrap">
                            <div class="input_wrap">
                				<form method="post" id="search_form" name="search_form" action="">
                				<input type="hidden" name="curPage"  id="curPage" value="${param.curPage?param.curPage:1 }">
                                <select name="searchKey" id="searchKey">
                                    <option value="">제목+내용</option>
			                        <option value="title" ${param.searchKey=="title"?"selected":"" }>제목</option>
			                        <option value="contents"  ${param.searchKey=="contents"?"selected":"" }>내용</option>
                                </select>
                                <input type="text"  name="searchValue"  id="searchValue" value="${param.searchValue }">
                                <a href="javascript:;;" id="searchBtn" class="btn">검색</a>
                                </form>
                            </div>
                        </div>
                        <table>
                            <colgroup>
                                <col style="width:130px;">
                                <col style="width:auto;">
                                <col style="width:190px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                </tr>
                            </thead>
                            <tbody>
		                    <c:forEach var="data" items="${list}"  varStatus="status">
                                <tr>
                                    <td>${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                                    <td>
                                    	<c:if test="${data.newsType=='link' }">
                                    	<a href="${data.url }" target="_blank"  onclick="showLink('${data.newsId}')">${data.title }</a>
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
                        <%@ include file="/include/paging.jsp" %>
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
        $(function(){
        	$('#searchBtn').on("click",function(){
        		$('#search_form').submit();
        	});
        });
        
        
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