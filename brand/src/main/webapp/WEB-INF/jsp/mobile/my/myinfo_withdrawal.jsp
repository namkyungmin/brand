<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>회원탈퇴 | 개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my withdrawal">
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
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li class="on"><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <!-- s: tabNav -->
                <div class="tab_nav type02">
                    <ul>
                        <li class="btm">
                            <a href="/my/myinfo">개인정보 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/password">비밀번호 변경</a>
                        </li>
                        <li class="btm on">
                            <a href="/my/myinfo/withdrawal">회원탈퇴</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="form_wrap">
                        <p class="form_title">
                            회원 탈퇴를 하시겠습니까?
                        </p>
                        <div class="form_type02">
                            <p class="tit">탈퇴사유</p>
                            <div class="radio_wrap reason">
                                <label for="reason1" class="">
                                    <input type="radio" id="reason1" name="reason"  value="ID변경을 위해" checked="checked"> 
                                    ID변경을 위해
                                </label>
                                <label for="reason2" class="">
                                    <input type="radio" id="reason2" name="reason" value="전반전인 서비스 불만족">
                                    전반전인 서비스 불만족
                                </label>
                                <label for="reason3" class="">
                                    <input type="radio" id="reason3" name="reason" value=" 유용한 컨텐츠 부족">
                                    유용한 컨텐츠 부족
                                </label>
                                <label for="reason4" class="">
                                    <input type="radio" id="reason4" name="reason" value="특별한 사유 없음">
                                    특별한 사유 없음
                                </label>
                                <label for="reason5" class="">
                                    <input type="radio" id="reason5" name="reason" value=" 사이트 이용 불편">
                                    사이트 이용 불편
                                </label>
                                <label for="reason6" class="">
                                    <input type="radio" id="reason6" name="reason" value="시스템 불안정">
                                    시스템 불안정
                                </label>
                                <label for="reason7" class="">
                                    <input type="radio" id="reason7" name="reason" value="기타">
                                    기타
                                </label>
                            </div>
                        </div>
                        <p class="tit">기존 비밀번호</p>
                        <div class="input_wrap">
                            <input type="password" class="" placeholder="비밀번호를 입력해 주세요" id="password" name="password">
                        </div>
                    </div>
                    <div class="btn_wrap type02">
                        <a href="/" class="basic_btn type02">
                            <span>취소</span>
                        </a>
                        <a href="javascript:;;" id="withdrawBtn"class="basic_btn">
                            <span>확인</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();

        $(function(){
        	$('#withdrawBtn').on("click",function(){
        		if($.trim($('#password').val()) == "") {
        			alert('비밀번호를 입력해주세요.');
        			return;
        		}
        		
        		var data = {password:$('#password').val(),userRetire:$('input[name=retireReason]:checked').val()};
        		  $.ajax({
        		    url: "withdraw_user",
        		    type: "POST",
        		    cache: false,
        		    dataType: "json",
        		    data: data,
        		    success: function(data){
        		    	if(data.result == 0) {
        		    		//alert('회원 탈퇴가 완료되었습니다.');
        		    		//location.reload();
        		    		location='/my/myinfo/withdrawal-end';
        		    	} else {
        		    		alert('정보를 확인 해 주세요.');
        		    	}
//        		    	console.log(data);
        		    },
        		    error: function (request, status, error){        
        		        var msg = "ERROR : " + request.status + "<br>"
        		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
        		      console.log(msg);              
        		    }
        		  });            		
        	});
        	
    		     		
      		          	
        })        
    </script>
</html>