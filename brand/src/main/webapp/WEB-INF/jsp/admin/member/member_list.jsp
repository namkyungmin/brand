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
            <h1>회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">게시판관리</li>
              <li class="breadcrumb-item active">회원관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <form method="post" id="search_form" name="search_form" action="">
        <input type="hidden" name="curPage"  id="curPage" value="${param.curPage?param.curPage:1 }">          
      <div class="container-fluid">

		<div class="row">
            <table id="detail1" class="table table-bordered table-bordered-border">
              <colgroup>
               <col width="15%">
               <col width="*">
               <col width="15%">
               <col width="*">
              </colgroup>
             <tbody>
               <tr>
                 <th>이름</th>
                 <td><input type="text" style="width:400px;" name="userName" id="userName" value="${param.userName }"></td>
                 <th>아이디</th>
                 <td><input type="text" style="width:400px;" name="userId" id="userId" value="${param.userId }"></td>
               </tr>
               <tr>
                 <th>휴대전화</th>
                 <td><input type="text" style="width:400px;" name="cellPhone" id="cellPhone"  value="${param.cellPhone }"></td>
                 <th>이메일</th>
                 <td><input type="text" style="width:400px;" name="email" id="email" value="${param.email }"></td>
               </tr>
               <tr>
                 <th>수신동의</th>
                 <td>
                 	우편물 <input type="checkbox" name="mailYn" value="Y" ${param.mailYn=='Y'?"checked":""}>
                 	이메일 <input type="checkbox" name="emailYn" value="Y" ${param.emailYn=='Y'?"checked":""}>
                 	SMS <input type="checkbox" name="smsYn" value="Y" ${param.smsYn=='Y'?"checked":""}>
                 </td>
                 <th></th>
                 <td></td>
               </tr>            
             </table> 
             </div>
			
        </div>
		<div class="box-footer" style="text-align:right;margin-bottom:30px;">
              	<button type="button" id="search_btn" class="btn btn-honor" style="margin-right: 5px;" >검색</button>
        </div>   
        </form>         

		<div class="row" style="background:#fff;margin-bottom:10px;">
			<button class="btn btn-honor" style="margin-right: 5px;" onclick="excelDown();return false;"><i class="fas fa-file-excel"></i> Excel 파일 다운로드</button>
		</div>
		<div class="row" style="background:#fff;">
                  <table id="body_list" class="table table-bordered">
                     <colgroup>
                      <col width="10%">
                      <col width="20%">
                      <col width="20%">
                      <col width="10%">
                      <col width="10%">
                      <col width="10%">
                      <col width="20%">
                     </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">이름</th>
                        <th class="text-center">아이디</th>
                        <th class="text-center">휴대전화</th>
                        <th class="text-center">이메일</th>
                        <th class="text-center">가입일시</th>
                        <th class="text-center">수신동의</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="data" items="${list}"  varStatus="status">
                    <tr>
                        <td class="text-center">${(pagination.listCnt+1)-(status.count  + (((param.curPage>0?param.curPage:1) - 1) * 10))}</td>
                        <td class="text-center">${data.userName }</td>
                        <td class="text-center"><a href="member_detail?user_idx=${data.userIdx }">${data.userId }</a></td>
                        <td class="text-center">
	                        <c:if test="${sessionScope.adminType == 'Master'}">
	                        ${data.cellPhone}
	                        </c:if>
	                        <c:if test="${sessionScope.adminType == 'Local'}">                        
	                        ${fn:substring(data.cellPhone,0,fn:length(data.cellPhone)-4) }****
	                        </c:if>
                        </td>
                        <td class="text-center">
	                        <c:if test="${sessionScope.adminType == 'Master'}">
	                        ${data.email}
	                        </c:if>
	                        <c:if test="${sessionScope.adminType == 'Local'}">                        
	                        ${fn:substring(data.email,0,fn:indexOf(data.email,"@")-3) }***
	                        ${fn:substring(data.email,fn:indexOf(data.email,"@"),fn:length(data.email)) }
	                        </c:if>
                        </td>
						<td class="text-center">${data.regTime }</td>
						<td class="text-center">
						${data.mailYn=="Y"?"<span class='agree'>우편물</span>":"" }
						${data.emailYn=="Y"?"<span class='agree'>이메일</span>":"" }
						${data.smsYn=="Y"?"<span class='agree'>SMS</span>":"" }
						</td>
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
			<%@ include file="/include/admin/paging.jsp" %>
        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script>
$(function(){
	$('#search_btn').on("click",function(){
		if($.trim($('#userName').val()) == "" && $.trim($('#userId').val()) == "" && $.trim($('#cellPhone').val()) == "" && $.trim($('#email').val()) == ""  && $('input[type=checkbox]').is(":checked") == false) {
			alert('검색어를 입력하세요.')
			return;
		}
		$('#search_form').attr("action","");
		$('#search_form').submit();		
	});
});
function fn_paging(page) {
	$('#curPage').val(page);
	$('#search_form').submit();
}
function save_btn(){ 
	location = "qna_detail";
}
function excelDown() {
	if($.trim($('#userName').val()) == "" && $.trim($('#userId').val()) == "" && $.trim($('#cellPhone').val()) == "" && $.trim($('#email').val()) == "" && $('input[type=checkbox]').is(":checked") == false) {
		alert('검색어를 입력하세요.')
		return;
	}	
	$('#search_form').attr("action","excel_down");
	$('#search_form').submit();
	
	$('#search_form').action = "";
}
</script>
</body>
</html>
