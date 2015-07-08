// taken from http://feriadeloja.com/wp-content/themes/inside/js/ownScript.js?ver=4.2.2

(function () {
  'use strict';
  
  var $document = jQuery(document),
  		className = 'header_scroll',
      $element = function () {
        return jQuery('#header');
      };

  $document.scroll(function() {
    $element().toggleClass(
      className,
      $document.scrollTop() >= 200
    );
  });

  // add header class on mobile screens
  jQuery(function() {
    /* Check width on page load*/
    if ( jQuery(window).width() < 769) {
      $element().addClass(className);
  	}
  });

  jQuery(window).resize(function() {
    /*If browser resized, check width again */
  	if (jQuery(window).width() < 769) {
  		 $element().addClass(className);
  	}
  	else {
      $element().removeClass(className);
    }
  });
})();
