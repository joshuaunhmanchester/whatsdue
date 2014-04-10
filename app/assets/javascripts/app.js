$(function () {
	// Upon clicking on the menu trigger, toggle the menu div.
	$('#menu-trigger').on('click', function(e) {
		$('#menu').slideToggle('fast');
	});

	// Upon clicking on an assignment on the dashboard, drop down the details div for that clicked assignment
	$('.assignment-trigger').on('click', function(e) {
		$(this).parent().nextAll('.assignment-details').slideToggle();
	});

	// Upon hovering over any of the main Icons on the home page, animate to a larger font size.
	$('.home-icon').hover(function(e) {
		// $(this).animate({ fontSize : '7em' }, 100);
		$(this).parent().parent().css('background-color', 'lightgrey');
	},
	function() {
		// $(this).animate({ fontSize : '5em' }, 100);
		$(this).parent().parent().css('background-color', '');
	});
});