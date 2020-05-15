<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
<style>
.card-body { height:150px;}
</style>
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
            <h1>운영자관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">관리자관리</li>
              <li class="breadcrumb-item active">운영자관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="box" style="background:#fff;">
                <div class="box-body">
                <form id="main_form" name="main_form" method="post">
                <input type="hidden" name="dup" id="dup" value="${data.adminIdx!=null?'Y':'' }" />
                <input type="hidden" name="adminIdx" id="adminIdx" value="${data.adminIdx }" />
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th><span class="text-required">*</span> 아이디</th>
                        <td>
                        	<c:if test="${data.adminIdx == null}">
                        	<input type="text" style="width:200px;" name="adminId" id="adminId" value="${data.adminId}">
	                        <button type="button" class="btn btn-honor" style="margin-left: 10px;padding:2px;" id="checkIdBtn">중복체크</button> 
	                        <span class="text-mention">5~20자의 영문 소문자, 숫자 조합 가능</span>
	                        </c:if>
	                        <c:if test="${data.adminIdx != ''}">
		                        ${data.adminId}
	                        </c:if>
	                    </td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 이름</th>
                        <td>
	                        <c:if test="${data.adminIdx == null}">
                            <input type="text" style="width:200px;" name="adminName" id="adminName" value="${data.adminName }"> 
	                        </c:if>
	                        <c:if test="${data.adminIdx != ''}">
		                        ${data.adminName}
	                        </c:if>                            
                        </td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 이메일</th>
                        <td>
                            <input type="text" style="width:400px;" name="email" id="email" value="${data.email }"> 
                        </td>
                      </tr>                      
                      <tr>
                        <th><span class="text-required">*</span> 소속</th>
                        <td>
                            <input type="text" style="width:400px;" name="dept" id="dept" value="${data.dept }"> 
                        </td>
                      </tr>         
                      <tr>
                        <th><span class="text-required">*</span> 사용기간</th>
                        <td>
                            <input type="text" style="width:150px;" name="useStartDate" id="useStartDate" value="${data.useStartDate }"> ~ 
                            <input type="text" style="width:150px;" name="useEndDate" id="useEndDate" value="${data.useEndDate }"> 
                        </td>
                      </tr>           
                      <tr>
                        <th><span class="text-required">*</span> 운영자 권한</th>
                        <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="adminType" id="adminTypeMaster" value="Master" ${data.adminType=='Master'?"checked":"" }>
	                            <label class="form-check-label" style="margin-right:50px;">Master</label>
	                            <input class="form-check-input" type="radio" name="adminType" id="adminTypeLocal" value="Local" ${data.adminType=='Local'?"checked":"" }>
	                            <label class="form-check-label">Local</label>
	                        </div>
                        </td>
                      </tr>     
                      <tr>
                        <th><span class="text-required">*</span> 관리자 메뉴 권한</th>
                        <td>
					       <div class="row">
					          <div class="col-md-4">
					            <div class="card">
					              <div class="card-header">
					                <h3 class="card-title">
								                  관리자 관리
					                </h3>
					              </div>
					              <!-- /.card-header -->
					              <div class="card-body">
					                <ul  class="list-unstyled">
					                  <li><input type="checkbox" name="role[]" value="ADMIN_ADMIN" <c:if test="${fn:contains(data.role,'ADMIN_ADMIN')}">checked</c:if>> <label>운영자 관리</label></li>
					                </ul>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					          </div>
					          <!-- ./col -->
					          <div class="col-md-4">
					            <div class="card">
					              <div class="card-header">
					                <h3 class="card-title">
								                 메인 관리
					                </h3>
					              </div>
					              <!-- /.card-header -->
					              <div class="card-body">
					                <ul  class="list-unstyled">
					                  <li><input type="checkbox" name="role[]" value="MAIN_BANNER"  <c:if test="${fn:contains(data.role,'MAIN_BANNER')}">checked</c:if>> <label>배너관리</label></li>
					                  <li><input type="checkbox" name="role[]" value="MAIN_POPUP"  <c:if test="${fn:contains(data.role,'MAIN_POPUP')}">checked</c:if>> <label>팝업관리</label></li>
					                </ul>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					          </div>
					          <!-- ./col -->
					          <div class="col-md-4">
					            <div class="card">
					              <div class="card-header">
					                <h3 class="card-title">
					                  
								                  분양관리
					                </h3>
					              </div>
					              <!-- /.card-header -->
					              <div class="card-body">
					                <ul  class="list-unstyled">
					                  <li><input type="checkbox" name="role[]" value="PARCEL_PARCEL"  <c:if test="${fn:contains(data.role,'PARCEL_PARCEL')}">checked</c:if>> <label>분양단지관리</label></li>
					                  <li><input type="checkbox" name="role[]" value="PARCEL_PLAN"  <c:if test="${fn:contains(data.role,'PARCEL_PLAN')}">checked</c:if>> <label>연간분양계획관리</label></li>
					                  <li><input type="checkbox" name="role[]" value="PARCEL_CUSTOMER"  <c:if test="${fn:contains(data.role,'PARCEL_CUSTOMER')}">checked</c:if>> <label>관심고객단지관리</label></li>
					                </ul>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					          </div>
					          <!-- ./col -->
					        </div>
					        <!-- /.row -->
					        <div class="row">
					          <div class="col-md-4">
					            <div class="card">
					              <div class="card-header">
					                <h3 class="card-title">
					                  
								                  게시판 관리
					                </h3>
					              </div>
					              <!-- /.card-header -->
					              <div class="card-body">
					                <ul class="list-unstyled">
					                  <li><input type="checkbox"  name="role[]" value="BOARD_NEWS"  <c:if test="${fn:contains(data.role,'BOARD_NEWS')}">checked</c:if>> <label>아너스빌 소식</label></li>
					                  <li><input type="checkbox"  name="role[]" value="BOARD_FAQ"  <c:if test="${fn:contains(data.role,'BOARD_FAQ')}">checked</c:if>> <label>자주묻는 질문</label></li>
					                  <li><input type="checkbox"  name="role[]" value="BOARD_QNA"  <c:if test="${fn:contains(data.role,'BOARD_QNA')}">checked</c:if>> <label>1:1문의관리</label></li>
					                  <li><input type="checkbox"  name="role[]" value="BOARD_AS"  <c:if test="${fn:contains(data.role,'BOARD_AS')}">checked</c:if>> <label>A/S문의관리</label></li>
					                </ul>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					          </div>
					          <!-- ./col -->
					          <div class="col-md-4">
					            <div class="card">
					              <div class="card-header">
					                <h3 class="card-title">
								                 회원관리
					                </h3>
					              </div>
					              <!-- /.card-header -->
					              <div class="card-body">
					                <ul  class="list-unstyled">
					                  <li><input type="checkbox" name="role[]" value="MEMBER_MEMBER"  <c:if test="${fn:contains(data.role,'MEMBER_MEMBER')}">checked</c:if>> <label>회원관리</label></li>
					                  <li><input type="checkbox" name="role[]" value="MEMBER_RETIRE"  <c:if test="${fn:contains(data.role,'MEMBER_RETIRE')}">checked</c:if>> <label>탈퇴회원관리</label></li>
					                </ul>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					          </div>
					        </div>
					        <!-- /.row -->       
                        </td>
                      </tr>                                                                   
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
					<c:if test="${data.adminIdx == null}">
                	<button type="button" class="btn btn-honor" style="margin-right: 5px;" id="saveBtn">등록</button>
                	</c:if>
                	<c:if test="${data.adminIdx != null}">
                	<button type="button" class="btn btn-honor" style="margin-right: 5px;" id="resetPasswordBtn">비밀번호 초기화</button>
                	<button type="button" class="btn btn-honor" style="margin-right: 5px;" id="saveBtn">수정</button>
                	<button type="button" class="btn btn-honor" style="margin-right: 5px;" id="deleteBtn">삭제</button>
                	</c:if>
	                <button type="button" class="btn btn-secondary" style="margin-right: 5px;" onclick="list_btn();return false;">목록</button>
	            </div>   
	            </form>             
              </div>
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
//영문과 숫자 조합인지 체크
function CheckId(str) {
  var reg1 = /^[a-z0-9]{5,20}$/;
  var reg2 = /[a-z]/g;
  var reg3 = /[0-9]/g;
  //return ( reg1.test(str) && reg2.test(str) && reg3.test(str) );
  return ( reg1.test(str)  ); 
}


