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

$(document).ready(function(){
	$('#review-panel').hide().fadeIn(1000, function(){
		$('#metal-door').delay(500).slideUp(3000, function(){
			$('#bars-left').animate({ width: '0px'}, 2000);
			$('#bars-right').animate({ width: '0px'}, 2000, function(){
				LoadSoundAndPlay()
				setInterval(function(){
				    $("body").toggleClass("backgroundRed");
				 },100)
			});
    });
	});
})

var LoadSoundAndPlay = function(){
	var audioElement = document.createElement('audio');
  audioElement.setAttribute('src', '/sounds/siren.mp3');
  audioElement.setAttribute('autoplay', 'autoplay');
  audioElement.play();
}
