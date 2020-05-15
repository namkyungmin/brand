<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      <div class="container-fluid">
        </div>
		<div class="row" style="background:#fff;">
                  <table id="body_list" class="table table-bordered">
                     <colgroup>
                      <col width="10%">
                      <col width="10%">
                      <col width="25%">
                      <col width="25%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                     </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">플래그</th>
                        <th class="text-center">타이틀</th>
                        <th class="text-center">이미지</th>
                        <th class="text-center">작성자</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">노출여부</th>
                      </tr>
                    </thead>
                    <tbody id="sortable">
                    <c:forEach var="data" items="${list}"  varStatus="status">
                    <tr class="sort_order" data-banner-id="${data.bannerId}" data-sort-order="${data.sortOrder}">
                        <td class="text-center">${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                        <td class="text-center">${data.flag }</td>
                        <td class="text-center"><a href="banner_detail?banner_id=${data.bannerId}">${data.title }</a></td>
                        <td class="text-center">
                        <c:if test="${data.image !=''}">
                        <img src='${data.image }' style="max-height:100px;">
                        </c:if>
						</td>
                        <td class="text-center">${data.adminId }</td>
						<td class="text-center">${data.regTime }</td>
						<td class="text-center">${data.displayYn }</td>
                    </tr>
                    </c:forEach>
                    <c:if test="${fn:length(list)==0}">
                    <tr>	
                    	<td colspan="7" class="text-center">정보가 없습니다.</td>
                    </tr>
                    </c:if>                    
                    </tbody>
                  </table>
            </div>
			<div class="box-footer" style="text-align:right;">
				<button class="btn btn-honor" style="margin-right: 5px;" type="button" id="sortBtn">노출순서 저장</button>
               	<button class="btn btn-honor" style="margin-right: 5px;" onclick="save_btn()">등록</button>
            </div>                            
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script>
function save_btn(){ 
	<c:if test="${fn:length(list)>=3}">
	alert('배너는 세개까지 등록 가능합니다.');
	</c:if>
	<c:if test="${fn:length(list)<3}">
	location = "banner_detail";
	</c:if>
}
$(function(){
	$('#sortBtn').on("click",function(){
		if(confirm('노출 순서를 저장하시겠습니까?')) {
			var i = 0;
			var data = {};
			var bannerId = new Array();
			var sortOrder = new Array();
			var url = "banner_sort_save";
			$('#sortable tr').each(function() {
				bannerId.push($(this).data("banner-id"));
				sortOrder.push(i++);
			});
			data={sortOrder:sortOrder, bannerId:bannerId};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('순서가 변경되었습니다.');
				    	} else {
				    		alert('정보변경에 실패하였습니다.');
				    	}
				    	location.reload();
				    },
				    error: function (request, status, error){        
				        var msg = "ERROR : " + request.status + "<br>"
				      msg +=  + "내용 : " + request.responseText + "<br>" + error;
				      console.log(msg);              
				    }
				  });	
			
			
		}
	});
    $("#sortable").sortable();
    $("#sortable").disableSelection();

	
});
</script>
</body>
</html>
