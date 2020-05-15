<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>비밀번호 변경 | 개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
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
                        <li class="btm">
                            <a href="/my/myinfo">개인정보 변경</a>
                        </li>
                        <li class="btm on">
                            <a href="/my/myinfo/password">비밀번호 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/withdrawal">회원탈퇴</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="form_wrap">
                        <p class="tit">기존 비밀번호</p>
                        <div class="input_wrap">
                        	<input type="hidden" name="userId" id="userId" value="${sessionScope.userId }" />
                            <input type="password" class="" placeholder="비밀번호를 입력해 주세요" name="password" id="password">
                        </div>
                        <p class="tit">신규 비밀번호</p>
                        <div class="input_wrap">
                            <input type="password" class="" placeholder="신규 비밀번호를 입력해 주세요"  name="new_password" id="new_password">
                        </div>
                        <p class="tit">신규 비밀번호 확인</p>
                        <div class="input_wrap">
                            <input type="password" class="" placeholder="신규 비밀번호를 다시 입력해 주세요"  name="new_password_re" id="new_password_re">
                        </div>
                        <div class="notice_wrap">
                            <p>비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.</p>
                            <p>사용 가능 특수문자 : ` ~ ! @ # $ % ^ * ( ) - _ = +</p>
                            <p>비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.</p>
                        </div>
                    </div>
                    <div class="btn_wrap">
                        <a href="javascript:;;" id="changeBtn" class="basic_btn">
                            <span>확인</span>
                        </a>
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
        	$('#changeBtn').on("click",function(){
        		/*
        		if(chekPasswordRule($.trim($('#password').val())) == false) {
        			return;
        		}
        		*/
        		if($.trim($('#password').val()) == "") {
        			alert('비밀번호를 입력해주세요.');
        			return;
        		}        		
        		if($('#password').val() == $.trim($('#new_password').val())){
        			alert('동일한 비밀번호는 사용할 수 없습니다.');
        			return;        			
        		}
        		
        		if(chekPasswordRule($.trim($('#new_password').val())) == false) {
        			return;
        		}     
        		
        		if($.trim($('#new_password').val()) != $.trim($('#new_password_re').val())) {
        			alert('비밀번호와 비밀번호 확인이 다릅니다.');
        			$('#new_password').focus();
        			return;
        		}    
        		
        		var data = {password:$('#password').val(),new_password:$('#new_password').val()};
	      		  $.ajax({
	      		    url: "edit_passowrd",
	      		    type: "POST",
	      		    cache: false,
	      		    dataType: "json",
	      		    data: data,
	      		    success: function(data){
	      		    	if(data.result == 0) {
	      		    		alert('비밀번호가 변경되었습니다.');
	      		    		location='/';
	      		    	} else {
	      		    		alert('비밀번호 변경이 실패하였습니다.');
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