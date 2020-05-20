    var searchArea = "";
    var searchType = "";
    var nowPage = 1;    
    function check_form() {
		$('.parcel_wrap').hide();
		$('.parcel_wrap').html('');
		getList();    	
    }
    $(document).ready(function(){
    	$('#moreBtn').on("click",function(){
    		if(totalCnt / 6 > nowPage) {
    			nowPage = nowPage+1; 
    			getList();
    		} else {
    			alert('더이상 분양정보가 없습니다.')
    		}
    	});
    	
    	$('#searchBtn').on("click",function(){
    		/*
    		if($.trim($('#searchValue').val()) == "") {
    			alert('정보를 입력해 주세요.');
    			$('#searchValue').focus();
    			return;
    		}
    		*/
    		$('.parcel_wrap').hide();
    		$('.parcel_wrap').html('');
    		getList();
    	});
    });
    
    function getList(){
    	  $('.no_result').hide();
          var data = {searchValue:$('#searchValue').val(), searchArea:searchArea,searchType:searchType, parcelStage:$('#parcelStage').val(),curPage:nowPage};
          var html = "";
	  	  $.ajax({
	  	    url: "/estate/parcel_list",
	  	    type: "POST",
	  	    cache: false,
	  	    dataType: "json",
	  	    data: data,
	  	    success: function(data){
	  	    	if(data.data.length>0)
	  	    		$('.parcel_wrap').removeClass("last");
	  	    	else {
	  	    		$('#moreBtn').hide();
	  	    		alert('더이상 분양정보가 없습니다.')
	  	    	}
	  	    	for(i=0;i<data.data.length;i++) {
	  	    		var row = data.data[i];
		  	    	// last
		  	    	
		  	    	html += '<div class="parcel_item">';
		  	    	html += '<div class="btn_area">';
                    if(row.homepageUrl=='' || row.homepageUrl==null) {} else 
                    	html += '<a href="'+row.homepageUrl+'" target="'+row.homepageTarget+'" class="btn_homepage">홈페이지 바로가기</a>';
                    
                    
                    if(row.parcelStage != '분양완료') {
                    	if(row.inquiry=='' || row.inquiry==null) {} else
                    		html += '<a href="tel:'+row.inquiry+'" class="btn_tel2">전화걸기</a>';
                    
                    
			  	    	if(row.favorite)
			  	    		html += '<a href="javascript:;;" id="favoriteBtn" data-parcelId="'+row.parcelId+'" class="btn_favor on"></a>';
			  	    	else
			  	    		html += '<a href="javascript:;;" id="favoriteBtn" data-parcelId="'+row.parcelId+'" class="btn_favor"></a>';
                    }
		  	    	
                    html += '</div>';
		  	    	html += '<a href="/estate/sale/view?parcel_id='+row.parcelId+'" class="item_inner">';
	                html += '<h4>'+row.parcelName+'</h4>';
	                html += '<table class="color_9a8b86">';
	                html += '<colgroup>';
	               	html += '<col width="55px">';
	               	html += '<col width="*">';
	               	html += '</colgroup>';
	               	html += '<tbody>';
	               	html += '<tr>';
	               	html += '<th>위치</th>';
	               	html += '<td>'+row.location+'</td>';
	               	html += '</tr>';
	               	html += '<tr>';
	               	html += '<th>세대수</th>';
	                html += '<td>'+row.scale+'</td>';
					html += '</tr>';
		            html += '<tr>';
		            html += '<th>분양</th>';
		            html += '<td>'+row.period+'</td>';
		            html += '</tr>';
		            html += '</tbody>';
		            html += '</table>';
		            
		            if(row.parcelStage=='분양중' && row.parcelType == '상가분양')
		            	html += '<span class="flag store_on">'+row.parcelStage+'</span>';
		            if(row.parcelStage=='분양중' && row.parcelType != '상가분양')
		            	html += '<span class="flag on">'+row.parcelStage+'</span>';		            
		            if(row.parcelStage=='분양예정'  && row.parcelType == '상가분양')
		            	html += '<span class="flag store_on">'+row.parcelStage+'</span>';
		            if(row.parcelStage=='분양예정' && row.parcelType != '상가분양')
		            	html += '<span class="flag scheduled">'+row.parcelStage+'</span>';
		            if(row.parcelStage=='분양완료'  && row.parcelType == '상가분양')
	    	            html += '<span class="flag store_on">'+row.parcelStage+'</span>';
		            if(row.parcelStage=='분양완료' && row.parcelType != '상가분양')
	    	            html += '<span class="flag complete">'+row.parcelStage+'</span>';
		            
		            html += '</a>';
					
					html += '</div>';	  	    	
	  	    	}
				$('#parcel_body').append(html);
				
				if($('.parcel_item').length == 0) {
					$('.no_result').show();
					$('.btn_wrap').hide();
				}
				
				if($('.parcel_item').length == 6) {
					$('.btn_wrap').show();
				}
				if(html != "") $('.parcel_wrap').show();
				
				if($('.parcel_item').length % 3 != 0) $('#moreBtn').hide();
				else $('#moreBtn').show();
				
	  	    	if(data.total <= 6) {
	  	    		$('#moreBtn').hide();
	  	    	}				
				activeClick();
				prochk = false;
	  	    },
	  	    error: function (request, status, error){        
	  	        var msg = "ERROR : " + request.status + "<br>"
	  	      msg +=  + "내용 : " + request.responseText + "<br>" + error;
	  	    }
	  	  });    	
    }
    var prochk = false;
    function setSearchValue(names) {
    	if(prochk == false) {
    		nowPage=1;
	    	prochk = true;    	
	    	searchArea = "";
	    	searchType = "";
	    	$('.parcel_wrap').hide();
	    	$('.parcel_wrap').html('');
	    	$('input[name='+names+']:checked').each(function() {
	    		if(searchArea =="")
	    			searchArea += "'"+$(this).val()+"'";
	    		else
	    			searchArea += ",'"+$(this).val()+"'"; 
	    	});
	    	
	    	$('.search_type>div>span.checked').each(function() {
	    		if(searchType =="")
	    			searchType += "'"+$(this).find("input").val()+"'";
	    		else
	    			searchType += ",'"+$(this).find("input").val()+"'";    		
	    	});   	
	    	getList();
    	}
    }