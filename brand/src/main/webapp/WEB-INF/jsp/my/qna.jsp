<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>1:1문의 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my question">
        <%@ include file="/include/gnb.jsp" %>
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
                        <li><a href="/my/qna" class="on">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li class="on">
                                <a href="/my/qna">1:1 문의</a>
                            </li>
                            <li>
                                <a href="/my/qna/list">문의내역 관리</a>
                            </li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="form_wrap">
                        <p class="form_title">
                            고객님께서 문의하신 내용의 답변은 <span>문의내역 관리</span>에서 확인하실 수 있습니다.
                        </p>
                <form id="main_form" name="main_form" method="post">
                <input type="hidden" name="qnaId" id="qnaId" value="${data.qnaId}" />
                <c:forEach var="i" begin="0" end="4" step="1">
                	<input type="hidden" name="fileSeq" id="file_${i}_fileSeq" value="${file[i].fileSeq }">
                	<input type="hidden" name="fileName" id="file_${i}_fileName" value="${file[i].fileName}">
                	<input type="hidden" name="filePath" id="file_${i}_filePath" value="${file[i].filePath}">
                	<input type="hidden" name="fileExt" id="file_${i}_fileExt" value="${file[i].fileExt}">
                	<input type="hidden" name="fileSize" id="file_${i}_fileSize" value="${file[i].fileSize}">
                </c:forEach>                        
                        <table>
                            <colgroup>
                                <col width="105px">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="ip_tit">카테고리<sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap category">
                                            <select name="category" id="category">
                                                <option value="분양문의">분양문의</option>
                                                <option value="입주문의">입주문의</option>
                                                <option value="기타">기타</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">제목<sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap title">
                                            <input type="text" class="" placeholder="제목을 입력해 주세요" name="title" id="title">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">내용<sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap contents">
                                            <textarea name="contents" id="board_contents" placeholder="내용을 입력해 주세요"></textarea>
                                        </div>
                                        <div class="file_wrap">
                                            <div class="tit">파일첨부</div>
                                            <div class="file_inner">                                            
                                                <div class="input_wrap file_upload">
                                                    <input type="file" class="myfile" name="file" id="myFile1" value="">
                                                    <input type="text" class="file_path file1" placeholder="" value="">
                                                    <a href="javascript:void(0);" class="btn">파일찾기</a>
                                                    <a href="#" class="file_btn plus"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="notice file important">※ 파일 첨부는 5개까지 가능합니다.</p>
                                        <p class="notice file">※ jpg,jpeg,gif,png,bmp,doc,docx,hwp,xls,xlsx,zip,pdf,ppt,pptx  형식만 지원합니다.</p>
                                        <p class="notice file">※ 파일 사이즈 5MB까지 업로드 가능합니다.</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                    </div>
                    <div class="btn_wrap two">
                        <a href="javascript:;" class="basic_btn sub type02" id="resetBtn">
                            <span>취소</span>
                        </a>
                        <a href="javascript:;" class="basic_btn sub" id="saveBtn">
                            <span>접수</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
	<div class="modal" style="display:none">    
	    <div class="center">
	        <img alt="" src="/resources/images/common/loading.gif" />    
	    </div>
	</div>
    
    <%@ include file="/include/common.jsp" %>
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>
    <script src="/resources/js/base.js"></script>
	<style>
	.modal {        position: fixed;        
	                z-index: 999;        
	                height: 100%;        
	                width: 100%;        
	                top: 0;        
	                left: 0;        
	                background-color: Black;        
	                filter: alpha(opacity=60);        
	                opacity: 0.6;        
	                -moz-opacity: 0.8;    }    
	
	.center {       z-index: 1000;        
	                margin: 300px auto;        
	                padding: 10px;        
	                width: 130px;     
	                background-color: none ;        
	                border-radius: 10px;        
	                filter: alpha(opacity=100);        
	                opacity: 1;        
	                -moz-opacity: 1;    }    
	
	.center img {   height: 32px;        
	                width: 32px;    }
    </style>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
        honorsvilleBrand.btnFavor();
        honorsvilleBrand.accodian();
        honorsvilleBrand.fileUpload();
        var chk = false;
    $(function(){
        $.ajaxSetup({
            beforeSend: function () { $(".modal").show(); }
           ,complete:  function () { $(".modal").hide(); }
        });
    
    
    
        $('#saveBtn').on("click", function() {
    
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
            var url = "qna_save";
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
                        alert("1:1문의가 등록되었습니다.");
                        location='qna/list';
                    } else {
                        alert("정보를 확인해주세요.");
                    }
                    chk = false;
    //		    	console.log(data);
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
</body>
</html>