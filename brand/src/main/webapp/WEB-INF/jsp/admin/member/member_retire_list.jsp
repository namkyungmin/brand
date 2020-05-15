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
            <h1>탈퇴회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">게시판관리</li>
              <li class="breadcrumb-item active">탈퇴회원관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
		<div class="card-header">
                <h3 class="card-title"></h3>

                <div class="card-tools">
                <form method="post" id="search_form" name="search_form" action="">
                <input type="hidden" name="curPage"  id="curPage" value="${param.curPage?param.curPage:1 }">
                  <div class="input-group input-group-sm" style="width: 450px;">
                    <select class="custom-select" name="searchKey" id="searchKey">
                          <option value="user_id">아이디</option>
                          <option value="retire_reason">탈퇴사유</option>
                          <option value="retire_time">탈퇴일시</option>
                    </select>                  
                    <input type="text" name="searchValue"  id="searchValue" class="form-control float-right" placeholder="Search">
                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i>검색</button>
                    </div>
                  </div>
                  </form>
                </div>
        </div>
		<div class="row" style="background:#fff;">
                  <table id="body_list" class="table table-bordered">
                     <colgroup>
                      <col width="10%">
                      <col width="30%">
                      <col width="40%">
                      <col width="20%">
                     </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">아이디</th>
                        <th class="text-center">탈퇴사유</th>
                        <th class="text-center">탈퇴일시</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="data" items="${list}"  varStatus="status">
                    <tr>
                        <td class="text-center">${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                        <td class="text-center">${data.userId }</td>
                        <td class="text-center">${data.retireReason }</td>
                        <td class="text-center">${data.retireTime }</td>               
                    </tr>
                    </c:forEach>
                    <c:if test="${fn:length(list)==0}">
                    <tr>	
                    	<td colspan="4" class="text-center">정보가 없습니다.</td>
                    </tr>
                    </c:if>                    
                    
                    </tbody>
                  </table>
            </div>
			<%@ include file="/include/admin/paging.jsp" %>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<script>
function fn_paging(page) {
	$('#curPage').val(page);
	$('#search_form').submit();
}
function save_btn(){ 
	location = "qna_detail";
}
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
</body>
</html>
