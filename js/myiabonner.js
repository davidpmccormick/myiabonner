// global
function scrollToContent() {
	// offset of the element from the top
	$distanceToScroll = $('.maincontent').offset().top - 20;
	// animate the scroll
	$('body, html').animate({ scrollTop: $distanceToScroll }, 500, 'easeInOutQuint');
}

// document ready
$(document).ready(function(){

	theHref = '?add=' + $('.maincontent').attr('rel');
	counter = 0;
	pdfOff = 0;
	
	
	
	// show the hidden links to +pdf/share
	// when you mouseover an item
    $('.hasoverlay').hover(function() {
		$('.overlayouter',this).fadeTo(100,1);  
    }, function() {
	    $('.overlayouter',this).fadeTo(100,0);
    })
    
    // polyfill placeholder support for rubz browserz
    Placeholders.init();
    
    // cycle images on the showcase page
    $('.cyclethis').cycle();
    
    
    // only do this if it isn't a touchscreen device
    if (!(Modernizr.touch)) {
	    // show all thumbnails from a section on mouseover
	    $('.mousemove').mouseover(function() {
	    	// make an array of thumbnail images from the
	    	// rel attribute of the moused-over thumbnail
		    var arrayItems = $(this).attr('rel').split(',');
		    $(this).iskip({images:arrayItems, method:'mousemove', 'cycle':1});
	    })
	}
    
	$('.maincontent').fadeIn(500);
	
	// ignore links that have already been clicked
	$('a.added').live('click', function() {
		return false;
	})
	
	// add items to PDF using AJAX
	$('a.addlink').live('click', function() {
		$this = $(this);
		theHref = theHref + $(this).attr('href');
		$.get(theHref, function() { 
			$this.addClass('added').removeClass('addlink');
			 // fade in the 'VIEW PDF' link if it's not visible
			if($('.viewpdf').css('display','none')) {
				$('.viewpdf').stop().fadeTo(200,1);
			};
		 });
		return false;
	})
  	
  	// remove the items from the PDF using AJAX
    $('a.removelink').live('click', function() {
		$this = $(this);
		
    	var initialHref='?add=' + $('.maincontent').attr('rel');
    	var toBeRemoved = $this.attr('href');
    	
    	// first time through, use the .maincontent rel version
    	if (counter == 0) {
	    	updatedHref=initialHref.replace(toBeRemoved,",");
	    // after that, update the already updated version
    	} else {
	    	updatedHref=updatedHref.replace(toBeRemoved,",");
    	}
	    // fade out the DOWNLOAD PDF link if there aren't any items
	    if (updatedHref == '?add=,0,') {
		    $('.compilepdf').fadeTo(200,0);
		    pdfOff = 1;
	    }
    	$parentDiv = $(this).parent('.span4');
	    $.get( updatedHref, function() { $parentDiv.fadeOut(600, function() { $parentDiv.remove() }); } );
	    counter++;
	    
	    // if items have been removed, use this 'updatedHref' value
	    // value (which contains the new 'sessionmonster-add' entry IDs)
	    if (counter > 0) {
		    $('a.compilepdf').click(function() {
		    	window.location.href = $('.footer').attr('rel') + '/pdf/compile/';
			    return false;
		    })
	    }
	    return false;
    })
    
    // if nothing has been removed, then use the initial 'theHref'
    // value (which contains the initial 'sessionmonster-add' entry IDs)
    if (counter == 0) {
	    $('a.compilepdf').click(function() {
		    window.location.href = $('.footer').attr('rel') + '/pdf/compile/';
	    })
    }
    
    // add the name to sessionmonster-namefield when the Submit button is clicked
    $('.submitbutton').live('click', function() {
    	$this = $(this);
    	str = '?namefield=' + $('#thenamefield').attr('value');
	    $.get(str, function() { 
			 // fade in the 'VIEW PDF' link if it's not visible
			if($('.compilepdf').css('display','none') && (str != '?namefield=') && (pdfOff == 0))  {
				$('.compilepdf').stop().fadeTo(200,1);
				$this.addClass('submitted'); 
				pdfOff = 1;
			} else if($this.hasClass('submitted')) {
				$this.removeClass('submitted');
			}
	    });
	    return false;
    })
    
    
    // set up sharrre plugin (deals with fb and twitter buttons)
	$('[data-toggle=modal]').live('click', function() {
		$('.twitter').sharrre({
		  share: {
		    twitter: true
		  },
		  enableHover: false,
		  enableTracking: false,
		  buttons: { twitter: {via: 'myiabonner'}},
		  click: function(api, options){
		    api.simulateClick();
		    api.openPopup('twitter');
		  }
		});
		$('.facebook').sharrre({
		  share: {
		    facebook: true
		  },
		  enableHover: false,
		  enableTracking: false,
		  click: function(api, options){
		    api.simulateClick();
		    api.openPopup('facebook');
		  }
		});
		return false;
	})   
    
});

// window load
$(window).load(function() {
	// make sure the footer's at the bottom of the screen once the page's loaded
	var footerFromTop = $('.footer').offset().top;
    var windowHeight = $(window).height();
    var footerHeight = $('.footer').height();
    if ((footerFromTop+footerHeight) < windowHeight ) {
	    $('.footer').css('margin-top',((windowHeight-(footerFromTop+footerHeight)+400)));
	    $('.footer').css('visibility','visible').hide(0).fadeTo(200,1);
    } else {
	    $('.footer').css('visibility','visible').hide(0).fadeTo(200,1);
    }
    
    // scroll menu and logo out of view on a phone
    if ($('.visible-phone').css('display') == 'block') {
	    setTimeout(function() {
		    scrollToContent();
	    }, 500);    
	}
})