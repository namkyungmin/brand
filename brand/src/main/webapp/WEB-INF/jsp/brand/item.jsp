<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>특화아이템 | 브랜드 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub brand item">
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
                        <li><a href="/brand/brandstory">브랜드 스토리</a></li>
                        <li><a href="/brand/bi">브랜드 아이덴티티</a></li>
                        <li><a href="/brand/item" class="on">특화아이템</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <div class="sec_tit">
                        <h3>일상의 새로운 변화</h3>
                        <p class="desc">주거상품 전반에 라이프 스타일의 변화를 고려한 설계와 디자인, 커뮤니티,<br>인테리어, 조경 등 아너스빌만의 차별화된 프리미엄을 만나보세요.</p>
                    </div>
                    <div class="cont_box">
                        <div class="cont cont1">
                            <div>
                                <div class="img_area el">
                                    <img src="/resources/images/brand/item/item_sec1_img01.png" alt="Remarkable Quality">
                                </div>
                                <div class="text_area el">
                                    <h4>차별화된 주거공간</h4>
                                    <p>주거의 본질인 편리함, 쾌적함, 안전성이 조화를 이루는<br> 차별화된 설계상품으로 주거문화의 새로운 가치를 제시합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="cont cont2">
                            <div class="obj">
                                <div class="text_area el">
                                    <h4>미학적 디자인</h4>
                                    <p>고객의 가치와 니즈에 부합하는 디자인 아이덴티티를 구축하여<br> 미학적 가치가 극대화된 세련된 공간을 창조합니다.</p>
                                </div>
                                <div class="img_area el">
                                    <img src="/resources/images/brand/item/item_sec1_img02.png" alt="Aesthetic Design">
                                </div>
                            </div>
                        </div>
                        <div class="cont cont3">
                            <div class="obj">
                                <div class="img_area el">
                                    <img src="/resources/images/brand/item/item_sec1_img03.png" alt="Innovative Technology">
                                </div>
                                <div class="text_area el">
                                    <h4>가장 앞선 라이프스타일</h4>
                                    <p>가장 앞선 기술이 집약된 스마트 시스템과 친환경 특화 기술을<br> 적용하여 생활의 품격을 완성합니다.</p>
                                </div>
                            </div>
                        </div>
                        <div class="cont cont4">
                            <div class="obj">
                                <div class="text_area el">
                                    <h4>고품격 서비스</h4>
                                    <p>다양한 라이프스타일과 개성을 반영할 수 있는 맞춤형 서비스를<br> 통해 차원 높은 생활과 비교할 수 없는 경험을 제공합니다.
                                    </p>
                                </div>
                                <div class="img_area el">
                                    <img src="/resources/images/brand/item/item_sec1_img04.png" alt="Exceptional Service">
                                </div>
                            </div>
                        </div>
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
        honorsvilleBrand.scrollMotion('cont2');
        honorsvilleBrand.scrollMotion('cont3');
        honorsvilleBrand.scrollMotion('cont4');
    </script>
</body>
</html>