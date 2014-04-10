$(function () {
	// Upon clicking on an assignment on the dashboard, drop down the details div for that clicked assignment
	$('.assignment-trigger').on('click', function(e) {
		$(this).parent().nextAll('.assignment-details').slideToggle();
	});

	// Upon clicking on an exam on the dashboard, drop down the details div for that clicked exam
	$('.exam-trigger').on('click', function(e) {
		$(this).parent().nextAll('.exam-details').slideToggle();
	});
});