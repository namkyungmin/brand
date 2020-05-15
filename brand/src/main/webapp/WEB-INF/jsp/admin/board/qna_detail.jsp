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
                     			<div><a href="/download_file?file_id=${sfile.fileId}&board_id=${sfile.boardId}&board_code=${sfile.boardCode}">${sfile.fileName}</a></div>
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
                
				<div class="card card-default">
		          <div class="card-header">
		            <h3 class="card-title">관리자 답변</h3>
		
		          </div>
		          <!-- /.card-header -->
		          <div class="card-body" style="display: block;height:250px">
		            <div class="row">
		                <table id="detail1" class="table table-bordered table-bordered-border">
	                     <colgroup>
	                      <col width="15%">
	                      <col width="*">
	                     </colgroup>
	                    <tbody>
	                      <tr>
	                        <th><span class="text-required">*</span> 작성자</th>
	                        <td>${data.replyId }</td>
	                      </tr>
	                      <tr>
	                        <th><span class="text-required">*</span> 작성일시</th>
	                        <td>${data.replyTime }</td>
	                      </tr>                      
	                      <tr>
	                        <th><span class="text-required">*</span> 내용</th>
	                        <td>
	                            ${data.replyContents}
	                        </td>
	                      </tr>
	                      <tr>
	                        <th>비고</th>
	                        <td>
	                            ${data.comment }
	                        </td>
	                      </tr>                                                                   
	                    </tbody>
	                  </table>
		            </div>
		            <!-- /.row -->
		          </div>
		          <!-- /.card-body -->
		          </div>
		        </div>                
				<div class="box-footer" style="text-align:right">
                	<button class="btn btn-honor" style="margin-right: 5px;" type="button" id="replyBtn">답변하기</button>
	                <button class="btn btn-secondary" style="margin-right: 5px;" id="listBtn" type="button">목록</button>
	            </div>                
    </section>
    <!-- /.content -->
  </div>
</script>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
<script language="javascript">
$(function() {
	$('#replyBtn').on("click",function(){
		location='qna_reply?qna_id=${param.qna_id}&mode=reply';
	});
	$('#listBtn').on("click",function(){
		location='qna_list';
	});	
});
</script>
</body>
</html>
