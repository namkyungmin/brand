<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
<link href="/resources/plugin/editor/css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/resources/plugin/editor/js/lib/jindo2.all.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/lib/jindo_component.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/service/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
<script type="text/javascript" src="/resources/plugin/editor/js/service/SE2BasicCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/smarteditor2.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>	
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

		<div class="box" style="background:#fff;">
                <div class="box-body">
                <form id="main_form" name="main_form" method="post">
                <input type="hidden" name="faqId" id="faqId" value="${data.faqId}" />                
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th>카테고리</th>
                        <td>
					        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="category" value="parcel" checked>
	                            <label class="form-check-label" style="margin-right:50px;">분양관련</label>
	                            <input class="form-check-input" type="radio" name="category"  value="move">
	                            <label class="form-check-label" style="margin-right:50px;">입주관련</label>
	                            <input class="form-check-input" type="radio" name="category" value="etc">
	                            <label class="form-check-label" style="margin-right:50px;">기타</label>	                            
	                        </div>   
                        </td>
                      </tr>                          
                      <tr>
                        <th><span class="text-required">*</span> 제목</th>
                        <td><input type="text" style="width:400px;" name="title" id="title" value="${data.title }"></td>
                      </tr>
                      
                      <tr>
                        <th><span class="text-required">*</span> 내용</th>
                        <td>
                        <textarea name="contents" id="contents" rows="10" cols="100" style="width:766px; height:412px; display:none;">${data.contents }</textarea>
                        </td>
                      </tr>
                      <tr>
                        <th><span class="text-required">*</span> 노출여부</th>
                        <td>
					        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="displayYn" id="displayY" value="Y"  ${data.displayYn=='Y'?"checked":"" }>
	                            <label class="form-check-label" style="margin-right:50px;">Y</label>
	                            <input class="form-check-input" type="radio" name="displayYn" id="displayN" value="N"  ${data.displayYn=='N'?"checked":"" }>
	                            <label class="form-check-label">N</label>
	                        </div>   
                        </td>
                      </tr>                                                                 
                    </tbody>
                  </table>
                  </form>
                </div><!-- /.box-body -->
				<div class="box-footer" style="text-align:right">
					<c:if test="${param.faq_id!=null}">
					<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.faq_id==null?"등록":"수정"}</button>				
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
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 삭제하시겠습니까?')) {
			var url = "delete_faq";
			var data = {faqId:"${param.faq_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='faq_list';
				    	} else {
				    		alert('삭제에 실패하였습니다.');
				    	}
				    },
				    error: function (request, status, error){        
				        var msg = "ERROR : " + request.status + "<br>"
				      msg +=  + "내용 : " + request.responseText + "<br>" + error;
				      console.log(msg);              
				    }
			   });	
		}
	});
	 
	
	$('#saveBtn').on("click", function() {

		if($.trim($('#title').val()) == "") {
			alert('타이틀을 입력 해 주세요.')
			$('#title').focus();
			return;
		}
		
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// Insert
		var url = "faq_save";
		var data = $('#main_form').serialize();
 
		  $.ajax({
		    url: url,
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data){
		    	if(data.result == 0) {
		    		alert('등록되었습니다.');
		    		location='faq_list';
		    	} else {
		    		alert('등록에 실패하였습니다.');
		    	}
//		    	console.log(data);
		    },
		    error: function (request, status, error){        
		        var msg = "ERROR : " + request.status + "<br>"
		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
		      console.log(msg);              
		    }
		  });		
	});

	$.datepicker.regional['ko'] = {
	 closeText: '닫기',
	 prevText: '이전달',
	 nextText: '다음달',
	 currentText: 'X',
	 monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	 '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	 monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	 '7월','8월','9월','10월','11월','12월'],
	 dayNames: ['일','월','화','수','목','금','토'],
	 dayNamesShort: ['일','월','화','수','목','금','토'],
	 dayNamesMin: ['일','월','화','수','목','금','토'],
	 weekHeader: 'Wk',
	 dateFormat: 'yy-mm-dd',
	 firstDay: 0,
	 isRTL: false,
	 showMonthAfterYear: true,
	 yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	$('#displayDate').datepicker({
	   showOn: 'button',
		buttonImage: '/resources/admin/images/calendar.svg',
		buttonImageOnly: true,
	   buttonText: "달력",
	   changeMonth: true,
	   changeYear: true,
	   showButtonPanel: true,
	   yearRange: 'c-99:c+99',
	   minDate: '',
	   maxDate: ''
	});
});

function list_btn(){ 
	location = "faq_list";
}

var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "/resources/plugin/editor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["contents"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["contents"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["contents"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</body>
</html>
