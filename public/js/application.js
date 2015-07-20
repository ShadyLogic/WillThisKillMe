$(document).ready(function() {

	// Scrolling title bar ********************************
	$('#background').pan({fps: 30, speed: 1, dir: 'left'});
	// ****************************************************

	$('#will-kill').on('click', function(e){

		e.preventDefault()
		$('.article').fadeOut();
		$('.header').fadeOut(function(){

			request = $.ajax({
				url: '/upload',
				type: 'get'
			});
			request.done(function(upload){
				new_post = $('.container').append(upload);
				new_post.hide();
				new_post.fadeIn();
			});
			request.fail(function(serverData){
				console.log("FAIL! " + serverData)
			});

		});

	});
	
});
