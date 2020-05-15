<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->

      <li class="nav-item ">
        <a class="nav-link"   href="/smadmin/mypage" style="color:#000">
			${sessionScope.adminName} 님  [개인정보 수정]
        </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link"   href="/smadmin/logout" style="color:#000">
			로그아웃
        </a>		      
	  </li> 
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/smadmin/main" class="brand-link" style="height:57px;text-align:center;background:#fff !important;">
      <img src="/resources/admin/images/logo.png"
           alt="Logo"
           class="brand-image " style="float:none;" id="logo1"
           >
      <img src="/resources/admin/images/slogo.png"
           alt="Logo"
           class="brand-image " style="float:none;display:none" id="logo2"
           >           
    </a>

    <!-- Sidebar -->
    <div class="sidebar" style="clear:both">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <c:if test="${fn:indexOf(sessionScope.adminType,'Master') >=0 }">
          <c:if test="${fn:indexOf(sessionScope.adminRole,'ADMIN_') >=0 }">
          <li class="nav-item has-treeview <c:if test="${fn:indexOf(path, 'admin_') >= 0}">menu-open</c:if>" >
            <a href="#" class="nav-link <c:if test="${fn:indexOf(path, 'admin_') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-users-cog"></i>
              <p>
		                관리자 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/smadmin/admin/admin_list" class="nav-link <c:if test="${fn:indexOf(path, 'admin_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>운영자 관리</p>
                </a>
              </li>
            </ul>
          </li>
          </c:if>
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_') >=0 }">     
          <li class="nav-item has-treeview  <c:if test="${fn:indexOf(path, 'main/') >= 0}">menu-open</c:if>">
            <a href="#" class="nav-link  <c:if test="${fn:indexOf(path, 'main/') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-cog"></i>
              <p>
		                메인 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_BANNER') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/main/banner_list" class="nav-link  <c:if test="${fn:indexOf(path, 'banner_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>배너 관리</p>
                </a>
              </li>
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'MAIN_POPUP') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/main/popup_list" class="nav-link  <c:if test="${fn:indexOf(path, 'popup_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>팝업 관리</p>
                </a>
              </li>              
              </c:if>
            </ul>
          </li>    
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_') >=0 }">       
          <li class="nav-item has-treeview  <c:if test="${fn:indexOf(path, 'parcel/') >= 0}">menu-open</c:if>">
            <a href="#" class="nav-link  <c:if test="${fn:indexOf(path, 'parcel/') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-calendar-check"></i>
              <p>
		                분양 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_PARCEL') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/parcel/parcel_list" class="nav-link  <c:if test="${fn:indexOf(path, 'parcel_') >= 0 and fn:indexOf(path, 'plan_') < 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>분양단지관리</p>
                </a>
              </li>
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_PLAN') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/parcel/parcel_plan_list" class="nav-link  <c:if test="${fn:indexOf(path, 'plan_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>연간분양계획관리</p>
                </a>
              </li>
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'PARCEL_CUSTOMER') >=0 }">              
              <li class="nav-item">
                <a href="/smadmin/parcel/customer_list" class="nav-link  <c:if test="${fn:indexOf(path, 'customer_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>관심고객단지관리</p>
                </a>
              </li>                          
              </c:if>
            </ul>
          </li> 
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_') >=0 }">  
          <li class="nav-item has-treeview  <c:if test="${fn:indexOf(path, 'board/') >= 0}">menu-open</c:if>">
            <a href="#" class="nav-link  <c:if test="${fn:indexOf(path, 'board/') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-list-ul"></i>
              <p>
		                게시판관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_NEWS') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/board/news_list" class="nav-link  <c:if test="${fn:indexOf(path, 'news_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>아너스빌 소식</p>
                </a>
              </li>
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_FAQ') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/board/faq_list" class="nav-link  <c:if test="${fn:indexOf(path, 'faq_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>자주묻는질문</p>
                </a>
              </li>              
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_QNA') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/board/qna_list" class="nav-link  <c:if test="${fn:indexOf(path, 'qna_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>1:1문의관리</p>
                </a>
              </li>                          
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'BOARD_AS') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/board/as_list" class="nav-link  <c:if test="${fn:indexOf(path, 'as_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>A/S문의관리</p>
                </a>
              </li>                        
              </c:if>
            </ul>
          </li>  
          </c:if>
          <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_') >=0 }">  
          <li class="nav-item has-treeview  <c:if test="${fn:indexOf(path, 'member/') >= 0}">menu-open</c:if>">
            <a href="#" class="nav-link  <c:if test="${fn:indexOf(path, 'member/') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-users"></i>
              <p>
		                회원관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_MEMBER') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/member/member_list" class="nav-link  <c:if test="${fn:indexOf(path, 'member_') >= 0 and fn:indexOf(path, 'retire_') < 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원 관리</p>
                </a>
              </li>
              </c:if>
              <c:if test="${fn:indexOf(sessionScope.adminRole,'MEMBER_RETIRE') >=0 }">
              <li class="nav-item">
                <a href="/smadmin/member/member_retire_list" class="nav-link  <c:if test="${fn:indexOf(path, 'retire_') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>탈퇴회원관리</p>
                </a>
              </li>              
              </c:if>
                        
            </ul>
          </li>   
          </c:if>
          <li class="nav-item has-treeview  <c:if test="${fn:indexOf(path, 'mypage') >= 0}">menu-open</c:if>">
            <a href="#" class="nav-link  <c:if test="${fn:indexOf(path, 'mypage') >= 0}">active</c:if>">
              <i class="nav-icon fas fa-user-cog"></i>
              <p>
		                개인정보수정
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/smadmin/mypage" class="nav-link  <c:if test="${fn:indexOf(path, 'mypage') >= 0}">active</c:if>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>개인정보수정</p>
                </a>
              </li>
            </ul>
          </li>                                                                 
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  
