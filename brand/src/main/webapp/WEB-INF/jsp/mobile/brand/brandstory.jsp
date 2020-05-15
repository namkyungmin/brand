<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>브랜드 스토리 | 브랜드 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub brand brand_story">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>브랜드</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul class="auto">
                        <li class="on">
                            <a href="/brand/brandstory">브랜드스토리</a>
                        </li>
                        <li>
                            <a href="/brand/bi">브랜드 아이덴티티</a>
                        </li>
                        <li>
                            <a href="/brand/item">특화 아이템</a>
                        </li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <div class="sec_tit">
                        <h3>일상의 특별한 가치</h3>
                        <p class="desc">온 가족이 함께 특별한 일상을 누릴 수 있는<br>차별화된 주거문화를 선보입니다.</p>
                    </div>
                </div>
                <div class="section sec_motion sec2">
                    <div class="text">
                        <div class="opa opa1">
                            <img src="/resources/mobile/images/brand/brstory_sec2_txt01.png" class="txt_line" alt="LIVING">
                            <span><img src="/resources/mobile/images/brand/brstory_sec2_txt01_full.png" class="txt_full" alt="LIVING"></span>
                        </div>
                        <div class="opa opa2">
                            <img src="/resources/mobile/images/brand/brstory_sec2_txt02.png" class="txt_line" alt="WITH">
                            <span><img src="/resources/mobile/images/brand/brstory_sec2_txt02_full.png" class="txt_full" alt="LIVING"></span>
                        </div>
                        <div class="opa opa3">
                            <img src="/resources/mobile/images/brand/brstory_sec2_txt03.png" class="txt_line" alt="DISTINCTION">
                            <span><img src="/resources/mobile/images/brand/brstory_sec2_txt03_full.png" class="txt_full" alt="LIVING"></span>
                        </div>
                    </div>
                    <div class="desc_sec2">
                        <p>그 곳,</p>
                        <p>당신의 꿈을 담은</p>
                        <p>경남아너스빌</p>
                    </div>
                </div>
                <div class="section sec_motion sec3">
                    <div class="bg_txt">
                        <div class="txt_wrap">
                            <div class="inner">
                                <span>PREMIUM</span>
                                <span>PREMIUM</span>
                                <span>PREMIUM</span>
                            </div>
                            <div class="inner">
                                <span>PREMIUM</span>
                                <span>PREMIUM</span>
                                <span>PREMIUM</span>
                            </div>
                        </div>
                    </div>
                    <div class="rolling_txt">
                        <ul>
                            <li>당신을 위한 생각들로<br>품격 있는 공간을 채웁니다.</li>
                            <li>이상적인 주거 공간은</li>
                            <li>일상의 순간이<br>특별해지는 가치를 만듭니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="section sec_motion sec4">
                    <div class="bg_txt">
                        <div class="txt_wrap">
                            <div class="inner">
                                <span>INTELLIGENT</span>
                                <span>INTELLIGENT</span>
                            </div>
                            <div class="inner">
                                <span>INTELLIGENT</span>
                                <span>INTELLIGENT</span>
                            </div>
                        </div>
                    </div>
                    <div class="rolling_txt">
                        <ul>
                            <li>세련된 삶을 위한<br>최첨단 라이프가 시작됩니다.</li>
                            <li>발길 닿는 곳에서 누리는<br>스마트 첨단 시스템</li>
                            <li>당신의 주거 라이프를<br>책임집니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="section sec_motion sec5">
                    <div class="bg_txt">
                        <div class="txt_wrap">
                            <div class="inner">
                                <span>COMMUNITY</span>
                                <span>COMMUNITY</span>
                            </div>
                            <div class="inner">
                                <span>COMMUNITY</span>
                                <span>COMMUNITY</span>
                            </div>
                        </div>
                    </div>
                    <div class="rolling_txt">
                        <ul>
                            <li>가족의 일상에 변화를 가져다줄<br>아너스빌의 커뮤니티가 있습니다.</li>
                            <li>커뮤니티로 새롭게 만나는 일상</li>
                            <li>취미, 교육, 놀이, 레저까지<br> 여유로운 여가생활을 선사합니다.</li>
                        </ul>
                    </div>
                </div>
                <div class="section sec_motion sec6">
                    <div class="desc_sec2">
                        <p class="txt1">일상이 감동이 되는<br> 감명 깊은 주거공간,</p>
                        <p class="txt2">경남아너스빌이 당신을 찾아갑니다.</p>
                        <p class="txt3">Living with<br> Distinction</p>
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

        var $sec2 = $(".sec2"), $sec3 = $(".sec3"), $sec4 = $(".sec4"), $sec5 = $(".sec5"), $sec6 = $(".sec6");
        var $secMotion = $(".sec_motion");
        var txtWidth = $secMotion.find(".txt_wrap").find(".inner").width();
        var wScrollTop;

        function bgTxt(){
            $secMotion.find(".txt_wrap").css("left", "0");
            $secMotion.find(".txt_wrap").stop().animate({"left": "-" + txtWidth}, 20000, "linear", function(){
                bgTxt();
            });
        }
        bgTxt();

        function textMotion1(secNum){
            $(".sec" + secNum).find(".desc_sec2").animate({"opacity":1, "bottom":0 + "px"}, 800);
        }

        function textMotion2(secNum){
            $(".sec" + secNum).find(".rolling_txt").each(function(index, item){
                $(item).find("li").each(function(_idx, ele){
                    setTimeout(function(){
                        $(ele).addClass("on");
                    },300*_idx , "easeInOutQuart");
                });
            });
        }

        $window.scroll(function(){
            wScrollTop = $(this).scrollTop();

            if(wScrollTop > $sec2.offset().top-400){
                $sec2.find(".text").find(".opa").each(function(index, item){
                    setTimeout(function(){
                        $(item).addClass("on");
                    },500*index , "easeInOutQuart");
                });
                setTimeout(function(){
                    textMotion1(2);
                },1500 , "easeInOutQuart");
            };
            if(wScrollTop > $sec3.offset().top-300){
                textMotion2(3);
            };
            if(wScrollTop > $sec4.offset().top-300){
                textMotion2(4);
            };
            if(wScrollTop > $sec5.offset().top-300){
                textMotion2(5);
            };
            if(wScrollTop > $sec6.offset().top-400){
                textMotion1(6);
            };
        });
    </script>
</body>
</html>