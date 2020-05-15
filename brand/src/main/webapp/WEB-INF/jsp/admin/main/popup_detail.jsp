<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h1>팝업관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">메인관리</li>
              <li class="breadcrumb-item active">팝업관리</li>
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
                <input type="hidden" name="popupId" id="popupId" value="${data.popupId}" />                
                <input type="hidden" name="imagePc" id="imagePc" value="${data.imagePc}" />                                
                <input type="hidden" name="imageMo" id="imageMo" value="${data.imageMo}" />                                
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th><span class="text-required">*</span> 제목</th>
                        <td><input type="text" style="width:400px;" class="textSize" name="title" id="title" value="${data.title }" data-limit="30">
                        <span class="typingSize" data-limit="30">0</span>/30
                        <span style="margin-right:20px;">
                        <input type="radio" name="popupType" value="ALL" ${data.popupType==null||data.popupType=='ALL'?"checked":"" }> PC/모바일
                        </span>
                        <span style="margin-right:20px;"> 
                        <input type="radio" name="popupType" value="PC" ${data.popupType=='PC'?"checked":"" }> PC
                        </span>
                        <span>
                        <input type="radio" name="popupType" value="MOBILE" ${data.popupType=='MOBILE'?"checked":"" }> 모바일
                        </span>
                        
                        </td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 게시기간</th>
                        <td>
                            <input type="text" style="width:150px;" name="startDateDate" id="startDateDate" value="${data.startDateDate }"> 
                            <select name="startDateHour" id="startDateHour">
                            <c:forEach var="i" begin="0" end="23" step="1" >
                            	<option value="<fmt:formatNumber value='${i}' pattern='00' />" ${data.startDateHour == i?"selected":"" } ><c:out value="${i }" /></option>
                            </c:forEach>                            
                            </select>시
                            <select name="startDateMin" id="startDateMin">
                            <c:forEach var="i" begin="0" end="59" step="30" >
                            	<option value="<fmt:formatNumber value='${i}' pattern='00' />"  ${data.startDateMin == i?"selected":"" }><c:out value="${i }" /></option>
                            </c:forEach>                                                        
                            </select>분
                            ~ 
                            <input type="text" style="width:150px;" name="endDateDate" id="endDateDate" value="${data.endDateDate}">                        
                            <select name="endDateHour" id="endDateHour">
                            <c:forEach var="i" begin="0" end="23" step="1" >
                            	<option value="<fmt:formatNumber value='${i}' pattern='00' />"  ${data.endDateHour == i?"selected":"" }><c:out value="${i }" /></option>
                            </c:forEach>                                                        
                            </select>
		                            시
                            <select name="endDateMin" id="endDateMin">
                            <c:forEach var="i" begin="0" end="59" step="30" >
                            	<option value="<fmt:formatNumber value='${i}' pattern='00' />"  ${data.endDateMin == i?"selected":"" }><c:out value="${i }" /></option>
                            </c:forEach>                                                        
                            </select>
		                            분
                            
                        </td>
                      </tr>                          
                      <tr>
                        <th>PC 이미지</th>
                        <td>
							<input type="file" style="width:400px;" name="file" id="imagePcFile" value="" data-target="imagePc">  
							<span>* PC용 사이즈 : 500 x 360 /  파일형식 : JPG, PNG / 용량 : 2MB 이하</span>${data.imagePc }
                        </td>
                      </tr>                  
                      <tr>
                        <th>MOBILE 이미지</th>
                        <td>
							<input type="file" style="width:400px;" name="file" id="imageMoFile" value="" data-target="imageMo">  
							<span>* Mobile용 사이즈 : 400 x 300 /  파일형식 : JPG, PNG / 용량 : 2MB 이하</span>${data.imageMo }
                        </td>
                      </tr>                                  
                      <tr>
                        <th>PC 링크 URL</th>
                        <td>
                            <input type="text" style="width:400px;" name="pcUrl" id="pcUrl" value="${data.pcUrl }">  
                            <input  type="radio" name="pcUrlTarget"  value="_self" ${data.pcUrlTarget=='_self'?"checked":"" }>
                            <label class="form-check-label" style="margin-right:10px;">본창</label>
                            <input type="radio" name="pcUrlTarget" value="_blank" ${data.pcUrlTarget=='_blank'?"checked":"" }>
                            <label class="form-check-label">새창</label>		
                        </td>
                      </tr>
                      <tr>
                        <th>MOBILE 링크 URL</th>
                        <td>
                            <input type="text" style="width:400px;" name="moUrl" id="moUrl" value="${data.moUrl }"> 
                            <input  type="radio" name="moUrlTarget" id="moUrlTargetSelf" value="_self" ${data.moUrlTarget=='_self'?"checked":"" }>
                            <label class="form-check-label" style="margin-right:10px;">본창</label>
                            <input type="radio" name="moUrlTarget" id="moUrlTargetBlank" value="_blank" ${data.moUrlTarget=='_blank'?"checked":"" }>
                            <label class="form-check-label">새창</label>		
                        </td>
                      </tr>                      
                      <tr>
                        <th>팝업위치 </th>
                        <td>
	                        X : <input type="text" style="width:100px;" name="posX"  id="posX" value="${data.posX }">  
	                        Y : <input type="text" style="width:100px;" name="posY" id="posY" value="${data.posY }"> 
                        </td>
                      </tr>     
                                                                       
                    </tbody>
                  </table>
                  </form>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
					<c:if test="${param.popup_id!=null}">
					<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.popup_id==null?"등록":"수정"}</button>
	                <button class="btn btn-secondary" style="margin-right: 5px;" onclick="list_btn();return false;">목록</button>
	            </div>                
              </div>
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
$(function(){ 	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 삭제하시겠습니까?')) {
			var url = "delete_popup";
			var data = {popupId:"${param.popup_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='popup_list';
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
	 
	
	$('#saveBtn').on("click", function() {

		if($.trim($('#title').val()) == "") {
			alert('타이틀을 입력 해 주세요.')
			$('#title').focus();
			return;
		}
		
		if($.trim($('#startDateDate').val()) == "") {
			alert('게시기간 시작일을 입력 해 주세요.')
			$('#startDateDate').focus();
			return;
		}		
		
		if($.trim($('#endDateDate').val()) == "") {
			alert('게시기간 종료일을 입력 해 주세요.')
			$('#endDateDate').focus();
			return;
		}		
		
		 
			
		// Insert
		var url = "popup_save";
		var data = $('#main_form').serialize();
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		alert('등록되었습니다.');
		    		location='popup_list';
		    	} else {
		    		alert('등록에 실패하였습니다.');
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

    $('#startDateDate, #endDateDate').datepicker({
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
    
	$('#imagePcFile, #imageMoFile').bind('change', function() {
		var target = $(this).data('target');
		if(chk_file($(this).val()) == false){
			$(this).val('');
			return;
		}		
		$("<form action='/smadmin/uploadFile' enctype='multipart/form-data' method='post'/>")
			.ajaxForm({
				dataType: 'json',
				beforeSend: function() {
				},
				success: function(data){
					if(data.result==0){
						$('#'+target).val(data.url);
					} else {
					}
				},
				complete: function(data) {
					console.log(data);
				}
			})
			.append( $(this).clone() )
			.submit();
	});     
});
function list_btn(){ 
	location = "popup_list";
}
</script>
</body>
</html>
