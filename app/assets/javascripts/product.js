// Sticky Buy Buttons
// ------------------

// Set desktop sticky params
$(function () {
    $(".sticky-desktop").sticky({
        topSpacing: 220
        , zIndex: 200
        , stopper: "#stopper"
    });
});

// Sticky mobile button
$(window).scroll(function() {
	var topofSection = $(".sumo-section-tldr").offset().top - 70;
	if($(this).scrollTop() >= topofSection) {
	  	$('#sticky-mobile').removeClass('fadeOutUp').addClass('fadeInDown stuck');
	} else {
	    if($(this).scrollTop() < topofSection) {
	  	    $('#sticky-mobile').addClass('fadeOutUp');
	    }
	}
});


// Scroll to Top "Button"
// ----------------------

// Hide/Show scroll elements
$(window).scroll(function() {
	var topofSection = $("#benefits-section").offset().top;
	if($(this).scrollTop() > topofSection) {
	    $('.scrolltop:hidden').stop(true, true).fadeIn();
	} else {
	    $('.scrolltop').stop(true, true).fadeOut();
	}
});
// Add/Remove scroll-bottom class based on scroll activity
$(window).scroll(function() {
	var bottomofSection = $("#stopper").offset().top;
	var targetScroll = $(".scrolltop");
	var scrollLocation = $(".scroll").offset().top;
	if (scrollLocation > bottomofSection) {
	targetScroll.addClass("scroll-bottom");
	} else {
		if(scrollLocation < bottomofSection) {
			targetScroll.removeClass("scroll-bottom");
		}
	}
});
// Scroll to top of page is scroll button is clicked
$(function() {
	$(".scroll").click(function(){
		$("html,body").animate({scrollTop:$(".sumo-product-pg").offset().top},"1000");
		return false})
});
