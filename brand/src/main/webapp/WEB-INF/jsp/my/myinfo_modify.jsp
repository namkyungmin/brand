<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/include/header.jsp" %>
<title>개인정보 변경 | 마이 아너스빌 | 경남아너스빌</title>
</head>

<body>
    <div id="wrap" class="wrap sub my my_info">
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
                            <li class="on"><a href="/my/myinfo">개인정보 변경</a></li>
                            <li><a href="/my/myinfo/password">비밀번호 변경</a></li>
                            <li><a href="/my/myinfo/withdrawal">회원탈퇴</a></li>
                        </ul>
                    </div>
                    <!--// e: Step tab -->
                    <div class="form_wrap">
                        <span class="top_txt"><sup>*</sup> 필수 입력사항</span>
                        <table>
                            <colgroup>
                                <col width="144px">
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="ip_tit">아이디 <sup>*</sup></th>
                                    <td>
                                    ${data.userId }</td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${data.userName }</td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">휴대전화 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap tel">
	                                        <c:set var="cell" value="${fn:split(data.cellPhone,'-')}" />
                                            <select name="cell1" id="cell1">
                                                <option value="010" ${cell[0]=='010'?"selected":"" }>010</option>
                                                <option value="011" ${cell[0]=='011'?"selected":"" }>011</option>
                                                <option value="016" ${cell[0]=='016'?"selected":"" }>016</option>
                                                <option value="017" ${cell[0]=='017'?"selected":"" }>017</option>
                                                <option value="018" ${cell[0]=='018'?"selected":"" }>018</option>
                                                <option value="019" ${cell[0]=='019'?"selected":"" }>019</option>
                                            </select>
                                            <input type="tel" class="" id="cell2" name="cell2" value="${cell[1] }">
                                            <input type="tel" class="" id="cell3" name="cell3" value="${cell[2] }">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">전화</th>
                                    <td>
                                        <div class="input_wrap tel">
                                        	<c:set var="tel" value="${fn:split(data.tel,'-')}" />
                                            <select name="tel1" id="tel1">
                                                <option value="02"  ${tel[0]=='02'?"selected":"" }>02</option>
                                                <option value="031" ${tel[0]=='031'?"selected":"" }>031</option>
                                                <option value="032" ${tel[0]=='032'?"selected":"" }>032</option>
                                                <option value="033" ${tel[0]=='033'?"selected":"" }>033</option>
                                                <option value="041" ${tel[0]=='041'?"selected":"" }>041</option>
                                                <option value="042" ${tel[0]=='042'?"selected":"" }>042</option>
                                                <option value="043" ${tel[0]=='043'?"selected":"" }>043</option>
                                                <option value="044" ${tel[0]=='044'?"selected":"" }>044</option>
                                                <option value="051" ${tel[0]=='051'?"selected":"" }>051</option>
                                                <option value="052" ${tel[0]=='052'?"selected":"" }>052</option>
                                                <option value="053" ${tel[0]=='053'?"selected":"" }>053</option>
                                                <option value="054" ${tel[0]=='054'?"selected":"" }>054</option>
                                                <option value="055" ${tel[0]=='055'?"selected":"" }>055</option>
                                                <option value="061" ${tel[0]=='061'?"selected":"" }>061</option>
                                                <option value="062" ${tel[0]=='062'?"selected":"" }>062</option>
                                                <option value="063" ${tel[0]=='063'?"selected":"" }>063</option>
                                            </select>
                                            <input type="tel" class="" name="tel2" id="tel2"  value="${tel[1] }">
                                            <input type="tel" class="" name="tel3" id="tel3"  value="${tel[2] }">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">이메일 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap email">
                                        	<c:set var="email" value="${fn:split(data.email,'@')}" />
                                            <input type="text" name="email" id="email" class="" placeholder="이메일을 입력해 주세요"  value="${email[0] }">
                                            <span>@</span>
                                            <input type="text" name="emailDomain" id="emailField" class="" value="${email[1] }">
                                            <select name="" id="selectEmail">
                                                <option value="etc">직접입력</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="hotmail.com">hotmail.com</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ip_tit">주소 <sup>*</sup></th>
                                    <td>
                                        <div class="input_wrap address">
                                            <input type="text" name="zipcode" id="address1" class="" placeholder="우편번호" value="${data.zipcode }" readonly onclick="openzip()">
                                            <a href="javascript:openzip()" class="btn">주소검색</a>
                                        </div>
                                        <div class="input_wrap address2">
                                            <input type="text" name="address" id="address2" class="" placeholder="주소를 검색해 주세요"  value="${data.address}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>우편물 동의</th>
                                    <td>
                                        <div class="radio_wrap">
                                            <label for="agreeY2" ${data.mailYn=="Y"?"class='checked'":"" }>
                                                <input type="radio" id="agreeY2" name="mailYn" value="Y"  ${data.mailYn=="Y"?"checked":"" }>
                                                예
                                            </label>
                                            <label for="agreeN2" ${data.mailYn=="N"?"class='checked'":"" }>
                                                <input type="radio" id="agreeN2" name="mailYn" value="N"  ${data.mailYn=="N"?"checked":"" }>
                                                아니오
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일 수신동의</th>
                                    <td>
                                        <div class="radio_wrap">
                                            <label for="agreeY3"  ${data.emailYn=="Y"?"class='checked'":"" }>
                                                <input type="radio" id="agreeY3" name="emailYn" value="Y" ${data.emailYn=='Y'?"checked":"" }>
                                                예
                                            </label>
                                            <label for="agreeN3"  ${data.emailYn=="N"?"class='checked'":"" }>
                                                <input type="radio" id="agreeN3" name="emailYn" value="N" ${data.emailYn=='N'?"checked":"" }>
                                                아니오
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>SMS 수신동의</th>
                                    <td>
                                        <div class="radio_wrap">
                                            <label for="agreeY4"  ${data.smsYn=="Y"?"class='checked'":"" }>
                                                <input type="radio" id="agreeY4" name="smsYn" value="Y" ${data.smsYn=='Y'?"checked":"" }>
                                                예
                                            </label>
                                            <label for="agreeN4"  ${data.smsYn=="N"?"class='checked'":"" }>
                                                <input type="radio" id="agreeN4" name="smsYn" value="N" ${data.smsYn=='N'?"checked":"" }>
                                                아니오
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_wrap two">
                        <a href="javascript:;;" class="basic_btn sub type02" id="resetBtn"><span>취소</span></a>
                        <a href="javascript:;;" class="basic_btn sub" id="editBtn"><span>확인</span></a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/footer.jsp" %>
    </div>
    <%@ include file="/include/common.jsp" %>
    <!-- <script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/register.js"></script>
    <script>
        honorsvilleBrand.subHeader();
        honorsvilleBrand.stickyTab();
        honorsvilleBrand.subTab();

        //이메일 select 선택입력
        $("#selectEmail").change(function(){ 
            $("#selectEmail option:selected").each(function () { 
            	if($("#selectEmail option:selected").index() == 0) { 
                    $("#emailField").val(''); 
                    $("#emailField").attr("readyOnly",false);
                }else{ 
                    $("#emailField").val($(this).text());
                    $("#emailField").attr("readyOnly",true);
                }
            });
        });
        $(function() {
	        $('#editBtn').on("click",function() {
	    		
	    		if($.trim($('#cell2').val()) == "") {
	    			alert('휴대전화를 입력해주세요.');
	    			$('#cell2').focus();
	    			return;
	    		}        		
	    		
	    		if($.trim($('#cell3').val()) == "") {
	    			alert('휴대전화를 입력해주세요.');
	    			$('#cell3').focus();
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
	    		var tel = $('#tel2').val()!=""&&$('#tel2').val()!=""?$('#tel1 option:selected').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val():"";
	    		
	    		var data = {
	    				cellPhone:$('#cell1 option:selected').val()+"-"+$('#cell2').val()+"-"+$('#cell3').val(),
	    				tel:tel,
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
</body>
</html>