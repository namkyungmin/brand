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


$(function(){
	$('#checkUserId').on("click", function(){
		if($.trim($('#userId').val()) == "") {
			alert('사용하실 아이디를 입력 해 주세요.');
			return;
		}	
		if($.trim($('#userId').val()).length < 6 || $.trim($('#adminId').val()).length > 20) {
			alert('아이디는 6~20자의 영문 소문자/숫자/특수문자(-)(_) 조합만 이용 가능합니다.')
			$('#userId').focus();
			return;
		}		
		
		if (!regTypeUserId.test($.trim($('#userId').val()))) { 
			alert('아이디는 6~20자의 영문 소문자/숫자/특수문자(-)(_) 조합만 이용 가능합니다.')
			$('#userId').focus();
			return;
		}		
		
		var data = {userId:$('#userId').val()};
		  $.ajax({
		    url: "user_id_check",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		$('#dup').val("Y");
		    		alert('사용이 가능한 아이디 입니다.');
		    	} else {
		    		$('#dup').val("");
		    		alert('사용중인 아이디 입니다.');
		    	}
//		    	console.log(data);
		    },
		    error: function (request, status, error){        
		        var msg = "ERROR : " + request.status + "<br>"
		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		      console.log(msg);              
		    }
		  });        		
	});
	
	$('#resetBtn').on("click", function(){
		location = "/";
	});        	
	
	$('#saveBtn').on("click", function(){
		
		if($.trim($('#userId').val()) == "") {
			alert('아이디를 입력해주세요.');
			$('#userId').focus();
			return;
		}
		
		if($.trim($('#dup').val()) != "Y") {
			alert('아이디 중복 확인을 해주세요..');
			$('#userId').focus();
			return;
		}   
		
		if($.trim($('#userId').val()).length < 6 || $.trim($('#userId').val()).length > 20) {
			alert('아이디는 6~20자의 영문 소문자/숫자/특수문자(-)(_) 조합만 이용 가능합니다.')
			$('#userId').focus();
			return;
		}		
		
		if (!regTypeUserId.test($.trim($('#userId').val()))) { 
			alert('아이디는 6~20자의 영문 소문자/숫자/특수문자(-)(_) 조합만 이용 가능합니다.')
			$('#userId').focus();
			return;
		}
		
		if (!regTypePassword.test($.trim($('#password').val()))) { 
			alert(' 비밀번호는 8~16자의 영문 대, 소문자, 숫자, 특수문자 중 3개 이상을 조합하여 사용해야 합니다.')
			$('#password').focus();
			return;
		}        		
		
		if(chekPassword() == false) {
			return;
		}
		
		if($.trim($('#password').val()) != $.trim($('#passwordCheck').val())) {
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			$('#password').focus();
			return;
		}        		
		
		if($.trim($('#cell2').val()) == "") {
			alert('휴대전화를 입력해주세요.');
			$('#cell2').focus();
			return;
		}        		
		
		if($.trim($('#cell3').val()) == "") {
			alert('휴대전화를 입력해주세요.');
			$('#cell3').focus();
			return;
		}        		
		
		if($.trim($('#email').val()) == "") {
			alert('이메일을 입력해주세요.');
			$('#email').focus();
			return;
		}        		
		
		if($.trim($('#emailField').val()) == "") {
			alert('이메일을 입력해주세요.');
			$('#emailField').focus();
			return;
		}
		
		if($.trim($('#address1').val()) == "") {
			alert('우편번호를 입력해주세요.');
			$('#address1').focus();
			return;
		}           		
		
		if($.trim($('#address2').val()) == "") {
			alert('주소를 입력해주세요.');
			$('#address2').focus();
			return;
		}        	
		
		var url = "register_user"
		var tel = $('#tel2').val()!=""&&$('#tel2').val()!=""?$('#tel1 option:selected').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val():"";
		
		var data = {
				userId:$('#userId').val(),
				certType:$('#certType').val(),
				certInfo:$('#certInfo').val(),
				userName:$('#name').val(),
				password:$('#password').val(),
				cellPhone:$('#cell1 option:selected').val()+"-"+$('#cell2').val()+"-"+$('#cell3').val(),
				tel:tel,
				email:$('#email').val()+"@"+$('#emailField').val(),
				zipcode:$('#address1').val(),
				address:$('#address2').val(),
				mailYn:$('#agreeY2').is(":checked")==true?"Y":"N",
				emailYn:$('#agreeY3').is(":checked")==true?"Y":"N",
				smsYn:$('#agreeY4').is(":checked")==true?"Y":"N",
								
			};      
  		  $.ajax({
  		    url: url,
  		    type: "POST",
  		    cache: false,
  		    dataType: "json",
  		    data: data,
  		    success: function(data){
  		    	console.log(data);
  		    	if(data.result == 0) {
  		    		location='end';
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

//이메일 select 선택입력
$("#selectEmail").change(function(){ 
    $("#selectEmail option:selected").each(function () { 
        //if($(this).val()== '1'){
        if($("#selectEmail option:selected").index() == 0) {
            $("#emailField").val(''); 
            $("#emailField").attr("readonly",false);
        }else{ 
            $("#emailField").val($(this).text());
            $("#emailField").attr("readonly",true);
        }
    });
});

function openzip() {

	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#address1").val(data.zonecode);
			jQuery("#address2").val(data.address+" ");
			$('#address2').prop("readonly", false);
			jQuery("#address2").focus();
		}

	}).open();

}        