$(function(){
	var regTypeId = /^[a-z0-9+]*$/;
	var regTypeId1 = /^[a-z+]*$/;
	var regTypeId2 = /^[0-9+]*$/;
	
	$('#adminTypeMaster').on("change", function(){
		if($('#adminTypeMaster').is(":checked") == true)
			$('input[type=checkbox]').prop("checked", true);
		
		$('input[name="role[]"]').eq(0).prop("disabled", false);
	});
	$('#adminTypeLocal').on("change", function(){
		if($('#adminTypeLocal').is(":checked") == true)
			$('input[type=checkbox]').prop("checked", false);
		
		$('input[name="role[]"]').eq(0).prop("disabled", true);
	});
		
	$('#checkIdBtn').on("click",function(){
		if($.trim($('#adminId').val()) == "") {
			alert('사용하실 아이디를 입력 해 주세요.');
			return;
		}	
		if($.trim($('#adminId').val()).length < 5 || $.trim($('#adminId').val()).length > 20) {
			alert('아이디는 5~20자의 영문 소문자/숫자 조합만 이용 가능합니다.')
			$('#adminId').focus();
			return;
		}		
		
		if (CheckId($.trim($('#adminId').val()))== false) { 
			alert('아이디는 5~20자의 영문 소문자/숫자 조합만 이용 가능합니다.')
			$('#adminId').focus();
			return;
		}		
		var data = {adminId:$('#adminId').val()};
		  $.ajax({
		    url: "admin_id_check",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		$('#dup').val("Y");
		    		alert('사용 가능한 아이디 입니다.');
		    		
		    	} else {
		    		$('#dup').val("");
		    		alert('이미 사용중인 아이디 입니다.');
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
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 계정을 삭제하시겠습니까?')) {
			var url = "delete_admin";
			var data = {adminIdx:"${param.admin_idx}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='admin_list';
				    	} else {
				    		alert('삭제에 실패하였습니다.');
				    	}
				    },
				    error: function (request, status, error){        
				        var msg = "ERROR : " + request.status + "<br>"
				      msg +=  + "내용 : " + request.responseText + "<br>" + error;
				      console.log(msg);              
				    }
			   });	
		}
	});
	
	$('#resetPasswordBtn').on("click", function() {
		if(confirm('비밀번호를 초기화 하시겠습니까?')) {
			var url = "update_admin_password";
			var data = {adminIdx:"${param.admin_idx}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('메일로 발송하였습니다.');
				    	} else {
				    		alert('비밀번호를 초기화하에 실패하였습니다.');
				    	}
				    },
				    error: function (request, status, error){        
				        var msg = "ERROR : " + request.status + "<br>"
				      msg +=  + "내용 : " + request.responseText + "<br>" + error;
				      console.log(msg);              
				    }
			   });			
		}
	});	
	
	$('#saveBtn').on("click", function() {
		var role = "";
		<c:if test="${data.adminIdx == null}">
		if($.trim($('#adminId').val()) == "") {
			alert('아이디를 입력 해 주세요.')
			$('#adminId').focus();
			return;
		}
		
		if($.trim($('#adminId').val()).length < 5 && $.trim($('#adminId').val()).length > 20) {
			alert('아이디는 5~20자의 영문 소문자/숫자 조합만 이용 가능합니다.')
			$('#adminId').focus();
			return;
		}		
		
		if (CheckId($.trim($('#adminId').val()))== false) { 
			alert('아이디는 5~20자의 영문 소문자/숫자 조합만 이용 가능합니다.')
			$('#adminId').focus();
			return;
		}		
		
		
		if($.trim($('#dup').val()) == "") {
			alert('아이디 중복 확인 해 주세요.')
			$('#adminId').focus();
			return;
		}		
		
		if($.trim($('#adminName').val()) == "") {
			alert('아이디 중복 확인 해 주세요.')
			$('#adminName').focus();
			return;
		}		
		
		if($.trim($('#email').val()) == "") {
			alert('이메일을 입력 해 주세요.')
			$('#email').focus();
			return;
		}		
		
		if($.trim($('#dept').val()) == "") {
			alert('소속을 입력 해 주세요.')
			$('#dept').focus();
			return;
		}		
		
		if($.trim($('#useStartDate').val()) == "") {
			alert('사용기간 시작일자를 입력 해 주세요.')
			$('#useStartDate').focus();
			return;
		}		
		
		if($.trim($('#useEndDate').val()) == "") {
			alert('사용기간 종료일자를 입력 해 주세요.')
			$('#useEndDate').focus();
			return;
		}		
		
		if($('#adminTypeMaster').is(":checked") == false && $('#adminTypeLocal').is(":checked") == false) {
			alert('운영자권한을 입력 해 주세요.')
			$('#adminTypeMaster').focus();
			return;
		}		
			
		// Insert
		var url = "insert_admin";
		$('input[name="role[]"]:checked').each(function(){
			if(role != '') 
				role += ','+$(this).val();
			else
				role = $(this).val();
		})
		var data = {
						adminId:$('#adminId').val(),
						adminName:$('#adminName').val(),
						email:$('#email').val(),
						dept:$('#dept').val(),
						useStartDate:$('#useStartDate').val(),
						useEndDate:$('#useEndDate').val(),
						adminType:$('input[name=adminType]:checked').val(),
						role:role,
					};
		</c:if>		
		<c:if test="${data.adminIdx != null}">
		
		if($.trim($('#email').val()) == "") {
			alert('이메일을 입력 해 주세요.')
			$('#email').focus();
			return;
		}		
		
		if($.trim($('#dept').val()) == "") {
			alert('소속을 입력 해 주세요.')
			$('#dept').focus();
			return;
		}		
		
		if($.trim($('#useStartDate').val()) == "") {
			alert('사용기간 시작일자를 입력 해 주세요.')
			$('#useStartDate').focus();
			return;
		}		
		
		if($.trim($('#useEndDate').val()) == "") {
			alert('사용기간 종료일자를 입력 해 주세요.')
			$('#useEndDate').focus();
			return;
		}		
		
		if($('#adminTypeMaster').is(":checked") == false && $('#adminTypeLocal').is(":checked") == false) {
			alert('운영자권한을 입력 해 주세요.')
			$('#adminTypeMaster').focus();
			return;
		}		
			
		// Update
		var url = "update_admin";
		$('input[name="role[]"]:checked').each(function(){
			if(role != '') 
				role += ','+$(this).val();
			else
				role = $(this).val();
		})
		var data = {
						adminIdx:"${data.adminIdx}",
						email:$('#email').val(),
						dept:$('#dept').val(),
						useStartDate:$('#useStartDate').val(),
						useEndDate:$('#useEndDate').val(),
						adminType:$('input[name=adminType]:checked').val(),
						role:role,
					};
		</c:if>		
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		$('#dup').val("Y");
		    		<c:if test="${data.adminIdx == null}">
		    		alert('등록되었습니다.');
		    		</c:if>
		    		<c:if test="${data.adminIdx != null}">
		    		alert('수정되었습니다.');
		    		</c:if>
		    		location = 'admin_list';
		    	} else {
		    		$('#dup').val("");
		    		<c:if test="${data.adminIdx == null}">
		    		alert('등록에 실패하였습니다.');
		    		</c:if>
		    		<c:if test="${data.adminIdx != null}">
		    		alert('수정에 실패하였습니다.');
		    		</c:if>		    		
		    		
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

	 $.datepicker.regional['ko'] = {
	  closeText: '닫기',
	  prevText: '이전달',
	  nextText: '다음달',
	  currentText: 'X',
	  monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	  '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	  monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	  '7월','8월','9월','10월','11월','12월'],
	  dayNames: ['일','월','화','수','목','금','토'],
	  dayNamesShort: ['일','월','화','수','목','금','토'],
	  dayNamesMin: ['일','월','화','수','목','금','토'],
	  weekHeader: 'Wk',
	  dateFormat: 'yy-mm-dd',
	  firstDay: 0,
	  isRTL: false,
	  showMonthAfterYear: true,
	  yearSuffix: ''};
	 $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#useStartDate, #useEndDate').datepicker({
        showOn: 'button',
		buttonImage: '/resources/admin/images/calendar.svg',
		buttonImageOnly: true,
        buttonText: "달력",
        changeMonth: true,
	    changeYear: true,
        showButtonPanel: true,
        yearRange: 'c-99:c+99',
        minDate: '',
        maxDate: ''
    });
});
function list_btn(){ 
	location = "admin_list";
}
</script>
</body>
</html>
