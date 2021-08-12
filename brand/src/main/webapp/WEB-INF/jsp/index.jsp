<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1100" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta property="og:title" content="경남아너스빌" />
<meta property="og:site_name" content="경남아너스빌" />
<meta property="og:description" content="SM경남기업 아파트 브랜드, 분양/입주 정보 제공, 브랜드 소개" />
<meta property="og:keywords" content="경남아너스빌, 아너스빌, 경남기업, keangnam, honorsville, 아파트 분양" />
<meta property="og:image" content="/resources/images/common/og_img.jpg" />
<meta name="description" content="SM경남기업 아파트 브랜드, 분양/입주 정보 제공, 브랜드 소개">
<meta name="keywords" content="경남아너스빌, 아너스빌, 경남기업, keangnam, honorsville, 아파트 분양">
<link rel="shortcut icon" href="/resources/images/common/favicon.ico">
<title>경남아너스빌</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/fullpage.css">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-159225570-1"></script>
<script>
if((window.location+"").indexOf("tb.") < 0) {
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-159225570-1');
}
</script>
</head>

<body>
    <%@ include file="/include/gnb.jsp" %>
    <div id="container" class="main">
        <div class="video_wrap">
            <video id="myVideo" muted data-keepplaying>
                <source src="/resources/images/main/main_video1.mp4" type="video/mp4">
            </video>
            <video id="myVideo" muted data-keepplaying>
                <source src="/resources/images/main/main_video2.mp4" type="video/mp4">
            </video>
            <video id="myVideo" muted data-keepplaying>
                <source src="/resources/images/main/main_video3.mp4" type="video/mp4">
            </video>
        </div>
        <div id="fullpage">
            <div class="section main_visual" id="section01">
                <div class="visual_inner">
                    <div class="contents">
                        <div class="main_tit">
                            <div class="tit01">
                                <div class="small_txt">
                                    <span>C</span>
                                    <span>O</span>
                                    <span>N</span>
                                    <span>S</span>
                                    <span>I</span>
                                    <span>D</span>
                                    <span>E</span>
                                    <span>R</span>
                                    <span>A</span>
                                    <span>T</span>
                                    <span>I</span>
                                    <span>O</span>
                                    <span>N</span>
                                </div>
                                <div class="big_txt">
                                    <div>
                                        <span>편</span>
                                        <span>안</span>
                                        <span>한&nbsp;</span>
                                        <span>삶</span>
                                        <span>을&nbsp;</span>
                                        <span>영</span>
                                        <span>위</span>
                                        <span>하</span>
                                        <span>기&nbsp;</span>
                                        <span>위</span>
                                        <span>한</span>
                                    </div>
                                    <div>
                                        <span>사</span>
                                        <span>려&nbsp;</span>
                                        <span>깊</span>
                                        <span>은&nbsp;</span>
                                        <span>생</span>
                                        <span>각</span>
                                    </div>
                                </div>
                            </div>
                            <div class="tit02">
                                <div class="small_txt">
                                    <span>A</span>
                                    <span>F</span>
                                    <span>F</span>
                                    <span>I</span>
                                    <span>N</span>
                                    <span>I</span>
                                    <span>T</span>
                                    <span>Y</span>
                                </div>
                                <div class="big_txt">
                                    <div>
                                        <span>감</span>
                                        <span>각</span>
                                        <span>적</span>
                                        <span>인&nbsp;</span>
                                        <span>공</span>
                                        <span>간</span>
                                        <span>이&nbsp;</span>
                                        <span>선</span>
                                        <span>사</span>
                                        <span>하</span>
                                        <span>는</span>
                                    </div>
                                    <div>
                                        <span>감</span>
                                        <span>명&nbsp;</span>
                                        <span>깊</span>
                                        <span>은&nbsp;</span>
                                        <span>생</span>
                                        <span>각</span>
                                    </div>
                                </div>
                            </div>
                            <div class="tit03">
                                <div class="small_txt">
                                    <span>P</span>
                                    <span>R</span>
                                    <span>E</span>
                                    <span>S</span>
                                    <span>T</span>
                                    <span>I</span>
                                    <span>G</span>
                                    <span>E</span>
                                </div>
                                <div class="big_txt">
                                    <div>
                                        <span>당</span>
                                        <span>신</span>
                                        <span>의&nbsp;</span>
                                        <span>일</span>
                                        <span>상</span>
                                        <span>이&nbsp;</span>
                                        <span>명</span>
                                        <span>예</span>
                                        <span>가&nbsp;</span>
                                        <span>되</span>
                                        <span>는</span>
                                    </div>
                                    <div>
                                        <span>고</span>
                                        <span>품</span>
                                        <span>격&nbsp;</span>
                                        <span>주</span>
                                        <span>거</span>
                                        <span>공</span>
                                        <span>간</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <c:if test="${fn:length(bannerList) > 0}">
                    <div class="right_wrap">
                        <div class="top_bg">
                            <img src="/resources/images/main/bg_main_pattern.jpg" alt="">
                        </div>
                        <div class="inner">
                        	<c:forEach var="data" items="${bannerList}"  varStatus="status">
                            <div class="percel0${status.count } ${status.count==1?'active':'' }">
                            	<c:if test="${data.flag=='분양예정' }">
                                <p class="flag banner scheduled">
                                    <span>분양<br>예정</span>
                                </p>
                                </c:if>
                                <c:if test="${data.flag=='분양중' }">
                                <p class="flag banner on">
                                    <span>분양중</span>
                                </p>
                                </c:if>
                                <c:if test="${data.flag=='분양완료' }">
                                <p class="flag banner complete">
                                    <span>분양완료</span>
                                </p>
                                </c:if>                                
                                <c:if test="${data.flag=='기타' }">
                                <p class="flag banner etc">
                                    <span>${data.flagInfo}</span>
                                </p>
                                </c:if>                                                                       
                                <div class="title_wrap">
                                    <div class="small_txt">
                                        <span>${data.subTitle}<br>${data.subTitle2}</span>
                                    </div>
                                        <div class="big_txt_km later">
                                        <div>
                                            <span>${data.title }</span>
                                        </div>
                                        <div>
                                            <span>${data.title2 }</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="info_wrap">
                                    <img src="${data.image}" alt="" class="thumb" onError="this.src='/resources/images/main/main_banner_basic.jpg'">
                                    <div class="btn_wrap">
                                        <a href="${data.url}" target="${data.urlTarget}" class="basic_btn outlink">
                                            <span>홈페이지 바로가기</span>
                                        </a>
                                    </div>
                                    <c:if test="${data.description != ''}">
                                    <table>
                                        <tr>
                                            <td>${data.description}</td>
                                        </tr>
                                    </table>                                    
                                    </c:if>
                                    <c:if test="${data.description == ''}">
                                    <table>
                                    	<c:if test="${data.descPlace != ''}">
                                        <tr>
                                            <th>위치</th>
                                            <td>${data.descPlace}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${data.descSize != ''}">
                                        <tr>
                                            <th>세대수</th>
                                            <td>${data.descSize}</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${data.descPlan != ''}">
                                        <tr>
                                            <th>분양</th>
                                            <td>${data.descPlan}</td>
                                        </tr>
                                        </c:if>
                                    </table>
                                    </c:if>
                                    <p class="tel">${data.contactNumber }</p>
                                </div>
                            </div>
                        	</c:forEach>
                        </div>
                        <div class="progress_wrap">
                            <div class="index_wrap">
                                <!-- <span class="crr_idx">01</span>
                                <span class="total">02</span> -->
                                <c:forEach var="data" items="${bannerList}"  varStatus="status">
                                <a href="#" ${status.count=='1'?'class="on"':'' }>0${status.count }</a>
                                </c:forEach>
                            </div>
                            <div class="circleSvg">
                                <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                                    <circle class="circle" cx="50" cy="50" r="50"></circle>
                                </svg>
                            </div>
                        </div>
                    </div>
                    </c:if>
                </div>
            </div>
            <div class="section" id="section02">
                <div class="fp-bg"></div>
                <div class="contents">
                    <div class="sec_inner">
                        <div class="btn_wrap obj">
                            <a href="/estate/tearplan" class="btn_tearplan">
                                <img src="/resources/images/main/btn_tearplan.png" alt="">
                            </a>
                        </div>
                        <div class="percel_container">
                            <div class="percel_wrap">
                                <c:forEach var="data" items="${parcelList}"  varStatus="status">
                                <div class="percel_item obj obj0${status.count }">
                                    <a href="#" class="btn_favor  ${data.favorite!=null?"on":"" }" data-parcelId="${data.parcelId }"></a>
                                    <c:if test="${data.parcelStage=='분양중' }">
                                    <a href="/estate/sale/view?parcel_id=${data.parcelId }" class="item_inner">
                                    </c:if>
                                    <c:if test="${data.parcelStage=='분양예정' }">
                                    <a href="/estate/plan/view?parcel_id=${data.parcelId }" class="item_inner">
                                    </c:if>                                
                                    <c:if test="${data.parcelStage=='분양완료' }">
                                    <a href="/estate/apt/view?parcel_id=${data.parcelId }" class="item_inner">
                                    </c:if>                                
                                        <div class="thumb">
                                            <img src="${data.parcelListImage }" alt="" onError="this.src='/resources/images/main/main_parcel_basic.jpg'">
                                        </div>
                                        <div class="info">
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
                                            
                                            
                                            <p class="percel_name">${data.parcelName}</p>
                                            <p class="address">${data.location }<br>${data.scale}</p>
                                            <p class="tel">${data.inquiry}</p>
                                        </div>
                                    </a>
                                </div>
                                   </c:forEach>
                                <c:if test="${fn:length(parcelList)==0}">
                                    정보가 없습니다.
                                </c:if>
                            </div>
                        </div>
                        <span class="percel_bg"><img src="/resources/images/main/bg_percel.jpg" alt=""></span>
                    </div>
                </div>
            </div>
            <div class="section" id="section03">
                <div class="fp-bg"></div>
                <div class="contents">
                    <div class="txt_bg_wrap">
                        <div class="txt_bg">
                            <div class="txt_top">
                                <div class="inner">
                                    <span class="eclips"></span>
                                    <span>PRESTIGE</span>
                                    <span class="eclips"></span>
                                    <span>CONSIDERATION</span>
                                    <span class="eclips"></span>
                                    <span>AFFINITY</span>
                                </div>
                                <div class="inner">
                                    <span class="eclips"></span>
                                    <span>PRESTIGE</span>
                                    <span class="eclips"></span>
                                    <span>CONSIDERATION</span>
                                    <span class="eclips"></span>
                                    <span>AFFINITY</span>
                                </div>
                            </div>
                        </div>
                        <div class="txt_bg">
                            <div class="txt_btm">
                                <div class="inner">
                                    <span class="eclips"></span>
                                    <span>PRESTIGE</span>
                                    <span class="eclips"></span>
                                    <span>CONSIDERATION</span>
                                    <span class="eclips"></span>
                                    <span>AFFINITY</span>
                                </div>
                                <div class="inner">
                                    <span class="eclips"></span>
                                    <span>PRESTIGE</span>
                                    <span class="eclips"></span>
                                    <span>CONSIDERATION</span>
                                    <span class="eclips"></span>
                                    <span>AFFINITY</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="brand_area left_area">
                        <div class="txt_wrap">
                            <img src="/resources/images/main/img_sec03_left_txt.png" alt="">
                            <a href="#" class="basic_btn">
                                <span>브랜드 스토리</span>
                            </a>
                        </div>
                        <div class="img_wrap">
                            <div class="img_inner">
                                <img src="/resources/images/main/img_sec03_left01.jpg" alt="" class="on">
                                <img src="/resources/images/main/img_sec03_left02.jpg" alt="">
                                <img src="/resources/images/main/img_sec03_left03.jpg" alt="">
                            </div>
                        </div>
                        <a href="/brand/brandstory" class="link_area"></a>
                    </div>
                    <div class="brand_area right_area">
                        <div class="img_wrap">
                            <div class="img_inner">
                                <img src="/resources/images/main/img_sec03_right01.jpg" alt="" class="on">
                                <img src="/resources/images/main/img_sec03_right02.jpg" alt="">
                                <img src="/resources/images/main/img_sec03_right03.jpg" alt="">
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <a href="#" class="basic_btn">
                                <span>브랜드 아이덴티티</span>
                            </a>
                            <img src="/resources/images/main/img_sec03_right_txt.png" alt="">
                        </div>
                        <a href="/brand/bi" class="link_area"></a>
                    </div>
                </div>
            </div>
            <div class="section" id="section04">
                <div class="contents">
                    <div class="sec_inner news_wrap">
                        <div class="tit_wrap">
                            <div class="tit">
                                <h2>NEWS</h2>
                                <a href="/members/news">
                                    경남아너스빌의 새로운 소식
                                </a>
                            </div>
                        </div>
                        <div class="news_list">
                            <ul>
                    			<c:forEach var="data" items="${newsList}"  varStatus="status">
                                <li>
                                   	<c:if test="${data.newsType=='link' }">
                                   	<a href="${data.url }" target="_blank">
                                   	</c:if>
                                   	<c:if test="${data.newsType=='news' || data.newsType==null }">
                                    <a href="/members/view?news_id=${data.newsId}">
                                    </c:if>	
                                        <span class="month">
                                        ${data.regTimeMonth }.</span>

                                        <span class="day">${fn:substring(data.displayDate,8,10) }</span>
                                        <span class="news_tit">
                                            ${data.title}
                                        </span>
                                    </a>
                                </li>
                    			</c:forEach>
			                    <c:if test="${fn:length(newsList)==0}">
			                    <li>정보가 없습니다.</li>
			                    </c:if>                        			
                            </ul>
                        </div>
                    </div>
                    <div class="btn_wrap">
                        <a href="/my/qna" class="qna">
                            <p class="tit">1:1 문의</p>
                            <p class="sub_tit">
                                원하시는 답을 찾지 못하셨다면, 1:1 문의를 이용할 수 있습니다.
                            </p>
                            <span class="view">
                                VIEW
                            </span>
                        </a>
                        <a href="/my/faq" class="faq">
                            <p class="tit">자주 묻는 질문</p>
                            <p class="sub_tit">
                                궁금하신 질문을 간편하게 찾아볼 수 있습니다.
                            </p>
                            <span class="view">
                                VIEW
                            </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="section fp-auto-height" id="section05">
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>

		<c:forEach var="data" items="${popupList}"  varStatus="status">
		<c:if test="${data.popupType=='ALL'||data.popupType=='PC' }">
        <!-- main popup -->
        <div id="mainPop${status.count }" class="main_pop open" style="left: ${data.posX}px;top: ${data.posY}px;display:none">
            <div class="cont_wrap">
            	<c:if test="${data.pcUrl!=''}"> 
                <a href="${data.pcUrl}" target="${data.pcUrlTarget }">
                </c:if>
                <img src="${data.imagePc }" alt="">
                </a>
            </div>
            <div id="dayCloseWrap" class="day_close_wrap">
                <input type="checkbox" id="dayClose${status.count }" class="" name="dayClose${status.count }" value="">
                <label for="dayClose">다시 보지 않기</label>
            </div>
            <a href="javascript:void(0);" id="mainClose${status.count }" class="main_pop_close" data-id="${status.count }">닫기</a>
        </div>
        <!-- //main popup -->
        </c:if>
        </c:forEach>
    </div>
    <script src="/resources/js/lib/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/plugin/TweenMax.min.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/plugin/fullpage.parallax.min.js"></script>
    <script src="/resources/js/plugin/fullpage.extensions.min.js"></script> 
    <script>
    $(function(){
    	$('.main_pop_close').on("click",function(){
    		$('#mainPop'+$(this).data("id")).hide();
    		if($('#dayClose'+$(this).data("id")).is(":checked") == true) {
    			 setCookie('mainPop'+$(this).data("id"), "done" , 1); 
    		}
    	});
    	$('.main_pop').each(function(){
    		   var blnCookie    = getCookie( $(this).attr("id") );
    		   if(blnCookie == "")
    			   $(this).show();
    		     
    	});
    });
    function getCookie( name ) {  
   	   var nameOfCookie = name + "=";  
   	   var x = 0;  
   	   while ( x <= document.cookie.length )  
   	   {  
   	       var y = (x+nameOfCookie.length);  
   	       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
   	           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
   	               endOfCookie = document.cookie.length;  
   	           return unescape( document.cookie.substring( y, endOfCookie ) );  
   	       }  
   	       x = document.cookie.indexOf( " ", x ) + 1;  
   	       if ( x == 0 )  
   	           break;  
   	   }  
   	   return "";  
   	}  
   	  
   	  
   	// 24시간 기준 쿠키 설정하기  
   	// expiredays 후의 클릭한 시간까지 쿠키 설정  
   	function setCookie( name, value, expiredays ) {   
   	   var todayDate = new Date();   
   	   todayDate.setDate( todayDate.getDate() + expiredays );   
   	   document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
   	}


    	    
        honorsvilleBrand.stickyGnb();
        //honorsvilleBrand.btnFavor();

        // video 재생 관련 변수
        var $video = $('.main .video_wrap video'),
            videoLen = $video.length,
            slideVideoIdx = 0,
            videos = document.getElementsByTagName('video'),
            $videoTxt = $('.main_visual .main_tit > div');

        // 메인비쥬얼 분양단지 영역 관련 변수
        var $rightWrap = $('.right_wrap'),
            $rightSlide = $rightWrap.find('.inner > div'),
            rightSlideLen = $rightSlide.length - 1,
            slideRightIdx = 0,
            beforeIdx,
            $rightTxt = $rightWrap.find('.inner .title_wrap'),
            rightSlideSec = 5000,
            $progress = $('.right_wrap .progress_wrap'),
            $prgIdxEl = $progress.find('a'),
            $circleWrap = $(".circleSvg"),
            $circle = $circleWrap.find("circle"),
            navDuration = rightSlideSec / 1000;

        // 브랜드 영역 관련 변수
        var $brandArea = $('.brand_area');
        var slideBrandIntv;
        $rightSlide.eq(0).find('.title_wrap span').addClass('on');
        window.onload  = function() {
            $('.txt_bg_wrap').show();
            // section03 텍스트 animation
            textAniTop();
            textAniBtm();
        };

        $(document).ready(function(){
            // video rolling
            if ( videoLen > 0 ) { slideVideo(slideVideoIdx); }

            if ( $rightSlide.length > 1 ) {
                circlePlay();
                var slideRightIntv = setInterval("slideRight()", rightSlideSec);
            } else {
                $circleWrap.addClass('stop');
            }
            
            $rightWrap.mouseenter(function(){
                $rightWrap.addClass('active');
                clearInterval(slideRightIntv);
                circleInit();
                $circleWrap.addClass('stop');
            }).mouseleave(function(){
                $rightWrap.removeClass('active');
                if ( $rightSlide.length > 1 ) {
                    slideRightIntv = setInterval("slideRight()", rightSlideSec);
                    circlePlay();
                    $circleWrap.removeClass('stop');
                } else {
                    $circleWrap.addClass('stop');
                }
                
            });

            $prgIdxEl.click(function(e){
                e.preventDefault();
                var $this = $(this);
                var $thisIdx = $this.index();
                var rightTxtClass = $rightSlide.eq($thisIdx).attr('class');
                slideRightIdx = $thisIdx;

                
                if ( !$this.hasClass('on') ) {
                    $rightTxt.find('span').removeClass('on');
                    $this.addClass('on').siblings().removeClass('on');
                    $rightSlide.eq($thisIdx).addClass('active').siblings().removeClass('active');
                    drawTitle(rightTxtClass);
                }
                
            });

            // 브랜드스토리 mouse over
            $brandArea.each(function(){
                var $this = $(this);
                var $BrandLinkArea = $this.find('.link_area');
                var $slideBrandInner = $this.find('.img_wrap').find('.img_inner');
                var $slideBrandImg = $slideBrandInner.find('img');
                var slideBrandLen = $slideBrandImg.length - 1;
                var slideBrandIdx = 0;
                var $slideBrandBtn;
                $BrandLinkArea.mouseenter(function(){
                    $slideBrandBtn = $(this).closest('.brand_area').find('.txt_wrap a');
                    if (slideBrandIdx < slideBrandLen){
                        slideBrandIdx++;
                    } else {
                        slideBrandIdx = 0;
                    }
                    $slideBrandInner.addClass('hover');
                    $slideBrandBtn.addClass('hover');
                    setTimeout(function(){$slideBrandImg.eq(slideBrandIdx).stop().addClass('on').siblings().removeClass('on');},500);
                    slideBrandIntv = setInterval(function(){
                        if (slideBrandIdx < slideBrandLen){
                            slideBrandIdx++;
                        } else {
                            slideBrandIdx = 0;
                        }
                        $slideBrandImg.eq(slideBrandIdx).stop().addClass('on').siblings().removeClass('on');
                    }, 2000);
                }).mouseleave(function(){
                    $slideBrandInner.removeClass('hover');
                    $slideBrandBtn.removeClass('hover');
                    clearInterval(slideBrandIntv);
                });
            });
        });

        // 메인비쥬얼 분양단지 영역 Progress Bar
        function circlePlay(){
            TweenMax.killTweensOf($circle);
            TweenMax.fromTo($circle, navDuration, {strokeDashoffset: 314}, {strokeDashoffset: 0, ease:Power0.easeNone,
                onComplete: function(){
                    circleInit();
                }
            });
        }
        function circleInit(){
            TweenMax.to($circle, 0, {strokeDashoffset: 314});
        }

        // fullpage js
        var isScrolling = false;
        var $header = $('#header');
        var myFullpage = new fullpage('#fullpage', {
            licenseKey: '498CFFC8-84564252-8A0832C7-81EE6C6B',
            parallax: true,
            parallaxKey: 'aG9ub3JzdmlsbGUuY28ua3JfZm42Y0dGeVlXeHNZWGc9SVdk',
            parallaxOptions: { type: 'cover' },
            verticalCentered: true,
            css3: true,
            onLeave: function(origin, destination, direction){
                var secIdx = destination.index + 1;
                var secId = $('#section0'+secIdx);
                $('#section0'+secIdx).find('.obj').addClass('on');
            },
            afterLoad: function(origin, destination, direction){
                if(destination.index == 0){
                    isScrolling = false;
                    $header.removeClass('on');
                } else {
                    isScrolling = true;
                    $header.addClass('on');
                }
	    	}
        });

        // header mouse over
        $header.mouseenter(function(){
            if ( isScrolling == false ) {
                $header.addClass('on');
            }
        }).mouseleave(function(){
            if ( isScrolling == false ) {
                $header.removeClass('on');
            } else {
                $header.addClass('on');
            }
        });

        function slideVideo (slideVideoIdx) {
            var videoTxtClass = $videoTxt.eq(slideVideoIdx).attr('class');
            videoFunc(slideVideoIdx);
            setTimeout(function(){
                $video.eq(slideVideoIdx).addClass('active').siblings().removeClass('active');
                $videoTxt.eq(slideVideoIdx).fadeIn().siblings().fadeOut();
                $videoTxt.find('span').removeClass('on');
                setTimeout(function(){drawTitle(videoTxtClass);},100);  
            },100);
        };

        function slideRight(){
            if ( slideRightIdx < rightSlideLen ) { 
                beforeIdx = slideRightIdx;
                slideRightIdx++; 
            } else {
                beforeIdx = rightSlideLen;
                slideRightIdx = 0; 
            }
            var rightTxtClass = $rightSlide.eq(slideRightIdx).attr('class');
            $rightSlide.removeClass('active');
            $rightSlide.eq(slideRightIdx).addClass('active');
            $rightTxt.find('span').removeClass('on');
            drawTitle(rightTxtClass);
            $prgIdxEl.eq(slideRightIdx).addClass('on').siblings().removeClass('on');
            circlePlay();
        }

        function videoFunc(index){
            videoTarget = videos[index];
            videoTarget.play();
            if(videoTarget.currentTime > 0){ videoTarget.currentTime = 0; };
            videoTarget.onended = function(e) {
                if ( slideVideoIdx > videoLen-2 ) { slideVideoIdx = 0; } else { slideVideoIdx += 1; }
                slideVideo(slideVideoIdx);
            };
        };

        function drawTitle(_title){
            var lettersTop =  $('.'+_title).find('.small_txt').find('span'),
                lettersTopLen = lettersTop.length,
                lettersBtm =  $('.'+_title).find('.big_txt').find('span'),
                lettersBtmLen = lettersBtm.length;
            var $bigTxtParent = lettersBtm.closest('.big_txt');
            var letterSec;

            function recursiveTop(i) {
                if (i < lettersTop.length) {
                    setTimeout(function() {
                        $(lettersTop).eq(i).addClass('on');
                        i++;
                        recursiveTop(i);
                    }, i == 0 ? 0 : 30)
                }
            }
            function recursiveBtm(i) {
                if (i < lettersBtm.length) {
                    if ($bigTxtParent.hasClass('later')){ 
                        letterSec = 200; 
                    } else { 
                        letterSec = 50; 
                    }
                    setTimeout(function() {
                        $(lettersBtm).eq(i).addClass('on');
                        i++;
                        recursiveBtm(i);
                    }, i == 0 ? 0 : letterSec)
                }
            }
            recursiveTop(0);	
            recursiveBtm(0);
         }

         // 텍스트 상단 움직임 관련 함수
        function textAniTop() {
            $(".txt_top").stop().css({right:0});
            $(".txt_top").animate({
                right: '-=2040px',
            }, 25000, 'linear', function(){
                textAniTop();
            });
        }

        // 텍스트 하단 움직임 관련 함수
        function textAniBtm(){
            $(".txt_btm").stop().css({left:0});
            $(".txt_btm").animate({
                left: '-=2040px',
            }, 25000, 'linear', function() {
                textAniBtm();
            });
        }


        <c:if test="${sessionScope.userId==null}">
        var $btn = $('.btn_favor');
        $btn.click(function(e){
            alert('로그인 후 이용이 가능합니다.');
            location='/membership/login';
            e.preventDefault();
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
    
</body>
</html>