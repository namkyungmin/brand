<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
            <h1>분양단지관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">분양관리</li>
              <li class="breadcrumb-item active">분양단지관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

		<div class="box" style="background:#fff;">
                <form id="main_form" name="main_form" method="post">
                <input type="hidden" name="parcelId" id="parcelId" value="${data.parcelId}" />
				<input type="hidden" name="parcelListImage" id="parcelListImage" value="${data.parcelListImage }" />
				<input type="hidden" name="parcelListImageMo" id="parcelListImageMo" value="${data.parcelListImageMo }" />
				<input type="hidden" name="parcelDetailImage" id="parcelDetailImage" value="${data.parcelDetailImage }" />
				<input type="hidden" name="parcelDetailImageMo" id="parcelDetailImageMo" value="${data.parcelDetailImageMo }" />
				<input type="hidden" name="constructionImagePc" id="constructionImagePc" value="${data.constructionImagePc }" />
				<input type="hidden" name="constructionImageMo" id="constructionImageMo" value="${data.constructionImageMo }" />
				<input type="hidden" name="modelhouseImagePc" id="modelhouseImagePc" value="${data.modelhouseImagePc }" />
				<input type="hidden" name="modelhouseImageMo" id="modelhouseImageMo" value="${data.modelhouseImageMo }" />
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title"  style="font-weight:bold">단지정보</h3>
		
		          </div>		
                <div class="box-body">
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th><span class="text-required">*</span> 단지명</th>
	                    <td><input type="text" style="width:500px;" name="parcelName" id="parcelName" value="${data.parcelName }"></td>
                      </tr>
                      <tr>
                        <th>지역</th>
                        <td>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="parcelArea" ${data.parcelArea=='수도권'?"checked":"" } value="수도권">
                            <label class="form-check-label" style="margin-right:50px;">수도권</label>
                            <input class="form-check-input" type="radio" name="parcelArea" ${data.parcelArea=='강원'?"checked":"" } value="강원">
                            <label class="form-check-label"  style="margin-right:50px;">강원</label>
                            <input class="form-check-input" type="radio" name="parcelArea" ${data.parcelArea=='충청'?"checked":"" } value="충청">
                            <label class="form-check-label" style="margin-right:50px;">충청</label>	                            
                            <input class="form-check-input" type="radio" name="parcelArea" ${data.parcelArea=='호남'?"checked":"" } value="호남">
                            <label class="form-check-label" style="margin-right:50px;">호남</label>	                            
                            <input class="form-check-input" type="radio" name="parcelArea" ${data.parcelArea=='영남'?"checked":"" } value="영남">
                            <label class="form-check-label">영남</label>	                                                        
                        </div>                        
						</td>
                      </tr>                       
                      <tr>
                        <th>분양단계</th>
                        <td>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="parcelStage" ${data.parcelStage=='분양예정'?"checked":"" } value="분양예정">
                            <label class="form-check-label" style="margin-right:30px;">분양예정</label>
                            <input class="form-check-input" type="radio" name="parcelStage" ${data.parcelStage=='분양중'?"checked":"" } value="분양중">
                            <label class="form-check-label"  style="margin-right:30px;">분양중</label>
                            <input class="form-check-input" type="radio" name="parcelStage" ${data.parcelStage=='분양완료'?"checked":"" } value="분양완료">
                            <label class="form-check-label"  style="margin-right:30px;">분양완료</label>
                            <!--                             
                            <input class="form-check-input" type="radio" name="parcelStage" ${data.parcelStage=='기타'?"checked":"" } value="기타">
                            <label class="form-check-label">기타</label>	                            
                            <input type="text" style="width:200px;" class="textSize" name="parcelStageEtc" id="parcelStageEtc" value="${data.parcelStageEtc}" data-limit="4"> 
                            <span class="typingSize" data-limit="4">0</span>/4
                             -->
                        </div>                        
						</td>
                      </tr>            
                      <tr>
                        <th>분양유형</th>
                        <td>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="parcelType" ${data.parcelType=='아파트'?"checked":"" } value="아파트">
                            <label class="form-check-label" style="margin-right:30px;">아파트</label>
                            <input class="form-check-input" type="radio" name="parcelType" ${data.parcelType=='오피스텔'?"checked":"" } value="오피스텔">
                            <label class="form-check-label"  style="margin-right:30px;">오피스텔</label>
                            <input class="form-check-input" type="radio" name="parcelType" ${data.parcelType=='상가분양'?"checked":"" } value="상가분양">
                            <label class="form-check-label"  style="margin-right:30px;">상가분양</label>
                            <input class="form-check-input" type="radio" name="parcelType" ${data.parcelType=='기타'?"checked":"" } value="기타">
                            <label class="form-check-label"  style="margin-right:30px;">기타</label>
                        </div>                        
						</td>
                      </tr> 
                      <tr>
                        <th >썸네일 이미지</th>
                        <td>
                        	<div style="width:80px;float:left">PC</div> <input type="file" name="file" data-target="parcelListImage">
                        	<span>*권장사이즈 340 x 268</span>
                        </td>
                      </tr>
                      <!-- 
                      <tr>
                        <td>
	                        <div style="width:80px;float:left">MOBILE</div> <input type="file" name="file" data-target="parcelListImageMo">
	                        <span>*권장사이즈 340 x 268</span>
                        </td>
                      </tr>
                       -->                      
                      <tr>
                        <th rowspan="2">상세 이미지</th>
                        <td>
                            <div style="width:80px;float:left">PC</div> <input type="file" name="file" data-target="parcelDetailImage">
                            <span>*권장사이즈 1100 x 620</span>
                        </td>
                      </tr> 
                      <tr>
                        <td>
                            <div style="width:80px;float:left">MOBILE</div> <input type="file" name="file" data-target="parcelDetailImageMo">
                            <span>*권장사이즈 1026x684</span>
                        </td>                      
                      </tr>
                      <tr>
                        <th>분양홈페이지 URL</th>
	                    <td><input type="text" style="width:500px;" name="homepageUrl" id="homepageUrl" value="${data.homepageUrl }">
                           <input  type="radio" name="homepageTarget" id="homepageUrlTargetSelf" value="_self" ${data.homepageTarget=='_self'?"checked":"" }>
                            <label class="form-check-label" style="margin-right:10px;">본창</label>
                            <input type="radio" name="homepageTarget" id="homepageUrlTargetBlank" value="_blank" ${data.homepageTarget=='_blank'?"checked":"" }>
                            <label class="form-check-label">새창</label>			                    
	                    </td>
                      </tr>                                           
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
            </div>
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title" style="font-weight:bold">분양일정</h3>
		
		          </div>
		          <!-- /.card-header -->
		            <div class="box-body">
		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                      <tr>
	                        <th>모집공고</th>
		                    <td>
		                    	<input type="text" style="width:150px;" name="announceStartDate" id="announceStartDate" value="${data.announceStartDate }">
	                           	 ~ 
	                           	<input type="text" style="width:150px;" name="announceEndDate" id="announceEndDate" value="${data.announceEndDate }">		                    
		                    </td>
	                        <th>당첨자 발표</th>
		                    <td>
		                    	<input type="text" style="width:150px;" name="winnerStartDate" id="winnerStartDate" value="${data.winnerStartDate }">
	                           	 ~ 
	                           	<input type="text" style="width:150px;" name="winnerEndDate" id="winnerEndDate" value="${data.winnerEndDate }">		                    
		                    </td>	                    
	                      </tr>                                                 
	                      <tr>
	                        <th>청약접수</th>
		                    <td>
		                    	<input type="text" style="width:150px;" name="applicationStartDate" id="applicationStartDate" value="${data.applicationStartDate }">
	                           	 ~ 
	                           	<input type="text" style="width:150px;" name="applicationEndDate" id="applicationEndDate" value="${data.applicationEndDate }">		                    
		                    </td>
	                        <th>계약</th>
		                    <td>
		                    	<input type="text" style="width:150px;" name="contractStartDate" id="contractStartDate" value="${data.contractStartDate }">
	                           	 ~ 
	                           	<input type="text" style="width:150px;" name="contractEndDate" id="contractEndDate" value="${data.contractEndDate }">		                    
		                    </td>	                    
	                      </tr>     
	                      <tr>
	                        <th>노출여부</th>
		                    <td colspan="3">
						        <div class="form-check" >
		                            <input class="form-check-input" type="radio" name="displayYn" id="displayY" value="Y"  ${data.displayYn=='Y'?"checked":"" }>
		                            <label class="form-check-label" style="margin-right:30px;">Y</label>
		                            <input class="form-check-input" type="radio"  name="displayYn" id="displayN" value="N"  ${data.displayYn=='N'?"checked":"" }>
		                            <label class="form-check-label">N</label>
		                        </div>                       
		                    </td>
	                      </tr>	                                                                                        
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->
		          </div>
		          
		          
		          
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title" style="font-weight:bold">사업개요</h3>
		
		          </div>
		          <!-- /.card-header -->
		            <div class="box-body">
		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                      <tr>
	                        <th>위치</th>
		                    <td>
		                    	<input type="text" style="width:500px;" name="location" id="location" value="${data.location}">		                    
		                    </td>
	                        <th>문의</th>
		                    <td> 
		                    	<input type="text" style="width:500px;" name="inquiry" id="inquiry" value="${data.inquiry}">		                    
		                    </td>	                                 
	                      </tr>                                                 
	                      <tr>
	                        <th>분양시기</th>
		                    <td>
		                    	<input type="text" style="width:500px;" name="period" id="period" value="${data.period}">		                    		                    
		                    </td>
	                        <th>세대수</th>
		                    <td>
		                    	<input type="text" style="width:500px;" name="scale" id="scale" value="${data.scale}">		                    		                    		                    
		                    </td>	                    
	                      </tr>     
	                      <tr>
	                        <th>입주시기</th>
		                    <td>
		                    	<input type="text" style="width:500px;" name="admission" id="admission" value="${data.admission}">		                    		                    
		                    </td>
	                        <th>주택형</th>
		                    <td>
			                   	 <input type="text" style="width:500px;" name="numbers" id="numbers" value="${data.numbers}">
		                    </td>	                    
	                      </tr>     
	                      <tr>
	                        <th>시행</th>
		                    <td>
		                    	<input type="text" style="width:500px;" name="enforcementCompany" id="enforcementCompany" value="${data.enforcementCompany}">		                    		                    
		                    </td>
	                        <th>시공</th>
		                    <td>
			                   	 <input type="text" style="width:500px;" name="constructorCompany" id="constructorCompany" value="${data.constructorCompany}">		                    		                    
		                    </td>	                    
	                      </tr>                             	                      
	                                                                                                    
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->
		          
		          
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title" style="font-weight:bold">현장위치</h3>
		
		          </div>
		          <!-- /.card-header -->
		            <div class="box-body">
		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                    
	                      <tr>
	                        <th rowspan="4">현장위치</th>
		                    <td>
			                    <div style="width:80px;float:left">위치</div> 
		                    	<input type="text" style="width:500px;" name="constructionLocation" id="constructionLocation" value="${data.constructionLocation}">		                    
		                    </td>
	                      </tr>                                                 
	                      <tr>
		                    <td>
		                    	<div style="width:80px;float:left">문의</div> 
		                    	<input type="text" style="width:500px;" name="constructionInquiry" id="constructionInquiry" value="${data.constructionInquiry}">		                    		                    
		                    </td>
	                      </tr>     
	                      <tr>
		                    <td>
    	                        <div style="width:80px;float:left">PC</div> 
	                            <input type="file" name="file" data-target="constructionImagePc">
	                            <span>*권장사이즈  766 x 409</span>
		                    </td>
	                      </tr>     
	                      <tr>
		                    <td>
        	                    <div style="width:80px;float:left">MOBILE</div> 
	                            <input type="file" name="file"  data-target="constructionImageMo">
	                            <span>*권장사이즈 1026 x 633</span>
		                    </td>
	                      </tr>     	                      	                      
	                      <tr>
	                        <th>노출여부</th>
		                    <td colspan="3">
						        <div class="form-check" >
		                            <input class="form-check-input" type="radio" name="constructionDisplayYn" id="constructionDisplayY" value="Y"  ${data.constructionDisplayYn=='Y'?"checked":"" }>
		                            <label class="form-check-label" style="margin-right:30px;">Y</label>
		                            <input class="form-check-input" type="radio"  name="constructionDisplayYn" id="constructionDisplayN" value="N"  ${data.constructionDisplayYn=='N'?"checked":"" }>
		                            <label class="form-check-label">N</label>
		                        </div>                       
		                    </td>
	                      </tr>	   	   	                           	                      
	                                                                                                    
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->
		          
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title" style="font-weight:bold">견본주택위치</h3>
		
		          </div>
		          <!-- /.card-header -->
		            <div class="box-body">
		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                    
	                      <tr>
	                        <th rowspan="4">견본주택</th>
		                    <td>
			                    <div style="width:80px;float:left">위치</div> 
		                    	<input type="text" style="width:500px;" name="modelhouseLocation" id="modelhouseLocation" value="${data.modelhouseLocation}">		                    
		                    </td>
	                      </tr>                                                 
	                      <tr>
		                    <td>
		                    	<div style="width:80px;float:left">문의</div> 
		                    	<input type="text" style="width:500px;" name="modelhouseInquiry" id="modelhouseInquiry" value="${data.modelhouseInquiry}">		                    		                    
		                    </td>
	                      </tr>     
	                      <tr>
		                    <td>
    	                        <div style="width:80px;float:left">PC</div> 
	                            <input type="file" name="file" data-target="modelhouseImagePc">
	                            <span>*권장사이즈 766 x 409</span>
		                    </td>
	                      </tr>     
	                      <tr>
		                    <td>
        	                    <div style="width:80px;float:left">MOBILE</div> 
	                            <input type="file" name="file" data-target="modelhouseImageMo">
	                            <span>*권장사이즈 1026 x 633</span>
		                    </td>
	                      </tr>     	                      	                      
	                      <tr>
	                        <th>노출여부</th>
		                    <td colspan="3">
						        <div class="form-check" >
		                            <input class="form-check-input" type="radio" name="modelhouseDisplayYn" id="modelhouseDisplayY" value="Y"  ${data.modelhouseDisplayYn=='Y'?"checked":"" }>
		                            <label class="form-check-label" style="margin-right:30px;">Y</label>
		                            <input class="form-check-input" type="radio"  name="modelhouseDisplayYn" id="modelhouseDisplayN" value="N"  ${data.modelhouseDisplayYn=='N'?"checked":"" }>
		                            <label class="form-check-label">N</label>
		                        </div>                       
		                    </td>
	                      </tr>	   	   	                           	                      
	                                                                                                    
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->		          
		          </form>
		          </div>		          
				<div class="box-footer" style="text-align:right">
					<c:if test="${param.parcel_id!=null}">
					<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.parcel_id==null?"등록":"수정"}</button>
	                <button class="btn btn-secondary" style="margin-right: 5px;" id="listBtn" type="button">목록</button>
	            </div>                
              </div>
    </section>
    <!-- /.content -->
  </div>
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
$(function() {
	$('#listBtn').on("click",function(){
		location='parcel_list';
	});	
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 삭제하시겠습니까?')) {
			var url = "delete_parcel";
			var data = {parcelId:"${param.parcel_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='parcel_list';
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

		if($.trim($('#parcelName').val()) == "") {
			alert('단지명을 입력 해 주세요.')
			$('#parcelNam').focus();
			return;
		}
		
		 
			
		// Insert
		var url = "parcel_save";
		var data = $('#main_form').serialize();
 
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		if($('#parcelId').val() == "")
		    			alert('등록되었습니다.');
		    		else
		    			alert('수정되었습니다.');
		    		location='parcel_list';
		    	} else {
		    		if($('#parcelId').val() == "")
		    			alert('등록에 실패하였습니다.');
		    		else
		    			alert('수정에 실패하였습니다.');
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

   $('input[name*=Date]').datepicker({
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
   
	$('input[type=file]').bind('change', function() {
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
</script>
</body>
</html>
