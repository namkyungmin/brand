<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/include/mobile/header.jsp" %>
<title>개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>
<body>
    <div id="wrap" class="wrap sub my myinfo_modify">
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
                        <li><a href="/my/as">A/S 문의</a></li>
                        <li><a href="/my/interest">관심단지 관리</a></li>
                        <li class="on"><a href="/my/myinfo">개인정보 변경</a></li>
                    </ul> 
                </div>
            </div>
            <!--// e: 2depth tab -->
            <div id="contents">
                <!-- s: tabNav -->
                <div class="tab_nav type02">
                    <ul>
                        <li class="btm on">
                            <a href="/my/myinfo">개인정보 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/password">비밀번호 변경</a>
                        </li>
                        <li class="btm">
                            <a href="/my/myinfo/withdrawal">회원탈퇴</a>
                        </li>
                    </ul>
                </div>
                <!--// e: tabNav -->
                <div class="section">
                    <div class="form_wrap">
                        <p class="top_txt"><sup>*</sup> 필수 입력사항</p>
                        <div class="form_type02">
                            <p class="tit">아이디<sup>*</sup></p>
                            <p>${data.userId }</p>
                        </div>
                        <div class="form_type02">
                            <p class="tit">이름<sup>*</sup></p>
                            <p>${data.userName }</p>
                        </div>
                        <p class="tit">휴대전화<sup>*</sup></p>
                        <div class="input_wrap">
                            <input type="text" class="" placeholder="휴대전화번호를 입력해 주세요" name="cellPhone" id="cellPhone" value="${data.cellPhone }">
                        </div>
                        <p class="tit">전화</p>
                        <div class="input_wrap">
                            <input type=""text"" class="" placeholder="전화번호를 입력해 주세요" name="tel" id="tel" value="${data.tel }">
                        </div>
                        <p class="tit">이메일<sup>*</sup></p>
                        <div class="input_wrap email">
                        <c:set var="email" value="${fn:split(data.email,'@')}" />
                            <input type="text" name="email" id="email" placeholder="이메일을 입력해 주세요" value="${email[0] }">
                            <span>@</span>
                        </div>
                        <div class="input_wrap">
                            <input type="text" placeholder="" name="emailDomain" id="emailField" value="${email[1] }">
                        </div>
                        <div class="input_wrap">
                            <select name="" id="selectEmail">
                                <option value="etc">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="daum.net">daum.net</option>
                                <option value="hotmail.com">hotmail.com</option>
                            </select>
                        </div>
                        <p class="tit">주소<sup>*</sup></p>
                        <div class="input_wrap address">
                            <input type="text" class="" placeholder="우편번호" name="zipcode" id="address1" value="${data.zipcode }" readonly onclick="openzip()">
                            <a  href="javascript:openzip()" class="btn">주소검색</a>
                        </div>
                        <div class="input_wrap">
                            <input type="text" placeholder="주소를 검색해 주세요" name="address" id="address2"  value="${data.address}">
                        </div>
                        <div class="form_type02 agree">
                            <p class="tit">우편물 동의</p>
                            <div class="radio_wrap">
                               <label for="agreeY1" ${data.mailYn=="Y"?"class='checked'":"" }>
                                   <input type="radio" id="agreeY1" name="mailYn" value="Y"  ${data.mailYn=="Y"?"checked":"" }>
                                   예
                               </label>
                               <label for="agreeN1" ${data.mailYn=="N"?"class='checked'":"" }>
                                   <input type="radio" id="agreeN1" name="mailYn" value="N"  ${data.mailYn=="N"?"checked":"" }>
                                   아니오
                               </label>
                            </div>
                        </div>
                        <div class="form_type02 agree">
                            <p class="tit">이메일 수신동의</p>
                            <div class="radio_wrap">

                                 <label for="agreeY2"  ${data.emailYn=="Y"?"class='checked'":"" }>
                                     <input type="radio" id="agreeY2" name="emailYn" value="Y" ${data.emailYn=='Y'?"checked":"" }>
                                     예
                                 </label>
                                 <label for="agreeN2"  ${data.emailYn=="N"?"class='checked'":"" }>
                                     <input type="radio" id="agreeN2" name="emailYn" value="N" ${data.emailYn=='N'?"checked":"" }>
                                     아니오
                                 </label>                                
                            </div>
                        </div>
                        <div class="form_type02 agree">
                            <p class="tit">SMS 수신동의</p>
                            <div class="radio_wrap">
                                <label for="agreeY3"  ${data.smsYn=="Y"?"class='checked'":"" }>
                                     <input type="radio" id="agreeY3" name="smsYn" value="Y" ${data.smsYn=='Y'?"checked":"" }>
                                    예
                                </label>
                                <label for="agreeN3"  ${data.smsYn=="N"?"class='checked'":"" }>
                                    <input type="radio" id="agreeN3" name="smsYn" value="N" ${data.smsYn=='N'?"checked":"" }>
                                    아니오
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="btn_wrap type02">
                        <a href="javascript:;;" class="basic_btn type02"  id="resetBtn">
                            <span>취소</span>
                        </a>
                        <a href="javascript:;;" class="basic_btn"  id="editBtn">
                            <span>확인</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/mobile/footer.jsp" %>
    </div>
    <%@ include file="/include/mobile/common.jsp" %>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/register.js"></script>
