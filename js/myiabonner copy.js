$(document).ready(function(){
	// show the hidden links to +pdf/share
	// when you mouseover an item
    $('.hasoverlay').hover(function() {
		$('.overlayouter',this).fadeTo(100,1);  
    }, function() {
		$('.overlayouter',this).fadeTo(100,0);  
    })
    
    // cycle images on the showcase page
    $('.cyclethis').cycle();
    
    // show all thumbnails from a section on mouseover
    $('.mousemove').mouseover(function() {
    	// make an array of thumbnail images from the
    	// rel attribute of the moused-over thumbnail
	    var arrayItems = $(this).attr('rel').split(',');
	    $(this).iskip({images:arrayItems, method:'mousemove', 'cycle':1});
    })
    
	$('.maincontent').fadeIn(500);
	
	// add items to PDF using AJAX
	$('a.addlink').click(function() {
		$this = $(this);
		$.get( $(this).attr('href'), function() { $this.addClass('added').removeClass('addlink'); } );
		return false;
	})
  	
  	// remove the items from the PDF using AJAX
    $('a.removelink').click(function() {
    	$parentDiv = $(this).parent('.span4');
	    $.get( $(this).attr('href'), function() { $parentDiv.fadeOut(600, function() { $parentDiv.remove() }); } );
	    return false;
    })
});