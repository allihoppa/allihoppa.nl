/* preload images function */
var preloaded = new Array();

function preload_images() {
    for (var i = 0; i < arguments.length; i++){
        preloaded[i] = document.createElement('img');
        preloaded[i].setAttribute('src',arguments[i]);
    };
	
};


jQuery(document).ready(function() {
	
	$( '.postfilter li' ).click( function(e) {
			
			$(this).find(':checkbox').attr('checked', !$(this).find(':checkbox').attr('checked'));
			$(this).closest('form').submit(); // submit form
	} );
	
	
});

