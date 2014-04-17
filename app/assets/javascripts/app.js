$(function () {
	// Upon clicking on the menu trigger, toggle the menu div.
	$('#menu-trigger').on('click', function(e) {
		$('#menu').slideToggle('fast');
	});

	// Upon hovering over any of the main Icons on the home page, animate to a larger font size.
	$('.home-icon').hover(function(e) {
		$(this).animate({ fontSize : '7em' }, 100);
		$(this).parent().parent().css('background-color', 'lightgrey');
	},
	function() {
		$(this).animate({ fontSize : '5em' }, 100);
		$(this).parent().parent().css('background-color', '');
	});
});