<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@ include file="/include/admin/menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>개인정보수정</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">개인정보수정</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

		<div class="box" style="background:#fff;">
                <div class="box-body">
                  <table id="detail1" class="table table-bordered table-striped">
                     <colgroup>
                      <col width="20%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th>이름</th>
                        <td>${data.adminName }</td>
                      </tr>
                      <tr>
                        <th>아이디</th>
                        <td>${data.adminId }</td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 기존비밀번호</th>
                        <td>
                            <input type="password" style="width:400px;" name="password" id="password" value="">
                             
                        </td>
                      </tr>                      
                      <tr>
                        <th><span class="text-required">*</span> 변경비밀번호</th>
                        <td>
                            <input type="password" style="width:400px;" name="new_password" id="new_password" value="">
                            <span>최소 8자리 이상, 영어대문자/소문자/숫자/특수문자 중 3종류 조합</span> 
                        </td>
                      </tr>         
                      <tr>
                        <th><span class="text-required">*</span> 변경비밀번호확인</th>
                        <td>
                            <input type="password" style="width:400px;" name="new_password_check" id="new_password_check" value=""> 
                        </td>
                      </tr>           
                      <tr>
                        <th>이메일</th>
                        <td>
                            <input type="text" style="width:400px;" name="email"  id="email" value="${data.email }"> 
                        </td>
                      </tr>     
                      <tr>
                        <th>소속</th>
                        <td>
                            <input type="text" style="width:400px;" name="dept"  id="dept" value="${data.dept }"> 
                        </td>
                      </tr>                                                                   
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
                	<button class="btn btn-info" style="margin-right: 5px;" id="editBtn"><i class="fa fa-save"></i> 수정</button>
	            </div>                
              </div>
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
$(function() {
	$('#editBtn').on("click",function(){
		validForm();
		
	});
});
function validForm(){
	if($.trim($('#password').val()) == "") {
		alert('기존비밀번호를 입력 해 주세요.');
		return;		
	}
	
	if($.trim($('#new_password').val()) == $.trim($('#password').val())) {
		alert('기존 비밀번호와 동일합니다.');
		return;
	}		
	
	if($.trim($('#new_password').val()) == "") {
		alert('변경비밀번호를 입력 해 주세요.');
		return;
	}	
	
	if($.trim($('#new_password_check').val()) == "") {
		alert('변경비밀번호확인을 입력 해 주세요.');
		return;
	}	
	
	if($.trim($('#new_password_check').val()) != $.trim($('#new_password').val())) {
		alert('변경할 비밀번호를 확인 해 주세요.');
		return;
	}
	
	
	if(chekPasswordRule($.trim($('#new_password').val())) == false) {
		return;
	}     
		
	
	var data = {adminIdx:${data.adminIdx}, password:$('#password').val(),new_password:$('#new_password').val(),email:$('#email').val(),dept:$('#dept').val()};
	  $.ajax({
	    url: "mypage_update",
	    type: "POST",
	    cache: false,
	    dataType: "json",
	    data: data,
	    success: function(data){
	    	if(data.result == 0) {
	    		alert('정보가 수정되었습니다.')
	    		location='main';
	    	} else {
	    		alert('정보 수정에 실패하였습니다.');
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
var regTypeUserId = /^[a-z0-9-_]*$/;
var regTypePassword = /^[a-z0-9`~!@#$%^*()-_=+]*$/;

var regTypeUserId = /^[a-z0-9-_]*$/;
var regTypePassword = /^[a-z0-9`~!@#$%^*()-_=+]*$/;
function chekPassword(){

	var mbrId = $("#userId").val();   // id 값 입력

	var mbrPwd = $("#password").val();  // pw 입력
	
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/.test(mbrPwd);   //영문,숫자

	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,16}$/.test(mbrPwd);  //영문,특수문자

	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/.test(mbrPwd);  //특수문자, 숫자
	
	var check = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/.test(mbrPwd);  //영문,특수문자

	//if(!(check1||check2||check3)){
	if(!(check)){
		alert("비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.");
		return false;
	}


	if(/(\w)\1\1/.test(mbrPwd)){
		alert('비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.');
		return false;
	}

	if(mbrPwd.search(mbrId)>-1){

		alert("비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.");

		return false;

	}

	return true;
}
	

function chekPasswordRule(pwd){

	var mbrId = $("#userId").val();   // id 값 입력

	var mbrPwd = pwd;  // pw 입력
	
	var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}$/.test(mbrPwd);   //영문,숫자

	var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,16}$/.test(mbrPwd);  //영문,특수문자

	var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/.test(mbrPwd);  //특수문자, 숫자
	
	var check = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/.test(mbrPwd);  //영문,특수문자
	
	if (!regTypePassword.test($.trim(pwd))) { 
		alert(' 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.')
		return;
	}     	

	//if(!(check1||check2||check3)){
	if(!(check)){
		alert("비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.");
		return false;
	}


	if(/(\w)\1\1/.test(mbrPwd)){
		alert('비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.');
		return false;
	}

	if(mbrPwd.search(mbrId)>-1){

		alert("비밀번호는 아이디를 포함할 수 없으며, 동일한 숫자 혹은 문자를 3번 이상 연속으로 사용할 수 없습니다.");

		return false;

	}

	return true;
}
</script>

</body>
</html>
