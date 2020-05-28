<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta property="og:title" content="경남아너스빌" />
<meta property="og:site_name" content="경남아너스빌" />
<meta property="og:description" content="SM경남기업 아파트 브랜드, 분양/입주 정보 제공, 브랜드 소개" />
<meta property="og:keywords" content="경남아너스빌, 아너스빌, 경남기업, keangnam, honorsville, 아파트 분양" />
<meta property="og:image" content="/resources/images/common/og_img.jpg" />
<meta name="description" content="SM경남기업 아파트 브랜드, 분양/입주 정보 제공, 브랜드 소개">
<meta name="keywords" content="경남아너스빌, 아너스빌, 경남기업, keangnam, honorsville, 아파트 분양">
<link rel="shortcut icon" href="/resources/mobile/images/common/favicon.ico">
<title>경남아너스빌 모바일</title>
<link rel="stylesheet" href="/resources/mobile/css/reset.css">
<link rel="stylesheet" href="/resources/mobile/css/common.css">
<link rel="stylesheet" href="/resources/mobile/css/main.css">
<link rel="stylesheet" href="/resources/mobile/css/swiper.css">
</head>
<body>
    <%@ include file="/include/mobile/gnb.jsp" %>
    <div id="container">
        <div id="contents">
            <div class="main_visual">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="/resources/mobile/images/main/img_main_top1.jpg" alt="">
                          </div>
                          <div class="swiper-slide">
                            <img src="/resources/mobile/images/main/img_main_top2.jpg" alt="">
                          </div>
                          <div class="swiper-slide">
                            <img src="/resources/mobile/images/main/img_main_top3.jpg" alt="">
                          </div>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination swiper-pagination-white"></div>
                </div>
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
                                <span>일</span>
                                <span>상</span>
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
            <div class="section sale">
                <div class="tit_wrap">
                    <h3>분양단지</h3>
                    <a href="/estate/tearplan" class="btn btn_tearplan">
                        <span>연간분양계획</span>
                    </a>
                </div>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                    
                       	<c:forEach var="data" items="${parcelList}"  varStatus="status">
                        <div class="swiper-slide">
                            <div class="percel_item">
                                <a href="" class="btn_favor ${data.favorite!=null?"on":"" }" data-parcelId="${data.parcelId }"></a>
                                	<c:if test="${data.parcelStage=='분양중' }">
                                		<a href="/estate/sale/view?parcel_id=${data.parcelId}" class="item_inner">
                                    </c:if>
                                    <c:if test="${data.parcelStage=='분양예정' }">
                                    	<a href="/estate/plan/view?parcel_id=${data.parcelId}" class="item_inner">
                                    </c:if>
                                    <c:if test="${data.parcelStage=='분양완료' }">
                                    	<a href="/estate/apt/view?parcel_id=${data.parcelId}" class="item_inner">
                                    </c:if>                                
                                    <div class="thumb">
                                        <img src="${data.parcelListImage}" alt="" class="thumb" onError="this.src='/resources/images/main/main_banner_basic.jpg'">
                                    </div>
                                    <div class="info">
                                    	<c:if test="${data.parcelStage=='분양예정' }">
                                        <span class="flag store_on">분양예정</span>
                                        </c:if>
                                        <c:if test="${data.parcelStage=='분양중' }">
                                        <span class="flag on">분양중</span>
                                        </c:if>
                                        <c:if test="${data.parcelStage=='분양완료' }">
                                        <span class="flag complete">분양완료</span>
                               			</c:if>
                                        <p class="percel_name">${data.parcelName}</p>
                                        <p class="tel">${data.inquiry}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                        </c:forEach>    
                    </div>
                    <div class="swiper-pagination"></div>
				</div>
            </div>
            <div class="section brand">
                <a href="/brand/brandstory" class="brand_item brand_story obj obj01">
                    <p class="tit01">브랜드 스토리</p>
                    <p class="tit02">공간의 품격을 완성하는 차별화된 주거문화</p>    
                </a>
                <a href="/brand/bi" class="brand_item bi obj obj02">
                    <p class="tit01">브랜드 아이덴티티</p>
                    <p class="tit02">가족의 삶에 대한 존경과 견고한 배려</p>    
                </a>
                <div class="txt_bg_wrap">
                    <div class="txt_bg top">
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
                    <div class="txt_bg btm">
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
            </div>
            <div class="section news">
                <div class="tit_wrap">
                    <h3 class="eng">NEWS</h3>
                    <a href="/members/news" class="btn btn_more">
                        <span>더 보기</span>
                    </a>
                </div>
                <div class="news_wrap">
                    <ul>
	          			<c:forEach var="data" items="${newsList}"  varStatus="status">
                        <li>
                           	<c:if test="${data.newsType=='link' }">
                           	<a href="${data.url }" target="_blank">
                           	</c:if>
                           	<c:if test="${data.newsType=='news' || data.newsType==null }">
                            <a href="/members/view?news_id=${data.newsId}">
                            </c:if>	
                                <div class="date">
                                    <span class="day"><span class="day">${fn:substring(data.displayDate,8,10) }</span></span>
                                    <span class="month">${data.regTimeMonth }.</span>
                                </div>
                                <div class="news_tit">
                                    ${data.title}
                                </div>
                            </a>
                        </li>
                  		</c:forEach>
	                    <c:if test="${fn:length(newsList)==0}">
	                    <li>정보가 없습니다.</li>
	                    </c:if>     
                    </ul>
                </div>
            </div>
            <div class="section my">
                <a href="/my/qna" class="qna">
                    <p class="tit">1:1 문의</p>
                </a>
                <a href="/my/faq" class="faq">
                    <p class="tit">자주 묻는 질문</p>
                </a>
            </div>
        </div>

		<c:forEach var="data" items="${popupList}"  varStatus="status">
		
		
        <!-- main popup -->
        <c:if test="${data.popupType=='ALL'||data.popupType=='MOBILE' }"> 
        <div id="mainPop${status.count }" class="main_pop open" style="left:0px;top:60px;z-index:${status.count};display:none">
        
            <div class="cont_wrap">
            
            	<c:if test="${data.moUrl!=''}"> 
                <a href="${data.moUrl}" target="${data.moUrlTarget }">
                </c:if>
                <img src="${data.imageMo }" alt=""></a>
            </div>
            <div id="dayCloseWrap" class="day_close_wrap">
                <input type="checkbox" id="dayClose${status.count }" class="" name="dayClose${status.count }" value="">
                <label for="dayClose">다시 보지 않기</label>
            </div>
            <a href="javascript:void(0);" id="mainClose${status.count }" class="main_pop_close" data-id="${status.count }">닫기</a>
        </div>
        </c:if>
        <!-- //main popup -->
         
        </c:forEach>        
    </div>
    <%@ include file="/include/mobile/footer.jsp" %>
    <script src="/resources/mobile/js/lib/jquery-3.4.1.min.js"></script>
    <script src="/resources/mobile/js/common.js"></script>
    <script src="/resources/mobile/js/plugin/swiper.jquery.js"></script>
    <script>
        honorsvilleBrand.stickyGnb();
        //honorsvilleBrand.btnFavor();
        
    $(function(){
    	$('.main_pop_close').on("click",function(){
            $('.dim').remove();
            $('body').css('position', 'static');
    		$('#mainPop'+$(this).data("id")).hide();
    		if($('#dayClose'+$(this).data("id")).is(":checked") == true) {
    			 setCookie('mainPop'+$(this).data("id"), "done" , 1); 
    		}
    	});
    	$('.main_pop').each(function(){
    		   var blnCookie    = getCookie( $(this).attr("id") );
    		   if(blnCookie == "") {
                    $('body').css('position', 'fixed');
                    $('#container').append('<div class="dim"></div>');
    			    $(this).show();
               }
    	});

        $()
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
        

        var $videoTxt = $('.main_visual .main_tit > div');

        var Timer;
        var slideIdx = 0;
        var slideLen = $('.main_visual .swiper-slide').length -1;
        var mainSlider = new Swiper('.main_visual .swiper-container', {
            speed : 1500,
            simulateTouch: true,
            pagination: '.swiper-pagination',
            paginationClickable: true,
            effect: 'fade',
        });
        var saleSlider = new Swiper('.sale .swiper-container', {
            autoplay:3000,
            autoplayDisableOnInteraction: false,
            loop: true,
            speed: 1000,
            pagination: '.swiper-pagination',
            paginationClickable: true,
            slidesPerView: 'auto',
            spaceBetween: 20,
            // freeMode: true,
            
        });

        //모션 type1
        mainSlider.on('onSlideChangeStart', function(){
            setTimeout(function(){
                var videoTxtClass = $videoTxt.eq(slideIdx).attr('class');
                $videoTxt.eq(slideIdx).fadeIn().siblings().fadeOut();
                $videoTxt.find('span').removeClass('on');
                setTimeout(function(){drawTitle(videoTxtClass);},100);  
            },100);
        });

        $( ".main_visual .swiper-pagination" ).on( "click", ".swiper-pagination-bullet", function() {
            slideIdx = $(this).index();
            clearInterval(Timer);
            setTimeout(function(){autoSlide();},1000);
        });

        // 페이지 완전 로딩후 실행
        window.onload  = function() {
            autoSlide();
            $videoTxt.eq(0).fadeIn();
            setTimeout(function(){drawTitle('tit01');},100);  

            textAniTop();
            textAniBtm();
        }
        
        //auto slide
        function autoSlide(){
            Timer = setInterval(function(){
                slideIdx++;
                if ( slideIdx > slideLen ) {
                    slideIdx = 0;
                }
                mainSlider.slideTo(slideIdx);
            }, 4000); 
        }

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
                right: '-=669px',
            }, 25000, 'linear', function(){
                textAniTop();
            });
        }

        // 텍스트 하단 움직임 관련 함수
        function textAniBtm(){
            $(".txt_btm").stop().css({left:0});
            $(".txt_btm").animate({
                left: '-=669px',
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