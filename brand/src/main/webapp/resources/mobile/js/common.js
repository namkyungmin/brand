var honorsvilleBrand = honorsvilleBrand || {};
var $window = $(window);
var scrollTop;
var $header = $('#header');
var $body = $('body');
var $gnb = $header.find('.gnb_wrap');
var $btnMenu = $header.find('.btn_menu');
honorsvilleBrand = {
    common : function(){

        //gnb
        $btnMenu.click(function(e){
            e.preventDefault();
            if ( !$body.hasClass('header_open') ) {
                $body.addClass('header_open');
                $gnb.stop().animate({"left": 0}, 300, "linear");
                if ( $header.hasClass('sub') ) {
                    $header.css('position','fixed');
                    $gnb.css('position','fixed');
                }
            } else {
                $gnb.stop().animate({"left":"100%"}, 300, "linear", function(){
                    $body.removeClass('header_open');
                    if ( $header.hasClass('sub') ) {
                        $header.css('position','absolute');
                        $gnb.css('position','absolute');
                    }
                    
                });
            }
        }); 

        //footer
        var $familySite = $('.family_site'),
            $defaultBtn = $familySite.find('.default_box a');
        $defaultBtn.click(function(e){
            e.preventDefault();
            if ( $familySite.hasClass('on') ){
                $familySite.removeClass('on');
            } else {
                $familySite.addClass('on');
            }
        });
        $btnTop = $('.btn_top');
        $btnTop.click(function(e) {
            e.preventDefault();
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });

        //radio
        var $radio = $('.radio_wrap'),
            $radioLabel = $radio.find('label'),
            $input = $radioLabel.find('input'),
            radioLen = $radio.length;
        if ( radioLen > 0 ) {
            $radioLabel.click(function(){
                var $this = $(this),
                    $thisInput = $this.find('input');
                $this.addClass('checked').siblings('label').removeClass('checked');
                //$input.removeAttr('checked');
                $thisInput.attr("checked", "checked");
            });
        }

        //checkbox
        var $checkbox = $('.check_wrap'),
            $checkSpan = $checkbox.find('span'),
            $checkLabel = $checkSpan.find('label'),
            checkLen = $checkbox.length;
		if ( checkLen > 0 ) {
		    $checkLabel.click(function(){
                var $this = $(this),
                    $thisSpan = $this.closest('span'),
                    $thisInput = $this.find('input');
                    
		        if ( $thisInput.prop("checked") == true ) {
		            $thisSpan.removeClass('checked');
                    $thisInput.prop("checked", false);
                    //전체 선택 후 리스트들 중 하나를 해제시
                    $thisSpan.siblings(".check_all").removeClass('checked').find("input").prop("checked", false);
		            //전체 해제시
		            if( $thisSpan.hasClass('check_all') ){
		                $thisSpan.siblings().removeClass('checked');
		                $thisSpan.siblings().find("input").prop("checked", false);
		            }
		        } else {
		            $thisSpan.addClass('checked');
                    $thisInput.prop("checked", true);
                    //각각 항목을 다 클릭 했을시 전체 체크박스 활성화
                    var $thisParents = $thisSpan.closest(".check_wrap"),
                        thisLen = $thisParents.find("span").length,
                        thisCkLen = $thisParents.find(".checked").length;
                    if(thisCkLen >= thisLen-1){
                        $thisParents.find(".check_all").addClass('checked');
                        $thisParents.find(".check_all").find("input").prop("checked", true);
                    }
		            //전체 선택시
		            if( $thisSpan.hasClass('check_all') ){
                        if ( $thisInput.prop("checked") == true ) {
                            $thisSpan.siblings().addClass('checked');
                            $thisSpan.siblings().find("input").prop("checked", true);
                        }
		            }
		        }
		        setSearchValue('parcelArea');
		    });
		}
        
    },

    subHeader : function(){
        $header.addClass("sub");
    },
    
    stickyGnb : function(){
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
            if ( scrollTop <= 0 ) {
                $header.removeClass('on');
            } else {
                $header.addClass('on');
            }
        });
    },
    subTab : function(){
        var $tabWrap = $('.tab_wrap');
            $tab = $tabWrap.find('ul'),
            $tabItem = $tab.find('li'),
            $tabActiveItem = $tab.find('li.on'),
            tabItemLen = $tabItem.length,
            tabItemW = 100 / tabItemLen,
            tabW = tabItemLen * 137;

        if ( tabItemLen < 3 ) {
            $tabItem.css('width', tabItemW+'%');
        } else {
            $tab.addClass('auto');
            $tab.css('width', tabW+'px');
            var tabOffset = $tabActiveItem.offset().left;
            $tabWrap.scrollLeft(tabOffset);
        }
        
    },

    stickyTab : function(){
        var $window = $(window),
            $tab = $('.tab_wrap'),
            tabOffset = $tab.offset().top;
        
        $window.scroll(function(){
            scrollTop = $window.scrollTop();
            if ( scrollTop > tabOffset ) {
                $tab.addClass('sticky');
            } else {
                $tab.removeClass('sticky');
            }
        });
    },
    btnFavor : function(){
        var $btn = $('.btn_favor');
        $btn.click(function(e){
            e.preventDefault();
            var $this = $(this);
            if ( $this.hasClass('on') ) {
                $this.removeClass('on');
            } else {
                $this.addClass('on');
            }
        });
    },
    accodian : function(){
        var $qestion = $('.my.faq .faq_wrap li .question');
        $qestion.click(function(){
            var $this = $(this);
            var $thisWrap = $this.closest('li');
            var $thisAnswer = $this.next('.answer');
            if ( $thisWrap.hasClass('open') ) {
                $thisWrap.removeClass('open');
                $thisAnswer.stop().slideUp();
            } else {
                $thisWrap.addClass('open');
                $thisAnswer.stop().slideDown();
            }
        });
    },
    fileUpload : function(){
        var $fileWrap = $('.file_wrap'),
            $btnPlus = $('.file_btn.plus'),
            fileIdx = 1,
            fileData;
        $btnPlus.click(function(e){
            e.preventDefault();
            if ( fileIdx <= 4 ) {
                fileIdx++;
                fileData = "";
                fileData += "<div class=\"input_wrap file_upload\">"
                fileData +=     "<div class=\"file_inner\">"    
                //fileData +=         "<input type=\"file\" class=\"myfile\" name=\"myFile" +fileIdx+ "\" id=\"myFile" +fileIdx+ "\" value=\"\">"
                	fileData +=    "<input type=\"file\" class=\"myfile\" name=\"file\" id=\"myFile" +fileIdx+ "\" value=\"\" data-seq='"+(fileIdx-1)+"'>"
                fileData +=         "<input type=\"text\" class=\"file_path file" +fileIdx+ "\" placeholder=\"파일선택\" value=\"\">"
                fileData +=         "<a href=\"javascript:void(0);\" class=\"btn\">파일찾기</a>"
                fileData +=     "</div>"
                fileData +=     "<a href=\"#\" class=\"file_btn minus\"></a>"
                fileData += "</div>"
                $fileWrap.append(fileData);
                

            	$('input[type=file]').off("change");
            	$('input[type=file]').on('change', function() {
            		//console.log($('input[type=file]').index());
            		var target,seq = $('input[type=file]').index();
            		//console.log(target);
            		seq,target = $(this).data('seq');
            		if(chk_file($(this).val()) == false){
            			$(this).val('');
            			return;
            		}
            		$("<form action='/my/uploadFile' enctype='multipart/form-data' method='post'/>")
            			.ajaxForm({
            				dataType: 'json',
            				beforeSend: function() {
            				},
            				success: function(data){
            					if(data.result==0){
            						//console.log($('#file[0][fileSeq]').val());
            						//$('input[name="file[0][fileSeq]").val(seq);
            						$('input[id="file_'+target+'_fileSeq"]').val(seq);
            						$('input[id="file_'+target+'_filePath"]').val(data.url);
            						$('input[id="file_'+target+'_fileName"]').val(data.originFilename);
            						$('input[id="file_'+target+'_fileExt"]').val(data.extensionName);
            						$('input[id="file_'+target+'_fileSize"]').val(data.size);
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
            	

           	
            }
        });
        $('body').on('change', '.myfile', function () {
            var crrBtnIdx = $(this).closest('.file_upload').index() + 1;
            var filename = $(this)[0].files[0].name; //파일명 추출
            $('.file_path.file'+crrBtnIdx).val(filename);
        });
        $('body').on('click', '.file_btn.minus', function (e) {
            e.preventDefault();
            if ( fileIdx >= 0 ) {
                fileIdx--;
                $(this).closest('.file_upload').remove();
            }
        });
        
        
    	$('input[type=file]').off("change");
    	$('input[type=file]').on('change', function() {
    		//console.log($('input[type=file]').index());
    		var target = $('input[type=file]').index();
    		var seq = $(this).data('seq');
    		if(chk_file($(this).val()) == false){
    			$(this).val('');
    			return;
    		}
    		$("<form action='/my/uploadFile' enctype='multipart/form-data' method='post'/>")
    			.ajaxForm({
    				dataType: 'json',
    				beforeSend: function() {
    				},
    				success: function(data){
    					if(data.result==0){
    						//console.log($('#file[0][fileSeq]').val());
    						//$('input[name="file[0][fileSeq]").val(seq);
    						$('input[id="file_'+target+'_fileSeq"]').val(seq);
    						$('input[id="file_'+target+'_filePath"]').val(data.url);
    						$('input[id="file_'+target+'_fileName"]').val(data.originFilename);
    						$('input[id="file_'+target+'_fileExt"]').val(data.extensionName);
    						$('input[id="file_'+target+'_fileSize"]').val(data.size);
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
    },
    scrollMotion : function(Offset){
        var effectOffset = $('.'+Offset).offset().top - 150;
        $window.scroll(function(){
            effectOffset = $('.'+Offset).offset().top - 150;
            scrollTop = $window.scrollTop();
            if( scrollTop > effectOffset ) {
                $('.'+Offset).find('.obj').addClass('on');
            };
        });
    },
    searchMotion : function(){
        var $searchBox = $(".search_box");
        var $searchBtn = $searchBox.find(".search_close");
        
		$searchBtn.click(function(e){
            e.preventDefault();
            if(!$searchBox.is(".on")) {
                $searchBox.addClass("on");
                $searchBtn.find("span").text("닫기");
            } else  {
                $searchBox.removeClass("on");
                $searchBtn.find("span").text("열기");
            }
		});
    }
}
honorsvilleBrand.common();