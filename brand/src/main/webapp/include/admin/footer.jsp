<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
        <!-- s:footer -->
		<!-- jQuery -->
		<script src="/resources/admin/js/jquery.min.js"></script>
		<!-- Bootstrap 4 -->
		<script src="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- AdminLTE App -->
		<script src="/resources/admin/js/adminlte.min.js"></script>
        <!--// e:footer -->
		<!-- Daterange picker -->
		<script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.0/jquery-ui.min.js"></script> 
		<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/themes/base/jquery-ui.css" rel="stylesheet" />        
		<style>.ui-datepicker-trigger {margin-left:5px; width:20px;height:20px;}</style>
		<!-- Admin base JS -->
		<script src="/resources/admin/js/base.js"></script>
		<script src="/resources/admin/js/jquery.resize.js"></script>
		
<script>
$(document).ready(function() {
	$('.main-sidebar').on("resize", function(){
		if($(this).width() < 250) {
			$('#logo1').hide();
			$('#logo2').show();
		} else {
			$('#logo2').hide();
			$('#logo1').show();			
		}
			
		console.log('resize'+$(this).width());
	});
	
	$('.sidebar').on("resize", function(){
		if($(this).width() < 100) {
			$('#logo1').hide();
			$('#logo2').show();
		} else {
			$('#logo2').hide();
			$('#logo1').show();			
		}		
		console.log('resize'+$(this).width());
	});
	
});
</script>		