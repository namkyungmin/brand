		// 업로드 타입 체크
		function chk_file(str) {
			if (/(\.gif|\.jpg|\.jpeg|\.png|\.bmp|\.doc|\.docx|\.hwp|\.xls|\.xlsx|\.zip|\.pdf|\.ppt|\.pptx)$/i.test(str) == false) {
				alert("허용된 형식의 파일을 선택하십시오");
				return false;
			}
			return true
		}
		
		// 전화번호 포맷 변경
		function phoneFomatter(num,type){
		    var formatNum = '';

		    

		    if(num.length==11){

		        if(type==0){

		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');

		        }else{

		            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

		        }

		    }else if(num.length==8){

		        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');

		    }else{

		        if(num.indexOf('02')==0){

		            if(type==0){

		                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');

		            }else{

		                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');

		            }

		        }else{

		            if(type==0){

		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');

		            }else{

		                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');

		            }

		        }

		    }
		    return formatNum;
		}		
		
        $(document).ready(function() {
            $(".enter").keydown(function(key) {
                if (key.keyCode == 13) {
                	check_form();
                }
            });
        });
 				