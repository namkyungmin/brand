		
		function chk_file(str) {
			if (/(\.gif|\.jpg|\.jpeg|\.png|\.bmp|\.doc|\.docx|\.hwp|\.xls|\.xlsx|\.zip|\.pdf|\.ppt|\.pptx)$/i.test(str) == false) {
				alert("허용된 형식의 파일을 선택하십시오");
				return false;
			}
			return true
		}
		
		
        $(document).ready(function() {
            $(".enter").keydown(function(key) {
                if (key.keyCode == 13) {
                	check_form();
                }
            });
        });
 		