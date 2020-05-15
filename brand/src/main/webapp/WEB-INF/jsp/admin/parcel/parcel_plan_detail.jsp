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
            <h1>연간분양계획관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">분양관리</li>
              <li class="breadcrumb-item active">연간분양계획관리</li>
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
                <input type="hidden" name="planId" id="planId" value="${data.planId}" />                
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th><span class="text-required">*</span> 단지명</th>
                        <td><input type="text" style="width:400px;" name="parcelName" id="parcelName" value="${data.parcelName }"></td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 분양시기(예정)</th>
                        <td> 
                            <Select name="parcelPlanYear">
                            <c:forEach var="i" begin="2020" end="2030" step="1" >
                            	<option value="<c:out value="${i }" />" <c:if test="${data.parcelPlanYear==$i }">selected</c:if>><c:out value="${i }" /></option>
                            </c:forEach>
                            </Select> 
                            <Select name="parcelPlanMonth">
                            <c:forEach var="i" begin="1" end="12" step="1" >
                            	<fmt:formatNumber var="zeroi" value='${i}' pattern='00' />
                            	<option value="${zeroi }"  <c:if test="${data.parcelPlanMonth==zeroi }">selected</c:if>><c:out value="${i }" /></option>
                            </c:forEach>
                            </Select>
                        </td>
                      </tr>                          
                      <tr>
                        <th>분양홈페이지 URL</th>
                        <td>
							<input type="text" style="width:400px;" name="homepageUrl" id="homepageUrl" value="${data.homepageUrl }"> 
	                            <input  type="radio" name="homepageUrlTarget" id="homepageUrlTargetSelf" value="_self"  ${data.homepageUrlTarget =='_self'?'checked':'' }>
	                            <label class="form-check-label" style="margin-right:10px;">본창</label>
	                            <input type="radio" name="homepageUrlTarget" id="homepageUrlTargetBlank" value="_blank"  ${data.homepageUrlTarget =='_blank'?'checked':'' }>
	                            <label class="form-check-label">새창</label>                        
						</td>
                      </tr>
                      <tr>
                        <th>연락처 </th>
                        <td>
							<input type="text" style="width:400px;" name="inquiry" id="inquiry" value="${data.inquiry }"> 
						</td>
                      </tr>  
                      <tr>
                        <th>노출여부</th>
                        <td>
					        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="displayYn" id="displayY" value="Y" ${data.displayYn =='Y'?'checked':'' }>
	                            <label class="form-check-label" style="margin-right:30px;">Y</label>
	                            <input class="form-check-input" type="radio"  name="displayYn" id="displayN" value="N" ${data.displayYn =='N'?'checked':'' }>
	                            <label class="form-check-label">N</label>
	                        </div>   
                        </td>
                      </tr>                                                                           
                    </tbody>
                  </table>
                  </form>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.plan_id==null?"등록":"수정"}</button>
                	<c:if test="${param.plan_id!=null}">
                		<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
                	</c:if>
	                <button class="btn btn-secondary" style="margin-right: 5px;" onclick="list_btn();return false;"  tpe="button">목록</button>
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
			var url = "delete_plan";
			var data = {planId:"${param.plan_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='parcel_plan_list';
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
			alert('단지명을 선택 해 주세요.')
			$('#parcelName').focus();
			return;
		}
		
		 
			
		// Insert
		var url = "parcel_plan_save";
		var data = $('#main_form').serialize();
 
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		if($('#planId').val() == "")
		    			alert('등록되었습니다.');
		    		else
		    			alert('수정되었습니다.');
		    		location='parcel_plan_list';
		    	} else {
		    		if($('#planId').val() == "")
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
 
});
function list_btn(){ 
	location = "parcel_plan_list";
}
</script>
</body>
</html>