</body>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.subTab();
        honorsvilleBrand.stickyTab();

        //이메일 select 선택입력
        $("#selectEmail").change(function(){ 
            $("#selectEmail option:selected").each(function () { 
                if($(this).val()== 'etc'){ 
                    $("#emailField").val(''); 
                    $("#emailField").attr("disabled",false);
                }else{ 
                    $("#emailField").val($(this).text());
                    $("#emailField").attr("disabled",true);
                }
            });
        });
        $(function() {
	        $('#editBtn').on("click",function() {
	    		
	    		if($.trim($('#cellPhone').val()) == "") {
	    			alert('휴대전화를 입력해주세요.');
	    			$('#cellPhone').focus();
	    			return;
	    		}        		
	    		 
	    		
	    		if($.trim($('#email').val()) == "") {
	    			alert('이메일을 입력해주세요.');
	    			$('#email').focus();
	    			return;
	    		}        		
	    		
	    		if($.trim($('#emailField').val()) == "") {
	    			alert('이메일을 입력해주세요.');
	    			$('#emailField').focus();
	    			return;
	    		}
	    		
	    		if($.trim($('#address1').val()) == "") {
	    			alert('우편번호를 입력해주세요.');
	    			$('#address1').focus();
	    			return;
	    		}           		
	    		
	    		if($.trim($('#address2').val()) == "") {
	    			alert('주소를 입력해주세요.');
	    			$('#address2').focus();
	    			return;
	    		}        	
	    		
	    		var url = "edit_user"
	    		
	    		var data = {
	    				cellPhone:$('#cellPhone').val(),
	    				tel:$('#tel').val(),
	    				email:$('#email').val()+"@"+$('#emailField').val(),
	    				zipcode:$('#address1').val(),
	    				address:$('#address2').val(),
	    				mailYn:$('#agreeY2').is(":checked")==true?"Y":"N",
	    				emailYn:$('#agreeY3').is(":checked")==true?"Y":"N",
	    				smsYn:$('#agreeY4').is(":checked")==true?"Y":"N",
	    								
	    			};      
	      		  $.ajax({
	      		    url: url,
	      		    type: "POST",
	      		    cache: false,
	      		    dataType: "json",
	      		    data: data,
	      		    success: function(data){
	      		    	console.log(data);
	      		    	if(data.result == 0) {
	      		    		alert('수정되었습니다.');
	      		    	} else {
	      		    		alert('정보를 확인해주세요.');
	      		    	}
	      		    },
	      		    error: function (request, status, error){        
	      		        var msg = "ERROR : " + request.status + "<br>"
	      		      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	      		      console.log(msg);              
	      		    }
	      		  });  	        	
	        });
        });        
    </script>
</html>