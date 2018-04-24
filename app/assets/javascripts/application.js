//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

$(document).ready(function(){

	var play  = 2;
	var pause = 3;

	$('.datepicker').datepicker();
	$('select').formSelect();

	$.ajaxSetup({
  		headers: {
    		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
 		}
	});
	

	$('.li_sidebar_trigger').click(function(){

		var task_id = $(this).data('task_id');
		$.ajax({
			url: '/tasks/'+task_id+'.js',
			method: 'get',
			dataType: 'script',
			async: false,
			success: function(data){
				// alert(task_id);
			}
		});
		// $('#main-overlay').fadeIn();
	});

	$('.play_pause').click(function(){
		var task_id 	= $(this).data('task_id');
		var validate 	= false; 
		var message 	= "";
		$.ajax({
			url: "/tasks/play_pause.json",
			dataType: "json",
			async: false,
			data: {task_id: task_id},
			method: "put",
			success: function(data) { 
				validate = true;
				status  = data.new_status;
				message = data.message;
			}, 
			error: function(message){
				message = data.message;
			}
		});
		 
		if(validate) {
			// Materialize.toast(message, 4000); 
			togglePlayPause($(this), status);
		} else {
			// Materialize.toast(message, 4000); 
		}

	});

	$('.closeSidebar').click(function(){
		$('#main-overlay').fadeOut();
		$('.sidebar').fadeOut();
	});

	function togglePlayPause(btn, status){
		if(status == play){
			bg = "blue";
			icon = "pause_circle_outline";
		}else {
			bg = "teal";
			icon = "play_circle_outline";
		}
		btn.removeClass('blue');
		btn.removeClass('teal');
		btn.addClass(bg);
		btn.children('.material-icons').text(icon);
		btn.data('status', status);
	}
	$(".dropdown-trigger").dropdown();
	
	$('.minSidebar').click(function(){
		
	});

	$('.minSidebar').click(function(){
		$('.sidebar').addClass('minSidebar');
		$('.overlay').fadeOut();
	});
});