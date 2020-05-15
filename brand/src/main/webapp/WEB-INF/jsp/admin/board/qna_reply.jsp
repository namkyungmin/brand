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
            <h1>1:1문의관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">게시판관리</li>
              <li class="breadcrumb-item active">1:1문의관리</li>
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
                        <th><span class="text-required">*</span> 카테고리</th>
                        <td>
	                        ${data.category}   
						</td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 상태</th>
                        <td>
                        ${data.status }
						</td>
                      </tr>                      
                      <tr>
                        <th><span class="text-required">*</span> 제목</th>
                        <td>
                            ${data.title}
                        </td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 내용</th>
                        <td>
                            ${data.contents}
                        </td>
                      </tr>                      
                      <tr>
                        <th>첨부파일</th>
                        <td>
                       		<c:forEach var="sfile" items="${file}" varStatus="row">
                     			<div><a href="${sfile.filePath}" target="_blank">${sfile.fileName}</a></div>
                       		</c:forEach>                        
                        </td>
                      </tr>      
                      <tr>
                        <th>요청자</th>
                        <td>
                            ${data.userId}
                            
                        </td>
                      </tr>                      
                      <tr>
                        <th>요청일</th>
                        <td>
                            ${data.regTime }
                            
                        </td>
                      </tr>     
                      <tr>
                        <th>휴대전화</th>
                        <td>
                            ${data.cellPhone}
                            
                        </td>
                      </tr>                                                                     
                      <tr>
                        <th>이메일</th>
                        <td>
                            ${data.email}
                            
                        </td>
                      </tr>                                                                  
                    </tbody>
                  </table>
                </div><!-- /.box-body -->

		                <form id="main_form" name="main_form" method="post">
		                <input type="hidden" name="qnaId" id="qnaId" value="${data.qnaId}" />                		            
		            	<input type="hidden" name="replyId" id="replyId" value="${sessionScope.adminId}">
		            	<input type="hidden" name="status" id="status" value="${data.status}">                
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title">관리자 답변</h3>
		
		          </div>
		          <!-- /.card-header -->
		          <div class="card-body" style="display: block;height:400px">
		            <div class="row">

		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                      <tr>
	                        <th>작성자</th>
	                        <td>${sessionScope.adminName}</td>
	                      </tr>
	                      <tr>
	                        <th>작성일시</th>
	                        <td>
	                        <jsp:useBean id="currTime" class="java.util.Date" />
	                        <fmt:formatDate value="${currTime}" var="currTime" pattern="yyyy-MM-dd HH:mm:ss" />
	                        <input type="text"   name="replyTime" value="${currTime }" style="border:0px solid #fff" readonly>
	                        
	                        </td>
	                      </tr>                      
	                      <tr>
	                        <th><span class="text-required">*</span> 내용</th>
	                        <td>
	                            <textarea name="replyContents" id="replyContents" style="width:700px;height:120px">${data.replyContents }</textarea>
	                        </td>
	                      </tr>
	                      <tr>
	                        <th>비고</th>
	                        <td>
		                        <textarea name="comment" id="comment" style="width:700px;height:50px">${data.comment }</textarea> <span>*단순 관리자용 비고란입니다(사용자에게 노출되지 않습니다)</span>
	                        </td>
	                      </tr>                                                                   
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->
		          </div>
		          </form>
		        </div>                
				<div class="box-footer" style="text-align:right">
                	<button class="btn btn-honor" style="margin-right: 5px;"   type="button" id="replyYBtn">답변완료</button>
                	<!-- <button class="btn btn-honor" style="margin-right: 5px;"   type="button" id="replyNBtn">답변불가</button> -->
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
	$('#replyYBtn').on("click",function(){
		$('#status').val('답변완료');
		save();
	});

	$('#replyNBtn').on("click",function(){
		$('#status').val('답변불가');
		save();
	});
	
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 계정을 삭제하시겠습니까?')) {
			
		}
	});
	 
	
	function save() {

		if($.trim($('#replyContents').val()) == "") {
			alert('답변내용을 입력 해 주세요.')
			$('#replyContents').focus();
			return;
		}
			
		// Insert
		var url = "qna_reply_save";
		var data = $('#main_form').serialize();
 
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		alert('답변이 등록되었습니다.');
		    		location='qna_list';
		    	} else {
		    		alert('답변이 등록에 실패하였습니다.');
		    	}
//		    	console.log(data);
		    },
		    error: function (request, status, error){        
		        var msg = "ERROR : " + request.status + "<br>"
		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		      console.log(msg);              
		    }
		  });		
	}
});
function list_btn(){ 
	location = "qna_list";
}
</script>
</body>
</html>
