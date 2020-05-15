<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/admin/header.jsp" %>
<style>
.card-body { height:150px;}
.none {display:none}
</style>
<link href="/resources/plugin/editor/css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/resources/plugin/editor/js/lib/jindo2.all.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/lib/jindo_component.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/service/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
<script type="text/javascript" src="/resources/plugin/editor/js/service/SE2BasicCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/smarteditor2.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/plugin/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
            <h1>아너스빌 소식</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item">게시판관리</li>
              <li class="breadcrumb-item active">아너스빌 소식</li>
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
                <input type="hidden" name="newsId" id="newsId" value="${data.newsId}" />
                <c:forEach var="i" begin="0" end="4" step="1">
                	<input type="hidden" name="fileSeq" id="file_${i}_fileSeq" value="${file[i].fileSeq }">
                	<input type="hidden" name="fileName" id="file_${i}_fileName" value="${file[i].fileName}">
                	<input type="hidden" name="filePath" id="file_${i}_filePath" value="${file[i].filePath}">
                	<input type="hidden" name="fileExt" id="file_${i}_fileExt" value="${file[i].fileExt}">
                	<input type="hidden" name="fileSize" id="file_${i}_fileSize" value="${file[i].fileSize}">
                </c:forEach>

                
                  <table id="detail1" class="table table-bordered table-bordered-border">
                     <colgroup>
                      <col width="15%">
                      <col width="*">
                     </colgroup>
                    <tbody>
                      <tr>
                        <th>페이지뷰 타입</th>
                        <td>
					        <div class="form-check">
	                            <input class="form-check-input" type="radio" name="newsType" id="newsTypeAticle" value="news" ${data.newsType=='news'||data.newsType==null?"checked":"" }>
	                            <label class="form-check-label" style="margin-right:50px;" for="newsTypeAticle">일반</label>
	                            <input class="form-check-input" type="radio" name="newsType" id="newsTypeLink"  value="link"  ${data.newsType=='link'?"checked":"" }>
	                            <label class="form-check-label" for="newsTypeLink">링크</label>
	                        </div>   
                        </td>
                      </tr>                    
                      <tr>
                        <th><span class="text-required">*</span> 제목</th>
                        <td><input type="text" style="width:400px;" name="title" id="title" value="${data.title }"></td>
                      </tr>
                      <tr  class="link none">
                        <th><span class="text-required">*</span> 링크URL</th>
                        <td><input type="text" style="width:400px;" name="url" id="url" value="${data.url }"></td>
                      </tr>                      
                      <tr class="aticle">
                        <th><span class="text-required">*</span> 내용</th>
                        <td>
                            <textarea name="contents" id="contents" rows="10" cols="100" style="width:766px; height:412px; display:none;">${data.contents }</textarea>
                        </td>
                      </tr>
                      <tr>
                        <th>첨부파일</th>
                        <td>
                        	<input type="file" style="width:400px;" name="file" value="" data-target="file_0" data-seq="0"> <i class="fas fa-plus-square plusFile"></i> ${file[0].fileName}
                        	<div class="fileArea">
                        		<c:forEach var="sfile" items="${file}" varStatus="row">
                        			<c:if test="${row.count > 1 }">
                        				<div><input type="file" style="width:400px;" name="file" value="" data-target="file_${row.count-1 }"  data-seq="${row.count-1 }"> <i class="fas fa-minus-circle remove_file"  data-target="file_${row.count-1 }"></i> ${sfile.fileName}</div>
                        			</c:if>
                        		</c:forEach>
                        	</div>
                        </td>
                      </tr>      
                      <tr>
                        <th>게시일</th>
                        <td>
                            <input type="text" style="width:150px;" name="displayDate" id="displayDate" value="${data.displayDate }">
                            
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
                	<button class="btn btn-honor" style="margin-right: 5px;"  id="saveBtn" type="button">${param.news_id==null?"등록":"수정"}</button>
					<c:if test="${param.news_id!=null}">
					<button class="btn btn-honor" style="margin-right: 5px;"  id="deleteBtn" type="button">삭제</button>
					</c:if>                	
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
	if($('#newsTypeLink').is(":checked") == true) {
		$('.aticle').hide();
		$('.link').show();
	}
	
	
	$('.plusFile').on("click",function(){
		var cnt = $('.fileArea div').length;
		if($('.fileArea div').length >= 4) {
			alert('파일은 5개까지 추가가 가능합니다.');
		} else 
			$('.fileArea').append('<div><input type="file" style="width:400px;" name="file" value="" data-target="file_'+(cnt+1)+'"  data-seq="'+(cnt+1)+'"><i class="fas fa-minus-circle remove_file"  data-target="file_'+(cnt+1)+'"></i></div>');
		
		$(".remove_file").off("click").on("click", function() {
			$(this).closest("div").remove();
			$('#'+$(this).data("target")+"_fileSeq").val('');
			$('#'+$(this).data("target")+"_fileName").val('');
			$('#'+$(this).data("target")+"_filePath").val('');
			$('#'+$(this).data("target")+"_fileExt").val('');
			$('#'+$(this).data("target")+"_fileSize").val('');
		});	
		
		$('input[type=file]').off('change').on('change', function() {
			var target = $(this).data('target');
			var seq = $(this).data('seq');
			$("<form action='/smadmin/uploadFile' enctype='multipart/form-data' method='post'/>")
				.ajaxForm({
					dataType: 'json',
					beforeSend: function() {
					},
					success: function(data){
						if(data.result==0){
							console.log(data);
							console.log(target);
							//console.log($('#file[0][fileSeq]').val());
							//$('input[name="file[0][fileSeq]").val(seq);
							/*
							$('input[name="'+target+'[fileSeq]"]').val(seq);
							$('input[name="'+target+'[filePath]"]').val(data.url);
							$('input[name="'+target+'[fileName]"]').val(data.originFilename);
							$('input[name="'+target+'[fileExt]"]').val(data.extensionName);
							$('input[name="'+target+'[fileSize]"]').val(data.size);
							*/
							
							$('input[id="'+target+'_fileSeq"]').val(seq);
							$('input[id="'+target+'_filePath"]').val(data.url);
							$('input[id="'+target+'_fileName"]').val(data.originFilename);
							$('input[id="'+target+'_fileExt"]').val(data.extensionName);
							$('input[id="'+target+'_fileSize"]').val(data.size);							
						} else {
						}
					},
					complete: function(data) {
						//console.log(data);
					}
				})
				.append( $(this).clone() )
				.submit();
		}); 		
	});
	$('#newsTypeAticle').on("change",function() {
		if($(this).is(":checked") == true) {
			$('.aticle').show();
			$('.link').hide();
		}
	});
	
	$('#newsTypeLink').on("change",function() {
		if($(this).is(":checked") == true) {
			$('.aticle').hide();
			$('.link').show();
		}
	});	
	
	$(".remove_file").off("click").on("click", function() {
		$(this).closest("div").remove();
		$('#'+$(this).data("target")+"_fileSeq").val('');
		$('#'+$(this).data("target")+"_fileName").val('');
		$('#'+$(this).data("target")+"_filePath").val('');
		$('#'+$(this).data("target")+"_fileExt").val('');
		$('#'+$(this).data("target")+"_fileSize").val('');
	});	
	
	
	$('#deleteBtn').on("click", function() {
		if(confirm('정말로 삭제하시겠습니까?')) {
			var url = "delete_news";
			var data = {newsId:"${param.news_id}"};
			  $.ajax({
				    url: url,
				    type: "POST",
				    cache: false,
				    dataType: "json",
				    data: data,
				    success: function(data){
				    	if(data.result == 0) {
				    		alert('삭제되었습니다.');
				    		location='news_list';
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
		if($.trim($('#displayDate').val()) == "") {
			alert('게시기간 시작일을 입력 해 주세요.')
			$('#displayDate').focus();
			return;
		}		
		if($('#newsTypeLink').is(":checked") == true) {
			if($.trim($('#url').val()) == "") {
				alert('링크주소를 입력 해 주세요.')
				$('#url').focus();
				return;				
			}
		}
		 	
		if($('input[name=displayYn]').is(":checked") == false) {
			alert('노출 여부를 선택 해 주세요.')
			return;			
		}
		if($('#newsTypeAticle').is(":checked") == true)
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		 
		// Insert
		var url = "news_save";
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
		    		location='news_list';
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
	
	$('input[type=file]').on('change', function() {
		var target = $(this).data('target');
		var seq = $(this).data('seq');
		if(chk_file($(this).val()) == false){
			$(this).val('');
			return;
		}
		$("<form action='/smadmin/uploadFile' enctype='multipart/form-data' method='post'/>")
			.ajaxForm({
				dataType: 'json',
				beforeSend: function() {
				},
				success: function(data){
					if(data.result==0){
						//console.log($('#file[0][fileSeq]').val());
						//$('input[name="file[0][fileSeq]").val(seq);
						$('input[id="'+target+'_fileSeq"]').val(seq);
						$('input[id="'+target+'_filePath"]').val(data.url);
						$('input[id="'+target+'_fileName"]').val(data.originFilename);
						$('input[id="'+target+'_fileExt"]').val(data.extensionName);
						$('input[id="'+target+'_fileSize"]').val(data.size);
					} else {
					}
				},
				complete: function(data) {
					//console.log(data);
				}
			})
			.append( $(this).clone() )
			.submit();
	}); 	
});

function list_btn(){ 
	location = "news_list";
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
