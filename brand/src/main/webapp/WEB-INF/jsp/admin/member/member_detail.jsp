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
            <h1>회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">회원관리</li>
              <li class="breadcrumb-item active">회원관리</li>
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
                        <th>이름</th>
                        <td>${data.userName }</td>
                      </tr>
                      <tr>
                        <th>아이디</th>
                        <td>${data.userId }</td>
                      </tr>                      
                      <tr>
                        <th>휴대전화</th>
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
                        <th>주소</th>
                        <td>
                            (${data.zipcode }) ${data.address }
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
                        <th>가입일시</th>
                        <td>
                            ${data.regTime}
                        </td>
                      </tr>                          
                      <tr>
                        <th>수신동의</th>
                        <td>
		                            우편물 : ${data.mailYn } /
		                            이메일 : ${data.emailYn }  / 
				            SMS : ${data.smsYn }  
                        </td>
                      </tr>                                                                           
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
	                <button class="btn btn-secondary" style="margin-right: 5px;" onclick="list_btn();return false;">목록</button>
	            </div>                
              </div>
    </section>
    <!-- /.content -->
  </div>
<script>
function list_btn(){ 
	location = "member_list";
}
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
</body>
</html>
