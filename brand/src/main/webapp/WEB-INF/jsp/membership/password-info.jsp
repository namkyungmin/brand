<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>비밀번호 변경 안내 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub membership find">
        <%@ include file="/include/gnb.jsp" %>
        <div id="container">
            <!-- s: title -->
            <div class="page_tit">
                <h2>비밀번호 변경 안내</h2>
            </div>
            <!--// e: title -->
            <div id="contents">
                <div class="section sec1">
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">개인정보 도용 피해를 예방하기 위하여<br>정기적인 비밀번호 변경을 권장합니다.</p>
                                <p class="txt2">회원님의 개인정보를 보호하고자 비밀번호 사용기간이<br>3개월이 지났을 경우 비밀번호 변경 안내를 시행하고 있습니다.<br>새로운 비밀번호를 설정해 주세요.</p>
                            </div>
                            <div class="btn_wrap two">
                                <a href="javascript:;;" class="basic_btn type02" id="time_update_btn"><span>90일 뒤 변경</span></a>
                                <a href="/my/myinfo/password" class="basic_btn sub"><span>비밀번호 변경</span></a>
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
        $(function(){
	        $('#time_update_btn').on("click",function(){
      		  $.ajax({
      		    url: "time_update",
      		    type: "POST",
      		    cache: false,
      		    dataType: "json",
      		    success: function(data){
      		    	if(data.result == 0) {
     		    		location = "/";
      		    	} else {
      		    		
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
</body>
</html>