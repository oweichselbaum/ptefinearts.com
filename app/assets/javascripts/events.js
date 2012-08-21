$(document).ready(function() {
	$('.newWindow a').live('click', function(event) {
	     var address = $(this).attr('href');
	     event.preventDefault();
	     event.stopPropagation();
	     window.open(address, '_blank');
	  });
});
