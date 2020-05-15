<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>리스트 | 분양단지 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub estate list">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>분양단지</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/estate/sale/list" class="on">분양중인 단지</a></li>
                        <li><a href="/estate/plan/list">분양예정 단지</a></li>
                        <li><a href="/estate/apt/list">분양완료 단지</a></li>
                        <li><a href="/estate/tearplan">연간분양계획</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section" id="parcel_body">
                    <div class="search_wrap">
                        <div class="search01">
                            <p class="tit"><a href="#">지역별/유형별 검색해보세요.</a></p>
                            <div class="check_area">
                                <h3>지역별</h3>
                                <div class="check_wrap search_area">
                                    <span class="checked check_all">
                                        <label for="parcelAreaAll">
                                            <input type="checkbox" name="parcelArea" id="parcelAreaAll" value="" checked="checked">
                                            전체
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelArea_1">
                                            <input type="checkbox" name="parcelArea" id="parcelArea_1" value="수도권" checked="checked">
                                            수도권
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelArea_2">
                                            <input type="checkbox" name="parcelArea" id="parcelArea_2" value="강원" checked="checked">
                                            강원
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelArea_3">
                                            <input type="checkbox" name="parcelArea" id="parcelArea_3" value="충청" checked="checked">
                                            충청
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelArea_4">
                                            <input type="checkbox" name="parcelArea" id="parcelArea_4" value="호남" checked="checked">
                                            호남
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelArea_5">
                                            <input type="checkbox" name="parcelArea" id="parcelArea_5" value="영남" checked="checked">
                                            영남
                                        </label>
                                    </span>
                                </div>
                            </div>
                            <div class="check_area">
                                <h3>유형별</h3>
                                <div class="check_wrap search_type">
                                    <span class="checked check_all">
                                        <label for="parcelTypeAll">
                                            <input type="checkbox" name="parcelType" id="parcelTypeAll" value="" checked="checked">
                                            전체
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelType_1">
                                            <input type="checkbox" name="parcelType" id="parcelType_1" value="아파트" checked="checked">
                                            아파트
                                        </label>
                                    </span>
                                    <span class="checked long">
                                        <label for="parcelType_2">
                                            <input type="checkbox" name="parcelType" id="parcelType_2" value="오피스텔" checked="checked">
                                            오피스텔
                                        </label>
                                    </span>
                                    <span class="checked long">
                                        <label for="parcelType_3">
                                            <input type="checkbox" name="parcelType" id="parcelType_3" value="상가분양" checked="checked">
                                            상가분양
                                        </label>
                                    </span>
                                    <span class="checked">
                                        <label for="parcelType_4">
                                            <input type="checkbox" name="parcelType" id="parcelType_4" value="기타" checked="checked">
                                            기타
                                        </label>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="search02">
                            <p class="tit"><a href="#">단지명으로 검색</a></p>
                            <div class="input_wrap">
                                <input type="hidden" name="parcelStage" id="parcelStage" value="분양중" />
                                <input type="text" name="searchValue" id="searchValue" placeholder="지역이나 단지명을 입력해 주세요." class="enter">
                                <a href="javascript:;;" class="btn_search" id="searchBtn">검색</a>
                            </div>
                        </div>
                    </div>
                    <div id="parcel_wrap">
                    <c:forEach var="data" items="${list}"  varStatus="status">
                    <c:if test="${status.count mod 3==1 || status.count == 1}">
                    	<div class="parcel_wrap  <c:if test="${status.count==4 || listCnt <= 3}">last</c:if>">
                    </c:if>
                        <div class="parcel_item">
                            <a href="javascript:;;" id="favoriteBtn" data-parcelId="${data.parcelId }" class="btn_favor ${data.favorite!=null?"on":"" }"></a>
                            <a href="/estate/sale/view?parcel_id=${data.parcelId }" class="item_inner">
                                <div class="info">
                                    <h4>
                                        ${data.parcelName }
                                    </h4>
                                    <table class="color_9a8b86">
                                        <colgroup>
                                            <col style="width:55px;">
                                            <col style="width:auto;">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>위치</th>
                                                <td>${data.location}</td>
                                            </tr>
                                            <tr>
                                                <th>세대수</th>
                                                <td>${data.scale}</td>
                                            </tr>
                                            <tr>
                                                <th>분양</th>
                                                <td>${data.period}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <p class="tel">${data.inquiry }</p>
			                    	<c:if test="${data.parcelStage=='분양중' && data.parcelType == '상가분양'}">
			                        <span class="flag store_on">${data.parcelStage }</span>
			                        </c:if>
			                        <c:if test="${data.parcelStage=='분양중' && data.parcelType != '상가분양'}">
			                        <span class="flag on">${data.parcelStage }</span>
			                        </c:if>			                        
			                        <c:if test="${data.parcelStage=='분양예정'  && data.parcelType == '상가분양'}">
			                        <span class="flag store_on">${data.parcelStage }</span>
			                        </c:if>
			                        <c:if test="${data.parcelStage=='분양예정'  && data.parcelType != '상가분양'}">
			                        <span class="flag scheduled">${data.parcelStage }</span>
			                        </c:if>			                        
			                        <c:if test="${data.parcelStage=='분양완료'  && data.parcelType == '상가분양'}">
			                        <span class="flag store_on">${data.parcelStage }</span>
			                        </c:if>                                    
			                        <c:if test="${data.parcelStage=='분양완료'  && data.parcelType != '상가분양' }">
			                        <span class="flag complete">${data.parcelStage }</span>
			                        </c:if>		                                  	                                 
                                </div>
                                <div class="thumb"><img src="${data.parcelListImage }" alt="" onError="this.src='/resources/images/main/main_parcel_basic.jpg'"></div>
                            </a>
                        </div>
                    <c:if test="${status.count%3==0 && status.count-1>0}">
                        </div>
                    </c:if>
                    </c:forEach>
                    </div>
					<div class="no_result" <c:if test="${listCnt>0}">style="display:none"</c:if>>
                        <p>
                            검색하신 정보가 없습니다.
                        </p>
                    </div>
                 <div class="btn_wrap" <c:if test="${listCnt  <= 6}">style="display:none"</c:if>>
                     <a href="javascript:;;" class="basic_btn more" id="moreBtn">
                         <span>더보기</span>
                     </a>
                 </div>                        
                </div>
           
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <script src="/resources/js/parcel.js"></script>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
        honorsvilleBrand.searchMotion();
        var totalCnt = "${listCnt}";
        
        <c:if test="${sessionScope.userId==null}">
        function activeClick() {
            var $btn = $('.btn_favor');
            $btn.off("click");
            $btn.on("click",function(e){
                e.preventDefault();
                alert('로그인 후 이용이 가능합니다.');
                location='/membership/login';
            });    
        }
        </c:if>
        <c:if test="${sessionScope.userId!=null}">
        function activeClick() {
            var $btn = $('.btn_favor');
            $btn.off("click");
            $btn.on("click",function(e){
                var parcelId = $(this).attr('data-parcelId');
                var data = {parcelId:parcelId};
                var $this = $(this);
                
                  $.ajax({
                      url: "/estate/add_favorite",
                      type: "POST",
                      cache: false,
                      dataType: "json",
                      data: data,
                      success: function(data){
                          if(data.result == 0) {
                              if ( $this.hasClass('on') ) {
                                  $this.removeClass('on');
                              } else {
                                  $this.addClass('on');
                              }
                          } else {
                              alert('정보를 확인해주세요.')
                          }
                      },
                      error: function (request, status, error){        
                          var msg = "ERROR : " + request.status + "<br>"
                          msg +=  + "내용 : " + request.responseText + "<br>" + error;
                          console.log(msg);              
                      }
                  });
                e.preventDefault();
    
            });    	
        }
        </c:if>    
        activeClick();
    </script>
</body>
</html>