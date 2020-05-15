<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
  <style> 
    .card-body { height:200px;}
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
            <h1>메인</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">메인</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">


        <div class="row">
        <c:if test="${fn:indexOf(sessionScope.adminType,'Master') >=0 }">
         <c:if test="${fn:indexOf(sessionScope.adminRole,'ADMIN_ADMIN') >=0 }">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  
			                  관리자 관리
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                  <li><a href="/smadmin/admin/admin_list">운영자 관리</a></li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
          </c:if>
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_') >=0 }">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  
			                 메인 관리
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_BANNER') >=0 }">
                  <li><a href="/smadmin/main/banner_list">배너관리</a></li>
                </c:if>
                <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_POPUP') >=0 }">
                  <li><a href="/smadmin/main/popup_list">팝업관리</a></li>
                </c:if>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_') >=0 }">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
			                  분양관리
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_PARCEL') >=0 }">
                  <li><a href="/smadmin/parcel/parcel_list">분양단지관리</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_PLAN') >=0 }">
                  <li><a href="/smadmin/parcel/parcel_plan_list">연간분양계획관리</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_CUSTOMER') >=0 }">
                  <li><a href="/smadmin/parcel/customer_list">관심고객단지관리</a></li>
                  </c:if>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
          </c:if>
 		  <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_') >=0 }">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  
			                  게시판 관리
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_NEWS') >=0 }">
                  <li><a href="/smadmin/board/news_list">아너스빌 소식</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_FAQ') >=0 }">
                  <li><a href="/smadmin/board/faq_list">자주묻는 질문</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_QNA') >=0 }">
                  <li><a href="/smadmin/board/qna_list">1:1문의관리</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_AS') >=0 }">
                  <li><a href="/smadmin/board/as_list">A/S문의관리</a></li>
                  </c:if>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_') >=0 }">
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  
			                 회원관리
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_MEMBER') >=0 }">
                  <li><a href="/smadmin/member/member_list">회원관리</a></li>
                  </c:if>
                  <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_RETIRE') >=0 }">
                  <li><a href="/smadmin/member/member_retire_list">탈퇴회원관리</a></li>
                  </c:if>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
          </c:if>
          <div class="col-md-4">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
			                  개인정보수정
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul>
                  <li><a href="/smadmin/mypage">개인정보수정</a></li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->        
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<%@ include file="/include/admin/footer.jsp" %>
<%@ include file="/include/admin/sub_footer.jsp" %>
</body>
</html>
