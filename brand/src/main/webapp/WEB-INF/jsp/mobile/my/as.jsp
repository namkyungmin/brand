<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>A/S문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my question as">
        <%@ include file="/include/mobile/gnb.jsp" %>
        <div id="container"> 
            <!-- s: title -->
            <div class="page_tit">
                <h2>마이 아너스빌</h2>
            </div>
            <!--// e: title -->
            <!-- s: 2depth tab -->
            <div class="tab">
                <div class="tab_wrap">
                    <ul>
                        <li><a href="/my/faq">자주 묻는 질문</a></li>
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li class="on"><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <!-- s: tabNav -->
                <div class="tab_nav type01">
                    <ul>
                        <li class="on btm">
                            <a href="/my/as">A/S 문의</a>
                        </li>
                        <li class="btm">
                            <a href="/my/as/list">문의내역 관리</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <form id="main_form" name="main_form" method="post">
                <input type="hidden" name="asId" id="asId" value="${data.qnaId}" />
                <c:forEach var="i" begin="0" end="4" step="1">
                	<input type="hidden" name="fileSeq" id="file_${i}_fileSeq" value="${file[i].fileSeq }">
                	<input type="hidden" name="fileName" id="file_${i}_fileName" value="${file[i].fileName}">
                	<input type="hidden" name="filePath" id="file_${i}_filePath" value="${file[i].filePath}">
                	<input type="hidden" name="fileExt" id="file_${i}_fileExt" value="${file[i].fileExt}">
                	<input type="hidden" name="fileSize" id="file_${i}_fileSize" value="${file[i].fileSize}">
                </c:forEach>                  
                <div class="section">
                    <div class="form_wrap">
                        <p class="top_txt"><sup>*</sup> 필수 입력사항</p>
                        <p class="tit">단지명<sup>*</sup></p>
                        <div class="input_wrap">
                            <input type="text" class="" placeholder="단지명을 입력해 주세요" name="parcelName" id="parcelName">
                        </div>
                        <p class="tit">동호수<sup>*</sup></p>
                        <div class="input_wrap dong_ho">
                            <input type="text" class="" placeholder="" name="dong" id="dong">
                            <span>동</span>
                            <input type="text" class="" placeholder="" name="ho" id="ho">
                            <span>호</span>
                        </div>
                        <p class="tit">제목<sup>*</sup></p>
                        <div class="input_wrap">
                            <input type="text" class="" placeholder="제목을 입력해 주세요"  name="title" id="title">
                        </div>
                        <p class="tit">내용<sup>*</sup></p>
                        <div class="input_wrap contents">
                            <textarea name="contents" id="board_contents"  placeholder="내용을 입력해 주세요"></textarea>
                        </div>
                        <p class="tit">파일첨부</p>
                        <div class="file_wrap">
                            <div class="input_wrap file_upload">
                                <div class="file_inner">
                                    <input type="file" class="myfile" name="file" id="myFile1" value="">
                                    <input type="text" class="file_path file1" placeholder="파일선택" value="">
                                    <a href="javascript:void(0);" class="btn">파일찾기</a>
                                </div>
                                <a href="#" class="file_btn plus"></a>
                            </div>
                        </div>
                        <div class="notice_wrap">
                            <p class="important">파일 첨부는 5개까지 가능합니다.</p>
                            <p>jpg,jpeg,gif,png,bmp,doc,docx,hwp,xls,xlsx,zip,pdf,ppt,pptx  형식만 지원합니다.</p>
                            <p>파일 사이즈 5MB까지 업로드 가능합니다.</p>
                        </div>
                    </div>
                    <div class="btn_wrap type02">
                        <a href="javascript:;"  class="basic_btn type02"  id="resetBtn">
                            <span>취소</span>
                        </a>
                        <a href="javascript:;"  class="basic_btn"  id="saveBtn">
                            <span>확인</span>
                        </a>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
    <script src="/resources/js/base.js"></script>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.fileUpload();
        var chk = false;
        $(function(){
        	$('#saveBtn').on("click", function() {
        		if($.trim($('#parcelName').val()) == "") {
        			alert('단지명을 입력 해 주세요.')
        			$('#parcelName').focus();
        			return;
        		}
        		
        		if($.trim($('#dong').val()) == "" || $.trim($('#ho').val()) == "") {
        			alert('단지명을 입력 해 주세요.')
        			$('#dong').focus();
        			return;
        		}    		
        		
        		if($.trim($('#title').val()) == "") {
        			alert('제목을 입력 해 주세요.')
        			$('#title').focus();
        			return;
        		}
        		
        		if($.trim($('#board_contents').val()) == "") {
        			alert('내용을 입력하세요.')
        			$('#board_contents').focus();
        			return;
        		}		
        		 	
        		 
        		// Insert
        		var url = "as_save";
        		var data = $('#main_form').serialize();
        		if(chk == true) {
        			alert('문의를 등록중입니다.');
        			return;
        		}
         		chk = true;         
        		  $.ajax({
        		    url: url,
        		    type: "POST",
        		    cache: false,
        		    dataType: "json",
        		    data: data,
        		    success: function(data){
        		    	if(data.result == 0) {
        		    		alert("A/S 문의가 등록되었습니다.");
        		    		location='as/list';
        		    	} else {
        		    		alert("정보를 확인해주세요.");
        		    	}
        		    	chk = false;
//        		    	console.log(data);
        		    },
        		    error: function (request, status, error){        
        		        var msg = "ERROR : " + request.status + "<br>"
        		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
        		      console.log(msg);              
        		    }
        		  });		
        	});
        	
        	$('#resetBtn').on("click",function(){
        		location='/';
        	});    	
        });            
    </script>
</html>