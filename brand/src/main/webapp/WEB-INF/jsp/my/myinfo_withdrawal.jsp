<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>회원탈퇴 | 개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my my_drw">
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
                        <li><a href="/my/qna">1:1 문의</a></li>
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li><a href="/my/myinfo" class="on">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <div class="section sec1">
                    <!-- s: Step tab -->
                    <div class="tab_nav">
                        <ul>
                            <li><a href="/my/myinfo">개인정보 변경</a></li>
                            <li><a href="/my/myinfo/password">비밀번호 변경</a></li>
                            <li class="on"><a href="/my/myinfo/withdrawal">회원탈퇴</a></li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="info_area">
                        <div class="inner">
                            <div class="text_wrap">
                                <p class="txt1">회원 탈퇴를 하시겠습니까?</p>
                                <p class="txt2">탈퇴 후에는 제공되었던 회원 서비스와 최신 업데이트 자료를<br>받으실 수 없습니다.</p>
                            </div>
                            <div class="drw_wrap">
                                <div class="form_wrap">
                                    <table>
                                        <colgroup>
                                            <col width="87px">
                                            <col width="*">
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th class="ip_tit">탈퇴사유</th>
                                                <td>
                                                    <div class="radio_wrap">
                                                        <label for="" class="type1 checked">
                                                            <input type="radio" id="" name="retireReason" value="ID변경을 위해" checked="checked">ID변경을 위해
                                                        </label>
                                                        <label for="" class="type2">
                                                            <input type="radio" id="" name="retireReason" value="사이트 이용 불편">사이트 이용 불편
                                                        </label>
                                                        <label for="" class="type1">
                                                            <input type="radio" id="" name="retireReason" value="전반적인 서비스 불만족">전반적인 서비스 불만족
                                                        </label>
                                                        <label for="" class="type2">
                                                            <input type="radio" id="" name="retireReason" value="시스템 불안정">시스템 불안정
                                                        </label>
                                                        <label for="" class="type1">
                                                            <input type="radio" id="" name="retireReason" value="유용한 컨텐츠 부족">유용한 컨텐츠 부족
                                                        </label>
                                                        <label for="" class="type2">
                                                            <input type="radio" id="" name="retireReason" value="기타">기타
                                                        </label>
                                                        <label for="" class="last type1">
                                                            <input type="radio" id="" name="retireReason" value="특별한 사유 없음">특별한 사유 없음
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="txt_input">
                                                <th class="ip_tit">비밀번호</th>
                                                <td>
                                                    <div class="input_wrap">
                                                        <input type="password" class="enter" placeholder="비밀번호를 입력해 주세요" id="password" name="password" >
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="btn_area">
                                    <a href="javascript:;;" class="basic_btn type02" id="resetBtn"><span>취소</span></a>
                                    <a href="javascript:;;" class="basic_btn sub" id="withdrawBtn"><span>확인</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();
        
        $(function(){
        	$('#resetBtn').on("click",function(){
        		location = "/";
        	});
        	$('#withdrawBtn').on("click",function(){
        		check_form();
        	});
        	
    		     		
      		          	
        })
        
        function check_form() {
        	if($.trim($('#password').val()) == "") {
    			alert('비밀번호를 입력해주세요.');
    			return;
    		}
        	
        	if($('.radio_wrap label.checked').find("input").val() == "") {
    			alert('탈퇴사유를 확인 해 주세요.');
    			return;        		
        	}

    		var data = {password:$('#password').val(),userRetire:$('.radio_wrap label.checked').find("input").val()};
    		  $.ajax({
    		    url: "withdraw_user",
    		    type: "POST",
    		    cache: false,
    		    dataType: "json",
    		    data: data,
    		    success: function(data){
    		    	if(data.result == 0) {
    		    		//alert('회원 탈퇴가 완료되었습니다.');
    		    		location='/my/myinfo/withdrawal-end';
    		    	} else {
    		    		alert('정보를 확인 해 주세요.');
    		    	}
//    		    	console.log(data);
    		    },
    		    error: function (request, status, error){        
    		        var msg = "ERROR : " + request.status + "<br>"
    		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
    		      console.log(msg);              
    		    }
    		  });            		        	
        }
    </script>
</body>
</html>