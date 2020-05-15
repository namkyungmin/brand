<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>관심단지 관리 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my estate list interest">
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
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li class="on"><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <div class="parcel_wrap">
                    <c:forEach var="data" items="${list}"  varStatus="status">
                     <div class="parcel_item">
                            <div class="btn_area">
		                        <c:if test="${data.homepageUrl!=''}">
		                        <a href="${data.homepageUrl}" target="${data.homepageTarget}" class="btn_homepage">홈페이지 바로가기</a>
		                        </c:if>
		                        <c:if test="${data.inquiry!=''}">
		                        <a href="tel:${data.inquiry}" class="btn_tel2">전화걸기</a>
		                        </c:if>
                                <a href="javascript:;;" id="favoriteBtn" data-parcelId="${data.parcelId }" class="btn_favor ${data.favorite!=null?"on":"" }"></a>
                            </div>
                            <c:if test="${data.parcelStage=='분양중'}">
                            <a href="/estate/sale/view?parcel_id=${data.parcelId }" class="item_inner">
                            </c:if>
                            <c:if test="${data.parcelStage=='분양예정'}">
                            <a href="/estate/plan/view?parcel_id=${data.parcelId }" class="item_inner">
                            </c:if>
                            <c:if test="${data.parcelStage=='분양완료'}">
                            <a href="/estate/apt/view?parcel_id=${data.parcelId }" class="item_inner">
                            </c:if>                            
                                <h4>
                                    ${data.parcelName }
                                </h4>
                                <table class="color_9a8b86">
                                    <colgroup>
                                        <col width="80px">
                                        <col width="*">
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
                                <!-- <span class="tel">${data.inquiry }</span>   -->
                            </a>
                        </div>
                         
                        </c:forEach> 
                        
					<div class="no_result" <c:if test="${listCnt>0}">style="display:none"</c:if>>
                        <p>
                           	 관심단지 리스트가 없습니다.
                        </p>
                    </div>
					<c:if test="${listCnt  > 6}">
                    <div class="btn_wrap">
                        <a href="javascript:;;" class="basic_btn more" id="moreBtn">
                            <span>더보기</span>
                        </a>
                    </div>
                    </c:if>                    
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script src="/resources/mobile/js/interest.js"></script>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab(); 
        honorsvilleBrand.stickyTab();
        //honorsvilleBrand.btnFavor();
        
        var totalCnt = "${listCnt}";

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
    	  		            location.reload();
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
        <c:if test="${sessionScope.userId==null}">
        var $btn = $('.btn_favor');
        $btn.click(function(e){
            e.preventDefault();
            alert('로그인 후 이용이 가능합니다.');
        });    
        </c:if>
        <c:if test="${sessionScope.userId!=null}">
            var $btn = $('.btn_favor');
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
    	  		            location.reload();
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
        </c:if>        
    </script>
</html>