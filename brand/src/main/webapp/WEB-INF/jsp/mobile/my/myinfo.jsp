<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my">
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
                        <li class="btm on">
                            <a href="/my/myinfo">개인정보 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/password">비밀번호 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/withdrawal">회원탈퇴</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">안전한 회원정보 보호를 위해 <span class="point">비밀번호를</span><br><span class="point">다시 한번 입력</span>해주시기 바랍니다.</p>
                            </div>
                            <div class="input_wrap">
                            	<input type="hidden" name="userId" id="userId" value="${sessionScope.userId}"> 
                                <input type="password" class="" placeholder="비밀번호를 입력해 주세요" name="password" id="password"  class="enter">
                            </div>
                            <div class="btn_wrap">
                                <<a href="javascript:;;" class="basic_btn sub" id="checkPassword"><span>확인</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script src="/resources/js/register.js"></script>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
        $(function() {
        	$('#checkPassword').on("click", function(){
        		/*
        		if (!regTypePassword.test($.trim($('#userId').val()))) { 
        			alert(' 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.')
        			$('#password').focus();
        			return;
        		}        		
        		
        		if(chekPassword() == false) {
        			return;
        		}
        		*/
        		if($.trim($('#password').val()) == "") {
        			alert('비밀번호를 입력해주세요.');
        			return;
        		}        		
        		var url = "user_password_check"
        		var data = {mode:"check_password",password:$('#password').val()};
       		  	$.ajax({
       	  		    url: url,
       	  		    type: "POST",
       	  		    cache: false,
       	  		    dataType: "json",
       	  		    data: data,
       	  		    success: function(data){
       	  		    	console.log(data);
       	  		    	if(data.result == 0) {
       	  		    		location=data.location;
       	  		    	} else {
       	  		    		alert('정보를 확인해주세요.');
       	  		    	}
       	  		    },
       	  		    error: function (request, status, error){        
       	  		        var msg = "ERROR : " + request.status + "<br>"
       	  		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
       	  		      console.log(msg);              
       	  		    }
       	  		  });           		
        	});
        });        
    </script>
</html>