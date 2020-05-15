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
      <div class="container-fluid">
		<div class="card-header">
                <h3 class="card-title"></h3>

				
                <div class="card-tools">
                <form method="post" id="search_form" name="search_form" action="">
                  <div class="input-group input-group-sm" style="width: 450px;">
	                <input type="hidden" name="curPage"  id="curPage" value="${param.curPage?param.curPage:1 }">
                    <select class="custom-select" name="searchKey" id="searchKey">
                          <option value="">전체</option>
                          <option value="admin_id" <c:if test="${param.searchKey=='admin_id'}">selected</c:if>>아이디</option>
                          <option value="admin_name"  <c:if test="${param.searchKey=='admin_name'}">selected</c:if>>이름</option>
                    </select>
                    <input type="text" name="searchValue"  id="searchValue" class="form-control float-right" placeholder="Search" value="${param.searchValue }">
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
                      <col width="20%">
                      <col width="20%">
                      <col width="15%">
                      <col width="20%">
                      <col width="15%">
                     </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">아이디</th>
                        <th class="text-center">이름</th>
                        <th class="text-center">권한</th>
                        <th class="text-center">소속</th>
                        <th class="text-center">등록일</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="row" items="${list}"  varStatus="status">
                    <tr>
                        <td class="text-center">${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                        <td class="text-center">
                        <a href="admin_detail?admin_idx=${row.adminIdx}">${row.adminId}</a></td>
                        <td class="text-center">${row.adminName}</td>
						<td class="text-center">${row.adminType}</td>
                        <td class="text-center">${row.dept}</td>
                        <td class="text-center">${row.regTime}</td>               
                    </tr>
                    </c:forEach>
                    <c:if test="${fn:length(list)==0}">
                    <tr>	
                    	<td colspan="6" class="text-center">정보가 없습니다.</td>
                    </tr>
                    </c:if>
                    </tbody>
                  </table>
            </div>
			<div class="box-footer" style="text-align:right;">
               	<button class="btn btn-honor" style="margin-right: 5px;" onclick="save_btn()">등록</button>
            </div>                            
			<%@ include file="/include/admin/paging.jsp" %>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<script name="javascript">
function save_btn(){ 
	location = "admin_detail";
}
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
</body>
</html>
