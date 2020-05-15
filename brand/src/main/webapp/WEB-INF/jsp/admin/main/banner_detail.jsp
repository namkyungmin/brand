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
            <h1>배너관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">메인관리</li>
              <li class="breadcrumb-item active">배너관리</li>
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
                <input type="hidden" name="bannerId" id="bannerId" value="${data.bannerId}" />                
                <input type="hidden" name="image" id="image" value="${data.image}" />                
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th><span class="text-required">*</span> 타이틀</th>
                        <td>
                        	<p><input type="text" style="width:500px;" name="title" id="title" value="${data.title }"></p>
                        	<p><input type="text" style="width:500px;" name="title2" id="title2" value="${data.title2 }"></p>
                        </td>
                      </tr>
                      <tr>
                        <th>서브타이틀</th>
                        <td>
                            <p><input type="text" class="textSize" style="width:500px;" name="subTitle" id="subTitle" value="${data.subTitle }" ></p>
                            <p><input type="text" class="textSize" style="width:500px;" name="subTitle2" id="subTitle2" value="${data.subTitle2 }" ></p> 
                            
                        </td>
                      </tr>
                      <tr>
                        <th>플래그</th>
                        <td>
	                        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="flag" ${data.flag=='분양예정'?"checked":"" } value="분양예정">
	                            <label class="form-check-label" style="margin-right:30px;">분양예정</label>
	                            <input class="form-check-input" type="radio" name="flag" ${data.flag=='분양중'?"checked":"" } value="분양중">
	                            <label class="form-check-label"  style="margin-right:30px;">분양중</label>
	                            <input class="form-check-input" type="radio" name="flag" ${data.flag=='없음'?"checked":"" } value="없음">
	                            <label class="form-check-label"  style="margin-right:30px;">없음</label>	                            
	                            <input class="form-check-input" type="radio" name="flag" ${data.flag=='기타'?"checked":"" } value="기타">
	                            <label class="form-check-label">기타</label>	                            
	                            <input type="text" style="width:200px;" class="textSize" name="flagInfo" id="flagInfo" value="${data.flagInfo}"  data-limit="4"> 
	                            <span class="typingSize" data-limit="4">0</span>/4
	                        </div>
                        </td>
                      </tr>     
                      <tr>
                        <th>게시기간</th>
                        <td>
                            <input type="text" style="width:150px;" name="startDate" id="startDate" value="${data.startDate }"> ~ 
                            <input type="text" style="width:150px;" name="endDate" id="endDate" value="${data.endDate }">                        
                        </td>
                      </tr>
                      
                      <tr class="parcel"  <c:if test="${data.flag =='없음' || data.flag=='기타' }">style="display:none"</c:if>>
                        <th>텍스트 입력</th>
                        <td>
                        	<table style="width:100%">
                        	<tr>
                        		<td>위치 : </td>
                        		<td><input type="text" style="width:500px;" name="descPlace" id="descPlace" value="${data.descPlace }"></td>
                        	</tr>
                        	<tr>
                        		<td>세대수 : </td>
                        		<td><input type="text" style="width:500px;" name="descSize" id="descSize" value="${data.descSize }"></td>
                        	</tr>
                        	<tr>
                        		<td>분양시기 : </td>
                        		<td><input type="text" style="width:500px;" name="descPlan" id="descPlan" value="${data.descPlan }"></td>
                        	</tr>
                        	<tr>
                        		<td>전화번호 : </td>
                        		<td><input type="text" style="width:500px;" name="contactNumber" id="contactNumber" value="${data.contactNumber }"></td>
                        	</tr>
                        	</table>                        	
                        </td>
                      </tr>  
                      <tr class="none"  <c:if test="${data.flag =='분양예정' || data.flag=='분양중' || data.flag==''}">style="display:none"</c:if>>
                        <th>텍스트 입력</th>
                        <td>
							<textarea name="description" class="textSize" id="description" style="width:500px"  data-limit="100">${data.description }</textarea>
							<span class="typingSize" data-limit="100">0</span>/100
                        </td>
                      </tr>           
                      <tr>
                        <th>이미지</th>
                        <td>
							<input type="file" style="width:400px;" name="file" id="file" value="" data-target="image"> 
							<span>* PC용 사이즈 : 355p  X 277 /  파일형식 : JPG, PNG </span> 
                        </td>
                      </tr>     
                      <tr>
                        <th>링크URL</th>
                        <td>
							<input type="text" style="width:400px;" name="url" id="url" value="${data.url }"> 
	                            <input  type="radio" name="urlTarget" id="urlTargetSelf" value="_self" ${data.urlTarget=='_self'?"checked":"" }>
	                            <label class="form-check-label" style="margin-right:10px;">본창</label>
	                            <input type="radio" name="urlTarget" id="urlTargetBlank" value="_blank" ${data.urlTarget=='_blank'?"checked":"" }>
	                            <label class="form-check-label">새창</label>							
                        </td>
                      </tr>                                           
                      <tr>
                        <th>노출여부</th>
                        <td>
					        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="displayYn" id="displayY" value="Y"  ${data.displayYn=='Y'?"checked":"" }>
	                            <label class="form-check-label" style="margin-right:30px;">Y</label>
	                            <input class="form-check-input" type="radio"  name="displayYn" id="displayN" value="N"  ${data.displayYn=='N'?"checked":"" }>
	                            <label class="form-check-label">N</label>
	                        </div>   
                        </td>
                      </tr>                                                                   
                    </tbody>
                  </table>
                  </form>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
					<c:if test="${param.banner_id!=null}">
					<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.banner_id==null?"등록":"수정"}</button>
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
			var url = "delete_banner";
			var data = {bannerId:"${param.banner_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='banner_list';
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
		 
		 
			
		// Insert
		var url = "banner_save";
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
		    		location='banner_list';
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

    $('#startDate, #endDate').datepicker({
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
    
	$('#file').bind('change', function() {
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
				}
			})
			.append( $(this).clone() )
			.submit();
	});
	
	$('input[name=flag]').on("change",function(){
		if($(this).val() == "없음" || $(this).val() == "기타") {
			 $('.none').show();
			 $('.parcel').hide();
		} else {
			 $('.none').hide();
			 $('.parcel').show();			
		}
				
	});
});
 
function list_btn(){ 
	location = "banner_list";
}
</script>
</body>
</html>
