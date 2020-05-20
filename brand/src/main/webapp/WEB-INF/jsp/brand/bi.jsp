<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>브랜드 아이덴티티 | 브랜드 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub brand bi">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>브랜드</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/brand/brandstory">브랜드스토리</a></li>
                        <li><a href="/brand/bi" class="on">브랜드 아이덴티티</a></li>
                        <li><a href="/brand/item">특화아이템</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <div class="sec_tit">
                        <h3>집, 존경을 담다</h3>
                        <p class="desc">아이를 생각하는 엄마 아빠의 마음을 다 담을 순 없지만<br>더 신나게 놀고 더 건강하게 자랄 수 있도록 조금 더 세심한 집을 짓겠습니다.</p>
                    </div>
                    <div class="img_area">
                        <img src="/resources/images/brand/bi/bi_sec1_img01.jpg" alt="집, 존경을 담다">
                        <div class="motion">
                            <span class="el1"><img src="/resources/images/brand/bi/bi_sec1_img02.png" alt="집, 존경을 담다"></span>
                            <span class="el2"><img src="/resources/images/brand/bi/bi_sec1_img03.jpg" alt="집, 존경을 담다"></span>
                        </div>
                        <img src="/resources/images/brand/bi/bi_sec1_img04.png" class="txt_img" alt="HONORABLE">
                    </div>
                    <div class="blind">
                        <h3>집, 존경을 담다</h3>
                        <p>아빠의 휴식에 여유를 주고 엄마의 잔소리를 덜어주며 아이의 생각을 존중해주는··· 나의 가족을 존경하라! 아너스빌의 존경을 담아 짓는 집은 많은 것을 달라지게 합니다. 사랑하는 가족의 삶에 대한 존경을 담아, 더 나은 라이프 스타일을 실현합니다. 집, 존경을 담다 경남아너스빌</p>
                    </div>
                </div>
                <div class="section sec2 full">
                    <div class="sec_inner">
                        <div class="sec_tit">
                            <h3>심볼로고</h3>
                        </div>
                        <img src="/resources/images/brand/bi/bi_sec2_img01.jpg" class="bi_logo" alt="경남 아너스빌 logo">
                        <!-- <p>지구의 구를 형상화한 경남아너스빌의 심볼은 글로벌 건설기업으로서 경남기업의 새로운 위상을 나타내며, 타원 안의 화살표 형상은 이니셜 "K"의 변을 활용한 모티브로 더욱 새롭고 진취적인 경남기업의 미래상을 제시하고 있습니다.</p> -->
                        <p>경남아너스빌의 새로운 로고 디자인은 명료한 워드마크 타입을 사용하여, 보다 안정적이고 견고한 신뢰감을 표현하고 있으며, 더 나은 삶의 방식을 만들어 가는 아너스빌의 핵심가치를 더욱 직관적으로 전달하고 있습니다.</p>
                        <div class="btn_wrap">
                            <a href="/download?filePath=bi&fileName=BI_jpg.jpg" class="basic_btn download" download><span>JPG 다운로드</span></a>
                            <a href="/download?filePath=bi&fileName=BI_ai.ai" class="basic_btn download" download><span>AI 다운로드</span></a>
                        </div>
                    </div>
                </div>
                <div class="section sec3">
                    <div class="sec_tit">
                        <h3>컬러시스템</h3>
                    </div>
                    <div class="color_wrap">
                        <div class="color_box">
                            <div class="left">
                                <ul>
                                    <li>PANTONE 3025 C <br>#004c6b</li>
                                </ul>
                            </div>
                            <div class="right">
                                <ul>
                                    <li>PANTONE Warm Gray 3 C <br>#bab3ac</li>
                                    <li>PANTONE 2328 C <br>#706142</li>
                                    <li>PANTONE Cool Gray 10 C <br>#626469</li>
                                    <li>PANTONE 4062 C <br>#9d3d3e</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <p class="txt">아너스빌의 새로운 메인컬러는 깊이 있는 무게감과 세련된 감각으로 프리미엄 라이프 스타일의 브랜드 이미지를 표현합니다. 또한 그레이와 골드를 조화롭게 사용해 아너스빌만의 정제된<br> 고품격 이미지를 완성합니다.</p>
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

        var $sec1 = $(".sec1");
        var delayTxt = 800;
        if($(this).scrollTop() > $sec1.offset().top-800){
            $sec1.find(".motion").find("span").each(function(index, item){
                setTimeout(function(){
                    $(item).addClass("on");
                }, delayTxt*index, "easeOutExpo");
            });
        }
    </script>
</body>
</html>