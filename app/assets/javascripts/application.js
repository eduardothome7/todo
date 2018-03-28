//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

$(document).ready(function(){

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
            dataType: 'script'
		});
		// $('#main-overlay').fadeIn();
	});

});