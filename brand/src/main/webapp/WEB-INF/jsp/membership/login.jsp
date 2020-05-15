<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>로그인 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership login">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>로그인</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                    <div class="info_area">
                        <div class="inner">
                            <div class="input_wrap">
                                <input type="text" name="user_id" id="user_id" class="first" placeholder="아이디">
                                <input type="password" name="password" id="password" placeholder="비밀번호" class="enter">
                            </div>
                            <div class="btn_area">
                                <a href="javascript:;;" class="login_btn" id="login_btn">로그인</a>
                                <ul>
                                    <li><a href="/membership/find-id">아이디 찾기</a></li>
                                    <li><a href="/membership/find-password">비밀번호 찾기</a></li>
                                    <li><a href="/membership/join/agreement">회원가입</a></li>
                                </ul>
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
        honorsvilleBrand.stickyGnb();
        
        $(function() {
        	$('#login_btn').on("click",function(){
        		check_form();
        	});
        });
        
		function check_form() {
    		if($.trim($('#user_id').val()) == "") {
    			alert('아이디를 입력하세요.')
    			$('#user_id').focus();
    			return;
    		}
    		if($.trim($('#password').val()) == "") {
    			alert('비밀번호를 입력하세요.')
    			$('#password').focus();
    			return;        			
    		}   
    		
    		var data = {userId:$('#user_id').val(), password:$('#password').val()}
    		  $.ajax({
    		    url: "/login_proc",
    		    type: "POST",
    		    cache: false,
    		    dataType: "json",
    		    data: data,
    		    success: function(data){
    		    	if(data.result == 0) {
    		    		if(data.location != null)
    		    			location=data.location;
    		    		else
    		    			location="/";
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
		}        
    </script>
</body>
</html>