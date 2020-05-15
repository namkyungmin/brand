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
            <h1>자주묻는질문</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">게시판관리</li>
              <li class="breadcrumb-item active">자주묻는질문</li>
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
                    <select class="custom-select" name="searchCategory" id="searchCategory">
                          <option value="">전체</option>
                          <option value="parcel">분양관련</option>
                          <option value="move">입주관련</option>
                          <option value="etc">기타</option>
                    </select>                     
                    <select class="custom-select" name="searchKey" id="searchKey">
                          <option value="">전체</option>
                          <option value="title">제목</option>
                          <option value="contents">내용</option>
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
                      <col width="8%">
                      <col width="10%">
                      <col width="39%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                      <col width="8%">
                     </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">카테고리</th>
                        <th class="text-center">제목</th>
                        <th class="text-center">작성자</th>
                        <th class="text-center">등록일</th>
                        <th class="text-center">노출여부</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="data" items="${list}"  varStatus="status">
                    <tr>
                        <td class="text-center">${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                        <td class="text-center">
	                        <c:if test="${data.category=='parcel'}">분양관련</c:if>
	                        <c:if test="${data.category=='move'}">입주관련</c:if>
	                        <c:if test="${data.category=='etc'}">기타</c:if>
                        </td>
                        <td class="text-center"><a href="faq_detail?faq_id=${data.faqId}">${data.title }</a></td>
                        <td class="text-center">${data.adminId }</td>
                        <td class="text-center">${data.regTime}</td>
                        <td class="text-center">${data.displayYn}</td>
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
<script>
function save_btn(){ 
	location = "faq_detail";
}
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
</body>
</html>
