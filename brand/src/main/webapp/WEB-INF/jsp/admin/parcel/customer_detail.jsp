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
            <h1>관심고객단지관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">분양관리</li>
              <li class="breadcrumb-item active">관심고객단지관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

		<div class="box" style="background:#fff;">
                <div class="box-body">
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th>단지명</th>
                        <td>${data.parcelName }</td>
                      </tr>
                      <tr>
                        <th>성별</th>
                        <td>${data.gender=='F'?"여성":"남성"}</td>
                      </tr>                          
                      <tr>
                        <th>전화번호</th>
                        <td>
	                        <c:if test="${sessionScope.adminType == 'Master'}">
	                        ${data.cellPhone}
	                        </c:if>
	                        <c:if test="${sessionScope.adminType == 'Local'}">
	                        ${fn:substring(data.cellPhone,0,fn:length(data.cellPhone)-4) }****
	                        </c:if>
	                        </td>
                      </tr>                  
                      <tr>
                        <th>이메일</th>
                        <td>
	                        <c:if test="${sessionScope.adminType == 'Master'}">
		                        ${data.email }
	                        </c:if>
	                        <c:if test="${sessionScope.adminType == 'Local'}">
		                        ${fn:substring(data.email,0,fn:indexOf(data.email,"@")-3) }***
    	                    	${fn:substring(data.email,fn:indexOf(data.email,"@"),fn:length(data.email)) }                        
    	                    </c:if>
                        </td>
                      </tr>                                  
                      <tr>
                        <th>주소</th>
                        <td>${data.address }</td>
                      </tr>
                      <tr>
                        <th>수신동의</th>
                        <td>
                        ${data.privateYn=="Y"?"<span class='agree'>개인정보동의</span>":"" }
                        ${data.smsYn=="Y"?"<span class='agree'>SMS</span>":"" }
                        </td>
                      </tr>        
                                                                       
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
					<c:if test="${param.customer_id!=null}">
						<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>
	                <button class="btn btn-secondary" style="margin-right: 5px;" onclick="list_btn();return false;">목록</button>
	            </div>                
              </div>
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
function list_btn(){ 
	location = "customer_list";
}
$(function() {
	$('#listBtn').on("click",function(){
		location='parcel_list';
	});	
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 삭제하시겠습니까?')) {
			var url = "delete_customer";
			var data = {customerId:"${param.customer_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='customer_list';
				    	} else {
				    		alert('삭제에 실패하셨습니다.');
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
});
</script>
</body>
</html>
