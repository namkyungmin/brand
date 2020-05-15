<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>비밀번호 변경 | 개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my my_pasw">
        <%@ include file="/include/gnb.jsp" %>
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
                        <li><a href="/my/myinfo" class="on">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li><a href="/my/myinfo">개인정보 변경</a></li>
                            <li class="on"><a href="/my/myinfo/password">비밀번호 변경</a></li>
                            <li><a href="/my/myinfo/withdrawal">회원탈퇴</a></li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <!-- 비밀번호 인증 페이지 -->
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">안전한 회원정보<br>보호를 위해 비밀번호를<br>변경해주시기 바랍니다.</p>
                                <p class="txt2">회원님의 소중한 개인정보를 보호하기 위해<br>노력하고 있습니다.</p>
                            </div>
                            <div class="pasw_wrap">
                                <div class="form_wrap">
                                    <table>
                                        <colgroup>
                                            <col width="140px">
                                            <col width="*">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="ip_tit">기존 비밀번호</th>
                                                <td>
                                                    <div class="input_wrap">
                                                    	<input type="hidden" name="userId" id="userId" value="${sessionScope.userId }" />
                                                        <input type="password" class="" placeholder="비밀번호를 입력해 주세요" name="password" id="password">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="ip_tit">신규 비밀번호</th>
                                                <td>
                                                    <div class="input_wrap">
                                                        <input type="password" class="" placeholder="신규 비밀번호를 입력해 주세요"  name="new_password" id="new_password">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="ip_tit">신규 비밀번호 확인</th>
                                                <td>
                                                    <div class="input_wrap">
                                                        <input type="password" class="enter" placeholder="신규 비밀번호를 다시 입력해 주세요"  name="new_password_re" id="new_password_re">
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="notice_txt">
                                    <li>※ 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.</li>
                                    <li>※ 사용 가능 특수문자: ` ~ ! @ # $ % ^ * ( ) - _ = +</li>
                                    <li>※ 비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.</li>
                                </ul>
                                <div class="btn_area">
                                    <a href="javascript:;;" class="basic_btn sub" id="changeBtn"><span>확인</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //비밀번호 인증 페이지 -->
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <script src="/resources/js/register.js"></script>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
        $(function() {
        	$('#changeBtn').on("click",function(){
      			check_form();
        		        		
        	});
        })
        
        function check_form() {
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
        }
        
    </script>
</body>
</html>