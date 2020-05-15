<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
</head>
<body class="hold-transition login-page" style="backgrond:#fff !important;">
<div class="login-box" style="backgrond:#fff !important;">
  <div class="login-logo">
    <img src="/resources/admin/images/logo.png" />
  </div>
  <!-- /.login-logo -->
  <div class="">
    <div class="card-body login-card-body">

      <form id="login_form" name="login_form" method="post">
        <div class="input-group mb-3">
        
          <input type="text" id="adminId" name="adminId" class="form-control" placeholder="아이디">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" id="password" class="form-control enter" placeholder="비밀번호">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
      <div class="social-auth-links  mb-3" style="font-size:13px;text-align:left;margin-left:20px">
          <p>1. 이 페이지는 관리자를 위한 페이지 입니다.</p>
          <p>2. 각 권한에 따른 인증된 관리자만 접속이 가능합니다.</p>
          <p>3. 관리 작업을 마치신 후 반드시 로그아웃 하시기 바랍니다.</p>
          <p>4. 비밀번호 5회 오류 시 4시간 접속불가</p>
          <hr />
      </div>        
        <div class="row text-center">
          <!-- /.col -->
          <div class="col-4"></div>
          <div class="col-4">
            <button type="button" class="btn btn-info btn-block" id="loginBtn">로그인</button>
          </div>
          <!-- /.col -->
        </div>
      </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<%@ include file="/include/admin/footer.jsp" %>
<script language="javascript">
$(function() {
	$('#loginBtn').on("click",function(){
		login();
		
	});
});
function login(){
	if($.trim($('#adminId').val()) == "") {
		alert('아이디를 입력 해 주세요.');
		return;		
	}
	
	if($.trim($('#password').val()) == "") {
		alert('비밀번호를 입력 해 주세요.');
		return;
	}	
	
	
	var data = {adminId:$('#adminId').val(), password:$('#password').val()}
	  $.ajax({
	    url: "login_proc",
	    type: "POST",
	    cache: false,
	    dataType: "json",
	    data: data,
	    success: function(data){
	    	console.log(data);
	    	if(data.result == 0) {
	    		alert('로그인 되었습니다.');
	    		location=data.location;
	    	} else if(data.result == -1) {
				alert('비밀번호 5회 이상 오류입니다. 4시간 이후 접속 가능합니다.');
	    	} else if(data.result == -2) {
				alert('해당 계정의 사용 기간이 만료되었습니다. 관리 담당자에게 문의하세요.');				
	    	} else {
	    		alert('로그인 정보를 확인 해 주세요.('+data.loginCnt+' 회)');
	    	}
//	    	console.log(data);
	    },
	    error: function (request, status, error){        
	        var msg = "ERROR : " + request.status + "<br>"
	      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	      console.log(msg);              
	    }
	  });
	}
$(document).ready(function() {
    $(".enter").keydown(function(key) {
        if (key.keyCode == 13) {
        	login();
        }
    });
});
	
</script>

</body>
</html>
